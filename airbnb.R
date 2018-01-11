#!/usr/bin/env Rscript

print("MK842 Team 2: AirBnB Analysis Project")

print("Loading libraries")
library(bit64)
library(data.table)
library(ggplot2)
library(scales)
library(stringr)
theme_set(theme_bw())

script.dir <- dirname(sys.frame(1)$ofile)

if (0) {
  print("Creating training and test data sets from a 50/50 split of the CSV")
  air <- read.csv(sprintf("%s/%s", script.dir, "listings.csv"), stringsAsFactors = TRUE)

  airt <- data.table(air)

  atrain.sampled <- sample(nrow(airt), nrow(airt)/2)
  atrain <- airt[atrain.sampled]
  atest <- airt[!atrain.sampled]
  if (!setequal(union(atest$id, atrain$id), airt$id)) {
    stop("ERROR: The test and training datasets don't add up to the original dataset")
  }

  print("Saving training and test data sets")
  save(atest, file=sprintf("%s/%s", script.dir, "atest.dat"))
  save(atrain, file=sprintf("%s/%s", script.dir, "atrain.dat"))
} else {
  print("Loading training and test data sets from binary storage. Note the atest and atrain variables will be OVERWRITTEN")
  load(file=sprintf("%s/%s", script.dir, "atrain.dat"))
  load(file=sprintf("%s/%s", script.dir, "atest.dat"))
  if (length(intersect(atest$id, atrain$id)) > 0) {
    stop("ERROR: The test and training datasets overlap")
  }
}