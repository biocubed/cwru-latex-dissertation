%
% Class for typesetting CWRU Dissertations
% Copyright 2013, Gary Doran (gary.doran@case.edu)
% Distributed under the terms of the GNU Lesser General Public License
% Uses guidelines from http://gradstudies.case.edu/current/etd/guidelines.html
%
% Modified by Russell Jackson 2014 to improve flexibility and overall flow.

\NeedsTeXFormat{LaTeX2e}

\ProvidesClass{cwru}[2013/08/01 v1.0 CWRU Dissertation Format]

\newif\if@notsinglespaced
\newif\if@proposal
\@proposalfalse
\@notsinglespacedtrue
\DeclareOption{singlespaced}{\@notsinglespacedfalse}
\DeclareOption{proposal}{\@proposaltrue}
\ProcessOptions

\LoadClass[12pt,letter,oneside]{book}
\RequirePackage[top=1in,bottom=1in,left=1.5in,right=1in]{geometry}
\RequirePackage{setspace}
\RequirePackage{array}
\RequirePackage{fancyhdr}
\RequirePackage{notoccite}
\RequirePackage[linktocpage]{hyperref}
\hypersetup{pdfborder=0 0 0} %,pdfview=FitH}

\pagestyle{fancy}
\if@notsinglespaced
  \doublespacing
\fi

\def\degree#1{\gdef\@degree{#1}}
\def\@degree{\@latex@warning@no@line{No \noexpand\degree given}}

\def\doctype#1{\gdef\@doctype{#1}}
\def\@doctype{\@latex@warning@no@line{No \noexpand\doctype given}}
%\def\advisor#1{\gdef\@advisor{#1}}
%\def\@advisor{\@latex@warning@no@line{No \noexpand\advisor given}}
\def\department#1{\gdef\@department{#1}}
\def\@department{\@latex@warning@no@line{No \noexpand\department given}}

\def\defensedate#1{\gdef\@defensedate{#1}}
\def\@defensedate{\@latex@warning@no@line{No \noexpand\defensedate given}}
%\def\committeechair#1{\gdef\@committeechair{#1}}
%\def\@committeechair{\@advisor}

