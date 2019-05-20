#' @export
read_csv <- function(folder, file) {
  path <- paste(folder, file, sep = '/')
  stopifnot(file.exists(path))
  read.csv(path, stringsAsFactors = TRUE)
}
#' @export
get_all_labels <- function(folder) {
  annotations <- read_csv(folder, 'annotations.csv')
  annotations$annotator <- as.factor(annotations$annotator )
  annotations$neuron <- as.factor(annotations$neuron )
  annotations
}
#' @export
get_alternative_types <- function(folder) {
  alternative <- read_csv(folder, 'alternative-types.csv')
  alternative$annotator <- as.factor(alternative$annotator )
  alternative
}
#' @export
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
#'
#' @import dplyr
#' @import tidyr
#' @import magrittr
#'
#' @export
get_all_counts <- function(folder) {
  a <- get_all_labels(folder)
  a <- make_annotations_tidy(a)
  summary <- a %>% dplyr::group_by(neuron, feature, value) %>% dplyr::tally()
  summary <- ungroup(summary)
  summary <- summary %>% dplyr::group_by(neuron) %>% tidyr::spread(key = 'value', value = 'n')
  # now group by neuron and sum all
  summary <- summary %>% dplyr::group_by(neuron) %>% dplyr::select(-feature) %>% dplyr::summarise_all(.funs = sum, na.rm = TRUE)
  summary$None  <- NULL
  summary$V1 <- NULL
  summary
}
#' @export
make_annotations_tidy <- function(a) {
  a$other <- NULL
  a$complete <- NULL
  a <- a %>% tidyr::gather(F1, F2, F3, F4, F5, F6, key = 'feature', value  = 'value')
  levels <- c( "",   "None", "intralaminar",   "translaminar", "intracolumnar", "transcolumnar",      "centered",   "displaced",   "ascending",       "both",  "descending",          "arcade","Cajal-Retzius",           "chandelier",         "common basket",   "common type",                  "horse-tail",             "large basket",    "Martinotti",      "neurogliaform",   "other",       "characterized",           "uncharacterized")
  stopifnot(identical(sort(levels), sort(unique(a$value))))
  a$value <- factor(a$value, levels = levels)
  a
}
#' @export
get_all_counts_meta <- function(folder) {
  counts <- get_all_counts(folder)
  metadata <- get_all_meta(folder)
  dplyr::left_join(counts, metadata, by = 'neuron') %>% dplyr::select(-paper, -original.type, -archive, -neuromorpho.name)
}
