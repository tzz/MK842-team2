#!/usr/bin/env Rscript
print("Hello")
library(bit64)
library(data.table)
library(ggplot2)
library(scales)
theme_set(theme_bw())

script.dir <- dirname(sys.frame(1)$ofile)
air <- fread(sprintf("%s/%s", script.dir, "listings.csv"), stringsAsFactors = TRUE)
