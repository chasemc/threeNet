Chicago Employees
================
Chase Clark
October 28, 2018

``` r
library(dplyr)
```

    ## 
    ## Attaching package: 'dplyr'

    ## The following objects are masked from 'package:stats':
    ## 
    ##     filter, lag

    ## The following objects are masked from 'package:base':
    ## 
    ##     intersect, setdiff, setequal, union

``` r
library(readr)
library(magrittr)
```

``` r
raw <- readr::read_csv("C:/Users/CMC/Downloads/Current_Employee_Names__Salaries__and_Position_Titles_-_Full-time.csv")
```

    ## Parsed with column specification:
    ## cols(
    ##   Name = col_character(),
    ##   `Job Titles` = col_character(),
    ##   Department = col_character(),
    ##   `Full or Part-Time` = col_logical(),
    ##   `Salary or Hourly` = col_character(),
    ##   `Typical Hours` = col_double(),
    ##   `Annual Salary` = col_double(),
    ##   `Hourly Rate` = col_double()
    ## )

``` r
rawweek<-raw[which(is.na(raw$`Annual Salary`)),]
rawweek$`Annual Salary` <- rawweek$`Hourly Rate` * rawweek$`Typical Hours` * 52
rawan <- raw[which(!is.na(raw$`Annual Salary`)),]

raw <- rbind(rawan, rawweek)


raw %>% 
  select(`Job Titles`,
         `Department`,
         `Annual Salary`) %>% 
  mutate(`Job` = paste0(`Job Titles`, "_", `Department`)) %>% 
  return(.) -> raw



raw$`Annual Salary` <- (raw$`Annual Salary`)/10000

raw %>% 
    group_by(`Job Titles`, Department) %>% 
    summarise(as = median(`Annual Salary`)) %>% 
    return(.) -> meds



raw2 <- cbind.data.frame(
  source = c(raw$Job, rep("Chicago", times= length(unique(raw$Department))) ),
  target = c(raw$Department, unique(raw$Department)),
  name = c(raw$`Job Titles`, rep("Chicago", times= length(unique(raw$Department)))),
  value= c(raw$`Annual Salary` /9000, rep(1, times= length(unique(raw$Department)))),
  stringsAsFactors = FALSE)


z <- unique(c(raw2$source, raw2$target))


raw3 <- list(id = unique(c(raw2$source, raw2$target)))

ww <-  unname(unlist(lapply(raw3$id,
                            function(x){
          
          w <- meds[which(x == meds$`Job Titles`), "as"]
          if(nrow(w) == 0){
            return(1)
          }else{
            return(as.numeric(w))
          }
          
          })))
         
raw3 <- c(raw3, list(sal=ww))
```

``` r
bipartite <- threeNet::igraph_to_networkD3(raw2, raw3)

threeNet::threeNet(jsonlite::toJSON(bipartite), width=.5)
```

    ## PhantomJS not found. You can install it with webshot::install_phantomjs(). If it is installed, please make sure the phantomjs executable can be found via the PATH variable.

<!--html_preserve-->

<!--/html_preserve-->