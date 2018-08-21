---
layout: post
title: Using Latexdiff For Marking Changes To Tex Documents
date: 2018-08-21 16:35:38.000000000 +08:00
type: post
categories: [DevOps, Latex]
author: yyl
---

Using Latexdiff For Marking Changes To Tex Documents
----------------------------------------------------------------------------------------------------------------------------------

Lately, I have been working on tex projects that involve a few collaborators. I find it hard to keep track of all the changes the contributors make because it’s easy to miss a few changed words in text\-heavy document. I was hoping to find a feature in tex similar to “Track changes” found in Microsoft Word. **latexdiff** was the solution to my problem.

**latexdiff** is an invaluable utility that makes it easy to markup and view changes made to the document. It definitely reduced my burden of having to read through two files simultaneously where it would be easy to overlook subtle changes like word substitutions and changing numbers or signs in an equation.

Acquiring _latexdiff_
---------------------

_latexdiff_ is a Perl script and requires an installation of Perl 5.8 or higher.

If you are a **Windows** user, you will have to go through the following setup to get _latexdiff_ working on your machine:

1.  Install Perl from [Perl \- Download](http://www.perl.org/get.html)
2.  Download _latexdiff_ from [CTAN](http://www.ctan.org/tex-archive/support/latexdiff)
3.  Unzip the _latexdiff_ files and copy them to the `Perl > bin` folder (default installation in C: drive)
4.  Enjoy _latexdiff_!

**Mac OS X** includes an installation of Perl and no additional setup is required. _latexdiff_ can be found in any CTAN repository in TeX Live Utility.

Usage
-----

To compare two documents simply run _latexdiff_ in the command line like so:

    latexdiff draft.tex revision.tex > diff.tex
    

where “draft.tex” and “revision.tex” are original and changed versions of your document, and “diff.tex” is where the markup is stored.

The above command provides `latexdiff` with the two comparison files and the filename for the resulting marked tex file. If the two input files you provide are valid tex files, the resulting “diff.tex” will also be a tex file. This marked file can now be compiled with your choice of tex compiler (PDFLatex, LaTeX, etc.).

Out of the box, any removed words are crossed out with a single line and colored red, whereas any added words are underlined with a squiggle and colored blue. When equations are changed, additions are marked with a blue font and removals are marked with a red.

Example Output
--------------

I compared two documents with default _latexdiff_ settings, and I was very impressed with the results:

![The new auto complete featuree](https://cdn.sharelatex.com/blog/images/latexdiff/default-format-latexdiff.png)

Unlike Microsoft Word, where the changes are simply highlighted and the notes are off to the side, all changes are clearly marked where they happen!

For those of you who do not want a cluttered document with lots of strikethrough text, the `CTRADITIONAL` option is way to go. Simply specify the option to _latexdiff_:

    latexdiff -t CTRADITIONAL draft.tex revision.tex > diff.tex
    

All the deleted text appear as footnotes and added text appear in blue.

![The new auto complete featuree](https://cdn.sharelatex.com/blog/images/latexdiff/changes-in-footer-latexdiff.png)

latexDiff Options
-----------------

You can include various to suit your needs for a visual markup style. Some options (taken from the [documentation](http://ctan.mirrorcatalogs.com/support/latexdiff/doc/latexdiff-man.pdf)) include:

*   UNDERLINE – Added text is wavy\-underlined and blue, discarded text is struck out and red
    
*   CTRADITIONAL – Added text is blue and set in sans\-serif, and a red footnote is created for each discarded piece of text
    
*   TRADITIONAL – Like CTRADITIONAL but without the use of color
    
*   CFONT – Added text is blue and set in sans\-serif, and discarded text is red and very small size
    
*   FONTSTRIKE – Added text is set in sans\-serif, discarded text small and struck out
    
*   CHANGEBAR – Added text is blue, and discarded text is red. Additionally, the changed text is marked with a bar in the margin
    

For more information on `latexdiff` check out the [official documentation](http://ctan.mirrorcatalogs.com/support/latexdiff/doc/latexdiff-man.pdf).

CHANGEBAR – Added text is blue, and discarded text is red. Additionally, the changed text is marked with a bar in the margin

For more information on latexdiff check out the official documentation.


latexDiff without TexLive or MikTex
-----------------

1. Install Perl
2. Install cpan
3. install cpanm
4. install alogorithm::diff module
5. download latexdiff zipfile
6. diff tex files.