%\newcounter{committeecounter}
%\setcounter{committeecounter}{1}
%\newcommand{\committee}[1]{
%\expandafter\gdef\csname @committeemember\thecommitteecounter\endcsname{#1}
%\stepcounter{committeecounter}}

\renewcommand\maketitle{\begin{titlepage}%
\begin{spacing}{2.0}
  %\newgeometry{left=1in,top=1in,bottom=1in,right=1in}
  \let\footnotesize\small
  \let\footnoterule\relax
  \let \footnote \thanks
  \null\vfil
  \vskip 60\p@
  \begin{center}%
    {\Large{\MakeUppercase{\@title}} \par}%  {\Large\bfseries \textsf{\MakeUppercase{\@title}} \par}%
    \vskip 3em%
    {\large
     \lineskip 3em%
      {{by}} \\  %{\bfseries\textsf{by}} 
      \begin{tabular}[t]{c}%
        {\bfseries{\MakeUppercase{\@author}}}   %\bfseries \textsf
      \end{tabular}\par%
      \vskip 2em%
      {Submitted in partial fulfillment of the requirements} \\ %\textsf
\if@proposal
  {for the dissertation proposal} \\ %\textsf
  \else
  {for the degree of \@degree} \\ %\textsf
\fi
      \vskip 2em%
      %Dissertation Advisor: \@advisor \\
      %\vskip 2em%
      {Department of \@department} \\ %\textsf
      {CASE WESTERN RESERVE UNIVERSITY} \\ %\textsf
      \vskip 2em%
      {\@date} \par} %\textsf
  \end{center}\par
  \@thanks
  \vfil\null
  \end{spacing}
  \end{titlepage}%
  \setcounter{footnote}{0}%
  \global\let\thanks\relax
  \global\let\maketitle\relax
  \global\let\@thanks\@empty
  %\global\let\@author\@empty
  \global\let\@date\@empty
  %\global\let\@title\@empty
  %\global\let\title\relax
  %\global\let\author\relax
  %\global\let\degree\relax
  %\global\let\advisor\relax
  \global\let\department\relax
  \global\let\date\relax
  \global\let\and\relax
  %\restoregeometry
}


%This command allows for differing lengths of the list of commitee members.
%Alsways define the advisor first
\newbox\@committeeMembers \newbox\@committeeMembers

\def\advisor#1{\setbox\@committeeMembers\vbox
  {\unvbox\@committeeMembers \vskip 10pt% plus 1fil minus 1fil
  \centering \def\baselinestretch{1}
  {\centering{{Committee Chair}} \par \centering{\bfseries{{#1}}}}}  %{\centering{\textsf{Committee Chair}} \par \centering{\textsf{\textbf{#1}}}}}
  \setbox\@committeeMembers\vbox{\unvbox\@committeeMembers
  \vskip\baselineskip \def\baselinestretch{1}\@normalsize }}

\def\committee#1{\setbox\@committeeMembers\vbox
  {\unvbox\@committeeMembers \vskip 10pt% plus 1fil minus 1fil
  \centering \def\baselinestretch{1}
  {\centering{{Committee Member}} \par \centering{\bfseries{{#1}}}}} %{\centering{\textsf{Committee Member}} \par \centering{\textsf{\textbf{#1}}}}}
  \setbox\@committeeMembers\vbox{\unvbox\@committeeMembers
  \vskip\baselineskip \def\baselinestretch{1}\@normalsize }}

\newcommand\makecopyrightpage{
\newpage
\thispagestyle{empty}
\begin{center}
\vspace*{20.0\baselineskip}
Copyright \copyright \the\year{} \@author \\
All rights reserved.
\end{center}
}





\newcommand\makeapprovalsheet{\newpage
\thispagestyle{empty}
\begin{spacing}{2.0}
\begin{center}
{\large\bfseries{CASE WESTERN RESERVE UNIVERSITY \\ %\textsf
SCHOOL OF GRADUATE STUDIES}
}
\par
\vspace{1em}
{{ %\textsf
\if@proposal
  We hereby approve the proposal of \\
  \else
  We hereby approve the \@doctype{} of \\
\fi
}
\par
{\Large \@author}} %\textsf
\par
{candidate for the degree of \textbf{\@degree{}}*.}  %\textsf
\vspace{2em}

\unvcopy\@committeeMembers

\vfill
%\vskip 2em%
%\noindent
{\centering{{Date of Defense}} \par \centering{{\textbf{\@defensedate}}}} %{\centering{\textsf{Date of Defense}} \par \centering{\textsf{\textbf{\@defensedate}}}}
\vfill
\noindent \small{*We also certify that written approval has been obtained \\
for any proprietary material contained therein.}
\end{center}
\end{spacing}
\newpage
}

\newenvironment{acknowledgments}%
{\chapter*{Acknowledgments}\addcontentsline{toc}{chapter}{Acknowledgments}\markboth{ACKNOWLEDGMENTS}{}}%
{\null}


\newenvironment{abstract}%
{\newpage\cleardoublepage\phantomsection
\if@proposal
  \addcontentsline{toc}{chapter}{Summary}
  \else
  \addcontentsline{toc}{chapter}{Abstract} 
\fi
\thispagestyle{plain}\begin{center}
\if@proposal
  \markboth{Summary}{}
  \else
  \markboth{Abstract}{}
\fi
\begin{spacing}{1.5}
    {\large \@title \par}%
    \vspace{-1.5em}
    \vskip 2em%
     \lineskip 2em%
\if@proposal
  Proposal Summary \\
  \else
  Abstract \\ 
\fi
	by \\    {%\large
     \lineskip 2em%
      \begin{tabular}[t]{c}%
        \MakeUppercase{\@author}
      \end{tabular}\par}%
\end{spacing}
\end{center}\vspace{-1.5em}}
{\vfill\@gobble\null}


\newenvironment{dedication}
{\newpage\thispagestyle{empty}
 \begin{center}
  \vspace*{20.0\baselineskip}}
{ \end{center}}



\endinput
