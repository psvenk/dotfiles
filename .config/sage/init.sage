%colors Linux

if get_display_manager().is_in_terminal():
    %display unicode_art
else:
    %display latex

from sage.misc.viewer import viewer

viewer.pdf_viewer("zathura")
viewer.png_viewer("feh")
