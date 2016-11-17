%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% builds on beamer class %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\ProvidesClass{mybeamer}[2013/11/31 v 0.01 beamer class]
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{beamer}}% or whatever
\ProcessOptions\relax
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% load beamer and options %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\LoadClass{beamer}
% \usetheme{default}
% \usetheme{Copenhagen}
% \usetheme{Darmstadt}
% \usetheme{Frankfurt}
% \usetheme{Luebeck
\usetheme{metropolis}
\setbeamercovered{invisible}
\setbeamertemplate{items}[rectangles] %ball
\setbeamertemplate{theorems}[numbered]
\setbeamertemplate{navigation symbols}{}
\setbeamertemplate{footline}{}
\setbeamersize{text margin left=7pt,text margin right=7pt} 
%%%%%%%%%%%%%%%%%%%%%%%%%
%% load other packages %%
%%%%%%%%%%%%%%%%%%%%%%%%%
%% default path to figures
\graphicspath{{.}{./figures/}{/home/heays/src/tex/system_wide_graphics/}{/home/heays/refs/}}
%%%%%%%%%%%
%% fonts %%
%%%%%%%%%%%
% \usepackage{fontspec} \setmainfont[Mapping=tex-text]{Droid Sans Fallback}
% \usepackage{fontspec} \setmainfont[Mapping=tex-text]{Helvetica Sans}
% \usepackage{fontspec}\setmainfont[Mapping=tex-text]{Liberation Sans}
\usepackage{fontspec}\setmainfont[Mapping=tex-text]{Bitstream Charter}
% \usepackage{fontspec}\setmainfont[Mapping=tex-text]{Arial}
% \usepackage[T1]{fontenc}                 % good practice I believe
% % \usepackage[top=0.5in,bottom=0.5in,left=0.5in,right=0.5in]{geometry} % Reduce the size of the margin
\usepackage{my}
% \usepackage{helvet}
%%%%%%%%%%%%%%%
%% biblatex  %%
%%%%%%%%%%%%%%%
% \usepackage[backend=bibtex,sorting=none,style=numeric-comp,autocite=superscript,natbib=true,firstinits,maxcitenames=1]{biblatex}
% \let\cite\autocite              %removes the ability for a plain cite, but nevermind
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
% %% custom bib style for article
% \DeclareFieldFormat{pages}{\mkfirstpage{#1}}
% \DeclareFieldFormat{journaltitle}{#1}     %not italic
% \DeclareBibliographyDriver{article}{%
  % \usebibmacro{author/translator+others} \printfield{year},%
  % \emph{\usebibmacro{title}}%
  % % \newunit\newblock%
  % \printfield{journaltitle} \printfield{volume}:\printfield{pages}%
  % \newunit\newblock%
  % \usebibmacro{finentry}}
% %% brand new maketitle command - less space required
% % \renewcommand\maketitle{%
    % % {\raggedright\Large\bf\@title\newline}%
    % % {\normalsize \@author\newline}%
    % % {\normalsize \@date\newline\smallskip}%
  % % }
%%%%%%%%%%%%%%%%%%%%%
%% custom commands %%
%%%%%%%%%%%%%%%%%%%%%
\newrobustcmd{\myfullcite}[1]{\scriptsize\fullcite{#1}}
\newrobustcmd{\myfigcite}[1]{\\\hfill{\footnotesize\textcite{#1}}\\}
%% use text block to define a way to absolutely place things using:
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
%%%%%%%%%%%%%%%
%% myitemize %%
%%%%%%%%%%%%%%%
%% stretches bullet points to fill page
\newenvironment{myitemize}{\vfill\begin{itemize}\setlength{\itemsep}{\fill}}{\end{itemize}\vfill}
%%%%%%%%%%%%%%%%%%%%%%%%
%% myitemizetwocolumn %%
%%%%%%%%%%%%%%%%%%%%%%%%
%% two column items with unbroken space
\usepackage{multicol}
\newenvironment{myitemizetwocolumn}{\begin{multicols}{2}\begin{itemize}\normalsize\setlength\itemsep{0.3em}}{\end{itemize}\end{multicols}}
%%%%%%%%%%%%%%% 
%% end input %%
%%%%%%%%%%%%%%%
\endinput
