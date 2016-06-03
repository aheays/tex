%% builds on article class to make simple class for quick reports,
%% lists, letters etc.
\ProvidesClass{myarticle}[2013/11/31 v 0.01 article class]
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}% or whatever
\ProcessOptions\relax
\LoadClass[a4paper,notitlepage,twocolumn]{article}
% \LoadClass[a4paper,notitlepage]{article}
\usepackage[T1]{fontenc}                 % good practice I believe
\usepackage[top=0.5in,bottom=0.5in,left=0.5in,right=0.5in]{geometry} % Reduce the size of the margin
\usepackage{my}
%% default path to figures
\graphicspath{{.}{./figures/}{/home/heays/src/tex/system_wide_graphics/}{/home/heays/refs/}}
%% biblatex 
\usepackage[%
backend=bibtex,sorting=none,style=numeric-comp,%
autocite=superscript,natbib=true,%
firstinits,maxcitenames=1,maxbibnames=1%
]{biblatex}
\let\cite\autocite              %removes the ability for a plain cite, but nevermind
\addbibresource{/home/heays/refs/anhrefs.bib}
%% custom bib style for article
\DeclareFieldFormat{pages}{\mkfirstpage{#1}}
\DeclareFieldFormat{journaltitle}{#1}     %not italic
\DeclareBibliographyDriver{article}{%
  \usebibmacro{author/translator+others} \printfield{year},%
  \emph{\usebibmacro{title}}%
  % \newunit\newblock%
  \printfield{journaltitle} \printfield{volume}:\printfield{pages}%
  \newunit\newblock%
  \usebibmacro{finentry}}
%% brand new maketitle command - less space required
% \renewcommand\maketitle{%
    % {\raggedright\Large\bf\@title\newline}%
    % {\normalsize \@author\newline}%
    % {\normalsize \@date\newline\smallskip}%
  % }
\endinput