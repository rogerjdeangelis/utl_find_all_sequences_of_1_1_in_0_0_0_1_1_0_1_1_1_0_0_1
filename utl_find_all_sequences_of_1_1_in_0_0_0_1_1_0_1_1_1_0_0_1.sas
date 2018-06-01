
Find all sequences of 1,1 in 0, 0, 0, 1, 1, 0, 1, 1, 1, 0, 0, 1

  Two Solutions
       1. WPS/SAS
       2. WPS Proc R

github
https://github.com/rogerjdeangelis/utl_find_all_sequences_of_1_1_in_0_0_0_1_1_0_1_1_1_0_0_1

StackOverflow R
https://stackoverflow.com/questions/50612584/match-a-vector-inside-a-vector

MKR profile
https://stackoverflow.com/users/8176478/mkr


INPUT
=====

 array big[12] _temporary_ (0, 0, 0, 1, 1, 0, 1, 1, 1, 0, 0, 1);
 array ltl[2]  _temporary_ (1,1);

 Expected output

 4, 7, 8



PROCESS
=======

data _null_;
 array big[12] _temporary_ (0, 0, 0, 1, 1, 0, 1, 1, 1, 0, 0, 1);
 array ltl[2]  _temporary_ (1,1);
 do i=1 to 11;
   if big[i]=ltl[1] and big[i+1]=ltl[2] then put i=;
 end;
run;quit;


OUTPUT
======

WPS/SAS Base

  I=4
  I=7
  I=8


The WPS PROC R System

[1] 4 7 8

*                _              _       _
 _ __ ___   __ _| | _____    __| | __ _| |_ __ _
| '_ ` _ \ / _` | |/ / _ \  / _` |/ _` | __/ _` |
| | | | | | (_| |   <  __/ | (_| | (_| | || (_| |
|_| |_| |_|\__,_|_|\_\___|  \__,_|\__,_|\__\__,_|

;

 SAS/WPS

  array big[12] _temporary_ (0, 0, 0, 1, 1, 0, 1, 1, 1, 0, 0, 1);
  array ltl[2]  _temporary_ (1,1);

 WPS/R

  vec1 <- c(0, 0, 0, 1, 1, 0, 1, 1, 1, 0, 0, 1);
  vec2 <- c(1, 1);

*          _       _   _
 ___  ___ | |_   _| |_(_) ___  _ __  ___
/ __|/ _ \| | | | | __| |/ _ \| '_ \/ __|
\__ \ (_) | | |_| | |_| | (_) | | | \__ \
|___/\___/|_|\__,_|\__|_|\___/|_| |_|___/

;

SAS see process


WPS

%utl_submit_wps64('
data _null_;
 array big[12] _temporary_ (0, 0, 0, 1, 1, 0, 1, 1, 1, 0, 0, 1);
 array ltl[2]  _temporary_ (1,1);
 do i=1 to 11;
   if big[i]=ltl[1] and big[i+1]=ltl[2] then put i=;
 end;
run;quit;
');

%utl_submit_wps64('
libname sd1 "d:/sd1";
options set=R_HOME "C:/Program Files/R/R-3.3.2";
proc r;
submit;
library(zoo);
vec1 <- c(0, 0, 0, 1, 1, 0, 1, 1, 1, 0, 0, 1);
vec2 <- c(1, 1);
which(c(rollapply(vec1, width=2, function(x) all(x==vec2), align = "left"),0)==TRUE);
endsubmit;
run;quit;
');
