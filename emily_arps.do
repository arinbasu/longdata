cd "/Users/arindambose/Documents/"
clear all
// import the emdata.csv file created in R

insheet using "emdata.csv", comma
// save as stata data to work with
save emdata, replace
use emdata

drop id
drop if id2 == "43,656"
destring time, gen(time3)

// reshape data from long to wide
/* in attempting this, learned that for id2 == 43,656 
is present in multiple instances of pre post follow up
and also that follow-up is invalid name, so change
*/

//destring time, gen(time_2)
//tab1 time, time2

reshape wide gratcont totalreplies ///
				totrepliesb reply_freq studyin ///
				dep_cutoff anx_cutoff grat_avg ///
				swls_avg sestm_avg wlbng_avg ///
				pos_avg neg_avg de1s_avg ///
				anx_avg mind3lness_avg ///
				gender age, i(id2) j(time)

save emdatawide, replace
use emdatawide
