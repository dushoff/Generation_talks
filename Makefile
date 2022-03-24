## This is Generation_talks, a screens project directory
## Importing to listdirs paradigm 2020 Jul 08 (Wed)

current: target
-include target.mk

######################################################################

Sources += Makefile legacy.mk content.mk

Sources += $(wildcard *.txt *.abs)

######################################################################

## Insane paradigm: talk chunks and control words
## Convention: slide break at the end
## U Texas 21_05
## Control words are listed (but not discussed) in local.txt.format

cgfiles += cgTitle.txt
cgfiles += cgInterval.txt ## rR links, phenomonology, bus waiting
cgfiles += ## cgLink.txt ## Generalized exponential, renewal equation, propagation of error
cgfiles += corrections.txt ## Champredon and 
cgfiles += cgSerial.txt
cgfiles += cgVariants.txt
cgfiles += cgIntervention.txt
cgfiles += cgThanks.txt

## covidGens.draft.pdf: cgInterval.txt
## covidGens.final.pdf: cgInterval.txt

covidGens.txt: $(cgfiles)
	$(catro)

######################################################################

## New for technical Tuesday

# Future:  doi: https://doi.org/10.1101/2021.05.03.21256545

technical.draft.pdf: technical.txt
technical.final.pdf: technical.txt

######################################################################

## 2020 Aug 17 (Mon)
## It's bad how I always do talks under pressure and my talk directories
## are always a disaster

## Current versions
## generations.txt Tachikawa
## genEst.txt Glasgow
## mathGens.txt Fields
## origins.txt
## smb.txt Plenary
## smb_covid.txt
## uncertainty.txt UBC (June 2020)
## bridging.txt (BIRS 2018)
## covid_colloq.txt (Cornell 2020)
## ebola.txt Tachikawa
## outbreakGens.txt BioSeminar ⇒ global health

## Discussion (?)
## UBC informal? GA Tech "incubator", EEB (!)
## UT Austin weird session May 2021
covid_disc.draft.pdf: covid_disc.txt

covid_colloq.draft.pdf: covid_colloq.txt
covid_colloq.final.pdf: covid_colloq.txt
covid_colloq.outline.pdf: covid_colloq.txt

covid_eeb.final.pdf: covid_eeb.txt
covid_eeb.draft.pdf: covid_eeb.txt

temp.draft.pdf: temp.txt

## Intervals and control SMB 2020
## smb_covid.final.pdf: smb_covid.txt
## smb_covid.draft.pdf: smb_covid.txt
## smb_covid.draft.pdf.cache: 

## uncertainty talk (joint with David Earn for Leah Keshet)
uncertainty.outline.pdf: uncertainty.txt
uncertainty.draft.pdf: uncertainty.txt
uncertainty.final.pdf: uncertainty.txt

######################################################################

## Directories (see content.mk)

subdirs += ssintervention
ssintervention: link=../../research/gamma

subdirs += speedfigs
speedfigs: link=../../research/speed_public/code

subdirs += ssvariant
ssvariant: link=../../research/ssvariant

subdirs += notebook
notebook: link=../../web/notebook

### Add url above

subdirs += rabies_R0
rabies_R0: link=../../research/rabies_R0
rabies_R0: url=https://github.com/wzmli/rabies_R0.git

## Note: not yet piped to pipelines (see Makefile)
Ignore += tz_pipelines ## Fix this up
subdirs += rabies_correlations
rabies_correlations: link= ../../rabies/correlations
rabies_correlations: url=https://github.com/wzmli/rabies_correlations.git

subdirs += coronaSpread
coronaSpread: link=../../outbreak/corona
coronaSpread: url=https://github.com/wzmli/corona.git

subdirs += coronaFrame
coronaFrame: link=../../research/exponential_framework
coronaFrame: url=https://github.com/parksw3/wuhan.git

subdirs += ss_pix
ss_pix: link=../ss_pix

subdirs += Endemic_curves
Endemic_curves: link=../Endemic_curves

## This is not a JD directory and does not work well with hotdirs
## make the figures subdirectory into a pardir at some point
subdirs += networkSEIR
networkSEIR: link=generations_mark1/networkSEIR
networkSEIR: url=https://github.com/parksw3/networkSEIR.git

######################################################################

## Unprocessed!
## For this directory to stand alone (useful?) we need link variables
subdirs += SIR_simulations Generation_distributions SIR_model_family WA_Ebola_Outbreak trace Disease_data

## early 2020
## NOTE: subdirs are assumed to be _linked_ (and alled at home)
## Rejected parallel for now because we want people to be able to clone one directory
$(subdirs):
	(ls -d ../$@ && $(LN) ../$@) \
	|| (ls -d $(link) && $(LN) $(link) $@) \
	|| git clone $(url) $@

Ignore += $(subdirs) generations_mark1

## hot to reduce technical debt, cold for emergencies
hotdirs += $(subdirs)

######################################################################

## Super temp!

## ln -fs ~dushoff/gitroot/covid19-git-plateaus// plateaus ##

## Copyright

Sources += copy.tex

######################################################################

## Is this sharing a good idea or not?
imageDrop = ~/Dropbox/disease_model_lectures/

## Images

Sources += $(wildcard *.step)

ebola.html: ebola.step
hiv.html: hiv.step
pix.html: pix.step
vaccine.html: vaccine.step
ici3d.html: ici3d.step
influenza.html: influenza.step
corona.html: corona.step

######################################################################

## Manipulate images
Ignore += *.jpg

## downcall my_images/MMED18.jpg ##
MMED18.jpg: my_images/MMED18.jpg
	convert -scale 25% $< $@

forward.jpg: my_images/GI_PRSB_4.jpg
	convert -crop 1280x640+0+0 $< $@

backward.jpg: my_images/GI_PRSB_4.jpg
	convert -crop 1280x640+0+640 $< $@

## This split makes two files somehow!!
coronasingle.jpg: webpix/coronapair.jpg
	convert -crop 646x400 $< $@
coronasingle-0.jpg: coronasingle.jpg ;

######################################################################

-include makestuff/newtalk.def

Ignore += beamer.tmp
Sources += local.txt.format

######################################################################

## Baumann deadline

Ignore += bbmisc_peak
## cp -r ~/screens/projects/bbmisc/peak_I_simple_files/figure-html/ bbmisc_peak

Ignore += Korea
## ln -s ~/screens/outbreak/Korea . ##

Ignore += plateaus
## ln -s ~/gitroot/covid19-git-plateaus/ plateaus ##

shields/dynamics_top.png: shields/dynamics.png Makefile
	convert -crop 748x748+0+0 $< $@

######################################################################

## Does not chain right!
../TalkArchive:
	$(justmakethere)

cachestuff: ../TalkArchive
	$(ln)

######################################################################

Ignore += makestuff
msrepo = https://github.com/dushoff
Makefile: makestuff/Makefile
makestuff/Makefile:
	git clone $(msrepo)/makestuff
	ls $@

-include makestuff/os.mk
-include makestuff/visual.mk

-include makestuff/newtalk.mk
-include makestuff/texi.mk
-include makestuff/makeR.mk
-include makestuff/webpix.mk
-include makestuff/hotcold.mk
-include makestuff/cacherepo.mk
-include makestuff/cacheflow.mk

-include makestuff/git.mk
