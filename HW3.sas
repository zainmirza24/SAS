data hw3sas; 

call streaminit(0); /***Loop**/

z = 10000;

do i = 1 to z ;
	sum = 0;
	M = 0;
do until (sum >1);
x = rand('uniform', 0, 1);
	sum = sum + x; /*x1 --> x10k*/
	M = M + 1; 
end; 

probability = M/z ; 
output;
end; 
run; 

proc means data = hw3sas mean; /**Expected Value of M**/ 
var M; 
title "1a- Zain Mirza";
run; 

proc gplot data = hw3sas; /**Indication of convergence because M is merging to specific point(s)*/
plot probability * i; 
title "1a- Zain Mirza"; 
run; 

data hw3sas; 
call streaminit(0); 

y = 10000; 

do j = 1 to y ; 
	N = 0;
	sum = 0; 
do until (sum>1); 
x = rand('uniform', 0, 1); 
	sum = sum + x; /**x1 --> x10k*/
	N = N + 1; 
end; 

probability = N/(y+1); 
output; 
end; 
run; 

proc means data = hw3sas mean; /**Expected Value of N**/
var N; 
title "1b- Zain Mirza"; 
run; 

proc gplot data = hw3sas; 
plot probability * j;
title "1b- Zain Mirza"; 
run; 

data hw3sas; 
call streaminit(0); 

n = 10000; 

do i = 1 to n;
x = rand('uniform'); 
	short = min(x, 1-x);
	long = max(x, 1-x);
sum = short + long; 
M = short/long; 
N = long/short;
output; 
end; 
run; 

proc means data = hw3sas mean;/**Expected value of short piece / long piece**/
var M; 
title "2a- Zain Mirza"; 
run;

proc gplot data = hw3sas; 
title "2a- Zain Mirza"; 
plot M * i;
run; 

proc means data = hw3sas mean; /**Expected value of long piece / short piece**/
var N; 
title "2b- Zain Mirza"; 
run; 

proc gplot data = hw3sas; 
title "2b- Zain Mirza"; 
plot N * i;
run; 














