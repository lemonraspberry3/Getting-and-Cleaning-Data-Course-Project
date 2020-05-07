---
title: "README.md"
author: "lemonraspberry3"
date: "5/7/2020"
output: html_document
---

```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)
```

This document explains how the run_analysis.R script works. First, the script downloads the zip file and unzips it. Next, the necessary files are read in and stored as variables. The files used are those containing the subject information, the test and training data, and the activity labels. Additionally, the list of features is read in and the second column, which contains the feature names, is extracted and converted to a character vector for later use.

Now that the files have been read in and are stored in the environment as variables, separate dataframes for the test and training data will be generated. Each dataframe has the subject ID number, the activity being performed by the subject, all measurements, as well as a column indicating whether it was a test subject or a training subject. The character vector of feature names is set as the column names for the measurements. The two dataframes are then bound using rbind() to generate one dataframe, called alldata. The script then calls for alldata to be viewed.

Next, the alldata dataframe was limited to contain only those columns with either the mean or standard deviation of measurements, and stored in a new dataframe called meansd. At this point, there is an activitycode column which presents the activities in coded form. The values in this column are converted to factors with character strings listing the actual activity being performed (for example, "walking" or "sitting"). Additionally, the column names were modified to be more descriptive and understandable. It is best for column names to have all lowercase letters and to not have any white spaces, underscores, periods, etc. However, I chose to use underscores because the clarity of the variables names is more important than the ease of typing, in my opinion. These variables are rather complex and the names are quite long. The column names of meansd were set to the new names and the script calls for meansd to be viewed.
  
The final part of the script is for making a new, tidy data set. The script loads the stats package and uses aggregate to calculate the average of each variable per subject, per activity. This results in each subject having six values in each column, with the six values corresponding to one of the six activities. This new data frame was stored as a new dataframe called new. The aggregate() function results in a couple of unwanted columns, which are removed, and two columns are rearranged so that the subject ID is the first column and the activity is the second column. Additionally, the activity variable is set as a factor variable and the levels are set as the six activities. Finally, the tidy data is saved as "tidy_dataset.txt" and the script calls for the tidy dataset to be viewed.

The final, saved dataset is tidy because each row is one observation and each column is a different variable.