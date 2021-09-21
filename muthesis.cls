%% muthesis Class for LaTeX2e.
%% Last update 12th August 2013: amended evensidemargin for duplex
%%
%% Time-stamp: <July 23, 1997 11:33:00 BST graham@cs.man.ac.uk>
%%
%% This class file has been cobbled together for use of postgraduate
%% students in the Department of Computer Science at the University of
%% Manchester. Any comments or problems about its use should be made
%% via the local newsgroup man.cs.tex.
%%
%% The \department command can be used to define as a department other than
%% Mathematics.
%% The \school command can be used to define as a department other than
%% Natural Sciences.
%%
%% History
%%    Acquired for uk.ac.oxford.prg by Stephen Page <sdpage> on 16 Apr
%%    86 from Howard Trickey <trickey@arpa.su-aimvax> , then hacked by
%%    Michael Fisher into Manchester University style.
%%
%%    Hacked from muthesis.sty by Rhod Davies (rmd@uk.ac.man.cs.r5) to
%%    match the latest ridiculous rules from the exams office (March
%%    1990) as given below.
%%
%%    Further modified by David Carlisle (DPC) September 1993.
%%
%%    Further modified by David Carlisle (DPC) September 1994.
%%      Add [PhD] option (default) and [MSc] option.
%%      Make into LaTeX2e Class file.
%%
%%    Further modified by Graham Gough at various dates
%%    Added [MPhil option.

%%    Modified William Dyke (WBD) July 1997 so that declaration is
%%    correct for use in departments other than Computer Science

%%    Modified by Chris Paul March 2006 to reflect new University 
%%    Schools and Faculty setup

%%    Modified by Chris Paul August 2013 to support duplex printed margins

%%    Modified by Chris Johnson January 2020 to reflect new
%%    University Schools and Faculty setup, and change URLs in the
%%    copyright statement

%%    Personal modifications made by Tom McSweeney August 2021 for his thesis.
%%   

%% Note that this makes no attempt to deal with multi-volume thesis -
%% if you do one that long you deserve everything you get.
%% 1) Page numbering starts on the title page and is arabic (i.e. title
%%       page is no.1), all pages are numbered (declaration, figures
%%       etc included), but the title page itself shall not show the
%%       page number!
%%
%%
%% 2) The preface will consist of the following sections in the
%%       following order!
%%       i  )    Title Page
%%       ii )    Contents page (actually we shall be fancy and have a
%%               table of contents, list of tables and list of figures.
%%               This is the correct place to put these extras)
%%       iii)    A short Abstract
%%       iv)     Declaration of honesty
%%       v)      Statement of qualifications and research
%%       vi)     Anything else you want, such as acknowledgements
%%
%%
%% 3) The ordering of the items on the title page has been changed
%%       slightly from the old muthesis style - it is now
%%               Statement - A thesis ..... Faculty of ...
%%               Year of Presentation
%%               Candidate's name
%%               Candidate's department
%%
%%
%% 4) Certain members of this university never having heard of
%%       typesetting, (i.e. the ones who will be the first against the
%%       wall when the revolution comes), the whole thing (apart from
%%       footnotes and quotations must be doublespaced. By a strang
%%       coincidence, a set of the thesis rules fell through a time
%%       warp from the future and landed on my desk. These note that
%%       single spacing is allowed in typeset thesis, with a footnote
%%       that those who were in favour of double spacing were the first
%%       against the wall when the revolution came.
%%               If everyone who submits a thesis goes and argues with
%%       them about this they may eventually get the hint, but this is
%%       unlikely. To get this we set baselinestretch to 1.5 which
%%       looks about right, and they have never noticed the difference.
%%       By all means set this to something sensible while producing
%%       draft copies, but remember DOUBLE SPACE before you hand in.
%%
%%
%% 5) The binding (left hand) margin must be no less than 40mm, other
%%       margins must be no less than 15mm, with page numbers falling
%%       within these margins. The binding margin is thus rather large,
%%       even when you take the binding (normally about 10mm) into account.
%%       Consequently you cannot reduce the other margins without
%%       making the page look unbalanced. Consequently we have a 40mm
%%       binding margin and 15 mm margin on all other sides. NOTE, this
%%       does not allow for any marginal notes. I recommend that you
%%       avoid using these, since a) there is not much space for them
%%       and they will format badly and b) they will violate the margin
%%       rules.
%%
%%
%% The rest of these notes will not be found in the written submission
%% rules, but come from converstions with the exams office.
%%
%%
%% 6)    They have not particular rules about the format of the
%%       bibliography, so long as you are consistent in your naming
%%       scheme. I would recommend the alpha style.
%%
%%
%% 7)    They do not seem to have any rules about appendices.
%%
%%
%% 8)    As before, any extra things you want to put in -
%%       acknowledgements etc, should come after the mandatory preface
%%       sections and before the first chapter.
%%
%% This style can usefully be used in conjunction with the doublespace
%% style which introduces a single spaced environment.
%%
%% It is not compatible with the drafthead style.


