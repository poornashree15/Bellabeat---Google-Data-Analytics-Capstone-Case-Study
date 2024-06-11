install.packages("tidyverse")
install.packages("here")
install.packages("janitor")
install.packages("dplyr")
install.packages("skimr")
install.packages("ggrepel")


library(ggrepel)
library("tidyverse")
library("here")
library("dplyr")
library("janitor")
library("skimr")

setwd("C:/Users/FIONA_SHREK/Documents/Bellabeat/mturkfitbit_export_4.12.16-5.12.16/Fitabase Data 4.12.16-5.12.16")
library(readr)

dailyActivity <- read_csv("dailyActivity_merged.csv")
dailyCalories <- read_csv("dailyCalories_merged.csv")
dailyIntensities <- read_csv("dailyIntensities_merged.csv")
dailySteps <- read_csv("dailySteps_merged.csv")
heartrate_seconds <- read_csv("heartrate_seconds_merged.csv")
minuteMETsNarrow<- read_csv("minuteMETsNarrow_merged.csv")
sleepDay <- read_csv("sleepDay_merged.csv")
weightLogInfo <- read_csv("weightLogInfo_merged.csv")
h_intensitie  <- read.csv("hourlyIntensities_merged.csv")
hourly_calories <- read.csv("hourlyCalories_merged.csv")
hourly_steps <- read.csv("hourlySteps_merged.csv")

head(dailyActivity)
head(dailyCalories)
head(dailyIntensities)
head(dailySteps)
head(heartrate_seconds)
head(minuteMETsNarrow)
head(sleepDay)
head(weightLogInfo)
head(hourly_calories)
head(hourly_steps)


sum(duplicated(sleepDay))
sleepDay_cleaned <- sleepDay %>% 
  distinct() %>% 
  drop_na()

sum(duplicated(sleepDay_cleaned))

sum(duplicated(weightLogInfo))
weightLogInfo_cleaned <- weightLogInfo %>% 
  distinct() %>% 
  drop_na()

sum(duplicated(weightLogInfo_cleaned))

sum(duplicated(dailyActivity))
dailyActivity_cleaned <- dailyActivity %>% 
  distinct() %>% 
  drop_na()

sum(duplicated(dailyActivity_cleaned))

sum(duplicated(dailyCalories))
dailyCalories_cleaned <- dailyCalories %>% 
  distinct() %>% 
  drop_na()

sum(duplicated(dailyCalories_cleaned))

sum(duplicated(dailyIntensities))
dailyIntensities_cleaned <- dailyIntensities %>% 
  distinct() %>% 
  drop_na()

sum(duplicated(dailyIntensities_cleaned))


sum(duplicated(dailySteps))
dailySteps_cleaned <- dailySteps %>% 
  distinct() %>% 
  drop_na()

sum(duplicated(dailySteps_cleaned))

sum(duplicated(heartrate_seconds))
heartrate_seconds_cleaned <- heartrate_seconds %>% 
  distinct() %>% 
  drop_na()

sum(duplicated(heartrate_seconds_cleaned))


sum(duplicated(minuteMETsNarrow))
minuteMETsNarrow_cleaned <- minuteMETsNarrow %>% 
  distinct() %>% 
  drop_na()

sum(duplicated(minuteMETsNarrow_cleaned))

sum(duplicated(h_intensitie))
h_intensitie <- h_intensitie %>% 
  distinct() %>% 
  drop_na()
sum(duplicated(h_intensitie))

sum(duplicated(hourly_calories))
hourly_calories <- hourly_calories %>% 
  distinct() %>% 
  drop_na()
sum(duplicated(hourly_calories))

sum(duplicated(hourly_steps))
hourly_steps <- hourly_steps %>% 
  distinct() %>% 
  drop_na()
sum(duplicated(hourly_steps))
# correcting the formats 

dailyActivity_cleaned$Date<-as.Date(dailyActivity_cleaned$ActivityDate, "%m/%d/%Y")
dailyActivity_cleaned$Id<-as.character(dailyActivity_cleaned$Id)

