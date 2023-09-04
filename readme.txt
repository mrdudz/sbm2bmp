RE: http://www.lemon64.com/forum/viewtopic.php?t=41387
--------------------------------------------------------------------------------

"SuperBitMap" image format (c) 1987 by Michael Hooper

This zip contains:
- deblitzed "sbm-printer" program in .prg and text format
- sample .sbm images converted to .bmp format
- sourcecode for a crude sbm to bmp converter

The format of the SBM files is quite simple, the first 10 bytes contain the
following header (example):

0000  47 46 58 6D  61 70        "GFXmap"
0006  40 02                     width in pixels
0008  59                        lines to print (height in pixels / 8)
0009  0D                        always $0d

after that follows the bitmap data, line by line. each byte contains 8 dots to
be printed in a vertical column (think of how a dot matrix printer works, this
way the data can be send to the printer in graphics mode as is).

last not least at the end of the provided sample files there is some excess data,
which might be an artefact of how the file was created, or simply the result of
xmodem transfers :)

2/2012 gpz
