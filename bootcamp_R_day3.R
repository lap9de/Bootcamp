# Title: Introduction to R and data manipulation
# Description: This session will be an introduction to the RStudio environment, basic scripting, and data manipulation using modern, user-friendly packages such as tidyr, dplyr, and stringr. Participants will engage in active learning with instructor-led tutorials for the morning and then the afternoon will involve participants tackling real-world data cleaning exercises.
# Instructor: David Martin
# Date/Time: Wednesday August 9th 9:00 - 3:00pm
# Room: Carter

#Intro to RStudio Environment

#Setting a Working Directory/Creating Projects
setwd("C:/Users/dnm5ca/Desktop/bootcamp")

#(Soft-wrapping, etc.)

#Installing Packages (install.packages())
  # #tidyverse
  #  install.packages("tidyverse")
  # #tidyr
  #   install.packages("tidyr")
  # #dplyr  
  #   install.packages("dplyr")
  # #readr
  #   install.packages("readr")
  # #stringr
  #   install.packages("stringr")

#Loading Libraries (library())
    #tidyverse
    library(tidyverse)
    #tidyr
    library(tidyr)
    #dplyr  
    library(dplyr)
    #readr
    library(readr)
    #stringr
    library(stringr)

#Working with Vectors
  
  5+7
  9*15
  
  #Basics (The <- operator, creating vectors, +/-, etc.)
    new_vec <- 2
    new_vec2 <- 3 + new_vec
    new_vec3 <- c(5, 1, 6, 1)  
    new_vec4 <- "This sentence is..."
    
  #Built-in Functions
    paste0(new_vec4, "now finished.")
    mean_var <- mean(c(3, 6, 9, 12))
    sd_var <- sd(c(3, 6, 9, 12))
    
#Working with the Environment
  #ls() - list all objects in the environment
    ls()
  #rm() - remove one object at a time
    rm(mean_var)
  #rm(list = ls()) - remove all objects in the environment
    rm(list = ls())
  
    #INTRO EXERCISE 1 - Creating Objects.
    
    # 1.	You have a patient with a height (inches) of 73 and a weight (lbs) of 203. Create r objects labeled 'height' and 'weight'.
    
    # 2.	Convert 'weight' to 'weight_kg' by dividing by 2.2. Convert 'height' to 'height_m' by dividing by 39.37
    
    # 3.	Calculate a new object 'bmi' where BMI = weight_kg / (height_m*height_m)
    
    
#DATAFRAMES
#Talk about dataframes. 
  #What is a dataframe?
  
  #What does it look like? 
  
    # All about Tidy Data
      # Each variable in its own column
      # Each Observation in its own row

  id       <- c(1, 2, 3, 4)
  mean_var <- c(3, 6, 9, 12)
  sd_var   <- c(.7, 1.6, .3, 2.1)
    
  data.frame(id, mean_var, sd_var)
  a_data_frame <- data.frame(id, mean_var, sd_var)
  data.frame(c(1, 2, 3, 4), c(3, 6, 9, 12))
  
  
#Getting data into a dataframe/tibble
  #Reading in Data
    #read.csv() vs. read_csv()
    nhanes <- read_csv("nhanes_long.csv") # Header is defaulted as true.
  #Writing out Data
    #write.csv()
    write_csv(nhanes, "nhanes_copy.csv")
  
#Summarizing a Dataframe
  #Taking a peek at the dataframe - View, head, tail
    View(nhanes)
    head(nhanes)
    tail(nhanes)
    
  #Describing the structure of the dataframe - nrow, ncol, dim
    nrow(nhanes)
    ncol(nhanes)
    dim(nhanes)
    
  #Ways to describe the data - summary, etc.
    summary(nhanes)
    class(nhanes)
    str(nhanes)
    
#Accessing elements of a dataframe 
  #By Name
    nhanes$Gender
    nhanes["Gender"]
    nhanes["Income"]
    income_vec <- nhanes$Income
    income_vec
  
  #By Position
    nhanes[3]
    nhanes[c(2, 4, 5)]
    new_vec <- nhanes[c(1,5,8)]
    new_vec
  
  #Subsetting a dataframe - by row
    nhanes[3, ]
    
    a_row <- nhanes[3, ]
    View(a_row)
  
  #Subsetting a dataframe - by cell
    nhanes[3, 1]
    a_cell <- nhanes[3, 12]
    a_cell
    many_cells <- nhanes[3, 1:8]
    many_cells
    combo <- nhanes[1:5, 1:8]
    combo
    
