%% builds on beamer class
\ProvidesClass{mybeamer}[2013/11/31 v 0.01 beamer class]
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{beamer}}% or whatever
\ProcessOptions\relax
%% load beamer and options
\LoadClass{beamer}
%
% \usetheme{boxes}
\usetheme{Luebeck}
%
\setbeamercovered{invisible}
\setbeamertemplate{items}[rectangles] %ball
\setbeamertemplate{theorems}[numbered]
\setbeamertemplate{navigation symbols}{}
\setbeamertemplate{footline}{}
\setbeamersize{text margin left=7pt,text margin right=7pt} 
\usepackage{my} % a host of packages
\graphicspath{{.}{./figures/}{/home/heays/presentations_posters/common_figures/}{/home/heays/refs/}} % default path to figures
% \usefonttheme{serif} % fonts
% \usefonttheme{default} % fonts
% \usepackage{fontspec}
% \defaultfontfeatures{Mapping=tex-text,Scale=MatchLowercase}
% \setmainfont[Extension=.otf,UprightFont=*-regular,BoldFont=*-bold,ItalicFont=*-italic,BoldItalicFont=*-bolditalic,]{xits} %fonts
% \setmathfont[Extension=.otf,BoldFont=*bold,]{xits-math} %fonts
\linespread{1}
%% colours
% \definecolor{myblue}{rgb}{0.0, 0.2, 0.4}
% \definecolor{myred}{rgb}{0.8, 0.36, 0.27}
% \definecolor{mygreen}{rgb}{0.0, 0.55, 0.55}
%% bibliography
\usepackage{csquotes}% Recommended
\usepackage[style=authoryear]{biblatex}
\addbibresource{/home/heays/refs/anhrefs.bib}
%% custom bib style
\DeclareBibliographyDriver{article}{%
  \usebibmacro{author/translator+others}%
  \newunit\newblock%
  \usebibmacro{journal}%
  \printfield{volume} \printfield{pages}
  \newunit\newblock%
  \usebibmacro{finentry}}
%% cite figures conveniently
\newrobustcmd{\myfullcite}[1]{\scriptsize\fullcite{#1}}
% \NewDocumentCommand{\myfigcite}{omo}{
%   \IfNoValueF{#1}{#1}%           
%   \\*\hfill% newline, right aligned
%   {\footnotesize\textcite{#2}}%
%   \IfNoValueF{#3}{#3}%
% }
\NewDocumentCommand{\myfigcite}{omo}{
  \IfNoValueF{#1}{#1}%           
  \hfill% newline, right aligned
  {\footnotesize\textcite{#2}}%
  \IfNoValueF{#3}{#3}%
}%
%% includegraphics with textwidth fraction and reference
\NewDocumentCommand{\myfig}{O{1}mO{}}{%
  \IfValueTF{#3}%
      {\includegraphics[width=#1\textwidth]{#2}\\\myfigcite{#3}}%
      {\includegraphics[width=#1\textwidth]{#2}\\}}%
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
%$
%%%%%%%%%%%
%% lists %%
%%%%%%%%%%%
\setlist[itemize]{% necessary to get enumitem to work with beamer
  label=\usebeamerfont*{itemize item}\usebeamercolor[fg]{itemize item}\usebeamertemplate{itemize item},
  noitemsep, topsep=0pt}
%% myitemize -- stretches bullet points vertically to fill page
\newenvironment{myitemize}{\vfill\begin{itemize}\setlength{\itemsep}{\fill}}{\end{itemize}\vfill}
%% myitemizetwocolumn -- two column items with unbroken space
\usepackage{multicol}
\newenvironment{myitemizetwocolumn}{\begin{multicols}{2}\begin{itemize}\normalsize\setlength\itemsep{0.3em}}{\end{itemize}\end{multicols}}
%% insert a page from another pdf presentation
\newrobustcmd{\myinsertpage}[2]{\centerline{\includegraphics[page=#1,width=\paperwidth,height=\paperheight,keepaspectratio]{#2}}}
%% end input
\endinput
