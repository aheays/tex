%% builds on beamer class
\ProvidesClass{mybeamer}[2013/11/31 v 0.01 beamer class]
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{beamer}}% or whatever
\ProcessOptions\relax
%% load beamer and options
\LoadClass{beamer}
\usetheme{metropolis}
\setbeamercovered{invisible}
\setbeamertemplate{items}[rectangles] %ball
\setbeamertemplate{theorems}[numbered]
\setbeamertemplate{navigation symbols}{}
\setbeamertemplate{footline}{}
\setbeamersize{text margin left=7pt,text margin right=7pt} 
%% default path to figures
\graphicspath{{.}{./figures/}{/home/heays/presentations_posters/common_figures/}{/home/heays/refs/}}
%% fonts
\usefonttheme{serif}
\usepackage{unicode-math}
\setmainfont[Extension=.otf,UprightFont=*-regular,BoldFont=*-bold,ItalicFont=*-italic,BoldItalicFont=*-bolditalic,]{xits}
\setmathfont[Extension=.otf,BoldFont=*bold,]{xits-math}
%% a host of packages
\usepackage{my}
%% colours
\definecolor{myblue}{rgb}{0.0, 0.2, 0.4}
\definecolor{myred}{rgb}{0.8, 0.36, 0.27}
\definecolor{mygreen}{rgb}{0.0, 0.55, 0.55}
%% bibliography
%%\usepackage[backend=bibtex,sorting=none,style=numeric-comp,autocite=superscript,natbib=true,firstinits,maxcitenames=1]{biblatex}
%% \let\cite\autocite              %removes the ability for a plain cite, but nevermind
\usepackage{csquotes}% Recommended
\usepackage[backend=bibtex,style=authoryear]{biblatex}
\addbibresource{/home/heays/refs/anhrefs.bib}
%% custom bib style
\DeclareBibliographyDriver{article}{%
  \usebibmacro{author/translator+others}%
  \newunit\newblock%
  \usebibmacro{journal}%
  \printfield{volume} \printfield{pages}
  \newunit\newblock%
  \usebibmacro{finentry}}
%% % %% custom bib style for article
%% % \DeclareFieldFormat{pages}{\mkfirstpage{#1}}
%% % \DeclareFieldFormat{journaltitle}{#1}     %not italic
%% % \DeclareBibliographyDriver{article}{%
%%   % \usebibmacro{author/translator+others} \printfield{year},%
%%   % \emph{\usebibmacro{title}}%
%%   % % \newunit\newblock%
%%   % \printfield{journaltitle} \printfield{volume}:\printfield{pages}%
%%   % \newunit\newblock%
%%   % \usebibmacro{finentry}}
%% % %% brand new maketitle command - less space required
%% % % \renewcommand\maketitle{%
%%     % % {\raggedright\Large\bf\@title\newline}%
%%     % % {\normalsize \@author\newline}%
%%     % % {\normalsize \@date\newline\smallskip}%
%%     % % }
%% %%
%% cite figures conveniently
\newrobustcmd{\myfullcite}[1]{\scriptsize\fullcite{#1}}
\NewDocumentCommand{\myfigcite}{omo}{
  \IfNoValueF{#1}{#1}%           
  \\*\hfill% newline, right aligned
  {\footnotesize\textcite{#2}}%
  \IfNoValueF{#3}{#3}%
}
%%
%% use text block to define a way to absolutely place things using:
%%
%% \myabsolute{width}{horizontal placement}{vertical placement}{content}.
%% Coordinates are from top left of page and in
%% units of page fraction.
\usepackage[absolute,overlay]{textpos}
\setlength{\TPHorizModule}{\paperwidth}
\setlength{\TPVertModule}{\paperheight}
\textblockorigin{0mm}{0mm}
\newrobustcmd{\myabsolute}[4]{\begin{textblock}{#1}(#2,#3){#4}\end{textblock}}
\newrobustcmd{\myabsolutegraphics}[4]{\begin{textblock}{#1}(#2,#3){\includegraphics[width=\textwidth]{#4}}\end{textblock}}
%% fullpage width centered figure
\newrobustcmd{\myfullpagewidthgraphics}[1]{\centerline{\includegraphics[width=0.96\paperwidth]{#1}}}
\newrobustcmd{\myfullpagegraphics}[1]{\centerline{\includegraphics[width=\paperwidth,height=0.88\paperheight,keepaspectratio]{#1}}}
%% myitemize -- stretches bullet points vertically to fill page
\newenvironment{myitemize}{\vfill\begin{itemize}\setlength{\itemsep}{\fill}}{\end{itemize}\vfill}
%% myitemizetwocolumn -- two column items with unbroken space
\usepackage{multicol}
\newenvironment{myitemizetwocolumn}{\begin{multicols}{2}\begin{itemize}\normalsize\setlength\itemsep{0.3em}}{\end{itemize}\end{multicols}}
%% insert a page from another pdf presentation
\newrobustcmd{\myinsertpage}[2]{\centerline{\includegraphics[page=#1,width=\paperwidth,height=\paperheight,keepaspectratio]{#2}}}
%% end input
\endinput
