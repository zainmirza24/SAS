data Hw4Sales;
infile "/home/u60939923/MATH 338/MATH 338 DATASETS/SALES .txt" dlm = '09'X;
input ID $ TRANS PART_NO QUANTITY;
run;

proc sort data = Hw4Sales;
by PART_NO;
run;

data Hw4Parts;
infile "/home/u60939923/MATH 338/MATH 338 DATASETS/PARTS .txt" dlm = '09'X;
input PART_NO PRICE;
run;

data Hw4Employ;
infile "/home/u60939923/MATH 338/MATH 338 DATASETS/EMPLOY .txt" dlm = '09'X;
input ID $ GENDER $ DOB MMDDYY8.;
format DOB MMDDYY8.;
run;

proc sort data = Hw4Employ;
by ID;
run;

/**1A.**/
data NEW_Hw4Sales;
merge Hw4Parts Hw4Sales;
by part_NO;
Total_Hw4Sales = QUANTITY;
keep ID TRANS Total_Hw4Sales;
*PART NO 789 does not have a quantity listed;
run;

proc sort data = NEW_Hw4Sales;
by trans;
run;

proc print data = NEW_Hw4Sales noobs;
sumby trans;
by trans;
run;

/**1B.**/
proc sort data = New_Hw4Sales;
by ID;
run;

data ZM;
merge NEW_Hw4Sales Hw4Employ;
by ID;
run;

proc sort data = ZM;
by ID;
run;

proc print data = ZM;
sumby ID;
by ID;
format DOB MMDDYY8.;
title "Question 1B.";
run;

/**1C.**/
proc sort data = ZM;
by Gender;
run;

proc print data = ZM;
sumby gender;
by gender;
format DOB MMDDYY8.;
title "Question 1C.";
run;