#Using functions within a dataframe
  #mean, sd, etc.
    sd(nhanes$Testosterone)
    mean(nhanes$BPDia)
    mean(nhanes[, 2])
    
  #cor, sum, rank, paste
    #Using Built-in Help (?)
    ?cor
    cor(nhanes$BPDia, nhanes$BPSys, use = "pairwise")
    nhanes$new_sum <- sum(nhanes$Weight, na.rm = TRUE) #Can create new columns from functions
    
    ?rank
    nhanes$new_var <- rank(nhanes$Testosterone)

    #paste adds space between strings, paste0 does not  
    paste(nhanes$Race, nhanes$Education)  
    paste0(nhanes$Race, nhanes$Education)
    
    #INTRO EXERCISE 2 - Functions.
    # 1. See ?abs and ?sqrt. Calculate the square root of the absolute value of -4*(2550-50).
    sqrt(abs(-4 * (2550-50)))
    
    # 2.	What's the range of ages represented in the NHANES data? (hint: range()).
    range(nhanes$Age)
    
    # 3.	Within the NHANES dataset, how many distinct values are there in the Gender variable and the Education variable (hint: ?n_distinct())
    n_distinct(nhanes$Gender)
    n_distinct(nhanes$Education)
    
#Conditionals
    # - `==`: Equal to, `!=`: Not equal to
    # - `>`, `>=`: Greater than, greater than or equal to
    # - `<`, `<=`: Less than, less than or equal to
    # - | : Or, & : And
    
  #if something is true, then do something 
    nhanes$High_BPDia <- ifelse(nhanes$BPDia >= 85, "Yes", "No")
      sum(nhanes$High_BPDia == "Yes", na.rm = TRUE)
    
    nhanes$PA <- ifelse(nhanes$PhysActive == "Yes", 1, 0)
      sum(nhanes$PA == 1, na.rm = TRUE)
    
    nhanes$High_BPDia_PA <- ifelse(nhanes$BPDia >= 85 & nhanes$PhysActive == "No", 1, ifelse(nhanes$BPDia >= 85 & nhanes$PhysActive == "Yes", 2,3)) 
      sum(nhanes$High_BPDia_PA == 1, na.rm = TRUE)
    
    #INTRO EXERCISE 3 - Conditionals.
    #1. Create a variable, nhanes_manyRooms, that is equal to "Yes" if there are more than 7 rooms in their house (see the HomeRooms variable). How many patients fall into this category?
    nhanes_manyRooms <- ifelse(nhanes$HomeRooms > 7, "Yes", "No")
      sum(nhanes_manyRooms == "Yes", na.rm = TRUE)
    
    #2. Create an indicator variable, nhanes_InsuredHomeOwn, that is equal to 1 if the patient is Insured and Owns a Home and 0 otherwise (See the Insured and HomeOwn variables). How many patients fall into this nhanes_InsuredHomeOwn category? 
    nhanes_InsuredHomeOwn <- ifelse(nhanes$Insured == "Yes" & nhanes$HomeOwn == "Own", 1, 0)
      sum(nhanes_InsuredHomeOwn == 1, na.rm = TRUE)
      
  
