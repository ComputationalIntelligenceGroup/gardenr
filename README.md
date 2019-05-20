<!-- README.md is generated from README.Rmd. Please edit that file -->
gardenr
-------

The goal of gardenr is provide simple functions of analyzing the data
from Gardener’s interneuron classification as well as to provide
examples of analyses of such data.

Installation
------------

You can use the `devtools` package to install `garnenr` from Github.

``` r
devtools::install_github('ComputationalIntelligenceGroup/gardenr')
```

The user needs to provide the path to the folder containing the data.
These can be downloaded from …(TODO)

``` r
folder <- '/home/bmihaljevic/code-gardener/gardener-experiment-data/data/' 
```

Example
-------

-   `get_all_*` functions, the return data for all 320 cells

``` r
library(gardenr)
annotations <- get_all_labels(folder ) 
summary(annotations)
#>    annotator         neuron                 F1                   F2      
#>  1      :  320   1      :   48               : 151                : 175  
#>  2      :  320   2      :   48   intralaminar:3895   intracolumnar:7660  
#>  3      :  320   4      :   48   None        :1326   None         :1326  
#>  4      :  320   5      :   48   translaminar:8970   transcolumnar:5181  
#>  5      :  320   6      :   48                                           
#>  6      :  320   7      :   48                                           
#>  (Other):12422   (Other):14054                                           
#>          F3                F4                   F5      
#>           : 254             : 375   common type  :2934  
#>  centered :5649   ascending :2390   common basket:2839  
#>  displaced:7113   both      :1352   large basket :1941  
#>  None     :1326   descending:2543   Martinotti   :1563  
#>                   None      :7682   None         :1326  
#>                                     neurogliaform:1032  
#>                                     (Other)      :2707  
#>                F6                    other        complete      
#>  characterized  :13016   None           :13346   Mode :logical  
#>  uncharacterized: 1326   columnar basket:   70   FALSE:482      
#>                          unknown        :   68   TRUE :13860    
#>                          bushy cell     :   59                  
#>                          bitufted       :   40                  
#>                          double bouquet :   40                  
#>                          (Other)        :  719
```

-   27 out of 48 neuroscientists provided alternative type names for the
    cells

``` r
alternative <- get_alternative_types(folder)
head(alternative)
#>   annotator                 type
#> 1         1      columnar basket
#> 2         4             bitufted
#> 3         4  ascending horsetail
#> 4         4    bipolar horsetail
#> 5         7 deep layer inhibitor
#> 6         7       double bouquet
#>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  definition
#> 1 This term is not new, I believe. In my view, these cells have a pattern of axonal branching similar to typical basket cells, and also display the curved pre-terminal axons typical of basket cells. At difference with the other types of basket cells (common and large basket cells), their axonal plexus form abundant ascending and descending branches that span several layers. Usually these axons distribute within the space of a column as defined in the proposed manuscript.
#> 2                                                                                                                                                                                                                                                                                                                                                                                                      I made a mistake. The bitufted cell should be classified as bipolar horsetail cells.
#> 3                                                                                                                                                                                                                                                                                                                                                                                                                                               Cells with horsetail-shaped ascending axons
#> 4                                                                                                                                                                                                                                                                                                                                                                                                                                Cells with horsetail-shaped ascending and descending axons
#> 5                                                                                                                                                                                                                                                                                                                                                                                                       neuron with an axonal domain that targets preferentially deep cortical layers (4-6)
#> 6                                                                                                                                                                                                                                                                                                                                                                                                        neuron with an axonal domain that targets both deep and superficial layers locally
length(unique(alternative$annotator))
#> [1] 27
unique(alternative$annotator)
#>  [1] 1  4  7  9  13 14 15 18 19 23 24 25 26 27 29 30 31 34 35 36 37 39 40
#> [24] 41 43 44 48
#> 27 Levels: 1 4 7 9 13 14 15 18 19 23 24 25 26 27 29 30 31 34 35 36 ... 48
```

We can easily map with the other data frame. **Those which are other,
and have this.**

