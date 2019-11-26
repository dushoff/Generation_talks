
vim_session: 
	bash -cl "vm target.mk generations.txt ebola.txt smb.txt"


######################################################################

## Directories
## hacking around for Chicago; will this ever be good
## Well, it's certainly not good now (Japan!)

## Module directories
mdirs += ss_pix Generation_distributions fitting_code SIR_model_family SIR_simulations Disease_data contact_trace

## Changed to cold 2019 Aug 06 (Tue) under pressure
hotdirs += $(mdirs)
Sources += $(mdirs)
alldirs += $(mdirs)

## may not be good; doing it on the plane to Chicago
disdirs += Endemic_curves

$(disdirs):
	cd .. && $(MAKE) disease_model_talks
	cd ../disease_model_talks && $(MAKE) $@ $@/Makefile
	$(LN) ../disease_model_talks/$@ .
colddirs += $(disdirs)
Ignore += $(disdirs)
alldirs += $(disdirs)

rabies_R0/figures: rabies_R0 ;
pardirs += rabies_R0 contact_trace WA_Ebola_Outbreak

networkSEIR/fig: 
	$(MAKE) networkSEIR
	$(makethere)

pardirs += networkSEIR

pardirs += rabies_correlations

## generation_links:  ;
pardirs += generation_links

## 2019 Aug 05 (Mon) rescued plots
pardirs += subclinical

## 2019 Aug 06 (Tue): more rescuing
pardirs += hybrid_fitting

Ignore += $(pardirs)
Ignore += link_calculations
## Not working!
link_calculations: 
	$(MAKE) generation_links
	cd generation_links && $(MAKE) makestuff && $(MAKE) $@/Makefile
	ln -s generation_links/$@/ .

## Why should pardirs be cold (or colder than mdirs)?
hotdirs += networkSEIR/fig $(pardirs)

######################################################################

## Is this necessary, or does hotcold work?
## Why is notebook here at all??
pardirs += notebook 
notebook/%: 
	$(MAKE) notebook
	$(makethere)

Ignore += notebook

######################################################################


