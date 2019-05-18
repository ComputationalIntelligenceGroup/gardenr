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

# get_all_meta <-
# get_all_labels_meta <-
