# Getting and Cleaning Data Course Project

This is a repository for the course project of the online course Getting and Cleaning Data from Coursera.

This project contains one R script, `run_analysis.R`, which will calculate means per activity, per subject of the mean and Standard deviation of the Human Activity Recognition Using Smartphones Dataset Version 1.0. The data discription can be found [here](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones) This dataset should be [downloaded](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip ) and extracted directly into the project directory.

Once executed, the resulting dataset can be found at `./TidyData.txt`

For futher details, refer to [CookBook.md](CookBook.md)



## Required R Packages

The R package `reshape2` is required to run this script. This maybe installed with,

```{r}
install.package("tidyr")
install.package("dplyr")
```