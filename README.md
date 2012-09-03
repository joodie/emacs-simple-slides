# emacs simple slides

Show page-break separated files as slides in Emacs.

## usage

Show page-break (^L) separated files as slides.
Btw, to insert ^L in an Emacs buffer, hit 'C-q C-l'

Call M-x slide-init to start with the current buffer

Use C-v and M-v to navigate, as usual. 

Use M-x slide-quit to stop


The switch to slide view changes the font size, not the font family. 
You might play with the text scale amount. In case size does matter.
Look for the following line:

    (text-scale-adjust 3))


# TODO
 
How do I restore former bindings of C-v and M-v in slides-quit, in case there are any.


# HISTORY

I changed the way the fonts are set. Now it affects the local buffer only.
But I don't change the Font set. This might be seen as negative.
