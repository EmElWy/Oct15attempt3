#Question 1
#Displays how many bonds were approved and how many bonds were defeated 
sum(Homework1_Bonds$Result=='Carried')
sum(Homework1_Bonds$Result=='Defeated')
#Displays the proportion of apporved and defeated bonds for each type of government
prop.table(table(Homework1_Bonds$Type,Homework1_Bonds$Result),1)


#Question 2
#Creates New Variable called Votes_Total
Homework1_Bonds$Votes_Total <- Homework1_Bonds$VotesFor+Homework1_Bonds$VotesAgainst
#Displays what the max voter turnout was
max(Homework1_Bonds$Votes_Total)
#Displays information about the place/bond measure with the highest voter turnout
Homework1_Bonds[Homework1_Bonds$Votes_Total==1030414,]


#Question 3
#Creates subset called 'margbonds'
margbonds<- Homework1_Bonds[Homework1_Bonds$Result=='Carried' & Homework1_Bonds$Votes_Total>=100,]
#Creates new variable in margbonds to represent the percentage of total votes that were for the bond measure
margbonds$propofapprov <- (margbonds$VotesFor/margbonds$Votes_Total)*100
#creates hsiotrgram and boxplot to represent the percentage of total votes that were for the bond measure
hist(margbonds$propofapprov,main='Histogram of the Approval of Bonds',xlab='Proportion of total votes that were for the bond measure(%)',col='light green',xlim=c(0,100),ylim=c(0,800))
boxplot(margbonds$propofapprov,main='Boxplot of Voter Approval of Bonds',xlab='Proportion of total votes that were for the bond measure(%)', pch=20, horizontal=TRUE)
#Provides min,Q1, med, Q3, and max for the percentage of total votes that were for the bond measure
fivenum(margbonds$propofapprov)
IQR(margbonds$propofapprov) #calculates Interquartile range for the data

#this is crazy #githubisweird #inclassworksucks

#Question 4
#creates scatterplot of the percentage of total votes that were for the bond measure according to the cost
plot(margbonds$Amount,margbonds$propofapprov,main='The cost of a bond measure and its approval',xlab='Cost ($)',ylab='Proportion of total votes that were for the bond measure(%)',pch=20,col='pink')
points(margbonds$Amount,margbonds$propofapprov)
#Creates Linear Line of Best fit for the data
abline(lm(margbonds$Amount~margbonds$propofapprov),col='orange')
cor(margbonds$Amount, margbonds$propofapprov) #finds correlation between cost and percentage of total votes that were for the bond measure
