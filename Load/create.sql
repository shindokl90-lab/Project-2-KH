Drop Table IF EXISTS SCHOOL ;
Drop Table IF EXISTS DISTRICT;


CREATE TABLE DISTRICT(
    ID				Serial		 Primary Key,
	name 			VARCHAR ,
    rating 			VARCHAR ,
    city 			VARCHAR ,
    niche_grade 	VARCHAR ,
    number_school 	INT	,
    number_student 	INT 
);

Select * from DISTRICT;


CREATE TABLE SCHOOL (
	ID				Serial		 Primary Key,
    name  			VARCHAR ,
    rating  		VARCHAR ,
    district  		VARCHAR ,
    niche_grade  	VARCHAR  ,
    stu_number 		INT ,
    ratio  			VARCHAR  );

Select * from SCHOOL;