/********Problem 1********/

data HW1;
call streaminit(0);
do i = 1 to 900;
do j = 1 to 400; 
x = rand('Beta', 0.6, 0.4);
output; 
end; 
end;
run;  

proc means data = HW1 noprint; 
by i;
var x; 
output out = average mean = SampleM std = SampleSD;
run; 

/*****a.*****/

data HW1a;
set average;
p = (.58 <= SampleM <= .60); 
run; 
proc freq data = HW1a; /* Frequency will give us Probabilities(%) of P(0) and P(1)*/
title "1a. Simulated Probability"; 
tables p; 
run; 

/*****b.*****/

proc means data = average mean; 
title "1b. Mean of the Means";
var SampleM; 
run;

/*****c.*****/

proc means data = average std;
title "1c. Standard Deviation of the Means";
var SampleM; 
run; 

/*****d.*****/ 

ods Select Histogram; 
proc univariate data = average; 
var SampleM;
histogram SampleM / NORMAL; 
title "1d. Histogram of the Means";
run; 

/********Problem 2********/

data HW2; 
call streaminit(0);
do i = 1 to 900;
do j = 1 to 400; 
x = rand('Pareto', 6.5);
output;
end; 
end;
run; 

proc means data = HW2 noprint; 
by i;
var x; 
output out = average mean = SampleM std = SampleSD;
run; 

/******a.******/

data HW2a;
set average;
p = (1.17 <= SampleM <= 1.19); 
run; 
proc freq data = HW2a; /* Frequency will give us Probabilities(%) of P(0) and P(1)*/
title "2a. Simulated Probability"; 
tables p; 
run; 

/*****b.*****/

proc means data = average mean; 
title "2b. Mean of the Means";
var SampleM; 
run;

/*****c.*****/

proc means data = average std;
title "2c. Standard Deviation of the Means";
var SampleM; 
run; 

/*****d.*****/ 

ods Select Histogram; 
proc univariate data = average; 
var SampleM;
histogram SampleM / NORMAL; 
title "2d. Histogram of the Means";
run; 





