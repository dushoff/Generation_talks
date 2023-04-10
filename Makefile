## This is Generation_talks, a screens project directory

current: target
-include target.mk
-include makestuff/perl.def

######################################################################

vim_session:
	bash -cl "vmt README.md"

Sources += Makefile legacy.mk content.mk README.md

Sources += $(wildcard *.txt *.abs)

######################################################################

## Newer insane paradigm 台灣 2023
## Big talks and lots of control words

allcg += cgTitle.txt
allcg += dushoff.txt ## Who am I
allcg += cgRtiming.txt ## Questions about intervention, Case vs. instantaneous R
allcg += cgBox.txt
allcg += cgInterval.txt ## rR links, phenomonology, bus waiting
allcg += cgLink.txt 
allcg += cgCorrections.txt ## Champredon and Barcelona
allcg += cgSerial.txt
allcg += cgSender.txt
allcg += cgNL.txt
allcg += cgVariants.txt
allcg += cgIntervention.txt
allcg += cgThanks.txt

Sources += filehead.pl
## cgBox.file.txt.compare: cgBox.txt filehead.pl
## cgBox.file.txt: cgBox.txt filehead.pl
%.file.txt: %.txt filehead.pl
	$(PUSH)

filecg = $(allcg:.txt=.file.txt)

bigtalk.txt: $(filecg)
	$(cat)

## bigtalk.draft.tex.pdf: bigtalk.txt bigtalk.draft.tex
## bigtalk.draft.pdf: bigtalk.txt bigtalk.draft.tex

######################################################################

## Insane paradigm: talk chunks and control words
## Convention: slide break at the end
## U Texas 21_05
## Control words are listed (but not discussed) in local.txt.format

## cgAbs.txt
cgfiles += cgTitle.txt

cgfiles += dushoff.txt ## Who am I

cgfiles += cgRtiming.txt ## Questions about intervention, Case vs. instantaneous R

## Modeling aproaches
cgfiles += cgBox.txt

cgfiles += cgInterval.txt ## rR links, phenomonology, bus waiting

## Generalized exponential, renewal equation, propagation of error
cgfiles += cgLink.txt 
## cgLink.draft.pdf: cgLink.txt

## cgfiles += cgCorrections.txt ## Champredon and Barcelona
## cgfiles += cgSerial.txt
## cgSerial.draft.pdf: cgSerial.txt

## Wuhan unmitigated
## cgfiles += cgSender.txt
## cgSender.draft.pdf: cgSender.txt

## Wallinga/Park intervals and corrections
## cgfiles += cgNL.txt

## cgfiles += cgVariants.txt

cgfiles += cgIntervention.txt
## cgIntervention.draft.pdf: cgIntervention.txt

cgfiles += cgThanks.txt

## covidGens.outline.pdf: cgInterval.txt
## covidGens.draft.pdf: cgInterval.txt
## covidGens.final.pdf: cgInterval.txt

covidGens.txt: $(cgfiles)
	$(catro)

######################################################################

## Re-added 2023 Mar 20 (Mon) to look at ideas for Taiwan talks
bridging.draft.pdf: bridging.txt

## 2020 Aug 17 (Mon)
## It's bad how I always do talks under pressure and my talk directories
## are always a disaster

######################################################################

## Directories (see content.mk)
## Redo as pardirs!!!

subdirs += ssintervention
ssintervention: loc=../../research/gamma

subdirs += speedfigs
speedfigs: loc=../../research/speed_public/code

subdirs += ssvariant
ssvariant: loc=../../research/ssvariant

subdirs += notebook
notebook: loc=../../web/notebook

### Add url above

subdirs += rabies_R0
rabies_R0: loc=../../research/rabies_R0
rabies_R0: url=https://github.com/wzmli/rabies_R0.git

## Note: not yet piped to pipelines (see Makefile)
Ignore += tz_pipelines ## Fix this up
subdirs += rabies_correlations
rabies_correlations: loc= ../../rabies/correlations
rabies_correlations: url=https://github.com/wzmli/rabies_correlations.git

subdirs += coronaSpread
coronaSpread: loc=../../outbreak/corona
coronaSpread: url=https://github.com/wzmli/corona.git

subdirs += coronaFrame
coronaFrame: loc=../../research/exponential_framework
coronaFrame: url=https://github.com/parksw3/wuhan.git

subdirs += ss_pix
ss_pix: loc=../ss_pix

subdirs += Endemic_curves
Endemic_curves: loc=../Endemic_curves

## This is not a JD directory and does not work well with hotdirs
## make the figures subdirectory into a pardir at some point
subdirs += networkSEIR
networkSEIR: loc=generations_mark1/networkSEIR
networkSEIR: url=https://github.com/parksw3/networkSEIR.git
colddirs += networkSEIR/fig

subdirs += link_calculations
Endemic_curves: loc=../link_calculations

######################################################################

## Unprocessed!
## For this directory to stand alone (useful?) we need link variables
subdirs += SIR_simulations Generation_distributions SIR_model_family WA_Ebola_Outbreak trace Disease_data

## early 2020
## NOTE: subdirs are assumed to be _linked_ (and alled at home)
## Rejected parallel for now because we want people to be able to clone one directory
$(subdirs):
	(ls -d ../$@ && $(LN) ../$@) \
	|| (ls -d $(loc)/Makefile && $(LN) $(loc) $@) \
	|| git clone $(url) $@

Ignore += $(subdirs) generations_mark1

## hot to reduce technical debt, cold for emergencies
hotdirs += $(subdirs)

######################################################################

## Super temp!

## ln -fs ~dushoff/gitroot/covid19-git-plateaus// plateaus ##
## This is from Weitz, and is in the research screendir

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

shields/dynamics_top.png: shields/dynamics.png
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
-include makestuff/webpix.mk
-include makestuff/hotcold.mk
-include makestuff/compare.mk
-include makestuff/cacherepo.mk
-include makestuff/cacheflow.mk

-include makestuff/git.mk
