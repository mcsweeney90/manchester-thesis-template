# manchester-thesis-template

This repository provides the LaTeX template I used for my PhD thesis. It's basically just the standard University of Manchester `muthesis.cls` class file with a few additions but one person asked me for the source code so I decided I may as well include it here. Warning: it's hacked together so I can't offer any guarantees that it will compile for you!

## Navigation

`intro` : TeX files and images for the introduction.

`references` : `bib` files to construct the references/bibliography.
 
`muthesis.cls` : The standard UoM thesis class file with some tweaks.

`thesis.pdf` : Example of the output.

`thesis.tex` : Source file used to build thesis.  

## Need to know

1. The margins in the `pdf` above are not valid for the printable version that the University requires at submission. To get the print version, comment out the `\RequirePackage[...]{geometry}` command in `muthesis.cls`. 