h_intensitie$ActivityHour=as.POSIXct(h_intensitie$ActivityHour, format="%m/%d/%Y %I:%M:%S %p", tz=Sys.timezone())
h_intensitie$time <- format(h_intensitie$ActivityHour, format = "%H:%M:%S")
h_intensitie$date <- format(h_intensitie$ActivityHour, format = "%m/%d/%y")

hourly_calories$ActivityHour=as.POSIXct(hourly_calories$ActivityHour, format="%m/%d/%Y %I:%M:%S %p", tz=Sys.timezone())
hourly_calories$time <- format(hourly_calories$ActivityHour, format = "%H:%M:%S")
hourly_calories$date <- format(hourly_calories$ActivityHour, format = "%m/%d/%y")

sleepDay_cleaned$SleepDay=as.POSIXct(sleepDay_cleaned$SleepDay, format="%m/%d/%Y %I:%M:%S %p", tz=Sys.timezone())
sleepDay_cleaned$Date <- format(sleepDay_cleaned$SleepDay, format = "%m/%d/%y")

#Finding the number of participants
print(paste(n_distinct(dailyActivity_cleaned$Id), "unique individuals in activity"))
print(paste(n_distinct(h_intensitie$Id), "unique individuals in intensities"))
print(paste(n_distinct(sleepDay_cleaned$Id), "unique individuals in sleep"))
print(paste(n_distinct(weightLogInfo_cleaned$Id), "unique individuals in weight"))


# summary of daily dataframes

print("-----Daily Calories-----")
dailyActivity_cleaned %>% 
  select(Calories) %>% 
  drop_na() %>% 
  summary()

print("-----Daily Intensities-----")
dailyActivity_cleaned %>% 
  select(SedentaryMinutes, LightlyActiveMinutes, FairlyActiveMinutes, VeryActiveDistance) %>% 
  drop_na() %>% 
  summary()

print("-----Daily Steps-----")
dailyActivity_cleaned %>% 
  select(TotalSteps) %>% 
  drop_na() %>% 
  summary()

print("-----Daily Sleep-----")
sleepDay_cleaned %>% 
  select(TotalSleepRecords, TotalMinutesAsleep, TotalTimeInBed) %>% 
  drop_na() %>% 
  summary()


# Summary of Hourly Data Frames
print("-----Hourly Calories-----")
hourly_calories %>% 
  select(Calories) %>% 
  drop_na() %>% 
  summary()

print("-----Hourly Intensities-----")
h_intensitie %>% 
  select(TotalIntensity, AverageIntensity) %>% 
  drop_na() %>% 
  summary()

print("-----Hourly Steps-----")
hourly_steps %>% 
  select(StepTotal) %>% 
  drop_na() %>% 
  summary()


heartrate_seconds_cleaned %>% select(Value) %>% summary()

minuteMETsNarrow_cleaned %>%  select(METs) %>% summary()

weightLogInfo_cleaned %>%  select(WeightPounds,BMI) %>% summary()

ggplot(data = dailyActivity_cleaned) + 
  geom_point(aes(x = VeryActiveMinutes, y = Calories)) + 
  geom_smooth(aes(x = VeryActiveMinutes, y = Calories), method = "lm") +
  labs(title = "Relationship between Very Active Minutes and Calories")
ggsave(" Very Active Minutes_and_Calories.png")

ggplot(data = dailyActivity_cleaned) + 
  geom_point(aes(x = TotalSteps, y = Calories)) + 
  geom_smooth(aes(x = TotalSteps, y = Calories), method = "lm") +
  labs(title = "Relationship between TotalSteps and Calories")


ggplot(data = dailyActivity_cleaned) + 
  geom_point(aes(x = TotalDistance, y = Calories)) + 
  geom_smooth(aes(x = TotalDistance, y = Calories), method = "lm") +
  labs(title = "Relationship between TotalDistance and Calories")
#pie chart

activity_summary <- colSums(dailyActivity_cleaned[, c("VeryActiveMinutes", "FairlyActiveMinutes", "LightlyActiveMinutes", "SedentaryMinutes")])

