## This is Generation_talks, a screens project directory
## Importing to listdirs paradigm

current: target
-include target.mk

######################################################################

Sources += Makefile legacy.mk content.mk

Sources += $(wildcard *.txt)

## uncertainty talk (joint with David Earn for Leah Keshet)
uncertainty.outline.pdf: uncertainty.txt
uncertainty.draft.pdf: uncertainty.txt
uncertainty.final.pdf: uncertainty.txt

######################################################################

## Directories (see content.mk)

subdirs += rabies_R0
rabies_R0: link=../research/rabies_R0
rabies_R0: url=https://github.com/wzmli/rabies_R0.git

## Unprocessed!
## For this directory to stand alone (useful?) we need link variables
subdirs += SIR_simulations ss_pix Generation_distributions

## NOTE: subdirs are assumed to be _linked_ (and alled at home)
## Rejected parallel for now because we want people to be able to clone one directory
$(subdirs):
	(ls -d ../$@ && $(LN) ../$@) || $(LN) $(link) $@ || git clone $(url) $@

Ignore += $(subdirs) generations_mark1

colddirs += $(subdirs)

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


-include makestuff/newtalk.def

Ignore += beamer.tmp local.txt.format

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
