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
library(tidyverse)
#> Registered S3 methods overwritten by 'ggplot2':
#>   method         from 
#>   [.quosures     rlang
#>   c.quosures     rlang
#>   print.quosures rlang
#> Registered S3 method overwritten by 'rvest':
#>   method            from
#>   read_xml.response xml2
#> ── Attaching packages ────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────── tidyverse 1.2.1 ──
#> ✔ ggplot2 3.1.1       ✔ purrr   0.3.2  
#> ✔ tibble  2.1.1       ✔ dplyr   0.8.0.1
#> ✔ tidyr   0.8.3       ✔ stringr 1.4.0  
#> ✔ readr   1.3.1       ✔ forcats 0.4.0
#> ── Conflicts ───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────── tidyverse_conflicts() ──
#> ✖ dplyr::filter() masks stats::filter()
#> ✖ dplyr::lag()    masks stats::lag()
```

Usage
-----

`garnenr` functions return the data for all 320 cells. There are
functions for the classification labels `get_all_labels`, metadata
`get_all_meta`, and alternative type names and definitions
`get_alternative_types`.

``` r
library(gardenr)
#> 
#> Attaching package: 'gardenr'
#> The following object is masked from 'package:readr':
#> 
#>     read_csv
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

``` r
alternative <- get_alternative_types(folder)
summary(alternative)
#>    annotator               type                            definition 
#>  23     :74   bipolar        :  5                               :163  
#>  27     :68   bitufted       :  5   see above.                  : 12  
#>  14     :38   double bouquet :  4   as it says.                 :  6  
#>  7      :11   bipolar?       :  3   see above                   :  4  
#>  30     :10   inverted arcade:  3   as above.                   :  2  
#>  18     : 9   bitufted?      :  2   deleted from the final list.:  2  
#>  (Other):59   (Other)        :247   (Other)                     : 80
```

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

To get data on a specific cell or annotator, we only need filter by id:

``` r
metadata %>% filter(neuron == 12)
#>   neuron    neuromorpho.name species       area  layer rotated
#> 1     12 03-27-01-3wideArbor  Monkey Prefrontal II/III   FALSE
#>           archive original.type
#> 1 Gonzalez-Burgos   Basket cell
#>                                                                                                                                                           paper
#> 1 Cluster analysis-based physiological classification and morphological properties of inhibitory neurons in layers 2-3 of monkey dorsolateral prefrontal cortex
annotations %>% filter(neuron == 12)
#>    annotator neuron           F1            F2        F3         F4
#> 1          1     12 translaminar transcolumnar  centered       None
#> 2          2     12 translaminar transcolumnar  centered       None
#> 3          3     12 translaminar transcolumnar displaced descending
#> 4          4     12 translaminar transcolumnar displaced       both
#> 5          5     12 translaminar transcolumnar  centered       None
#> 6          6     12 translaminar transcolumnar  centered       None
#> 7          7     12 translaminar transcolumnar displaced       both
#> 8          8     12 translaminar transcolumnar displaced descending
#> 9          9     12 translaminar transcolumnar  centered       None
#> 10        10     12 translaminar transcolumnar  centered       None
#> 11        11     12 intralaminar transcolumnar  centered       None
#> 12        12     12 intralaminar transcolumnar  centered       None
#> 13        13     12 translaminar intracolumnar  centered       None
#> 14        14     12 intralaminar transcolumnar  centered       None
#> 15        15     12 translaminar transcolumnar  centered       None
#> 16        16     12 translaminar transcolumnar  centered       None
#> 17        17     12 translaminar transcolumnar displaced descending
#> 18        18     12 intralaminar transcolumnar  centered       None
#> 19        19     12 translaminar transcolumnar  centered       None
#> 20        20     12 translaminar transcolumnar  centered       None
#> 21        21     12 translaminar transcolumnar  centered       None
#> 22        22     12 translaminar transcolumnar  centered       None
#> 23        23     12         None          None      None       None
#> 24        24     12 translaminar transcolumnar  centered       None
#> 25        25     12 translaminar transcolumnar  centered       None
#> 26        26     12 translaminar transcolumnar  centered       None
#> 27        27     12 translaminar transcolumnar  centered       None
#> 28        28     12 translaminar transcolumnar  centered       None
#> 29        29     12 translaminar transcolumnar  centered       None
#> 30        30     12 translaminar transcolumnar  centered       None
#> 31        31     12 translaminar transcolumnar  centered       None
#> 32        32     12 translaminar transcolumnar displaced       both
#> 33        33     12 intralaminar transcolumnar  centered       None
#> 34        34     12 translaminar transcolumnar  centered       None
#> 35        35     12 intralaminar transcolumnar  centered       None
#> 36        36     12 translaminar transcolumnar  centered       None
#> 37        37     12 translaminar transcolumnar displaced descending
#> 38        38     12 translaminar transcolumnar  centered       None
#> 39        39     12 intralaminar transcolumnar  centered       None
#> 40        40     12 intralaminar transcolumnar  centered       None
#> 41        41     12 translaminar transcolumnar displaced       both
#> 42        42     12 intralaminar transcolumnar  centered       None
#> 43        43     12 translaminar transcolumnar  centered       None
#> 44        44     12         None          None      None       None
#> 45        45     12              transcolumnar                     
#> 46        46     12                             centered           
#> 47        47     12 translaminar transcolumnar displaced       both
#> 48        48     12 translaminar transcolumnar                     
#>               F5              F6
#> 1   large basket   characterized
#> 2   large basket   characterized
#> 3   large basket   characterized
#> 4   large basket   characterized
#> 5   large basket   characterized
#> 6   large basket   characterized
#> 7   large basket   characterized
#> 8   large basket   characterized
#> 9   large basket   characterized
#> 10  large basket   characterized
#> 11   common type   characterized
#> 12 common basket   characterized
#> 13   common type   characterized
#> 14  large basket   characterized
#> 15         other   characterized
#> 16  large basket   characterized
#> 17  large basket   characterized
#> 18   common type   characterized
#> 19  large basket   characterized
#> 20 common basket   characterized
#> 21 common basket   characterized
#> 22  large basket   characterized
#> 23          None uncharacterized
#> 24  large basket   characterized
#> 25  large basket   characterized
#> 26  large basket   characterized
#> 27  large basket   characterized
#> 28   common type   characterized
#> 29  large basket   characterized
#> 30  large basket   characterized
#> 31  large basket   characterized
#> 32  large basket   characterized
#> 33  large basket   characterized
#> 34  large basket   characterized
#> 35   common type   characterized
#> 36  large basket   characterized
#> 37         other   characterized
#> 38  large basket   characterized
#> 39  large basket   characterized
#> 40   common type   characterized
#> 41 common basket   characterized
#> 42 neurogliaform   characterized
#> 43  large basket   characterized
#> 44          None uncharacterized
#> 45 common basket   characterized
#> 46  large basket   characterized
#> 47  large basket   characterized
#> 48  large basket   characterized
#>                                          other complete
#> 1                                         None     TRUE
#> 2                                         None     TRUE
#> 3                                         None     TRUE
#> 4                                         None     TRUE
#> 5                                         None     TRUE
#> 6                                         None     TRUE
#> 7                                         None     TRUE
#> 8                                         None     TRUE
#> 9                                         None     TRUE
#> 10                                        None     TRUE
#> 11                                        None     TRUE
#> 12                                        None     TRUE
#> 13                                        None     TRUE
#> 14                                        None     TRUE
#> 15 fs non-basket (dendrite targetting fs) cell     TRUE
#> 16                                        None     TRUE
#> 17                                        None     TRUE
#> 18                                        None     TRUE
#> 19                                        None     TRUE
#> 20                                        None     TRUE
#> 21                                        None     TRUE
#> 22                                        None     TRUE
#> 23                                        None     TRUE
#> 24                                        None     TRUE
#> 25                                        None     TRUE
#> 26                                        None     TRUE
#> 27                                        None     TRUE
#> 28                                        None     TRUE
#> 29                                        None     TRUE
#> 30                                        None     TRUE
#> 31                                        None     TRUE
#> 32                                        None     TRUE
#> 33                                        None     TRUE
#> 34                                        None     TRUE
#> 35                                        None     TRUE
#> 36                                        None     TRUE
#> 37                               extended ball     TRUE
#> 38                                        None     TRUE
#> 39                                        None     TRUE
#> 40                                        None     TRUE
#> 41                                        None     TRUE
#> 42                                        None     TRUE
#> 43                                        None     TRUE
#> 44                                        None     TRUE
#> 45                                        None    FALSE
#> 46                                        None    FALSE
#> 47                                        None    FALSE
#> 48                                        None    FALSE
```

