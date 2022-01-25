%% builds on article class to make simple class for quick reports,
%% lists, letters etc.
\ProvidesClass{myarticle}[2013/11/31 v 0.01 article class]
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}% or whatever
\ProcessOptions\relax
\LoadClass[ta4paper,notitlepage,twocolumn]{article}
\usepackage[top=0.5in,bottom=0.5in,left=0.5in,right=0.5in]{geometry} % Reduce the size of the margin
\usepackage{my}
%% default path to figures
\graphicspath{{.}{./figures/}{/home/heays/presentations_posters/common_figures/}{/home/heays/refs/}}
%% footnotes marked with a,b,c, etc
\renewcommand{\thefootnote}{\arabic{footnote}}
%% biblatex 
\usepackage[%
% backend=bibtex,%
backend=biber,%
sorting=none,style=numeric-comp,%
autocite=superscript,natbib=true,%
giveninits,maxcitenames=1,maxbibnames=1%
]{biblatex}
\let\cite\autocite              %removes the ability for a plain cite, but nevermind
\addbibresource{/home/heays/refs/anhrefs.bib} %where I normally keep references
\addbibresource{article.bib}                  %sometimes also locally with this name
%% custom bib style for article
\DeclareFieldFormat{pages}{\mkfirstpage{#1}}
\DeclareFieldFormat{journaltitle}{#1}     %not italic
\DeclareBibliographyDriver{article}{%
  \usebibmacro{author/translator+others} \printfield{year},%
  \emph{\usebibmacro{title}}%
  \printfield{journaltitle} \printfield{doi}%
  \newunit\newblock%
  \usebibmacro{finentry}}
%% change maketitle command to use less space required
\renewcommand\maketitle{%
  \raggedright
    {\large\bf\@title\\[1ex]}%
    {\normalsize \@author \quad|\quad \@date\newline}%
    \smallskip%
  }%
\endinput
