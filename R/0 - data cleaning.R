library(tidyverse)
library(janitor)
library(googlesheets4)


# reits <- "https://docs.google.com/spreadsheets/d/1M18jyMWV54AAcrks45VgISIgzbxu_7uy23gSJG1Ed80/edit#gid=0"
# other <- "https://docs.google.com/spreadsheets/d/14BPDMIwDyCFAZjnzqQXqYRodWrMoUXGaXemrUEV2TGQ/edit#gid=0"

gs4_deauth()

id_pfds <- "1M18jyMWV54AAcrks45VgISIgzbxu_7uy23gSJG1Ed80"
id_russ  <- "1oKaPvT9S21L_qqPjW-c0EhxF_vztwZyTE1dN9XM0Yw0"


dat <- read_sheet(ss= id_russ, na = "NA") %>%
  clean_names() %>% 
  remove_empty(c("rows", "cols"))

# helpers -------------------------------
is_list_character <- function(x) { sapply(x, is.character)}
is_list_numeric   <- function(x) { sapply(x, is.numeric)}
is_list_null      <- function(x) { sapply(x, is.null)}

pfd_chr <- lapply(dat, FUN = is_list_character) %>%
  as_tibble()

pfd_num <- lapply(dat, FUN = is_list_numeric) %>%
  as_tibble()

pfd_null <- lapply(dat, FUN = is_list_null) %>%
  as_tibble()

# Get preferred type --------------------
idx_type <- !is.na(dat$symbol) & pfd_null$div

dat[idx_type, ]


# Get prefered symbol / data -----------
idx_sym <- !is.na(dat$symbol) & !pfd_null$div & !pfd_null$rating

dat[idx_sym, ]  %>% View()

# clean up data (make NA/NULL/blank missing)

# clean up call date

idx_test <- idx_sym & !pfd_num$yield

dat[idx_test, ] %>% View()
  
  
# Make the data frame --------------------



# Derived Variables -----------------------
## par = div / coupon rate
# company name (google finance lookup?)
# current price (google finance lookup?)
# current yield
# yesterday yield (google finance lookup?)

# Create Par value ------------------------




# Save off Data


# Update most recent price ------------------