#DPLYR Stuff
  # filter - Selects the rows you want to look at.
    filter(nhanes, BPDia >= 100)    
    filter(nhanes, Gender == "male" & BPDia >= 100)
    
  # The Pipe Operator - Allows for the chaining of commands in R
    #Explain and use
    nhanes %>% filter(BPDia >=  100)
    
    nhanes_HighBP_male <- nhanes %>% 
      filter(BPDia >= 100) %>% 
      filter(Gender == "male")
    
    View(nhanes_HighBP_male)
    
  # select - Selects the columns you want to look at.
    select(nhanes, BPDia, BPSys)
    
    new_df <- nhanes %>%
        select(BPDia, BPSys)
    
    new_df2 <- nhanes %>%
      select(-id)
    
    select(nhanes, -c(3:35))
    select(nhanes, c(1:3, 15:17))
    
  # mutate - changes or creates a new variable/column
    mutate(nhanes, Testosterone_Squared = Testosterone * Testosterone)
    
    mutate(nhanes, Testosterone_mean = mean(Testosterone, na.rm = TRUE))
    
    nhanes <- mutate(nhanes, High_BPDia = ifelse(BPDia > 60, "High", "Low"))
    
    nhanes_new <- nhanes   %>%  
      mutate(High_BPDia = ifelse(BPDia > 60, "High", "Low"))
      
    nhanes_new <- nhanes  %>% 
      mutate_if(is.numeric, replace_na, 0)
    
    nhanes_new <- nhanes  %>% 
      mutate_if(is.character, replace_na, "") 
    
    nhanes %>%
      mutate(BMI_Category = ifelse(BMI >= 0 & BMI < 15, "Very Low",
                      ifelse(BMI >= 15 & BMI < 25, "Low",
                      ifelse(BMI >= 25 & BMI < 35, "Average",
                      ifelse(BMI >= 35, "High", "")))))
    
  # summarize - Applies a function to a group  
  # group_by - Tells a function which group(s) to act upon
  # Look at cheatsheet (Help -> Cheatsheets -> Data Manipulation with DPLYR, TidyR) for small list of functions you can use in R
    summary(nhanes$Testosterone)
    
    summarize(nhanes, mean(Testosterone, na.rm = TRUE))
    summarize(nhanes, IQR(Testosterone, na.rm = TRUE))
    
    summarize(group_by(nhanes, Gender), mean(Testosterone, na.rm = TRUE))
    
    #Can use Group by to group by one variable
    nhanes %>% 
        group_by(Education) %>%
        summarize(n())
    
    #...Or multiple variables
    nhanes %>% 
      group_by(Gender, Race) %>%
      summarize(n())
    
    #Advantage of using the Pipe 
    #Old Way
    select(filter(summarize(group_by(nhanes, Gender, Race), mean_size = mean(Age, na.rm = TRUE), min_HDLChol = min(HDLChol)), !is.na(min_HDLChol)), Gender, mean_size, min_HDLChol)
    
    #Pipe Way
    nhanes %>%
      group_by(Gender, Race) %>%
      summarize(mean_size = mean(Age, na.rm = TRUE), min_HDLChol = min(HDLChol)) %>%
      filter(!is.na(min_HDLChol)) %>%
      select(Gender, mean_size, min_HDLChol)
    
    nhanes %>% 
      filter(Age > 65 & Gender == "female" & !is.na(Insured)) %>% 
      group_by(Insured) %>% 
      summarize(meanexp=mean(Pulse, na.rm = TRUE))
    
#String Stuff (USE SOME PIPE OPERATORS/DPLYR COMBO STUFF)
  #Paste/Paste0 Redux
    paste("We need", "a little space")
    paste0("I'd rather stick", "close by!")
    paste(nhanes$Education, nhanes$Race)
    
  #(grep, gsub)
  # Regular Expressions - Quick Look
  #Detect Matches
    #str_detect - detects the presence of a pattern match in a string
      str_detect("This is something", "is")
      str_detect("This is not something", "Am I Here?")
      
    # Use of Regular Expressions
        # Overview of Regular Expressions
      str_detect("Is there a number here?", "[:digit:]")
      str_detect("Well are there 3 numbers here?", "[:digit:]")
      str_detect("Is this a question?", "[\\?]")
      str_detect("Is this a question", "[\\?]")
      
  #Detect whether someone received less than high school (8th -> 9th-11th)  
      str_detect(Education, "th")
      
      nhanes_NoHS <- summarize(group_by(Gender)(filter(mutate())))
      nhanes_NoHS <- nhanes %>%
        mutate(HS_Category = ifelse(str_detect(Education, "th"), "Less than HS", "HS or More")) %>% 
        filter(HS_Category == "Less than HS" & !is.na(TotChol)) %>% 
        group_by(Gender) %>% 
        summarize(meanexp=mean(TotChol))
      
    #str_which - Find the indexes of strings that contain a pattern match.
      str_which(nhanes$Education, "th")
    #str_count - Count the number of matches in a string.
      str_count(nhanes$Education, "h")
    #str_locate - Shows the location of the pattern matches in a string
      str_locate(nhanes$Education, "th")
      str_locate_all(nhanes$Education, "h")
      
  #Subset strings
    #str_sub - Extract substrings from a character vector.
      str_sub("Here is a substring, let us look at it.", 11, 19)
      str_sub(nhanes$Education, 3, 5)
    #str_subset
      str_subset("Here is a substring, let us look at it", "substring")
      str_subset(nhanes$Race, "ite")

  #Manage Lengths
    #str_length - Find the length of a string
      str_length("How long is this string")
      ifelse(str_length("How long is this string") > 20, "String is long", "String is not long")
      
    #str_trim - Trims away white spaces from the beginning and end of a string
      str_trim("   This has       too much    space  ")
      str_trim("   Author: David Martin")
      
    #str_squish - Trims extra white space from the beginning, middle, and end of a sentence
      str_squish("   This still has       too much    space  ")
      str_squish("   Address: 2312 Main Street,    City: Charlottesville,   State:  Virginia  ")
      
   #Mutate Strings
    #str_replace()
      str_replace("First time is is here replace is with is replacer", "is", "REPLACE")
      
      #LOOK AT str_replace() for Gender
        
    #str_replace_all()
      str_replace_all("First time is is here replace is with is replacer", "is", "REPLACE")
  
      str_replace_all(nhanes$Education, "th", "")
      
      str_replace_all(nhanes$Education, c("th" = "", "Grad" = "", " e" = ""))
      
      
    #str_to_lower()
      str_to_lower("STOP SHOUTING AT ME NOW")
      str_to_lower(nhanes$Gender)
  
    #str_to_upper()
      str_to_upper("please speak up")
      str_to_upper(nhanes$Education)
      
    #str_to_title()
      str_to_title("an introduction to r by: DAVID MARTIN")
      str_vec <- "How does THIS look?"
      c(paste("to lower", str_to_lower(str_vec)), str_to_upper(str_vec), str_to_title(str_vec))
      
      str_vec %>% 
          str_to_lower()
          
      str_vec %>% 
        str_to_upper()
      
      str_vec %>% 
        str_to_title()
      
      
      #Finding and replacing within a substring
      "First time is is" %>% 
        str_sub(15, 18) %>%
        str_replace("is", "try_this")
      
      
