

here <- rprojroot::find_rstudio_root_file()

suppressWarnings(suppressMessages(library(dataverse)))
suppressWarnings(suppressMessages(library(tidyverse)))
suppressWarnings(suppressMessages(library(data.table)))
suppressWarnings(suppressMessages(library(curl)))
suppressWarnings(suppressMessages(library(jsonlite)))
suppressWarnings(suppressMessages(library(glue)))
suppressWarnings(suppressMessages(library(furrr)))
suppressWarnings(suppressMessages(library(stringdist)))
suppressWarnings(suppressMessages(library(stringi)))
suppressWarnings(suppressMessages(library(janitor)))
suppressWarnings(suppressMessages(library(lubridate)))

`%notin%` <- Negate(`%in%`)
`%notlike%` <- Negate(`%like%`)
`%notchin%` <- Negate(`%chin%`)