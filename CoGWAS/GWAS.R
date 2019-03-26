## The Data
#The Data folder contains data from simulations of host-parasite coevolution.
#Every 10 generations over the course of coevolution 1000 host-parasite pairs are sampled.
#The susceptbility (for example measured as pathogen load) is recorded along with the genotype at 2 host loci and 2 loci in the interacting pathogen loci

# We are going to begin by pretending we sample the host population at one particular time point
# Drawing a random generation between 0 and 1000 in steps of 10
gen=sample(seq(0, 1000, by=10), 1)
#Importing Data
data=read.csv(paste("Data/sample_",gen,".csv",sep=""))

##Traditional Association Study: Host only
#We then perform a "GWAS" inferring the effect of the host loci on susceptbility
# Linear regression GWAS
hostOnlyFit=lm(Susceptbility~host_locus_1+host_locus_2+host_locus_1:host_locus_2,data);
#Effect of host loci
summary(hostOnlyFit)$coefficients
#Varience explained
summary(hostOnlyFit)$r.squared
#Add your results to the first tab of this google sheet
# https://docs.google.com/spreadsheets/d/1Sd_pINdUjW5j5MHeCS2HuXldwO51eEzgMp73Y_EfOm0/edit?usp=sharing

##CoGWAS
#We then perform a "GWAS" inferring the effect of the host loci on susceptbility
# Linear regression GWAS
hostPathFit=lm(Susceptbility~host_locus_1+host_locus_2+host_locus_1:host_locus_2+path_locus_1+path_locus_2+path_locus_1:path_locus_2+host_locus_1:path_locus_1+host_locus_1:path_locus_2+host_locus_2:path_locus_1+host_locus_2:path_locus_2,data);
#Effect of host loci
summary(hostPathFit)$coefficients #Note not all terms may appear due to extensive LD between loci
#Varience explained
summary(hostPathFit)$r.squared
#Add your results to the second tab of this google sheet
# https://docs.google.com/spreadsheets/d/1Sd_pINdUjW5j5MHeCS2HuXldwO51eEzgMp73Y_EfOm0/edit?usp=sharing
