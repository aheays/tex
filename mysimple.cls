%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% builds on article class to make simple class for quick reports, %%
%% lists, letters etc.                                             %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
\ProvidesClass{mysimple}[2013/11/31 v 0.01 simple class]
%% add option for spacing
\DeclareOption{doublespacing}{\AtEndOfPackage{\doublespacing}}
\DeclareOption{singlespacing}{\AtEndOfPackage{\singlespacing}}
\DeclareOption{onehalfspacing}{\AtEndOfPackage{\onehalfspacing}}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}% or whatever
\ProcessOptions\relax
%% default options in base class
\LoadClass[a4paper,12pt,notitlepage]{article}
%%
%% set margins -- must come before \usepackage{my} for some reason
\usepackage[top=0.5in,bottom=0.5in,left=0.5in,right=0.5in]{geometry}
\usepackage{my} % my macros -- must come before for some reason
\usepackage{lscape}             %permit \begin{landscape} \end{landscape}
\usepackage{setspace} % needed for doublespacing
%%
%% set font
%%
% \RequirePackage{palatino}\usepackage{palatino}\linespread{1.05} % Palatino font
% \usepackage{fontspec} \setmainfont[Mapping=tex-text]{Droid Sans Fallback}
% \usepackage{fontspec} \setmainfont[Mapping=tex-text]{Helvetica Sans}
% \usepackage{fontspec}\setmainfont[Mapping=tex-text]{Liberation Sans}
\usepackage{mathspec} %loads fontspec as well
\setmainfont{Liberation Sans}
\setmathrm{Liberation Sans}
\setmathfont(Digits,Latin){Liberation Sans}
% \usepackage{fontspec}\setmainfont[Mapping=tex-text]{Bitstream Charter}
% \usepackage{fontspec}\setmainfont[Mapping=tex-text]{Arial}
% \usepackage{helvet} % Helvetica font
% \renewcommand*\familydefault{\sfdefault} % Use the sans serif version of the font
% \usepackage[T1]{fontenc}                 % good practice I believe
%%
%% Allows in-line images
\usepackage{wrapfig}
%%
%% caption style
\usepackage[labelfont={bf,it,footnotesize},textfont={bf,footnotesize}]{caption}
%%
%% paragraph no indent, line skip instead
\parindent=0em
\parskip=\baselineskip
%% paragraph indent, no line skip instead
% \parindent=0em
% \parskip=\baselineskip
%%
\pagestyle{plain} %page numbers
%% \pagestyle{empty}               %not page numbers
%%
%% default path to figures
\graphicspath{{.}{./figures/}{/home/heays/presentations_posters/common_figures/}{/home/heays/refs/}}
%%
%% biblatex 
\usepackage[
backend=bibtex,
% sorting=none,
% style=numeric-comp,
style=authoryear,
% autocite=superscript,
natbib=true,
giveninits
]{biblatex}
\let\cite\autocite              %removes the ability for a plain cite, but nevermind
\addbibresource{/home/heays/refs/anhrefs.bib}
% %% bug fix or biblatex -- delete and test one day
% \makeatletter
% \def\blx@maxline{77}
% \makeatother
%% custom bib style for article
\DeclareFieldFormat{pages}{\mkfirstpage{#1}}
\DeclareFieldFormat{journaltitle}{#1}     %not italic
\DeclareBibliographyDriver{article}{%
  \usebibmacro{author/translator+others} \printfield{year}, %
  \emph{\usebibmacro{title}}%
  % \newunit\newblock%
  \printfield{journaltitle} \printfield{volume}:\printfield{pages}%
  \newunit\newblock%
  \usebibmacro{finentry}}
%%
%% itemize with title
\newenvironment{titleditemize}[1]{\paragraph{#1}\begin{itemize}}{\end{itemize}}
%%
%% new section formats, requires titlesec package
\usepackage[compact]{titlesec} %[compact] for generic compactification
%% next line temporary hack to be removed after titlesec upgrade
\usepackage{etoolbox} \makeatletter \patchcmd{\ttlh@hang}{\parindent\z@}{\parindent\z@\leavevmode}{}{} \patchcmd{\ttlh@hang}{\noindent}{}{}{} \makeatother
% %% \titlespacing{\section}{0pt}{0pt}{0pt}
% \titlespacing*{\section}{0pt}{1em}{0.5em}
% \titleformat{\section}
% {\normalfont}
% {\large\bfseries\thesection}
% {8pt}
% {\large\bfseries}
% \titlespacing*{\subsection}{0pt}{1em}{0.5em}
% \titleformat{\subsection}
% {\normalfont}
% {\bfseries\thesubsection}
% % {\bfseries\filright \footnotesize \enspace SECTION \thesection\enspace}
% {8pt}
% {\normalsize\bfseries}
% \titleformat{\subsubsection}{\normalfont}{\bfseries\thesubsection}{8pt}{\normalsize\it}
%%
%% make mathfonts the same style as the surrounding text environment
\DeclareMathVersion{sans}
\SetSymbolFont{operators}{sans}{OT1}{cmbr}{m}{n}
\SetSymbolFont{letters}{sans}{OML}{cmbrm}{m}{it}
\SetSymbolFont{symbols}{sans}{OMS}{cmbrs}{m}{n}
\SetMathAlphabet{\mathit}{sans}{OT1}{cmbr}{m}{sl}
\SetMathAlphabet{\mathbf}{sans}{OT1}{cmbr}{bx}{n}
\SetMathAlphabet{\mathtt}{sans}{OT1}{cmtl}{m}{n}
\SetSymbolFont{largesymbols}{sans}{OMX}{iwona}{m}{n}
\DeclareMathVersion{boldsans}
\SetSymbolFont{operators}{boldsans}{OT1}{cmbr}{b}{n}
\SetSymbolFont{letters}{boldsans}{OML}{cmbrm}{b}{it}
\SetSymbolFont{symbols}{boldsans}{OMS}{cmbrs}{b}{n}
\SetMathAlphabet{\mathit}{boldsans}{OT1}{cmbr}{b}{sl}
\SetMathAlphabet{\mathbf}{boldsans}{OT1}{cmbr}{bx}{n}
\SetMathAlphabet{\mathtt}{boldsans}{OT1}{cmtl}{b}{n}
\SetSymbolFont{largesymbols}{boldsans}{OMX}{iwona}{bx}{n}
\newif\IfInSansMode
\let\oldsf\sffamily
\renewcommand*{\sffamily}{\oldsf\mathversion{sans}\InSansModetrue}
\let\oldbf\bfseries
\renewcommand*{\bfseries}{\oldbf\IfInSansMode\mathversion{boldsans}\else\mathversion{bold}\fi\relax}
\let\oldnorm\normalfont
\renewcommand*{\normalfont}{\oldnorm\InSansModefalse\mathversion{normal}}
\let\oldrm\rmfamily
\renewcommand*{\rmfamily}{\oldrm\InSansModefalse\mathversion{normal}}
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% set code listing format %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Default fixed font does not support bold face
\DeclareFixedFont{\ttb}{T1}{txtt}{bx}{n}{12} % for bold
\DeclareFixedFont{\ttm}{T1}{txtt}{m}{n}{12}  % for normal
%% Custom colors
\usepackage{color}
\definecolor{deepblue}{rgb}{0,0,0.5}
\definecolor{deepred}{rgb}{0.6,0,0}
\definecolor{deepgreen}{rgb}{0,0.5,0}
\usepackage{listings}
%% Python style for highlighting
\newcommand\pythonstyle{\lstset{
    language=Python,
    basicstyle=\ttm,
    otherkeywords={self},             % Add keywords here
    keywordstyle=\ttb\color{deepblue},
    emph={MyClass,__init__},          % Custom highlighting
    emphstyle=\ttb\color{deepred},    % Custom highlighting style
    stringstyle=\color{deepgreen},
    frame=tb,                         % Any extra options here
    showstringspaces=false            % 
  }}
%% bash style for highlighting
\newcommand\bashstyle{\lstset{
    language=bash,
    basicstyle=\ttm,
    % otherkeywords={ls,mv,cp,zip,gedit,python},             % Add keywords here
    keywordstyle=\ttb\color{deepblue},
    % emph={MyClass,__init__},          % Custom highlighting
    emphstyle=\ttb\color{deepred},    % Custom highlighting style
    stringstyle=\color{deepgreen},
    frame=tb,                         % Any extra options here
    showstringspaces=false            % 
  }}
%% Python environment
\lstnewenvironment{python}[1][]{\pythonstyle\lstset{#1}}{}
%% Python for inline
\newcommand\pythoninline[1]{{\pythonstyle\lstinline!#1!}}
%% bash environment
\lstnewenvironment{bash}[1][]{\bashstyle\lstset{#1}}{}
%% bash inline
\newcommand\bashinline[1]{{\bashstyle\lstinline!#1!}}
%%
%%%%%%%%%%%%%%%%%%%%%%%
%% end of definition %%
%%%%%%%%%%%%%%%%%%%%%%%
\endinput

