## This is Generation_talks, a screens project directory
## Workshops/generations

## deptarget:
current: target
-include target.mk

# include makestuff/perl.def

######################################################################

# Content

vim_session:
	bash -cl "vmt"

######################################################################

## Moved original Generation_talks to "legacy" 2019 Oct 27 (Sun)
## Even earlier stuff is possibly in bitbucket talks directory
Sources += Makefile legacy.mk

Sources += $(wildcard *.txt)

## Talk for SMB Jul 2017
## Also in push
smb.outline.pdf: smb.txt
smb.draft.pdf: smb.txt
smb.final.pdf: smb.txt

## smb.draft.tex: smb.txt

## SMB 2019 Time-since-infection overview
overview.outline.pdf: overview.txt
overview.draft.pdf: overview.txt
overview.final.pdf: overview.txt

## Tokyo 2019
generations.outline.pdf: generations.txt
generations.draft.pdf: generations.txt ## generations.draft.log
generations.final.pdf: generations.txt
generations.handouts.pdf: generations.txt

ebola.outline.pdf: ebola.txt
ebola.draft.pdf: ebola.txt
ebola.final.pdf: ebola.txt
ebola.complete.pdf: ebola.txt

## Legacy directory
Ignore += Ebola_math

Ebola_math: dir=~/Dropbox/academicWW/
Ebola_math:
	$(linkdir)

######################################################################

## Cancelled talks (father illness)

## Taiwan AIMS (overlap with SMB/hetero? what else?)
Sources += aims.abs

## SMB 2018
Sources += hetero.abs
hetero.outline.pdf: hetero.txt
hetero.draft.pdf: hetero.txt
hetero.final.pdf: hetero.txt

######################################################################

## Forecasting talk (developing for U. Chicago 2018 Oct 26 (Fri))
## Glasgow Oct 2019 (half me/half Mike); marked out a bunch of stuff, moved thanks to beginning
## Used to be callled fido
genEst.outline.pdf: genEst.txt
genEst.draft.pdf: genEst.txt
genEst.final.pdf: genEst.txt

## The super-fast Banff talk is a version of bridging
bridging.outline.pdf: bridging.txt
bridging.draft.pdf: bridging.txt
bridging.final.pdf: bridging.txt

## nCoV McMaster version Feb 2020
outbreakGens.outline.pdf: outbreakGens.txt
outbreakGens.draft.pdf: outbreakGens.txt
outbreakGens.final.pdf: outbreakGens.txt

######################################################################

## Paths (could be modularized in case there's another user)

screenroot = ~/screens
legacy = ~/gitroot

######################################################################

## Directories

pardirs += Generation_distributions Endemic_curves Disease_data link_calculations trace
pardirs += SIR_model_family WA_Ebola_Outbreak SIR_simulations ss_pix

hotdirs += $(pardirs)

screenroot = ~/screens
mli = $(screenroot)/rabies

## Maybe try to deprecate this; some repetition of pardirs seems fine
## (linked from elsewhere)
linkdirs += rabies_R0
rabies_R0: dir=$(mli)/R0
rabies_R0:
	$(linkdirname)

linkdirs += rabies_correlations
rabies_correlations: dir=$(mli)/correlations
rabies_correlations:
	$(linkdirname)

## Trying to avoid alling this directory
linkdirs += networkSEIR
networkSEIR: dir=$(legacy)
networkSEIR:
	$(linkdir)

networkSEIR/fig/diagram.pdf:
	$(MAKE) networkSEIR
	cd networkSEIR/fig && pdflatex diagram

linkdirs += notebook
notebook: dir=$(screenroot)/admin
notebook:
	$(linkdir)

Ignore += $(linkdirs)
colddirs += $(linkdirs)

######################################################################

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

legacy:
	git clone https://github.com/dushoff/Generation_talks_prescreens.git $@
	cd $@ && chmod a-w Makefile *.*

## cp legacy/copy.tex . ##

######################################################################

-include makestuff/newtalk.def

Ignore += beamer.tmp local.txt.format

######################################################################

## Keep deprecating whatever this is! 2020 Feb 05 (Wed)

Ignore += tmpfigs
tmpfigs:
	$(mkdir)

%.png: %.svg
	$(convert)

tmpfigs/%: ~/Dropbox/HIV_presentations/images/%
	$(copy)

######################################################################

Ignore += makestuff
msrepo = https://github.com/dushoff
Makefile: makestuff/Makefile
makestuff/Makefile:
	git clone $(msrepo)/makestuff
	ls $@

-include makestuff/os.mk
-include makestuff/git.mk
-include makestuff/visual.mk
-include makestuff/projdir.mk
-include makestuff/newtalk.mk
-include makestuff/texdeps.mk
-include makestuff/wrapR.mk
-include makestuff/webpix.mk
-include makestuff/hotcold.mk
