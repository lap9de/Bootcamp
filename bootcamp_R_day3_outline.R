# Title: Introduction to R and data manipulation
# Description: This session will be an introduction to the RStudio environment, basic scripting, and data manipulation using modern, user-friendly packages such as tidyr, dplyr, and stringr. Participants will engage in active learning with instructor-led tutorials for the morning and then the afternoon will involve participants tackling real-world data cleaning exercises.
# Instructor: David Martin
# Date/Time: Wednesday August 9th 9:00 - 3:00pm
# Room: Carter

#Intro to RStudio Environment

# COMMENTING

#Setting a Working Directory/Creating Projects
setwd("https://github.com/dnm5ca/Bootcamp")


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
  
  #Basics (The <- operator, creating vectors, +/-, etc.)
    
  #Built-in Functions
    
#Working with the Environment
  #ls() - list all objects in the environment
    
  #rm() - remove one object at a time
    
  #rm(list = ls()) - remove all objects in the environment
    
    #INTRO EXERCISE 1 - Creating Objects.
    
    # 1.	You have a patient with a height (inches) of 73 and a weight (lbs) of 203. Create r objects labeled 'height' and 'weight'.
    
    # 2.	Convert 'weight' to 'weight_kg' by dividing by 2.2. Convert 'height' to 'height_m' by dividing by 39.37
    
    # 3.	Calculate a new object 'bmi' where BMI = weight_kg / (height_m*height_m)
    
    #----------------------------------------------------------#
    
#DATAFRAMES
#Talk about dataframes. 
  #What is a dataframe?
  
  #What does it look like? 
  
    # All about Tidy Data
      # Each variable in its own column
      # Each Observation in its own row

  
#Getting data into a dataframe/tibble
  #Reading in Data
    #read.csv() vs. read_csv()
    
  #Writing out Data
    #write.csv()

#Summarizing a Dataframe
  #Taking a peek at the dataframe - View, head, tail

  #Describing the structure of the dataframe - nrow, ncol, dim

  #Ways to describe the data - summary, etc.

#Accessing elements of a dataframe 
  #By Name

  #By Position

  #Subsetting a dataframe - by row

  #Subsetting a dataframe - by cell

#Using functions within a dataframe
  #mean, sd, etc.

  #cor, sum, rank, paste
    #Using Built-in Help (?)
    

    #paste adds space between strings, paste0 does not  

    #INTRO EXERCISE 2 - Functions.
    # 1. See ?abs and ?sqrt. Calculate the square root of the absolute value of -4*(2550-50).

    # 2.	What's the range of ages represented in the NHANES data? (hint: range()).

    # 3.	Within the NHANES dataset, how many distinct values are there in the Gender variable and the Education variable (hint: ?n_distinct())

    #----------------------------------------------------------#
    
#Conditionals
    # - `==`: Equal to, `!=`: Not equal to
    # - `>`, `>=`: Greater than, greater than or equal to
    # - `<`, `<=`: Less than, less than or equal to
    # - | : Or, & : And
    
  #if something is true, then do something 

    #INTRO EXERCISE 3 - Conditionals.
    #1. Create a variable, nhanes_manyRooms, that is equal to "Yes" if there are more than 7 rooms in their house (see the HomeRooms variable). How many patients fall into this category?
    
    #2. Create an indicator variable, nhanes_InsuredHomeOwn, that is equal to 1 if the patient is Insured and Owns a Home and 0 otherwise (See the Insured and HomeOwn variables). How many patients fall into this nhanes_InsuredHomeOwn category? 

      #---------------------------------------------------------------#
      
# The Pipe Operator - Allows for the chaining of commands in R
    #Explain and use the pipe operator (Pipe == Then)

#DPLYR
  #The DPLYR Package offers a series of built-in functions allowing the user to use easy to understand function names to manipulate their data.
  
  # filter - Selects the rows you want to look at based off of certain criteria.

  # Using the pipe with filter

  # select - Selects the columns you want to look at.
    # Combining Filter and Select

