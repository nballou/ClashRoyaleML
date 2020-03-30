library(dplyr)
library(purrr)
library(ggplot2)
library(rlang)

# make "remainder" / throw away components more symmetric (expects balanced)
ggplot_continuous_binary <- function(df, covariate, response, rug = TRUE, snip_scales = FALSE, input_bin_size = NULL){

  covariate_var <- enquo(covariate)
  response_var <- enquo(response) # needs to be either a TRUE/FALSE or a 1/0

  df_start <- df %>%
    arrange(!!covariate_var) %>%
    mutate(row_n = row_number())

  # set bin size -- either 1% of number of rows, or positioin of first TRUE or
  # FALSE value of response relative to covariate values
  size_window <- df_start %>%
    group_by(!!response_var) %>% # response
    summarise(min_row = min(row_n),
              max_row = nrow(df_start) - max(row_n)) %>%
    unlist() %>%
    max() %>%
    max(floor(nrow(df_start) * 0.01))

  # refine `size_window` to minimize thrown away data points (could improve this)
  group_size <- tibble(remainder = nrow(df_start) %% size_window:(size_window*1.5),
                       size = size_window:(size_window*1.5),
                       group_n = nrow(df_start) %/% size_window) %>%
    mutate(remainder_lead1 = lead(remainder)) %>%
    filter(remainder_lead1 > remainder) %>%
    pluck("size") %>%
    .[[1]]

  print(paste0("bin size: ", group_size))

  # bin and prep df and summary values
  df <- df_start %>%
    mutate(grouping = (row_n + 1) %/% group_size) %>%
    group_by(grouping) %>%
    summarise(
      binned_prop = mean(!!response_var, na.rm = TRUE),
      log_odds_avg = log(binned_prop / (1 - binned_prop)),
      !!covariate_var := mean(!!covariate_var),
      n = n()
    ) %>%
    ungroup() %>%
    filter(n >= floor(mean(n))) # throw away remainder from `group_size`

  p <- df %>%
    ggplot(aes(x = !!covariate_var, y = log_odds_avg))+
    geom_point()+
    geom_smooth()

  # with large n, this will run slower
  if(rug) {
    p <- p +
      geom_rug(aes(x = !!covariate_var, colour = "TRUE"), sides = "t", alpha = 0.1, data = filter(df_start, as.logical(!!response_var)) %>% mutate(log_odds_avg = 1))+
      geom_rug(aes(x = !!covariate_var, colour = "FALSE"), sides = "b", alpha = 0.1, data = filter(df_start, !as.logical(!!response_var)) %>% mutate(log_odds_avg = 1))
  }

  # change in future to bunch near edge w/o removing
  if(snip_scales){
    p <- p +
      coord_cartesian(xlim = range(df[[quo_name(covariate_var)]]))
  }

  p
}

ggplot_continuous_binary(df = bin_res,
                         covariate = match.trophy,
                         response = correct,
                         snip_scales = TRUE,
                         input_bin_size = 250)

cdplot(as.factor(correct) ~ match.trophy, data = bin_res)
