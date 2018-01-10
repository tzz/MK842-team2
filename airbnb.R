#!/usr/bin/env Rscript
print("Hello")
library(bit64)
script.dir <- dirname(sys.frame(1)$ofile)
air <- fread(sprintf("%s/%s", script.dir, "listings.csv"))
