bankchurn <- read.csv("https://github.com/SavioSal/datasets/raw/master/Bank%20Churn_Modelling.csv")
bankchurn1 <- read.csv("https://github.com/SavioSal/datasets/raw/master/Bank%20Churn_Modelling.csv")

bankchurn
View(bankchurn)
library(dplyr)
library(ggplot2)

bankchurn <- bankchurn %>% 
  dplyr::mutate(Geography = as.factor(Geography),
         Gender = as.factor(Gender),
         HasCrCard = as.factor(HasCrCard),
         IsActiveMember = as.factor(IsActiveMember),
         Exited = as.factor(Exited),
         Tenure = as.factor(Tenure),
         NumOfProducts = as.factor(NumOfProducts))

#1. Gender versus Exited. 
bankchurn %>% ggplot() +
  geom_col(aes(Exited, Gender, color=Exited)) + coord_flip()+
  theme(legend.position = 'none')

#2. Geography versus Active Members Gender wise
bankchurn1 %>% ggplot() +
        geom_col(aes(Geography,IsActiveMember, col=Gender)) 

#3. Age versus Exited (churn numbers)
library(scales)
bankchurn %>% ggplot(aes(x = Age, fill = Exited)) +
  geom_histogram(binwidth = 5) +
  theme_minimal() +
  scale_x_continuous(breaks = seq(0,100,by=10), labels = comma)


#4. Balance versus Exited
bankchurn %>%  ggplot() +
  geom_boxplot(aes(Balance, fill = Exited)) + coord_flip()

#5.Age versus Credit score 
bankchurn %>% 
  ggplot()+
  geom_col(aes(Age, CreditScore, color = Gender))

#2a What is the average credit score of females and males in France?
bankchurn %>% select(CreditScore, Gender, Geography) %>% filter(Geography == "France") %>%
  dplyr::group_by(Gender) %>%
  dplyr::summarise(Gender_Average = mean(CreditScore))

#2b What is the average credit score of people in the age brackets 20-30,31-40,41-50?
bankchurn %>% select(CreditScore, Age) %>% mutate(agegroup = case_when(Age >= 41  & Age <= 50 ~ '3', Age >= 31  & Age <= 40 ~ '2', Age >= 20  & Age <= 30 ~ '1')) %>%
  filter(agegroup == "1" | agegroup == '2' | agegroup == '3') %>%
  dplyr::group_by(agegroup) %>%
  dplyr::summarise(Age_Average = mean(CreditScore))

#2c What is the correlation between credit score and estimated salary?  
bankchurn %>% select(CreditScore, EstimatedSalary) %>% cor()

#2d Develop a statistical model to explain and establish a mathematical relationship between credit score (dependent) and gender, age, estimate salary
model <- lm(CreditScore ~ Age + Gender + EstimatedSalary, bankchurn)
summary(model)