\ProvidesClass{muthesis}[2020/01/16 MU Thesis Class]

\DeclareOption{PhD}{\def\degreetitle{Doctor of Philosophy}}
\DeclareOption{MSc}{\def\degreetitle{Master of Science}}
\DeclareOption{MPhil}{\def\degreetitle{Master of Philosophy}}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{report}}
\def\@msc{Master of Science}

\ExecuteOptions{PhD}

\ProcessOptions

\LoadClass[a4paper]{report}

%% Manchester University PhD thesis style -- modifications to the report style
%%


%------------------ Margins ----------------------%
%% We need >15mm  margins except on the binding edge, where it is >40mm
%% Negated using the geometry package below - to use recommended print margins, comment out the \RequirePackage[...]{geometry} command.
\oddsidemargin 15truemm \evensidemargin -8truemm
\marginparwidth 40pt \marginparsep 10pt
\topmargin -11.5truemm \headsep 7truemm
\textheight 245truemm \textwidth 154truemm
%-------------------------------------------------%

%% Disallow page breaks at hyphens (this will give some underfull vbox's,
%% so an alternative is to use \brokenpenalty=100 and manually search
%% for and fix such page breaks)
\brokenpenalty=10000

%% Use 1.5 times the normal baseline-to-baseline skip (approx double space)
\def\stretch{1.5}
\renewcommand{\baselinestretch}{\stretch}

%% Redefine the macro used for floats (including figures and tables)
%% so that single spacing is used.
\let\latex@xfloat=\@xfloat
\def\@xfloat #1[#2]{
        \latex@xfloat #1[#2]
        \def\baselinestretch{1}
        \@normalsize \normalsize
}

