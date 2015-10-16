%% builds on article class to make simple class for quick reports,
%% lists, letters etc.
\ProvidesClass{mysimple}[2013/11/31 v 0.01 simple class]
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}% or whatever
\ProcessOptions\relax
\LoadClass[a4paper,12pt,notitlepage]{article}
% \RequirePackage{palatino}\usepackage{palatino}\linespread{1.05} % Palatino font
% \usepackage{fontspec} \setmainfont[Mapping=tex-text]{Droid Sans Fallback}
\usepackage{fontspec}\setmainfont[Mapping=tex-text]{Liberation Sans}
% \usepackage{helvet} % Helvetica font
% \renewcommand*\familydefault{\sfdefault} % Use the sans serif version of the font
% \usepackage[T1]{fontenc}                 % good practice I believe
\usepackage{wrapfig} % Allows in-line images
\usepackage[labelfont=bf]{caption} % Make figure numbering in captions bold
\usepackage[top=0.5in,bottom=0.5in,left=0.5in,right=0.5in]{geometry} % Reduce the size of the margin
% %% paragraph no indent, line skip instead
% \parindent=0em
% \parskip=\baselineskip
%% paragraph indent, no line skip instead
% \parindent=0em
% \parskip=\baselineskip
\pagestyle{empty} % Remove page numbers - DOESN'T WORK!
\usepackage{my}
\usepackage{titlesec}           %[compact] for generic compactification
\graphicspath{{.}{./figures/}{/home/heays/src/tex/system_wide_graphics/}}
%% biblatex 
\usepackage[backend=bibtex,sorting=none,style=numeric-comp,autocite=superscript,natbib=true,firstinits]{biblatex}
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
\renewcommand\maketitle{%
    {\raggedright\Large\bf\@title\newline}%
    {\normalsize \@author\newline}%
    {\normalsize \@date\newline\smallskip}%
  }
%% itemize spacing
\usepackage{enumitem}
\setlist[itemize]{topsep=5pt,itemsep=-1ex,partopsep=1ex,parsep=1ex}
\setlist[enumerate]{topsep=5pt,itemsep=-1ex,partopsep=1ex,parsep=1ex}
\setlist[description]{topsep=5pt,itemsep=-1ex,partopsep=1ex,parsep=1ex}
%% itemize with title
\newenvironment{titled_itemize}[1]{\paragraph{#1}\begin{itemize}}{\end{itemize}}
%% new section formats, requires titlesec package
% \titlespacing{\section}{0pt}{0pt}{0pt}
\titlespacing*{\section}{0pt}{1em}{0.5em}
\titleformat{\section}
{\normalfont}
{\large\bfseries\thesection}
{8pt}
{\large\bfseries}
\titlespacing*{\subsection}{0pt}{1em}{0.5em}
\titleformat{\subsection}
{\normalfont}
{\bfseries\thesubsection}
% {\bfseries\filright \footnotesize \enspace SECTION \thesection\enspace}
{8pt}
{\normalsize\bfseries}
\titleformat{\subsubsection}{\normalfont}{\bfseries\thesubsection}{8pt}{\normalsize\it}
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
% %% make itemize lists a bit tighter
% \setlist{nolistsep}
% \setlist{noitemsep}
% % \let\olditemize\itemize
% % \renewcommand\itemize{\olditemize\setlength{\itemsep}{-2pt}\addtolength{\itemskip}{-2pt}}
%% end of definition
\endinput
