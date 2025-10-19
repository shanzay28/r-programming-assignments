
I learned how to load data into R, summarize it, filter it, and save the results in different file types for this project.First, I set up my working location so that R could find files quickly and save them in a neat place.
After that, I used read.table() to add the information to a data frame. This helped me learn how heads and divisions work when reading real data. Next, I used the ddply() method and the plyr package to find the average grade and age for each gender.
This taught me how to do grouped reports in R.  Lastly, I used the subset() and grepl() methods to practice filtering data. I got all the student names that started with "i" and saved both the names-only and full filtered results.
By following these steps, I learned how to use R to automatically clean data, analyze it, and send it to a file. These are important skills for working with datasets quickly.

---------

setwd("C:/Users/shanz/OneDrive/Documents/Assigment 6")

x <- read.table("Assignment 6 Dataset.txt",
                header = TRUE, sep = ",", stringsAsFactors = FALSE)
str(x); head(x)

library(plyr)
y <- ddply(
  x, "Sex", transform,
  Grade.Average = mean(Grade, na.rm = TRUE),
  Age.Average   = mean(Age,   na.rm = TRUE)
)

write.table(y, "Sorted_Average", row.names = FALSE)
write.table(y, "Sorted_Average.csv", sep = ",", row.names = FALSE)

newx <- subset(x, grepl("[iI]", x$Name))
write.table(newx$Name, "NamesWithI.csv",
            sep = ",", row.names = FALSE, col.names = FALSE, quote = FALSE)
write.table(newx, "DataSubset.csv", sep = ",", row.names = FALSE)

list.files(pattern = "Sorted_Average|NamesWithI|DataSubset")
