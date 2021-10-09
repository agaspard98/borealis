#Exercise #5

#Practice the following skills:
  # reshape data frames
  # if_else statements

#Part 1: version control --------------------------------------------
# Please track changes to your script using version control. Include in your homework the URL to your completed homework assignment available on your
#GitHub repository


#URL: https://github.com/agaspard98/borealis.git


#Part 2: reshaping data frames ---------------------------------------------

#Using the 'batting.2008.Rdata' dataset, please do the following

setwd("~/2021fallclasses/Intro to R/assignments/assignment 5")
load("~/2021fallclasses/Intro to R/assignments/assignment 5/batting.2008.Rdata")
library(tidyverse)
head(d)

#1) Using the spread() function, please create a data frame that shows the total number of home runs (HR) for each birthYear for
  #each team (use the teamID column) aggregated by player

da <- d[, c("teamID", "HR", "nameLast", "nameFirst")]
dab <- data.frame(r1=names(da$birthYear), t(da)
dac <- spread(data = dab, key = teamID, value = HR)                  

#2) Subset the data for the Houston Astros (HOU). Using the gather() function, create a new data frame that has 3 columns:
  # (1) playerID, (2) variable containing (AB, R, H, 2B, 3B) and (3) column with the corresponding values for the stats.

ha = d[d$teamID == "HOU", c("playerID", "AB", "R", "H", "2B", "3B")]
hb = gather(data = ha, key = player.stat, value = stat.value, 2:6)

#3) Repeat the process for Question 2. However, this time, please use the melt() function from the 'reshape2' package.

hamelt <- melt(data = ha, id = c("playerID"), variable.name = c("player.stat"))


#4) Using the dcast() function from the 'reshape2 package', find the mean number of AB, R, H, 2B, 3B for each player (use 'playerID' to aggregate).

hadcast <- dcast(data = ha, formula = playerID~3B, fun.aggregate = mean)

#Part 3: if_else statements -------------------------------

# one condition
#5) generate an if_else statment to test if the value of a numeric object is positive number

x = 7

if(x > 0){
print("positive number")
} else {
print("negative number")
}

#6) using the two objects below, please generate an if_else statement that uses logical operator (i.e, !=, ==, >, etc.)
  # in the test

    x <- 5
    y <- 8

if(x != y){
print("True")  
} else {
print("False")
}
    
#7) Hamlet's quandry: In Shakespeare's play Hamlet, the lead character has a famous speech "to be or not to be".
browseURL("https://www.poetryfoundation.org/poems/56965/speech-to-be-or-not-to-be-that-is-the-question")
# Write an if_else statement using the "to be' or 'not to be' for outcomes of the 'yes' and 'no' arguments respectively.

suffer = 7
take.arms = 12

if(suffer != take.arms){
print("To Be")
} else {
print("Not to be")
}


#two or more conditions
#8) create an 'if else' statement that returns (in order of preference) your four ideal pizza toppings

pepercini = 1
peperoni = 2
sausage = 3
cheese = 4

if(pepercini = 1 & peperoni = 2) {
  print("Pepercini, peperoni, sausage, cheese")
} else if(pepercini = 3 & peperoni =4){
print("Sausage, cheese, pepercini, peperoni")
}


#two or more conditions joined (new content)
#To join two or more conditions into a single if statement, use logical operators viz. && (and), || (or) and ! (not).

  #example:
  x <- 7
  y <- 5
  z <- 2
  if(x > y && x > z) {
    print("x is greater")
  }

#9) generate your own 'if' statement using multiple conditions in one line

if(z < y && z < x) {
  print("z is less than")
}
}

#New content: understanding a common warning/error message when using if_else.
# The follow set of code will generate a warning message. Explain in a comment what the warning is telling you.
  v <- 1:6

  if(v %% 2) {
    print("odd")
  } else {
    print("even")
  }

# V has 6 numbers within it, but the if else statement is not the same length. R will evaluate the if else statement for only the first value in the v vector.