``` r
other <- droplevels(subset(annotations, F5 == 'other'))
a <- levels(other$other) 
b <- levels(alternative$type)
setdiff(a, b)
#> character(0)
setdiff(b, a)
#> character(0)
library(tidyverse)
#> Registered S3 methods overwritten by 'ggplot2':
#>   method         from 
#>   [.quosures     rlang
#>   c.quosures     rlang
#>   print.quosures rlang
#> Registered S3 method overwritten by 'rvest':
#>   method            from
#>   read_xml.response xml2
#> ── Attaching packages ────────────────────────────────────────────────────────────────────────────────────────────────────────────────────── tidyverse 1.2.1 ──
#> ✔ ggplot2 3.1.1       ✔ purrr   0.3.2  
#> ✔ tibble  2.1.1       ✔ dplyr   0.8.0.1
#> ✔ tidyr   0.8.3       ✔ stringr 1.4.0  
#> ✔ readr   1.3.1       ✔ forcats 0.4.0
#> ── Conflicts ───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────── tidyverse_conflicts() ──
#> ✖ dplyr::filter()   masks stats::filter()
#> ✖ dplyr::lag()      masks stats::lag()
#> ✖ readr::read_csv() masks gardenr::read_csv()
other <- left_join(other, alternative, by = c("other" = "type"))
length(unique(other$annotator)) 
#> [1] 0
```

-   Get the cells metadata

``` r
metadata <- get_all_meta(folder)
summary(metadata)
#>      neuron            neuromorpho.name   species   
#>  Min.   :  1.00   None         : 79     Cat   : 10  
#>  1st Qu.: 80.75   020227-slice1:  1     Human : 11  
#>  Median :160.50   020315-2-ST  :  1     Monkey: 68  
#>  Mean   :160.50   020315-3-ST  :  1     Mouse : 78  
#>  3rd Qu.:240.25   020515-2-NPY :  1     Rabbit:  2  
#>  Max.   :320.00   020530-2-NPY :  1     Rat   :151  
#>                   (Other)      :236                 
#>                 area              layer      rotated       
#>  Area not reported:  1   II          :  4   Mode :logical  
#>  Auditory         :  1   III         : 16   FALSE:310      
#>  Frontal          :  8   II/III      :136   TRUE :10       
#>  Prefrontal       : 33   IV          : 98                  
#>  Somatosensory    :184   not reported: 30                  
#>  Temporal         :  9   V           : 33                  
#>  Visual           : 84   VI          :  3                  
#>             archive                               original.type
#>  Gonzalez-Burgos: 15   Not reported                      :79   
#>  Helmstaedter   : 43   Basket cell                       :57   
#>  Markram        :104   Martinotti cell                   :33   
#>  Yuste          : 78   Somatostatin (SOM) containing cell:18   
#>  NA's           : 80   Bitufted cell                     :12   
#>                        (Other)                           :41   
#>                        NA's                              :80   
#>                                                                                                                                  paper    
#>  Anatomical, physiological, molecular and circuit properties of nest basket cells in the developing somatosensory cortex            :104  
#>  The relation between dendritic geometry, electrical excitability, and axonal projections of L2/3 Interneurons in rat barrel cortex.: 43  
#>  Internal dynamics determine the cortical response to thalamic stimulation                                                          : 17  
#>  Correlation between axonal morphologies and synaptic input kinetics of interneurons from mouse visual cortex                       : 16  
#>  Calcium microdomains in aspiny dendrites                                                                                           : 15  
#>  (Other)                                                                                                                            :104  
#>  NA's                                                                                                                               : 21
```

**join this with labels** **aggregate counts across neurons**

From here, it is easy to filter for a given cell, species, etc.

``` r
# subset, tidy filter
```

Also, simple functions that work at cell level:

-   One can get statistics with `tidyverse` functions. Get the counts
    from the categories

``` r
get_all_counts 
#> function(folder) {
#>   get_all_labels(folder)
#>   a$other <- NULL
#>   a$complete <- NULL
#>   a <- a %>% gather(F1, F2, F3, F4, F5, F6, key = 'feature', value  = 'value')
#>   a %>% group_by(feature, value) %>% tally()
#>   summary <- a %>% group_by(neuron, feature, value) %>% tally()
#>   summary <- ungroup(summary)
#>   summary <- summary %>% group_by(neuron) %>% spread(key = 'value', value = 'n')
#>   # now group by neuron and summ all
#>   summary <- summary %>% group_by(neuron) %>% select(-feature) %>% summarise_all(.funs = sum, na.rm = TRUE)
#>   summary$None  <- NULL
#>   summary$V1 <- NULL
#>   cols <- c( "neuron",    "intralaminar",   "translaminar", "intracolumnar", "transcolumnar",      "centered",   "displaced",   "ascending",       "both",  "descending",          "arcade","Cajal-Retzius",           "chandelier",         "common basket",   "common type",                  "horse-tail",             "large basket",    "Martinotti",      "neurogliaform",   "other",       "characterized",           "uncharacterized")
#>   summary <- summary[, cols]
#>   summary
#> }
#> <bytecode: 0x5110748>
#> <environment: namespace:gardenr>
```

This is also available in row-view, which is a bit easier to analyze
Thus, directly filter by confidence in some variable. Here, use the row
verions.

Example statistics
==================

-   How many partially labelled cells?
-   …
