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
# get_all_alternative_types <-
#   alternative <- read.csv('../data/alternative-types.csv')

# get_all_meta <-
# get_all_labels_meta <-
