## This is Generation_talks, a screens project directory
## Workshops/generations
## makestuff/project.Makefile

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

## fido.draft.tex: fido.txt
fido.outline.pdf: fido.txt
fido.draft.pdf: fido.txt
fido.final.pdf: fido.txt

## bridging.draft.tex: bridging.txt
bridging.outline.pdf: bridging.txt
bridging.draft.pdf: bridging.txt
bridging.final.pdf: bridging.txt

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

######################################################################

## Manipulate images
Ignore += *.jpg

forward.jpg: my_images/GI_PRSB_4.jpg
	convert -crop 1280x640+0+0 $< $@

backward.jpg: my_images/GI_PRSB_4.jpg
	convert -crop 1280x640+0+640 $< $@

######################################################################

legacy:
	git clone https://github.com/dushoff/Generation_talks_prescreens.git $@
	cd $@ && chmod a-w Makefile *.*

## cp legacy/copy.tex . ##

######################################################################

-include makestuff/newtalk.def

Ignore += beamer.tmp local.txt.format

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