activity_data <- data.frame(
  ActivityLevel = names(activity_summary),
  Minutes = activity_summary
)

activity_data <- activity_data %>%
  mutate(Percentage = round((Minutes / sum(Minutes)) * 100, 1))
activity_data$Label <- paste0(activity_data$ActivityLevel, ": ", activity_data$Percentage, "%")


custom_colors <- c("VeryActiveMinutes" = "#FFB3B3",  
                  "FairlyActiveMinutes" = "#B3FFB3", 
                  "LightlyActiveMinutes" = "#B3B3FF", 
                  "SedentaryMinutes" = "#FFFFB3")    



ggplot(activity_data, aes(x = "", y = Minutes, fill = ActivityLevel)) +
  geom_bar(width = 1, stat = "identity") +
  coord_polar(theta = "y") +
  labs(title = "Activity Levels in Daily Activity") +
  scale_fill_manual(values = custom_colors) +
  theme_void() +
  theme(legend.title = element_blank()) +
  geom_text_repel(aes(label = Label, y = Minutes / 2, x = 1), 
                  direction = "y", nudge_x = 0.2, nudge_y = 0.2,
                  segment.color = "grey50", segment.size = 0.5)







#Correlation between Activity Levels and Calories Burnt per Day

ggplot(data = dailyActivity_cleaned) + 
  geom_point(aes(x = LightlyActiveMinutes, y = Calories)) + 
  geom_smooth(aes(x = LightlyActiveMinutes, y = Calories), method = "lm") +
  labs(title = "Relationship between LightlyActiveMinutes and Calories")

ggplot(data = dailyActivity_cleaned) + 
  geom_point(aes(x = FairlyActiveMinutes, y = Calories)) + 
  geom_smooth(aes(x = FairlyActiveMinutes, y = Calories), method = "lm") +
  labs(title = "Relationship between FairlyActiveMinutes and Calories")

ggplot(data = dailyActivity_cleaned) + 
  geom_point(aes(x = SedentaryMinutes, y = Calories)) + 
  geom_smooth(aes(x = SedentaryMinutes, y = Calories), method = "lm") +
  labs(title = "Relationship between SedentaryMinutes and Calories")


ggplot(data = dailyActivity_cleaned) + 
  geom_point(aes(x = VeryActiveMinutes, y = Calories)) + 
  geom_smooth(aes(x = VeryActiveMinutes, y = Calories), method = "lm") +
  labs(title = "Relationship between VeryActiveMinutes and Calories")


ggplot(data = sleepDay_cleaned) + 
  geom_point(aes(x = TotalMinutesAsleep, y = TotalTimeInBed)) + 
  geom_smooth(aes(x = TotalMinutesAsleep, y = TotalTimeInBed), method = "lm") +
  labs(title = "Relationship between TotalMinutesAsleep and TotalTimeInBed")
#relationship between Intensity and Time

int_new <- h_intensitie %>%
  group_by(time) %>%
  drop_na() %>%
  summarise(mean_total_int = mean(TotalIntensity))

ggplot(data=int_new, aes(x=time, y=mean_total_int)) + geom_histogram(stat = "identity", fill='darkblue') +
  theme(axis.text.x = element_text(angle = 90)) +
  labs(title="Average Total Intensity vs. Time")

combined_sleep_activity <- merge(sleepDay_cleaned, dailyActivity_cleaned, by='Id')
head(combined_sleep_activity)


ggplot(data = combined_sleep_activity) + 
  geom_point(aes(x = TotalMinutesAsleep, y = SedentaryMinutes)) + 
  geom_smooth(aes(x = TotalMinutesAsleep, y = SedentaryMinutes), method = "lm") +
  labs(title = "Relationship between TotalMinutesAsleep and SedentaryMinutes")

combined_steps_calories <- merge(dailySteps, hourly_calories, by="Id")
glimpse(combined_steps_calories)

ggplot(data = combined_steps_calories,aes(x = Calories, y = StepTotal)) + geom_jitter()+
  geom_smooth(aes(x = Calories, y = StepTotal), method = "lm") +
  labs(title = "Hourly Calorie Burn and Hourly Step Count")