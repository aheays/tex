%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% builds on article class to make simple class for quick reports, %%
%% lists, letters etc.                                             %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\ProvidesClass{mysimple}[2013/11/31 v 0.01 simple class]
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}% or whatever
\ProcessOptions\relax
\LoadClass[a4paper,11pt,notitlepage]{article} % default options in base class
% \ProcessOptions\relax
%% set margins -- must come before \usepackage{my} for some reason
\usepackage[top=0.5in,bottom=0.5in,left=0.5in,right=0.5in]{geometry}
\usepackage{my} % my macros -- must come before for some reason
%% permit \begin{landscape} \end{landscape}
\usepackage{lscape}
%% needed for doublespacing
\usepackage{setspace}
%% for sideways tables/figures
\usepackage{rotating}
%%better lists
\usepackage{enumitem}           
%% do not remember
\usepackage{verbatim}
%% multipage tables, might need to adjust caption width
\usepackage{longtable}\setlength{\LTcapwidth}{0.9\textwidth} 
%%\url{...} formatting
\usepackage{xurl}                
%% like \multicolumn in tables
\usepackage{multirow} 
%% better tables
\usepackage{booktabs} 
%%svgnames load additional default colours, alternatives: dvipsnames, x11names
\usepackage{xcolor}   
%% use siunitx
\usepackage[
separate-uncertainty,
list-units=single,
range-units=single,
]{siunitx}%
% \sisetup{list-units=single,range-units=single,}%
%% mhchem
\usepackage[version=3]{mhchem}  % \ce{...} for chem equations
%% set font
\usepackage{fontspec}
\setmainfont[Mapping=tex-text]{Liberation Sans}
%% date-time
\usepackage[useregional=numeric]{datetime2} 
\usepackage[british]{babel} 
%% paragraph no indent, line skip instead
\parindent=0em
\parskip=\baselineskip
%% page number
\pagestyle{plain} % yes
% \pagestyle{empty}   % no
%% allow images
\usepackage{graphicx}
%% default path to figures
\graphicspath{{.}{./figures/}{/home/heays/presentations_posters/common_figures/}{/home/heays/refs/}}
%% allows in-line images
\usepackage{wrapfig}
%% caption style
\usepackage[labelfont={bf,it,footnotesize},textfont={bf,footnotesize}]{caption}
%% biblatex 
\usepackage[
% backend=bibtex,
backend=biber,
% sorting=none,
% style=numeric-comp,
% style=authoryear,
style=iso-authoryear,
% autocite=superscript,
natbib=true,
giveninits=true,
% maxnames=99,
% maxbibnames=99,
% maxcitenames=99,
]{biblatex}
\let\cite\autocite              %removes the ability for a plain cite, but nevermind
\addbibresource{/home/heays/refs/anhrefs.bib}
% %% custom bib style for article
% \DeclareFieldFormat{pages}{\mkfirstpage{#1}}
% \DeclareFieldFormat{journaltitle}{#1}     %not italic
% \DeclareBibliographyDriver{article}{%
  % \usebibmacro{author/translator+others}% \printfield{year}, %
  % \emph{\usebibmacro{title}}%
  % % \newunit\newblock%
  % \printfield{journaltitle} (\printfield{volume}:\printfield{pages}),%
  % {\it\ \printfield{doi}}%
  % \newunit\newblock%
  % \usebibmacro{finentry}}
%% itemize with title
\newenvironment{titleditemize}[1]{\paragraph{#1}\begin{itemize}}{\end{itemize}}
%% new section formats, requires titlesec package
\usepackage[compact]{titlesec} %[compact] for generic compactification
% %% next line temporary hack to be removed after titlesec upgrade
% \usepackage{etoolbox} \makeatletter \patchcmd{\ttlh@hang}{\parindent\z@}{\parindent\z@\leavevmode}{}{} \patchcmd{\ttlh@hang}{\noindent}{}{}{} \makeatother
%% math fonts and macros, and unicode symbols
\usepackage{amsmath}
\usepackage{amssymb}
\usepackage{unicode-math}
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