``` r
annotations %>% filter(annotator == 2)
#>     annotator neuron           F1            F2        F3         F4
#> 1           2      1 intralaminar intracolumnar  centered       None
#> 2           2      2 translaminar transcolumnar displaced       both
#> 3           2      3 translaminar intracolumnar displaced  ascending
#> 4           2      4 intralaminar intracolumnar  centered       None
#> 5           2      5 translaminar transcolumnar  centered       None
#> 6           2      6 intralaminar intracolumnar  centered       None
#> 7           2      7 translaminar intracolumnar  centered       None
#> 8           2      8 translaminar intracolumnar displaced  ascending
#> 9           2      9 translaminar transcolumnar  centered       None
#> 10          2     10 translaminar intracolumnar displaced descending
#> 11          2     11 translaminar transcolumnar displaced descending
#> 12          2     12 translaminar transcolumnar  centered       None
#> 13          2     13 translaminar intracolumnar  centered       None
#> 14          2     14 translaminar intracolumnar  centered       None
#> 15          2     15 intralaminar transcolumnar  centered       None
#> 16          2     16 intralaminar intracolumnar  centered       None
#> 17          2     17 translaminar intracolumnar  centered       None
#> 18          2     18 translaminar intracolumnar displaced descending
#> 19          2     19 translaminar transcolumnar displaced descending
#> 20          2     20 translaminar intracolumnar displaced  ascending
#> 21          2     21 intralaminar intracolumnar  centered       None
#> 22          2     22 translaminar intracolumnar displaced descending
#> 23          2     23 translaminar intracolumnar  centered       None
#> 24          2     24 intralaminar intracolumnar  centered       None
#> 25          2     25 translaminar intracolumnar  centered       None
#> 26          2     26 intralaminar transcolumnar displaced       None
#> 27          2     27 translaminar intracolumnar displaced       both
#> 28          2     28 translaminar intracolumnar displaced  ascending
#> 29          2     29 intralaminar intracolumnar  centered       None
#> 30          2     30 translaminar transcolumnar displaced       both
#> 31          2     31 translaminar transcolumnar displaced       both
#> 32          2     32 translaminar intracolumnar displaced descending
#> 33          2     33 intralaminar intracolumnar  centered       None
#> 34          2     34 translaminar transcolumnar displaced  ascending
#> 35          2     35 intralaminar intracolumnar  centered       None
#> 36          2     36 intralaminar intracolumnar  centered       None
#> 37          2     37 intralaminar intracolumnar  centered       None
#> 38          2     38 translaminar intracolumnar displaced descending
#> 39          2     39 translaminar intracolumnar displaced descending
#> 40          2     40 translaminar transcolumnar displaced  ascending
#> 41          2     41 translaminar intracolumnar  centered       None
#> 42          2     42 translaminar intracolumnar displaced  ascending
#> 43          2     43 translaminar intracolumnar  centered       None
#> 44          2     44 intralaminar intracolumnar  centered       None
#> 45          2     45 translaminar intracolumnar displaced  ascending
#> 46          2     46 translaminar intracolumnar displaced       both
#> 47          2     47 translaminar intracolumnar displaced descending
#> 48          2     48 translaminar transcolumnar displaced descending
#> 49          2     49 intralaminar transcolumnar  centered       None
#> 50          2     50 translaminar intracolumnar displaced descending
#> 51          2     51 translaminar transcolumnar  centered       None
#> 52          2     52 translaminar transcolumnar  centered       None
#> 53          2     53 translaminar intracolumnar displaced  ascending
#> 54          2     54 intralaminar intracolumnar  centered       None
#> 55          2     55 intralaminar transcolumnar displaced       None
#> 56          2     56 intralaminar transcolumnar displaced       None
#> 57          2     57 translaminar transcolumnar displaced  ascending
#> 58          2     58 translaminar intracolumnar displaced descending
#> 59          2     59 translaminar transcolumnar  centered       None
#> 60          2     60 intralaminar intracolumnar  centered       None
#> 61          2     61 translaminar transcolumnar displaced  ascending
#> 62          2     62 translaminar intracolumnar displaced       both
#> 63          2     63 translaminar transcolumnar displaced descending
#> 64          2     64 translaminar intracolumnar displaced  ascending
#> 65          2     65 intralaminar intracolumnar  centered       None
#> 66          2     66 translaminar transcolumnar displaced  ascending
#> 67          2     67 intralaminar intracolumnar  centered       None
#> 68          2     68 intralaminar transcolumnar  centered       None
#> 69          2     69 translaminar transcolumnar displaced  ascending
#> 70          2     70 intralaminar transcolumnar  centered       None
#> 71          2     71 intralaminar intracolumnar  centered       None
#> 72          2     72 translaminar intracolumnar displaced descending
#> 73          2     73 translaminar intracolumnar displaced  ascending
#> 74          2     74 translaminar intracolumnar displaced  ascending
#> 75          2     75 intralaminar intracolumnar displaced       None
#> 76          2     76 translaminar transcolumnar displaced descending
#> 77          2     77 translaminar transcolumnar displaced       both
#> 78          2     78 intralaminar transcolumnar  centered       None
#> 79          2     79 translaminar transcolumnar displaced  ascending
#> 80          2     80 intralaminar intracolumnar displaced       None
#> 81          2     81 intralaminar transcolumnar  centered       None
#> 82          2     82 translaminar transcolumnar displaced  ascending
#> 83          2     83 translaminar intracolumnar displaced       both
#> 84          2     84 translaminar transcolumnar  centered       None
#> 85          2     85 intralaminar transcolumnar  centered       None
#> 86          2     86 intralaminar intracolumnar  centered       None
#> 87          2     87 translaminar intracolumnar displaced  ascending
#> 88          2     88 translaminar intracolumnar displaced       both
#> 89          2     89 translaminar intracolumnar displaced descending
#> 90          2     90 translaminar transcolumnar displaced  ascending
#> 91          2     91 translaminar intracolumnar displaced  ascending
#> 92          2     92 intralaminar transcolumnar  centered       None
#> 93          2     93 translaminar transcolumnar  centered       None
#> 94          2     94 translaminar intracolumnar displaced       both
#> 95          2     95 translaminar intracolumnar displaced       both
#> 96          2     96 translaminar intracolumnar  centered       None
#> 97          2     97 translaminar intracolumnar displaced       both
#> 98          2     98 translaminar intracolumnar displaced descending
#> 99          2     99 intralaminar intracolumnar displaced       None
#> 100         2    100 translaminar intracolumnar displaced       both
#> 101         2    101 translaminar transcolumnar displaced       both
#> 102         2    102 translaminar intracolumnar displaced       both
#> 103         2    103 translaminar transcolumnar displaced descending
#> 104         2    104 translaminar intracolumnar displaced descending
#> 105         2    105 translaminar transcolumnar displaced  ascending
#> 106         2    106 translaminar transcolumnar displaced  ascending
#> 107         2    107 translaminar intracolumnar displaced  ascending
#> 108         2    108 translaminar transcolumnar displaced       both
#> 109         2    109 translaminar intracolumnar displaced       both
#> 110         2    110 translaminar intracolumnar displaced descending
#> 111         2    111 translaminar transcolumnar displaced  ascending
#> 112         2    112 translaminar transcolumnar displaced       both
#> 113         2    113 intralaminar transcolumnar  centered       None
#> 114         2    114 translaminar transcolumnar displaced descending
#> 115         2    115 translaminar transcolumnar displaced       both
#> 116         2    116 intralaminar intracolumnar  centered       None
#> 117         2    117 intralaminar intracolumnar displaced       None
#> 118         2    118 translaminar intracolumnar displaced       both
#> 119         2    119 translaminar transcolumnar displaced  ascending
#> 120         2    120 translaminar transcolumnar  centered       None
#> 121         2    121 intralaminar transcolumnar  centered       None
#> 122         2    122 translaminar transcolumnar  centered       None
#> 123         2    123 intralaminar transcolumnar  centered       None
#> 124         2    124 translaminar intracolumnar displaced descending
#> 125         2    125 translaminar transcolumnar displaced  ascending
#> 126         2    126 translaminar transcolumnar displaced descending
#> 127         2    127 intralaminar transcolumnar displaced       None
#> 128         2    128 translaminar intracolumnar displaced       both
#> 129         2    129 intralaminar intracolumnar displaced       None
#> 130         2    130 translaminar intracolumnar displaced descending
#> 131         2    131 intralaminar transcolumnar displaced       None
#> 132         2    132 translaminar transcolumnar displaced       both
#> 133         2    133 translaminar transcolumnar displaced  ascending
#> 134         2    134 translaminar intracolumnar displaced descending
#> 135         2    135 intralaminar transcolumnar displaced       None
#> 136         2    136 intralaminar transcolumnar displaced       None
#> 137         2    137 translaminar transcolumnar displaced descending
#> 138         2    138 intralaminar transcolumnar displaced       None
#> 139         2    139 translaminar intracolumnar displaced descending
#> 140         2    140 translaminar intracolumnar displaced descending
#> 141         2    141         None          None      None       None
#> 142         2    142 translaminar intracolumnar displaced descending
#> 143         2    143 translaminar intracolumnar displaced       both
#> 144         2    144 translaminar transcolumnar  centered       None
#> 145         2    145 translaminar transcolumnar displaced descending
#> 146         2    146 translaminar transcolumnar displaced descending
#> 147         2    147 translaminar intracolumnar displaced descending
#> 148         2    148 translaminar transcolumnar displaced descending
#> 149         2    149 translaminar intracolumnar displaced       both
#> 150         2    150 intralaminar intracolumnar  centered       None
#> 151         2    151 translaminar intracolumnar displaced       both
#> 152         2    152 intralaminar intracolumnar  centered       None
#> 153         2    153 translaminar transcolumnar  centered       None
#> 154         2    154 translaminar intracolumnar displaced       both
#> 155         2    155 translaminar transcolumnar displaced       both
#> 156         2    156 intralaminar intracolumnar displaced       None
#> 157         2    157 translaminar transcolumnar displaced descending
#> 158         2    158 translaminar transcolumnar displaced       both
#> 159         2    159         None          None      None       None
#> 160         2    160 intralaminar intracolumnar displaced       None
#> 161         2    161 translaminar intracolumnar  centered       None
#> 162         2    162 translaminar transcolumnar displaced       both
#> 163         2    163 translaminar transcolumnar displaced  ascending
#> 164         2    164 translaminar transcolumnar displaced       both
#> 165         2    165 translaminar transcolumnar displaced       both
#> 166         2    166 translaminar transcolumnar  centered       None
#> 167         2    167 translaminar intracolumnar displaced descending
#> 168         2    168 translaminar intracolumnar displaced descending
#> 169         2    169 translaminar intracolumnar displaced descending
#> 170         2    170 translaminar transcolumnar displaced descending
#> 171         2    171 translaminar transcolumnar displaced       both
#> 172         2    172 translaminar intracolumnar displaced descending
#> 173         2    173 translaminar intracolumnar displaced       both
#> 174         2    174 translaminar transcolumnar  centered       None
#> 175         2    175 intralaminar intracolumnar  centered       None
#> 176         2    176 intralaminar transcolumnar  centered       None
#> 177         2    177 translaminar transcolumnar displaced descending
#> 178         2    178 translaminar transcolumnar displaced  ascending
#> 179         2    179 translaminar intracolumnar displaced  ascending
#> 180         2    180 intralaminar intracolumnar displaced       None
#> 181         2    181 intralaminar intracolumnar displaced       None
#> 182         2    182 translaminar transcolumnar displaced descending
#> 183         2    183 intralaminar transcolumnar displaced       None
#> 184         2    184 translaminar transcolumnar displaced  ascending
#> 185         2    185 translaminar transcolumnar displaced       both
#> 186         2    186 translaminar transcolumnar displaced descending
#> 187         2    187 translaminar transcolumnar displaced descending
#> 188         2    188 translaminar intracolumnar displaced descending
#> 189         2    189         None          None      None       None
#> 190         2    190 intralaminar intracolumnar displaced       None
#> 191         2    191 translaminar transcolumnar displaced       both
#> 192         2    192 translaminar intracolumnar displaced       both
#> 193         2    193 translaminar intracolumnar displaced  ascending
#> 194         2    194 translaminar transcolumnar displaced       both
#> 195         2    195 intralaminar intracolumnar  centered       None
#> 196         2    196 translaminar transcolumnar displaced descending
#> 197         2    197 translaminar intracolumnar displaced descending
#> 198         2    198 intralaminar intracolumnar  centered       None
#> 199         2    199 translaminar intracolumnar displaced  ascending
#> 200         2    200 translaminar transcolumnar displaced       both
#> 201         2    201 translaminar transcolumnar displaced       both
#> 202         2    202 translaminar intracolumnar  centered       None
#> 203         2    203 translaminar intracolumnar displaced  ascending
#> 204         2    204 intralaminar intracolumnar  centered       None
#> 205         2    205 translaminar intracolumnar displaced descending
#> 206         2    206 translaminar transcolumnar  centered       None
#> 207         2    207 translaminar intracolumnar displaced       both
#> 208         2    208 translaminar transcolumnar displaced       both
#> 209         2    209 translaminar intracolumnar displaced       both
#> 210         2    210 translaminar transcolumnar displaced       both
#> 211         2    211 intralaminar intracolumnar  centered       None
#> 212         2    212 intralaminar intracolumnar  centered       None
#> 213         2    213 intralaminar intracolumnar  centered       None
#> 214         2    214 intralaminar intracolumnar displaced       None
#> 215         2    215 intralaminar transcolumnar displaced       None
#> 216         2    216 translaminar transcolumnar  centered       None
#> 217         2    217 translaminar transcolumnar displaced       both
#> 218         2    218 intralaminar intracolumnar  centered       None
#> 219         2    219 translaminar intracolumnar displaced descending
#> 220         2    220 translaminar transcolumnar displaced       both
#> 221         2    221 translaminar transcolumnar displaced  ascending
#> 222         2    222 translaminar transcolumnar displaced  ascending
#> 223         2    223 translaminar transcolumnar displaced       both
#> 224         2    224 translaminar intracolumnar  centered       None
#> 225         2    225 intralaminar intracolumnar  centered       None
#> 226         2    226 translaminar transcolumnar displaced descending
#> 227         2    227 intralaminar transcolumnar  centered       None
#> 228         2    228 intralaminar transcolumnar  centered       None
#> 229         2    229 translaminar transcolumnar displaced  ascending
#> 230         2    230 intralaminar transcolumnar  centered       None
#> 231         2    231 translaminar transcolumnar displaced  ascending
#> 232         2    232 translaminar transcolumnar displaced  ascending
#> 233         2    233 translaminar intracolumnar displaced descending
#> 234         2    234 translaminar transcolumnar displaced       both
#> 235         2    235 intralaminar intracolumnar  centered       None
#> 236         2    236 intralaminar transcolumnar  centered       None
#> 237         2    237 intralaminar intracolumnar  centered       None
#> 238         2    238 translaminar intracolumnar displaced descending
#> 239         2    239 intralaminar transcolumnar  centered       None
#> 240         2    240 translaminar intracolumnar displaced       both
#> 241         2    241 intralaminar intracolumnar  centered       None
#> 242         2    242 intralaminar intracolumnar displaced       None
#> 243         2    243 translaminar transcolumnar displaced descending
#> 244         2    244 translaminar intracolumnar  centered       None
#> 245         2    245 translaminar intracolumnar displaced  ascending
#> 246         2    246 translaminar intracolumnar displaced descending
#> 247         2    247 intralaminar transcolumnar  centered       None
#> 248         2    248 translaminar intracolumnar displaced descending
#> 249         2    249 translaminar transcolumnar displaced  ascending
#> 250         2    250 translaminar transcolumnar displaced  ascending
#> 251         2    251 translaminar transcolumnar displaced       both
#> 252         2    252 translaminar intracolumnar  centered       None
#> 253         2    253 translaminar transcolumnar  centered       None
#> 254         2    254 translaminar intracolumnar displaced descending
#> 255         2    255 translaminar transcolumnar  centered       None
#> 256         2    256 translaminar transcolumnar displaced  ascending
#> 257         2    257 translaminar intracolumnar displaced descending
#> 258         2    258 intralaminar intracolumnar displaced       None
#> 259         2    259 translaminar transcolumnar  centered       None
#> 260         2    260 intralaminar transcolumnar  centered       None
#> 261         2    261 translaminar intracolumnar displaced  ascending
#> 262         2    262 intralaminar intracolumnar displaced       None
#> 263         2    263 intralaminar intracolumnar  centered       None
#> 264         2    264 intralaminar intracolumnar  centered       None
#> 265         2    265 translaminar intracolumnar  centered       None
#> 266         2    266 translaminar intracolumnar displaced descending
#> 267         2    267 intralaminar transcolumnar  centered       None
#> 268         2    268 translaminar intracolumnar  centered       None
#> 269         2    269 translaminar intracolumnar displaced descending
#> 270         2    270 intralaminar intracolumnar displaced       None
#> 271         2    271 intralaminar intracolumnar displaced       None
#> 272         2    272 translaminar transcolumnar displaced  ascending
#> 273         2    273 translaminar transcolumnar displaced       both
#> 274         2    274 translaminar transcolumnar  centered       None
#> 275         2    275 translaminar transcolumnar displaced descending
#> 276         2    276 translaminar transcolumnar displaced descending
#> 277         2    277 intralaminar intracolumnar  centered       None
#> 278         2    278 translaminar intracolumnar displaced descending
#> 279         2    279 translaminar intracolumnar displaced       both
#> 280         2    280 intralaminar transcolumnar  centered       None
#> 281         2    281 translaminar transcolumnar displaced descending
#> 282         2    282 translaminar intracolumnar displaced       both
#> 283         2    283 translaminar intracolumnar  centered       None
#> 284         2    284 translaminar transcolumnar displaced  ascending
#> 285         2    285 intralaminar intracolumnar  centered       None
#> 286         2    286 translaminar transcolumnar  centered       None
#> 287         2    287 translaminar intracolumnar displaced descending
#> 288         2    288 translaminar transcolumnar displaced  ascending
#> 289         2    289 translaminar transcolumnar displaced       both
#> 290         2    290 translaminar intracolumnar displaced  ascending
#> 291         2    291 translaminar transcolumnar displaced       both
#> 292         2    292 translaminar transcolumnar displaced       both
#> 293         2    293 translaminar intracolumnar  centered       None
#> 294         2    294 translaminar intracolumnar displaced  ascending
#> 295         2    295 intralaminar intracolumnar  centered       None
#> 296         2    296 intralaminar intracolumnar  centered       None
#> 297         2    297 translaminar transcolumnar displaced  ascending
#> 298         2    298 translaminar intracolumnar displaced  ascending
#> 299         2    299 translaminar intracolumnar  centered       None
#> 300         2    300 translaminar intracolumnar displaced descending
#> 301         2    301 translaminar intracolumnar  centered       None
#> 302         2    302 translaminar transcolumnar displaced  ascending
#> 303         2    303 translaminar transcolumnar displaced  ascending
#> 304         2    304 translaminar intracolumnar  centered       None
#> 305         2    305 intralaminar transcolumnar  centered       None
#> 306         2    306 translaminar transcolumnar displaced       both
#> 307         2    307 intralaminar intracolumnar  centered       None
#> 308         2    308 intralaminar intracolumnar  centered       None
#> 309         2    309 intralaminar intracolumnar  centered       None
#> 310         2    310 intralaminar intracolumnar  centered       None
#> 311         2    311 translaminar intracolumnar displaced  ascending
#> 312         2    312 translaminar transcolumnar displaced descending
#> 313         2    313 translaminar intracolumnar displaced descending
#> 314         2    314 translaminar transcolumnar displaced  ascending
#> 315         2    315 intralaminar intracolumnar  centered       None
#> 316         2    316 intralaminar transcolumnar  centered       None
#> 317         2    317 translaminar transcolumnar displaced descending
#> 318         2    318 translaminar transcolumnar displaced descending
#> 319         2    319 intralaminar intracolumnar  centered       None
#> 320         2    320 intralaminar intracolumnar displaced       None
#>                F5              F6 other complete
#> 1   neurogliaform   characterized  None     TRUE
#> 2      chandelier   characterized  None     TRUE
#> 3      Martinotti   characterized  None     TRUE
#> 4     common type   characterized  None     TRUE
#> 5   common basket   characterized  None     TRUE
#> 6   neurogliaform   characterized  None     TRUE
#> 7     common type   characterized  None     TRUE
#> 8      Martinotti   characterized  None     TRUE
#> 9     common type   characterized  None     TRUE
#> 10     horse-tail   characterized  None     TRUE
#> 11   large basket   characterized  None     TRUE
#> 12   large basket   characterized  None     TRUE
#> 13    common type   characterized  None     TRUE
#> 14    common type   characterized  None     TRUE
#> 15    common type   characterized  None     TRUE
#> 16  neurogliaform   characterized  None     TRUE
#> 17  common basket   characterized  None     TRUE
#> 18  common basket   characterized  None     TRUE
#> 19    common type   characterized  None     TRUE
#> 20     Martinotti   characterized  None     TRUE
#> 21  neurogliaform   characterized  None     TRUE
#> 22    common type   characterized  None     TRUE
#> 23    common type   characterized  None     TRUE
#> 24  common basket   characterized  None     TRUE
#> 25  common basket   characterized  None     TRUE
#> 26    common type   characterized  None     TRUE
#> 27     chandelier   characterized  None     TRUE
#> 28     Martinotti   characterized  None     TRUE
#> 29  common basket   characterized  None     TRUE
#> 30   large basket   characterized  None     TRUE
#> 31    common type   characterized  None     TRUE
#> 32    common type   characterized  None     TRUE
#> 33    common type   characterized  None     TRUE
#> 34     Martinotti   characterized  None     TRUE
#> 35  neurogliaform   characterized  None     TRUE
#> 36    common type   characterized  None     TRUE
#> 37  common basket   characterized  None     TRUE
#> 38     horse-tail   characterized  None     TRUE
#> 39     horse-tail   characterized  None     TRUE
#> 40   large basket   characterized  None     TRUE
#> 41  common basket   characterized  None     TRUE
#> 42    common type   characterized  None     TRUE
#> 43    common type   characterized  None     TRUE
#> 44  neurogliaform   characterized  None     TRUE
#> 45    common type   characterized  None     TRUE
#> 46     horse-tail   characterized  None     TRUE
#> 47  common basket   characterized  None     TRUE
#> 48    common type   characterized  None     TRUE
#> 49   large basket   characterized  None     TRUE
#> 50    common type   characterized  None     TRUE
#> 51    common type   characterized  None     TRUE
#> 52  common basket   characterized  None     TRUE
#> 53     Martinotti   characterized  None     TRUE
#> 54  common basket   characterized  None     TRUE
#> 55   large basket   characterized  None     TRUE
#> 56  common basket   characterized  None     TRUE
#> 57    common type   characterized  None     TRUE
#> 58     horse-tail   characterized  None     TRUE
#> 59    common type   characterized  None     TRUE
#> 60  neurogliaform   characterized  None     TRUE
#> 61   large basket   characterized  None     TRUE
#> 62    common type   characterized  None     TRUE
#> 63         arcade   characterized  None     TRUE
#> 64    common type   characterized  None     TRUE
#> 65  common basket   characterized  None     TRUE
#> 66     Martinotti   characterized  None     TRUE
#> 67  common basket   characterized  None     TRUE
#> 68  neurogliaform   characterized  None     TRUE
#> 69     Martinotti   characterized  None     TRUE
#> 70   large basket   characterized  None     TRUE
#> 71  neurogliaform   characterized  None     TRUE
#> 72    common type   characterized  None     TRUE
#> 73     Martinotti   characterized  None     TRUE
#> 74    common type   characterized  None     TRUE
#> 75    common type   characterized  None     TRUE
#> 76    common type   characterized  None     TRUE
#> 77    common type   characterized  None     TRUE
#> 78   large basket   characterized  None     TRUE
#> 79  common basket   characterized  None     TRUE
#> 80  common basket   characterized  None     TRUE
#> 81    common type   characterized  None     TRUE
#> 82  common basket   characterized  None     TRUE
#> 83    common type   characterized  None     TRUE
#> 84   large basket   characterized  None     TRUE
#> 85  common basket   characterized  None     TRUE
#> 86  common basket   characterized  None     TRUE
#> 87  common basket   characterized  None     TRUE
#> 88    common type   characterized  None     TRUE
#> 89     horse-tail   characterized  None     TRUE
#> 90  common basket   characterized  None     TRUE
#> 91    common type   characterized  None     TRUE
#> 92  neurogliaform   characterized  None     TRUE
#> 93   large basket   characterized  None     TRUE
#> 94  common basket   characterized  None     TRUE
#> 95    common type   characterized  None     TRUE
#> 96  common basket   characterized  None     TRUE
#> 97     horse-tail   characterized  None     TRUE
#> 98    common type   characterized  None     TRUE
#> 99  common basket   characterized  None     TRUE
#> 100 common basket   characterized  None     TRUE
#> 101  large basket   characterized  None     TRUE
#> 102 common basket   characterized  None     TRUE
#> 103 neurogliaform   characterized  None     TRUE
#> 104   common type   characterized  None     TRUE
#> 105  large basket   characterized  None     TRUE
#> 106  large basket   characterized  None     TRUE
#> 107  large basket   characterized  None     TRUE
#> 108 neurogliaform   characterized  None     TRUE
#> 109   common type   characterized  None     TRUE
#> 110   common type   characterized  None     TRUE
#> 111    Martinotti   characterized  None     TRUE
#> 112 common basket   characterized  None     TRUE
#> 113 common basket   characterized  None     TRUE
#> 114   common type   characterized  None     TRUE
#> 115 common basket   characterized  None     TRUE
#> 116 neurogliaform   characterized  None     TRUE
#> 117 neurogliaform   characterized  None     TRUE
#> 118  large basket   characterized  None     TRUE
#> 119  large basket   characterized  None     TRUE
#> 120  large basket   characterized  None     TRUE
#> 121 neurogliaform   characterized  None     TRUE
#> 122   common type   characterized  None     TRUE
#> 123   common type   characterized  None     TRUE
#> 124    horse-tail   characterized  None     TRUE
#> 125  large basket   characterized  None     TRUE
#> 126   common type   characterized  None     TRUE
#> 127  large basket   characterized  None     TRUE
#> 128  large basket   characterized  None     TRUE
#> 129 common basket   characterized  None     TRUE
#> 130    horse-tail   characterized  None     TRUE
#> 131 common basket   characterized  None     TRUE
#> 132  large basket   characterized  None     TRUE
#> 133  large basket   characterized  None     TRUE
#> 134  large basket   characterized  None     TRUE
#> 135  large basket   characterized  None     TRUE
#> 136  large basket   characterized  None     TRUE
#> 137  large basket   characterized  None     TRUE
#> 138  large basket   characterized  None     TRUE
#> 139  large basket   characterized  None     TRUE
#> 140    horse-tail   characterized  None     TRUE
#> 141          None uncharacterized  None     TRUE
#> 142    horse-tail   characterized  None     TRUE
#> 143  large basket   characterized  None     TRUE
#> 144   common type   characterized  None     TRUE
#> 145        arcade   characterized  None     TRUE
#> 146  large basket   characterized  None     TRUE
#> 147 common basket   characterized  None     TRUE
#> 148   common type   characterized  None     TRUE
#> 149 neurogliaform   characterized  None     TRUE
#> 150 common basket   characterized  None     TRUE
#> 151  large basket   characterized  None     TRUE
#> 152 neurogliaform   characterized  None     TRUE
#> 153   common type   characterized  None     TRUE
#> 154  large basket   characterized  None     TRUE
#> 155  large basket   characterized  None     TRUE
#> 156 common basket   characterized  None     TRUE
#> 157  large basket   characterized  None     TRUE
#> 158  large basket   characterized  None     TRUE
#> 159          None uncharacterized  None     TRUE
#> 160 common basket   characterized  None     TRUE
#> 161 neurogliaform   characterized  None     TRUE
#> 162 neurogliaform   characterized  None     TRUE
#> 163   common type   characterized  None     TRUE
#> 164  large basket   characterized  None     TRUE
#> 165 common basket   characterized  None     TRUE
#> 166 common basket   characterized  None     TRUE
#> 167  large basket   characterized  None     TRUE
#> 168 common basket   characterized  None     TRUE
#> 169    horse-tail   characterized  None     TRUE
#> 170  large basket   characterized  None     TRUE
#> 171  large basket   characterized  None     TRUE
#> 172    horse-tail   characterized  None     TRUE
#> 173  large basket   characterized  None     TRUE
#> 174   common type   characterized  None     TRUE
#> 175 common basket   characterized  None     TRUE
#> 176  large basket   characterized  None     TRUE
#> 177   common type   characterized  None     TRUE
#> 178    Martinotti   characterized  None     TRUE
#> 179   common type   characterized  None     TRUE
#> 180   common type   characterized  None     TRUE
#> 181 common basket   characterized  None     TRUE
#> 182  large basket   characterized  None     TRUE
#> 183 common basket   characterized  None     TRUE
#> 184    Martinotti   characterized  None     TRUE
#> 185    Martinotti   characterized  None     TRUE
#> 186 common basket   characterized  None     TRUE
#> 187  large basket   characterized  None     TRUE
#> 188    horse-tail   characterized  None     TRUE
#> 189          None uncharacterized  None     TRUE
#> 190   common type   characterized  None     TRUE
#> 191  large basket   characterized  None     TRUE
#> 192 common basket   characterized  None     TRUE
#> 193 common basket   characterized  None     TRUE
#> 194 common basket   characterized  None     TRUE
#> 195 neurogliaform   characterized  None     TRUE
#> 196   common type   characterized  None     TRUE
#> 197    horse-tail   characterized  None     TRUE
#> 198 common basket   characterized  None     TRUE
#> 199   common type   characterized  None     TRUE
#> 200   common type   characterized  None     TRUE
#> 201        arcade   characterized  None     TRUE
#> 202   common type   characterized  None     TRUE
#> 203 common basket   characterized  None     TRUE
#> 204 common basket   characterized  None     TRUE
#> 205  large basket   characterized  None     TRUE
#> 206  large basket   characterized  None     TRUE
#> 207 common basket   characterized  None     TRUE
#> 208  large basket   characterized  None     TRUE
#> 209  large basket   characterized  None     TRUE
#> 210  large basket   characterized  None     TRUE
#> 211 common basket   characterized  None     TRUE
#> 212 common basket   characterized  None     TRUE
#> 213    chandelier   characterized  None     TRUE
#> 214 common basket   characterized  None     TRUE
#> 215 common basket   characterized  None     TRUE
#> 216  large basket   characterized  None     TRUE
#> 217  large basket   characterized  None     TRUE
#> 218    chandelier   characterized  None     TRUE
#> 219  large basket   characterized  None     TRUE
#> 220  large basket   characterized  None     TRUE
#> 221  large basket   characterized  None     TRUE
#> 222    Martinotti   characterized  None     TRUE
#> 223   common type   characterized  None     TRUE
#> 224 common basket   characterized  None     TRUE
#> 225 common basket   characterized  None     TRUE
#> 226 common basket   characterized  None     TRUE
#> 227  large basket   characterized  None     TRUE
#> 228 common basket   characterized  None     TRUE
#> 229    Martinotti   characterized  None     TRUE
#> 230 common basket   characterized  None     TRUE
#> 231    Martinotti   characterized  None     TRUE
#> 232   common type   characterized  None     TRUE
#> 233    horse-tail   characterized  None     TRUE
#> 234        arcade   characterized  None     TRUE
#> 235    chandelier   characterized  None     TRUE
#> 236 common basket   characterized  None     TRUE
#> 237 common basket   characterized  None     TRUE
#> 238  large basket   characterized  None     TRUE
#> 239   common type   characterized  None     TRUE
#> 240  large basket   characterized  None     TRUE
#> 241 common basket   characterized  None     TRUE
#> 242 neurogliaform   characterized  None     TRUE
#> 243   common type   characterized  None     TRUE
#> 244   common type   characterized  None     TRUE
#> 245  large basket   characterized  None     TRUE
#> 246   common type   characterized  None     TRUE
#> 247 common basket   characterized  None     TRUE
#> 248 common basket   characterized  None     TRUE
#> 249  large basket   characterized  None     TRUE
#> 250 common basket   characterized  None     TRUE
#> 251 common basket   characterized  None     TRUE
#> 252   common type   characterized  None     TRUE
#> 253 common basket   characterized  None     TRUE
#> 254 common basket   characterized  None     TRUE
#> 255   common type   characterized  None     TRUE
#> 256  large basket   characterized  None     TRUE
#> 257    horse-tail   characterized  None     TRUE
#> 258 common basket   characterized  None     TRUE
#> 259 common basket   characterized  None     TRUE
#> 260 common basket   characterized  None     TRUE
#> 261  large basket   characterized  None     TRUE
#> 262 common basket   characterized  None     TRUE
#> 263 neurogliaform   characterized  None     TRUE
#> 264 common basket   characterized  None     TRUE
#> 265   common type   characterized  None     TRUE
#> 266    horse-tail   characterized  None     TRUE
#> 267 common basket   characterized  None     TRUE
#> 268   common type   characterized  None     TRUE
#> 269 common basket   characterized  None     TRUE
#> 270 common basket   characterized  None     TRUE
#> 271 common basket   characterized  None     TRUE
#> 272    Martinotti   characterized  None     TRUE
#> 273   common type   characterized  None     TRUE
#> 274 common basket   characterized  None     TRUE
#> 275   common type   characterized  None     TRUE
#> 276    horse-tail   characterized  None     TRUE
#> 277    chandelier   characterized  None     TRUE
#> 278 common basket   characterized  None     TRUE
#> 279   common type   characterized  None     TRUE
#> 280   common type   characterized  None     TRUE
#> 281  large basket   characterized  None     TRUE
#> 282   common type   characterized  None     TRUE
#> 283 neurogliaform   characterized  None     TRUE
#> 284   common type   characterized  None     TRUE
#> 285 common basket   characterized  None     TRUE
#> 286  large basket   characterized  None     TRUE
#> 287  large basket   characterized  None     TRUE
#> 288  large basket   characterized  None     TRUE
#> 289  large basket   characterized  None     TRUE
#> 290    Martinotti   characterized  None     TRUE
#> 291    Martinotti   characterized  None     TRUE
#> 292   common type   characterized  None     TRUE
#> 293 common basket   characterized  None     TRUE
#> 294  large basket   characterized  None     TRUE
#> 295 common basket   characterized  None     TRUE
#> 296 common basket   characterized  None     TRUE
#> 297 common basket   characterized  None     TRUE
#> 298   common type   characterized  None     TRUE
#> 299 common basket   characterized  None     TRUE
#> 300 common basket   characterized  None     TRUE
#> 301 neurogliaform   characterized  None     TRUE
#> 302  large basket   characterized  None     TRUE
#> 303  large basket   characterized  None     TRUE
#> 304   common type   characterized  None     TRUE
#> 305 common basket   characterized  None     TRUE
#> 306   common type   characterized  None     TRUE
#> 307 common basket   characterized  None     TRUE
#> 308 common basket   characterized  None     TRUE
#> 309   common type   characterized  None     TRUE
#> 310 common basket   characterized  None     TRUE
#> 311 common basket   characterized  None     TRUE
#> 312 common basket   characterized  None     TRUE
#> 313    horse-tail   characterized  None     TRUE
#> 314   common type   characterized  None     TRUE
#> 315 neurogliaform   characterized  None     TRUE
#> 316   common type   characterized  None     TRUE
#> 317        arcade   characterized  None     TRUE
#> 318    horse-tail   characterized  None     TRUE
#> 319   common type   characterized  None     TRUE
#> 320    chandelier   characterized  None     TRUE
alternative %>% filter(annotator == 2)
#> [1] annotator  type       definition
#> <0 rows> (or 0-length row.names)
```