#### DPLYR EXERCISE 1 #####
    # 1. Using filter and select, display the Age, Gender, MaritalStatus, Work, HDLChol, and TotChol data where the patient is "NotWorking" and has never been married. (Answer should return a 224-by-6 tibble/dataframe).

    # 2. Display the patient data where the Pulse is really high (in the top 1% of all patients). _Hint:_ see `?quantile` and try `quantile(nhanes$Pulse, probs=.99, na.rm = TRUE) to see the pulse value which is higher than 99% of all the data, then `filter()` based on that. Use Select to look at the Age, Gender, and BMI for these patients. Answer should return a 56-by-3 tibble/data frame.

    #----------------------------------------------------------#
    
  # mutate - changes or creates a new variable/column
    
    # mutate using a function

    # mutate using a conditional
      
    # mutate with the pipe
  

    #### DPLYR EXERCISE 2 #####
    
    # 1. Using Mutate, create an indicator (LowSleep) for those patients that get 6 or less hours of sleep a night (SleepHrsNight).
    
    # 2. Filter using the LowSleep indicator and Select the Age, SleepHrsNight, BPSys, and BPDia variables

    # 3. Using mutate, create a "Low", "Medium", and "High" indicator (HDLChol_cat) for the TotChol variable ranging from 0 to 3, 3 to 5.5, and 5.5 and above. Use select and View() to show Age, Gender, TotChol and TotChol_cat.
    
    
    
  #----------------------------------------------------------#
    
  # summarize - Applies a function to a group  
  # group_by - Tells a function which group(s) to act upon
  # Look at cheatsheet (Help -> Cheatsheets -> Data Manipulation with DPLYR, TidyR) for small list of functions you can use in R

    #Can use Group by to group by one variable

    #...Or multiple variables

    #Advantage of using the Pipe 
    #Old Way

    #Pipe Way

    #### DPLYR EXERCISE 3 #####
    
    #1. When the poverty level is less than 2, what is the average weight across all patients that are Single, separately for each Smoking Status? _Hint:_ 3 pipes: `filter`, `group_by, `summarize.

    #----------------------------------------------------------#

#Manipulating Strings
  #Paste/Paste0 Redux

  #Detect Matches
    #str_detect - detects the presence of a pattern match in a string

    #Use of Regular Expressions
      # Overview of Regular Expressions

  #Detect whether someone received less than high school (8th -> 9th-11th)  

    #str_which - Find the indexes of strings that contain a pattern match.

    #str_count - Count the number of matches in a string.

    #str_locate - Shows the location of the pattern matches in a string

  #Subset strings
    #str_sub - Extract substrings from a character vector.
      
      # You can also assign character vectors to a substring
      
    #str_subset - Return only the strings that contain a pattern match.

  
      #### String Exercise 1 #####
      #1. Create the string vector "This is a test string for us to look at in this exercise, tell me what you can find."  
         # Using str_detect, check whether the following strings or patterns are found.
         #  a. "ell"
         #  b. "Exe"
         #  c. "!"
         #  d. "[:digit:]"
      
      #2. Create a substring within the nhanes dataset for RelationshipStatus that starts at the first character and is 4 characters long.
        
      #3. Filter the nhanes dataset by patients that have an "a" or "A" in the Race variable. Select the Age and Race columns.
        
      #--------------------------#
      
  #Manage Lengths
    #str_length - Find the length of a string
  
    #str_trim - Trims away white spaces from the beginning and end of a string
      
    #str_squish - Trims extra white space from the beginning, middle, and end of a sentence
      
   #Mutate Strings
    #str_replace() - Replace the first matched pattern in each string.
      
    #str_replace_all() - Replace all matched patterns in each string.
    
    #str_to_lower() - set all characters in string to lowercase
      
    #str_to_upper() - set all characters in string to uppercase

    #str_to_title() - - set the first character in string to uppercase
      
      #Compare the 3 modifiers
 
      #--------------------------#
#Merging/Appending/Reshaping Data
    # rbind, cbind
    
    # Bind Columns
    
    # Bind Rows
    
    #Full Join

    # Gather/Spread
    
    #Save Final CSV.
    
    