%% Redefine the macro used for footnotes to use single spacing
\long\def\@footnotetext#1{\insert\footins{\def\baselinestretch{1}\footnotesize
    \interlinepenalty\interfootnotelinepenalty
    \splittopskip\footnotesep
    \splitmaxdepth \dp\strutbox \floatingpenalty \@MM
    \hsize\columnwidth \@parboxrestore
   \edef\@currentlabel{\csname p@footnote\endcsname\@thefnmark}\@makefntext
    {\rule{\z@}{\footnotesep}\ignorespaces
      #1\strut}}}

%% \author, \title are defined in report; here are the rest of the
%% front matter defining macros
%% Note: If you really want, you can define your own macro for, say
%% \supervisor , just by copying the definitions of \principaladvisor
%%
\def\department#1{\gdef\@department{#1}}
\def\school#1{\gdef\@school{#1}}
\def\faculty#1{\gdef\@faculty{#1}}
\def\principaladviser#1{\gdef\@principaladviser{#1}}
\def\advis@r{Advisor} % default spelling---we are English!
%% Obviously, we could add a \supervisor macro
\def\principaladvisor#1{\gdef\@principaladviser{#1}\gdef\advis@r{Advisor}}
\def\firstreader#1{\gdef\@firstreader{#1}}
\def\secondreader#1{\gdef\@secondreader{#1}}
\def\submitdate#1{\gdef\@submitdate{#1}}
\def\copyrightyear#1{\gdef\@copyrightyear{#1}} % \author, \title in report
\def\@title{}
\def\@author{}
\def\@department{}
\def\@school{}
\def\@faculty{}
\def\@principaladviser{}\def\@firstreader{}\def\@secondreader{}
\def\@submitdate{\number\the\year}
%% Stanford says that December theses should have the next year as the
%% copyright year
\ifnum\month=12
    \@tempcnta=\year \advance\@tempcnta by 1
    \edef\@copyrightyear{\number\the\@tempcnta}
\else
    \def\@copyrightyear{\number\the\year}
\fi
\newif\ifcopyright \newif\iffigurespage \newif\iftablespage \newif\ifsigpage \newif\ifnompage % added nompage
\copyrighttrue \figurespagetrue \tablespagetrue \sigpagefalse \nompagetrue % added nompage


\ifx\degreetitle\@msc
    \def\@thesis{dissertation}
    \else
    \def\@thesis{thesis}
\fi

%% If you're doing an MSc, I'm sure you can guess which parts to change
%% below; if not then you shouldn't be doing one.
\def\titlep{%
        \thispagestyle{empty}%
        \null\vskip1in%
        \begin{center}
                \Huge\uppercase\expandafter{\@title}
        \end{center}
        \vfill
        \begin{center}
           \sc A \expandafter{\@thesis} submitted to the University of Manchester\\
           for the degree of \degreetitle\\
           in the Faculty of \expandafter{\@faculty}
        \end{center}
        \vfill
        \begin{center}
                \@submitdate
        \end{center}
        \vfill
        \begin{center}
                {\bf\@author}\\
                \ifx\@empty\@department
                \else
                Department of \expandafter{\@department}
                \ifx\@empty\@school
                \else
                \\
                \fi
                \fi
                \ifx\@empty\@school
                \else
                School of \expandafter{\@school}
                \fi
        \end{center}\vskip.5in\newpage}

\def\copyrightpage{%
\ifx\degreetitle\@msc
\prefacesection{Intellectual Property Statement}
\else
\prefacesection{Copyright Statement}
\fi
\begin{list}{\labelitemi}{\leftmargin=1em}
\item[{\bf i.}] The author of this \expandafter{\@thesis} (including any
appendices and/or schedules to this \expandafter{\@thesis}) owns certain
copyright or related rights in it (the ``Copyright'') and s/he has given
The University of Manchester certain rights to use such Copyright,
including for administrative purposes.
\item[{\bf ii.}] Copies of this \expandafter{\@thesis}, either in full or in
extracts and whether in hard or electronic copy, may be made {\bf only} in
accordance with the Copyright, Designs and Patents Act 1988 (as amended) and
regulations issued under it or, where appropriate, in accordance with
licensing agreements which the University has
\ifx\degreetitle\@msc
entered into.
\else
from time to time.
\fi
This page must form part of any such copies made.
\item[{\bf iii.}] The ownership of certain Copyright, patents, designs, trade
marks and other intellectual property (the ``Intellectual Property'') and any
reproductions of copyright works in the \expandafter{\@thesis}, for example
graphs and tables  (``Reproductions''), which may be described in this
\expandafter{\@thesis}, may not be owned by the author and may be owned by
third parties. Such Intellectual Property and Reproductions cannot and must
not be made available for use without the prior written permission of the
owner(s) of the relevant Intellectual Property and/or Reproductions.
\item[{\bf iv.}] Further information on the conditions under which disclosure,
publication and commercialisation of this \expandafter{\@thesis}, the
Copyright and any Intellectual Property and/or Reproductions described in
it may take place is available in the University IP Policy (see
http://documents.manchester.ac.uk/DocuInfo.aspx?DocID=2442), in any relevant
\ifx\degreetitle\@msc
Dissertation
\else
Thesis
\fi
 restriction declarations deposited in the University Library, The University
Library's regulations (see
http://www.manchester.ac.uk/library/ab\-out/regul\-ations) and in The 
University's 
\ifx\degreetitle\@msc
Guidance on Presentation of Dissertations.
\else
Policy on Presentation of Theses.
\fi
\end{list}
\vfill\newpage}

\long\def\signature#1{%
\begin{center}
\begin{minipage}{4in}
\parindent=0pt
I certify that I have read this thesis and that in my opinion
it is fully adequate, in scope and in quality, as a dissertation for the degree
of \degreetitle.
\par
\vspace{.5in}
\hbox to 4in{\hfil\shortstack{\vrule width 3in height 0.4pt\\#1}}
\end{minipage}
\end{center}}

\def\signaturepage{%
        \signature{\@principaladviser\\(Principal \advis@r)}
        \vfill
        \signature\@firstreader
        \vfill
        \signature\@secondreader
        \vfill
%% Again, the real format will have to be added here%
        \begin{center}
        \begin{minipage}{4in}
        Approved for the University Committee on Graduate Studies:\par
        \vspace{.5in}
        \hbox to 4in{\hfil\shortstack{\vrule width 3in height 0.4pt\\
                        Dean of Graduate Studies \& Research}}
        \end{minipage}
        \end{center}}

\def\declaration{No portion of the work referred to in the
\expandafter{\@thesis} has been submitted in support of an application for
another degree or qualification of this or any other university or other
institute of learning.}
\def\declpage{%
  \prefacesection{Declaration}
        \begin{center}
        \begin{minipage}{4in}
            \parindent=0pt
            \declaration 
            \par
        \end{minipage}%
        \end{center}%
        \vfill}
\def\beforeabstract{
        \pagenumbering{arabic}
        \pagestyle{plain}
        \titlep
        \ifsigpage\signaturepage\fi
        \tableofcontents
	\vfill
	\centerline{Word count \wordcount}
        \newpage
        \iftablespage
                \addvspace{10pt}
                 \def\baselinestretch{1.0}\normalsize{\listoftables}
                \newpage
        \fi
        \iffigurespage
                \addvspace{10pt}
                 \def\baselinestretch{1.0}\normalsize{\listoffigures}
                \newpage
                \fi
                \phantomsection
        \addcontentsline{toc}{chapter}{Abstract}
        \ifx\degreetitle\@msc
             \chapter*{Abstract}
             \else
             \begin{center}\LARGE\bf The University of Manchester\end{center}
             \noindent{\bf\@author}\\
             \noindent{\bf\degreetitle}\\
             \noindent{\bf\@title}\\
             \noindent{\bf\today}\\[0.1\baselineskip]
             \def\baselinestretch{1.0}\normalsize
        \fi
        }

\def\afterabstract{
%% \newpage inserted by DPC 15/9/93
%% make the declaration come on the page after the abstract.
        \def\baselinestretch{\stretch}\normalsize
        \newpage
        \declpage
        \ifcopyright\copyrightpage\fi % moved to conform with 95 regs
        }

%% The declaration page above is the standard
%% declaration, but if you want the other sort ( where you admit
%% that parts of your thesis have been used elsewhere) then you'll
%% have to hack it yourself -- just replace the text by what you'd like
%%
\def\prefacesection#1{%
        \chapter*{#1}
        \addcontentsline{toc}{chapter}{#1}}

%% The \addvspace business below is to avoid the extra space that gets put
%% in the tables of figures and tables between chapters (it makes no sense
%% now that the numbering is continuous)
\def\afterpreface{\newpage
        \pagestyle{headings}}

\pagestyle{headings}

%% This produces the chapter title at the top of each page. It can be
%% changed in the obvious way, e.g., \pagestyle{empty} or \pagestyle{plain}
%%

%%% DPC 15/9/93 Make the bibliography generate an entry in the table
%%% of contents.

\def\thebibliography#1{\chapter*{\bibname\@mkboth
  {\uppercase{\bibname}}{\uppercase{\bibname}}}%
  \addcontentsline{toc}{chapter}{\bibname}%
  \list
  {\@biblabel{\arabic{enumiv}}}{\settowidth\labelwidth{\@biblabel{#1}}%
    \leftmargin\labelwidth
    \advance\leftmargin\labelsep
    \usecounter{enumiv}%
    \let\p@enumiv\@empty
    \def\theenumiv{\arabic{enumiv}}}%
    \def\newblock{\hskip .11em plus.33em minus.07em}%
    \sloppy\clubpenalty4000\widowpenalty4000
    \sfcode`\.=\@m}

\def\endthebibliography{%
  \def\@noitemerr{\@warning{Empty `thebibliography' environment}}%
  \endlist}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% BELOW ADDED BY TOM MCSWEENEY FOR THESIS.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Don't break enumeration (etc.) across pages in an ugly manner
\clubpenalty=10000
\widowpenalty=10000

% ---------------- Margins ---------------%
% Comment this to use recommended print margins (defined above).
\RequirePackage[a4paper, hmarginratio=1:1,
vmarginratio=1:1, scale=0.75]{geometry} % dvips 

% \RequirePackage{setspace} % Define line spacing in paragraph. Clashes with something.
\RequirePackage{calc}     % calculate vertical spacing
\RequirePackage[nottoc]{tocbibind} %add Bibliography, List of figures and tables to contents. 
\RequirePackage[title,titletoc]{appendix} % if using appendix.

\RequirePackage[labelsep=space,tableposition=top]{caption} % Caption package.
\captionsetup[figure]{labelfont={bf},name={Figure},labelsep=colon}
\captionsetup[table]{labelfont={bf},name={Table},labelsep=colon}
\RequirePackage{subcaption}
\RequirePackage{booktabs} % For professional looking tables.
\RequirePackage{multirow} % For multirow entries in tables.

% Names of ToC, LoF, LoT.
\renewcommand{\contentsname}{Table of Contents}
\renewcommand{\listfigurename}{List of Figures}
\renewcommand{\listtablename}{List of Tables}

% ---------Algorithms--------------------%
\RequirePackage[linesnumbered, ruled, algochapter]{algorithm2e}

% ---------Enumerate etc--------------------%
\RequirePackage{enumitem}
\RequirePackage{mdwlist} % For suspend. 

%---------Fonts, colors, etc.--------------------%
\RequirePackage[usenames, dvipsnames]{xcolor} 
\RequirePackage{textcomp}
% \RequirePackage{mathptmx}  % times roman, including math (where possible)
\RequirePackage{fourier} % Fourier
\RequirePackage[utf8]{inputenc}
\RequirePackage[T1]{fontenc}  
% If building with PDFLaTeX, use microtype spacing adjustments
\RequirePackage[final]{microtype}
\RequirePackage{amsfonts}
  \RequirePackage{amsmath}
  \RequirePackage{amssymb}

%------------------ Hyperref/URLs ----------------------%
\RequirePackage[unicode=true]{hyperref}
\hypersetup{
    final=true,
    plainpages=false,
    pdfstartview=FitV,
    pdftoolbar=true,
    pdfmenubar=true,
    bookmarksopen=true,
    bookmarksnumbered=true,
    breaklinks=true,
    linktocpage=true,  
    colorlinks=true,
    linkcolor=hotpink,
    urlcolor=ggplotblue,
    citecolor=hotpink, 
    anchorcolor=green
  }

  \RequirePackage{url}
% Redefining urlstyle to use smaller fontsize in References with URLs
\newcommand{\url@leostyle}{%
 \@ifundefined{selectfont}{\renewcommand{\UrlFont}{\sffamily}}
 {\renewcommand{\UrlFont}{\normalsize}}}
\urlstyle{leo}

%------------------ Headers and footers ----------------------%
\RequirePackage{fancyhdr}
\fancypagestyle{plain}{
\renewcommand{\chaptermark}[1]{\markboth{\textsc{##1}}{}}
  \renewcommand{\sectionmark}[1]{\markright{\textsc{##1}\ }} 
  \fancyhf{}
  \fancyfoot[RO]{\hspace{0.25em} 
    \hspace{0.25em} \bfseries{\thepage}}
  \fancyfoot[LE]{ {\bfseries\thepage} \hspace{0.25em}
    \hspace{0.25em} }
}
\fancypagestyle{headings}{
\renewcommand{\chaptermark}[1]{\markboth{\textcolor{ggplotgrey}{\textsc{##1}}}{}}
  \renewcommand{\sectionmark}[1]{\markright{\textcolor{ggplotgrey}{\textsc{##1}}\ }} 
  \fancyhf{}
  \fancyhead[RO]{\nouppercase \rightmark\hspace{0.25em} | 
    \hspace{0.25em} \bfseries{\thepage}}
  \fancyhead[LE]{ {\bfseries\thepage} \hspace{0.25em} | 
    \hspace{0.25em} \nouppercase \leftmark}
}
\newcommand{\setFancyHdr}{
  \pagestyle{fancy}
}
\setFancyHdr
\renewcommand{\headrulewidth}{0pt}

%------------------ Titles ----------------------%
\RequirePackage[sc]{titlesec} 
\RequirePackage[titles]{tocloft}
% \titlespacing*{\chapter}{0pt}{-50pt}{20pt} 
\titleformat{\chapter}[display]{\normalfont\scshape\huge\bfseries}{\chaptertitlename\ \thechapter}{20pt}{\Huge}
\titleformat{\section}{\normalfont\scshape\Large}{\thesection}{15pt}{\LARGE} 
\titleformat{\subsection}{\normalfont\bfseries}{\thesubsection}{12pt}{\normalsize} 
\titleformat{\paragraph}[runin]{\normalfont\bfseries}{\theparagraph}{12pt}{\normalsize} 
\renewcommand\cftchapfont{\scshape}
\renewcommand\cftsecfont{\scshape}
\renewcommand{\cftdot}{.}
\renewcommand{\cftfigfont}{\normalsize }
\renewcommand\cftfigpresnum{Figure }
\setlength{\cftfignumwidth}{6 em}
\setlength{\cftfigindent}{0 em}  % remove indentation from figures in LoF.
\renewcommand{\cfttabfont}{\normalsize }
\renewcommand\cfttabpresnum{Table }
\setlength{\cfttabnumwidth}{6 em}
\setlength{\cfttabindent}{0 em}

% Can't remember what these do.
\setlength\cftbeforefigskip{\cftbeforechapskip}
\setlength\cftbeforetabskip{\cftbeforechapskip}

% Move page numbers closer in ToC/LoF/LoT (decided not to use).
% \renewcommand{\cftchapleader}{}
% \renewcommand{\cftchapafterpnum}{\cftparfillskip}
% \renewcommand{\cftpnumalign}{r}

% \renewcommand{\cftsecleader}{}
% \renewcommand{\cftsecafterpnum}{\cftparfillskip}
% \renewcommand{\cftpnumalign}{r}

% \renewcommand{\cftsubsecleader}{}
% \renewcommand{\cftsubsecafterpnum}{\cftparfillskip}
% \renewcommand{\cftpnumalign}{r}

% \renewcommand{\cfttableader}{}
% \renewcommand{\cftfigleader}{}
% \renewcommand{\cfttabafterpnum}{\cftparfillskip}
% \renewcommand{\cftfigafterpnum}{\cftparfillskip}

%------------------ Bibliography ----------------------%

\RequirePackage[sorting=nty,style=ieee, backend=biber, doi=false, date=year, maxbibnames=6, url=false, isbn=false, eprint=false]{biblatex} 
\addbibresource{references/refs.bib} % Change location if necessary.

% \DeclareFieldFormat{labelnumberwidth}{#1\hspace{10pt}}
\DeclareNameWrapperFormat{author}{\textsc{#1}} % Author names in small caps.

%make the 'and' between the last two authors upright and not small caps
%taken from biblatex.def and modified
\DeclareDelimFormat{finalnamedelim}{
\textup{
  \ifnumgreater{\value{liststop}}{2}{\finalandcomma}{}%
  \addspace\bibstring{and}\space
  }
}
  
% Make title clickable. Use doi/url/isbn/issn (in that order).
\newbibmacro{string+doiurlisbn}[1]{%
  \iffieldundef{doi}{%
    \iffieldundef{url}{%
      \iffieldundef{isbn}{%
        \iffieldundef{issn}{%
          #1%
        }{%
          \href{http://books.google.com/books?vid=ISSN\thefield{issn}}{#1}%
        }%
      }{%
        \href{http://books.google.com/books?vid=ISBN\thefield{isbn}}{#1}%
      }%
    }{%
      \href{\thefield{url}}{#1}%
    }%
  }{%
    \href{http://dx.doi.org/\thefield{doi}}{#1}%
  }%
}
\DeclareFieldFormat{title}{\usebibmacro{string+doiurlisbn}{\mkbibemph{#1}}} 
\DeclareFieldFormat[article,inbook,incollection,inproceedings,patent,thesis,unpublished, report]{title}{\usebibmacro{string+doiurlisbn}{#1}} % took out mkbibquote{} to remove quotes.

% Ignore abstracts.
\DeclareSourcemap{
  \maps[datatype=bibtex]{
    \map{
      \step[fieldset=abstract, null]
    }
  }
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% COLORS.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\definecolor{hotpink}{rgb}{0.9,0,0.5}
\definecolor{ggplotblue}{HTML}{348ABD}
\definecolor{ggplotred}{HTML}{E24A33}
\definecolor{ggplotgold}{HTML}{FBC15E}
\definecolor{ggplotpurple}{HTML}{988ED5}
\definecolor{ggplotgrey}{HTML}{777777}
\definecolor{ggplotgreen}{HTML}{8EBA42}
\definecolor{ggplotpink}{HTML}{FFB5B8}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% MATH SYMBOLS.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\RequirePackage{mathtools} % for :=
\def\R{\mathbb{R}}
\def\C{\mathbb{C}}
\def\P{\mathbb{P}}
\def\E{\mathbb{E}}
\def\Var{\operatorname{Var}}
\def\U{\operatorname{U}}
\def\N{\operatorname{N}}
\def\norm#1{\|#1\|}    
\DeclareMathOperator*{\argmax}{arg\,max}
\DeclareMathOperator*{\argmin}{arg\,min}
\def\diff{\mathop{}\!\mathrm{d}}