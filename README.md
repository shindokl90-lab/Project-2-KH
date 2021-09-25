# 2021 Best Public Elementary Schools and School Districts in the Chicago Area

Are you or your friends living in Chicago? <br>
Are you or your friends moving to Chicago? <br>
Are you looking for the best schools for you kids in the Chicago area? <br>
Are you going to purchase a house within the best school districts in the Chicago area? <br>
You probably will find out the answers here ... <br>
Let's go and take a look at the web scraping results from NICHE!

According to NICHE, "The 2021 Best Public Elementary Schools and School Districts ranking is based on rigorous analysis of key statistics and millions of reviews from students and parents using data from the U.S. Department of Education."

## Step 1. **E**xtract
### Data Sources

[![niche](Images/NicheLogo.png)](https://www.niche.com/) <br>
[Best Public Elementary Schools in the Chicago Area](https://www.niche.com/k12/search/best-public-elementary-schools/m/chicago-metro-area/) <br>
[Best School Districts in the Chicago Area](https://www.niche.com/k12/search/best-school-districts/m/chicago-metro-area/)


#### K-12 Schools and Districts
- US Department of Education K12 data on graduation rates and state level test scores.
- Private School Universe Survey (PSS) from National Center for Education Statistics (NCES).
  Source for list of private schools and their information such as enrollment figures.
- Common Core Data (CCD) from National Center for Education Statistics (NCES)
  Source for list of schools and school districts and their information such as enrollment figures.
- Common Core Data (CCD) School District Finance Survey (F-33) from National Center for Education Statistics (NCES)
  School district data on finance information.
- Civil Rights Data Collection
  K12 data on AP/IB classes, disciplinary actions, athletics, etc.
- School Attendance Boundary Survey (SABS) from National Center for Education Statistics (NCES)
  Source for school boundaries.
- Niche K-12 Student and Parent Surveys
  Survey administered to millions of parents, high school students, and recent alumni on Niche.com.
- Niche K-12 Student and Parent Surveys 
  Survey administered to millions of parents, high school students, and recent alumni on Niche.com.

A web scraping was perform to gather the following infomation for the top **500** best elementary public schools and top **50** school districts:

[Niche_best_elementary_school.ipynb](Extract/Niche_best_elementary_school.ipynb) <br>
Best Public Elementary Schools in the Chicago Area:
- name of school
- rating of school
- district
- overall Niche grade
- number of students
- student-teacher ratio

[Niche_best_school_district.ipynb](Extract/Niche_best_school_district.ipynb) <br>
Best School Districts in the Chicago Area:
- name of district
- rating of district
- city and state
- oerall Niche grade
- number of schools
- number of students

All the information is extracted via web scraping and stored in the csv files.
* [top500_elementary_school.csv](Extract/top500_elementary_school.csv)
* [top50_school_district.csv](Extract/top50_school_district.csv)

## Step 2. **T**ransform

[data_Transform.ipynb](Transform/data_Transform.ipynb) <br>
#### Data cleaning
- "States" from the district column of the school table is removed. 
- White space of the disctrict column is trimmed in both tables.
#### Data type conversion
- Student number from both tables is converted from string type to integer type. <br>
#### Final clean tables
- [top50_school_district_clean.csv](Transform/top50_school_district_clean.csv) <br>
- [top500_elementary_school_clean.csv](Transform/top500_elementary_school_clean.csv)

## Step 3. **L**oad
[Load.ipynb](Load/Load.ipynb) <br> <br>
A SQL database was created to support this initiative. The primary reasons for selecting a SQL database were
- Extensable data structure
- Consistant data structure
- Data integrity

![ERD](/Load/Project2_Group_5_Schools_in_Chicago_ERD.png)<br>
 
The load process uses Python to consume CSV file outputs of the Transform step and populate the database.   
* [top500_elementary_school_clean.csv](Transform/top500_elementary_school_clean.csv)
* [top50_school_district_clean.csv](Transform/top50_school_district_clean.csv)

Python is then read from the database and merged into a single joined view, associating Schools with their District.

* [top500_elementary_school_withdistrict_clean.csv](Load/top500_elementary_school_withdistrict_clean.csv)
