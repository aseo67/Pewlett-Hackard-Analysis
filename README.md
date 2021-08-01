# Pewlett-Hackard-Analysis
Module 7 Challenge Data Analysis File Links
- ![Employee_Database_challenge.sql](https://github.com/aseo67/Pewlett-Hackard-Analysis/blob/main/Queries/Employee_Database_challenge.sql)
- ![retirement_titles.csv](https://github.com/aseo67/Pewlett-Hackard-Analysis/blob/main/Data/retirement_titles.csv)
- ![unique_titles.csv](https://github.com/aseo67/Pewlett-Hackard-Analysis/blob/main/Data/unique_titles.csv)
- ![retiring_titles.csv](https://github.com/aseo67/Pewlett-Hackard-Analysis/blob/main/Data/retiring_titles.csv)
- ![mentoring_eligibilty.csv](https://github.com/aseo67/Pewlett-Hackard-Analysis/blob/main/Data/mentorship_eligibilty.csv)

## Overview of Analysis
Pewlett-Hackard is a company with several thousand employees, many of whom are nearing retirement. Thus, the company will need to proactively plan ahead for positions that will need to be filled in the near future. This analysis conducts employee research, seeking answers to two primary questions, (1) who will be retiring soon and are eligible for the retirement package, and (2) how many positions will the company need to fill. As the company historically relied on Excel and VBA to store their data, this analysis also leverages a newer tool, SQL, to build an employee database to help answer these questions. 

## Results
Bulleted list with 4 major points from two analysis deliverables
- First, this analysis parses out which employees were born between Jan.1, 1952 and December 31, 1955, to help identify those nearing retirement. However, important to note that this list includes duplicates, as various employees have been promoted over the years; thus, they have multiple titles saved in their records. 

  ![retirement_titles.csv](https://github.com/aseo67/Pewlett-Hackard-Analysis/blob/main/Data/retirement_titles.csv)
  ![Screenshot](https://github.com/aseo67/Pewlett-Hackard-Analysis/blob/main/Screenshot_retirement_titles.png)

- To resolve this duplicates issue, a second table was created pulling data of most recent titles of each employee only. This data table helps consolidate all employee information of those who will be retiring soon, forming an extensive list that the company can refer to as they prepare for this staffing issue. 

  ![unique_titles.csv](https://github.com/aseo67/Pewlett-Hackard-Analysis/blob/main/Data/unique_titles.csv)
  ![Screenshot](https://github.com/aseo67/Pewlett-Hackard-Analysis/blob/main/Screenshot_unique_titles.png)

- Next, to help directly answer the business question of which positions/roles will need the most replacements as employees retire, another data table was pulled focusing on the count of retiring employees for each role/title. From this, we see that Senior Engineers and Senior Staff comprise the majority of positions that will need to be filled. 

  ![retiring_titles.csv](https://github.com/aseo67/Pewlett-Hackard-Analysis/blob/main/Data/retiring_titles.csv)
  ![Screenshot](https://github.com/aseo67/Pewlett-Hackard-Analysis/blob/main/Screenshot_retiring_titles.png)

- Finally, given that many of the positions needing fills are the senior positions, one idea to help alleviate the transition pains of so many retiring employees, is to implement a mentorship program. Those eligible for the program are retiring employees who were born in 1965. The following analysis and table helps narrow the list for these program-eligible employees. 

  ![mentoring_eligibilty.csv](https://github.com/aseo67/Pewlett-Hackard-Analysis/blob/main/Data/mentorship_eligibilty.csv)
  ![Screenshot](https://github.com/aseo67/Pewlett-Hackard-Analysis/blob/main/Screenshot_mentorship_eligibility.png)


## Summary
As mentioned, the two main questions the company is looking to answer through this analysis are: 
  1. Who will be retiring soon?
  2. How many positions will the company need to fill?
Through this analysis we see that: 
  1. Many employees from the baby boomers' era are up for retirement, born between the years of 1952 and 1955. 
  2. A total of 90,398 employees are eligible for retirement packages. Of those, 1,549 employees are born in 1965 and eligible for the mentorship program. 

Two additional pieces of analysis are:

