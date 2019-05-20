read_csv <- function(folder, file) {
  path <- paste(folder, file, sep = '/')
  stopifnot(file.exists(path))
  read.csv(path, stringsAsFactors = TRUE)
}
get_all_labels <- function(folder) {
  annotations <- read_csv(folder, 'annotations.csv')
  annotations$annotator <- as.factor(annotations$annotator )
  annotations$neuron <- as.factor(annotations$neuron )
  annotations
}
get_alternative_types <- function(folder) {
  alternative <- read_csv(folder, 'alternative-types.csv')
  alternative$annotator <- as.factor(alternative$annotator )
  alternative
}
get_all_meta <- function(folder) {
  metadata <- read_csv(folder, 'metadata.csv')
  metadata$neuron <- as.factor(metadata$neuron )
  metadata
}
#' Returns count for all categories
#'
#' Does not include the category 'None', as it is not unique across features.
#' The categories are sorted according to features F1-F6 and then alphabetically.
#' Does not include 'complete' as it is at annotator-cell level, not cell level
#' Does not include alternative type names as their number varies from cell to cell
get_all_counts <- function(folder) {
  a <- get_all_labels(folder)
  a$other <- NULL
  a$complete <- NULL
  a <- a %>% gather(F1, F2, F3, F4, F5, F6, key = 'feature', value  = 'value')
  a %>% group_by(feature, value) %>% tally()
  summary <- a %>% group_by(neuron, feature, value) %>% tally()
  summary <- ungroup(summary)
  summary <- summary %>% group_by(neuron) %>% spread(key = 'value', value = 'n')
  # now group by neuron and summ all
  summary <- summary %>% group_by(neuron) %>% select(-feature) %>% summarise_all(.funs = sum, na.rm = TRUE)
  summary$None  <- NULL
  summary$V1 <- NULL
  cols <- c( "neuron",    "intralaminar",   "translaminar", "intracolumnar", "transcolumnar",      "centered",   "displaced",   "ascending",       "both",  "descending",          "arcade","Cajal-Retzius",           "chandelier",         "common basket",   "common type",                  "horse-tail",             "large basket",    "Martinotti",      "neurogliaform",   "other",       "characterized",           "uncharacterized")
  summary <- summary[, cols]
  summary
}
get_all_counts_meta <- function(folder) {
  counts <- get_all_counts(folder)
  metadata <- get_all_meta(folder)
  left_join(counts, metadata, by = 'neuron') %>% select(-paper, -original.type, -archive, -neuromorpho.name)
}
