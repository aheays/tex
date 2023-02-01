\ProvidesClass{mysimpleletter}[A class for simple letters.]
%% base on mysimple
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{mysimple}}% or whatever
\ProcessOptions\relax
\LoadClass[a4paper,12pt,notitlepage]{mysimple} % default options in base class
\ProcessOptions\relax
%% no page numbers
\pagestyle{empty}
%% page geometry
\geometry{top=1.5in,bottom=1.5in,left=1in,right=1in}
%% font
\setmainfont[Mapping=tex-text]{Liberation Serif}
%%


%% define fielss in a header and a makeheader command
\newcommand{\mysimpletlettersender}{{\tt Define sender with \textbackslash{}sender\{\\name\\address\\email\\etc\\\}}}
\newcommand{\mysimplelettersubject}{{\tt Define subject with \textbackslash{}subject\{text\}}}
\newcommand{\mysimpleletterrecipient}{{\tt Define recipient with \textbackslash{}recipient\{text\}}}
\newcommand{\sender}[1]{\renewcommand{\mysimpletlettersender}{#1}}
\newcommand{\subject}[1]{\renewcommand{\mysimplelettersubject}{#1}}
\newcommand{\recipient}[1]{\renewcommand{\mysimpleletterrecipient}{#1}}

\newcommand{\makeheader}{
\begin{minipage}[b]{0.5\textwidth} \today \end{minipage}
\hfill
\begin{minipage}[b]{0.25\textwidth} \mysimpletlettersender \end{minipage} \\[2ex]
\mysimpleletterrecipient \\
\mysimplelettersubject \\ [1ex]
}


\newcommand{\signature}{%
  \includegraphics[width=0.15\textwidth]{signature_transparent.png}\\
Alan Heays\\
}


\endinput