It is easy to combine the three data frames using joins, and then
compute summaries with `tidyverse` functions.

``` r
other <- droplevels(subset(annotations, F5 == 'other'))
a <- levels(other$other) 
b <- levels(alternative$type)
setdiff(a, b)
#> character(0)
setdiff(b, a)
#> character(0)
library(tidyverse)
other <- left_join(other, alternative, by = c("other" = "type"))
length(unique(other$annotator)) 
#> [1] 0
```

There is a utility function to return the counts for all categories,
with a single entry per neuron.

``` r
counts <- get_all_counts(folder) 
#> Warning: attributes are not identical across measure variables;
#> they will be dropped
head(counts)
#> # A tibble: 6 x 22
#>   neuron intralaminar translaminar intracolumnar transcolumnar centered
#>   <fct>         <int>        <int>         <int>         <int>    <int>
#> 1 1                44            2            44             0       44
#> 2 2                21           26            29            17        4
#> 3 3                 1           45            36             8        1
#> 4 4                 9           28            34             2       33
#> 5 5                 4           43             8            39       30
#> 6 6                45            1            45             0       44
#> # … with 16 more variables: displaced <int>, ascending <int>, both <int>,
#> #   descending <int>, arcade <int>, `Cajal-Retzius` <int>,
#> #   chandelier <int>, `common basket` <int>, `common type` <int>,
#> #   `horse-tail` <int>, `large basket` <int>, Martinotti <int>,
#> #   neurogliaform <int>, other <int>, characterized <int>,
#> #   uncharacterized <int>
```

This is also available in row-view, which is a bit easier to analyze

Examples
========

-   Those which are other, and have this
-   How many partially labelled cells?
-   …
-   Directly filter by confidence in some variable. Here, use the row
    verions.
-   Statistics for a species
    -   we join, then filter
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