#Merging/Appending/Reshaping Data
    # rbind, cbind
    new_var <- 1
    View(new_var)
    cbind(new_var, 1:7)
    
    rbind(new_var, 1:7)
    cbind(new_var, rbind(new_var, 1:7))
    
    # Full_join, etc.
    # Gather/Spread
    View(nhanes)
    nhanes <- select(nhanes, -PhysActive)
    #nhanes <- select(nhanes, -PhysActiveDays)"
    
    final_nhanes <- spread(nhanes, visit_num, visit_num, sep = "_")
    final_nhanes <- final_nhanes[, -grep("visit_num", colnames(final_nhanes))]
    View(final_nhanes)

    #Save Final CSV.
    write.csv(final_nhanes, "nhanes_final.csv")
    
  
#### DPLYR EXERCISE 1 #####
    # 1. Display the data where the biological process the gene plays a role in (the `bp` variable) is "leucine biosynthesis" (case-sensitive) _and_ the limiting nutrient is Leucine. (Answer should return a 24-by-7 data frame -- 4 genes X 6 growth rates).
    
    
    # 2. Display the data where the gene/rate combinations had high expression (in the top 1% of expressed genes). _Hint:_ see `?quantile` and try `quantile(ydat$expression, probs=.99)` to see the expression value which is higher than 99% of all the data, then `filter()` based on that. Try wrapping your answer with a `View()` function so you can see the whole thing. What does it look like those genes are doing? Answer should return a 1971-by-7 data frame.
    
  
# DPLYR EXERCISE 2
    
    # 1. First, re-run the command you used above to filter the data for genes involved in the "leucine biosynthesis" biological process and where the limiting nutrient is Leucine. 
    filter(ydat, bp = "leucine biosynthesis"  & nutrient=="Leucine")
    
    # 2. Wrap this entire filtered result with a call to `arrange()` where you'll arrange the result of #1 by the gene symbol.
    arrange(filter(ydat, bp=="leucine biosynthesis" & nutrient=="Leucine"), symbol)
    
    # 3. Wrap this entire result in a `View()` statement so you can see the entire result.
    View(arrange(filter(ydat, bp=="leucine biosynthesis" & nutrient=="Leucine"), symbol))
    

    
# DPLYR EXERCISE 3
    
    #Show the limiting nutrient and expression values for the gene ADH2 when the growth rate is restricted to 0.05. _Hint:_ 2 pipes: `filter` and `select`.
    ydat %>% filter(symbol=="ADH2" & rate==0.05) %>% select(nutrient, expression)
    
    
    #2. What are the four most highly expressed genes when the growth rate is restricted to 0.05 by restricting glucose? Show only the symbol, expression value, and GO terms (bp and mf). _Hint:_ 4 pipes: `filter`, `arrange`, `head`, and `select`.
    ydat %>% 
      filter(nutrient=="Glucose" & rate==.05) %>% 
      arrange(desc(expression)) %>% 
      head(4) %>% 
      select(symbol, expression, bp, mf) 
    
    #3. When the growth rate is restricted to 0.05, what is the average expression level across all genes in the "response to stress" biological process, separately for each limiting nutrient? What about genes in the "protein biosynthesis" biological process? _Hint:_ 3 pipes: `filter`, `group_by`, `summarize`.
    
    ##STRINGR EXERCISE
    #SOMETHING HERE!!!
    
    #EXTRA EXERCISES