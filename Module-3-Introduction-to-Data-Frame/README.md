From this chapter and exercise, I have taken away a number of operations I can perform to explore and understand a data frame in R. By utilizing functions such as str(), head() and summary(), it allowed me to visually see the structure and column names of my dataset, as well summary statistics for each variable. I also drilled how to calculate statistics such as the mean, median and range, which helped me further understand what was going on with the poll data.
The results indicate that Donald is leading with the most support in both polls, but his strength varies between ABC and CBS. Ted does well. Carly and Hillary still suck. The biggest difference was caused by Donald, who received a lot more points on CBS than ABC.
Since the dataset is entirely manufactured, none of these results can be taken at face value. There is no sample size or margin of error behind the numbers and no demographics to break it down. The data is only useful if you want to practice R skills that involve creating a data frame, calculating some statistics, and plotting bar charts.
In the real world yes I would be using pooled results from reputable organisations and compare different sources. Being able to verify details like how many people were surveyed, the dates of a poll and methodology would help me trust the data and thus make results more accurate.

# Define and Inspect Your Data

Name <- c("Jeb", "Donald", "Ted", "Marco", "Carly", "Hillary", "Bernie")
ABC_poll <- c(4, 62, 51, 21, 2, 14, 15)
CBS_poll <- c(12, 75, 43, 19, 1, 21, 19)

# Combine into a data frame
df_polls <- data.frame(Name, ABC_poll, CBS_poll)

str(df_polls)
head(df_polls)

# Compute Summary Statistics

# Mean, median, and range for ABC poll
mean(df_polls$ABC_poll)
median(df_polls$ABC_poll)
range(df_polls$ABC_poll)

# Mean, median, and range for CBS poll
mean(df_polls$CBS_poll)
median(df_polls$CBS_poll)
range(df_polls$CBS_poll)

# Add a new column for the difference
df_polls$Diff <- df_polls$CBS_poll - df_polls$ABC_poll

# Create Plot with ggplot2
library(ggplot2)
library(tidyr)

df_long <- pivot_longer(df_polls,
                        cols = c(ABC_poll, CBS_poll),
                        names_to = "Poll",
                        values_to = "Support")

plt <- ggplot(df_long, aes(x = Name, y = Support, fill = Poll)) +
  geom_col(position = "dodge") +
  labs(
    title = "ABC vs CBS Poll Results",
    x = "Candidate",
    y = "Support (%)",
    caption = "Source: class exercise (data invented)"
  ) +
  theme_minimal()

print(plt)

# Save plot
ggsave("polls_bar.png", plt, width = 8, height = 5, dpi = 300)
