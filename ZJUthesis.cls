%%
%% This is file `ZJUthesis.cls',
%%


\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesClass{ZJUthesis}[2006/04/15 v0.1c ZJUthesis document class]
\newif\ifZJU@typeinfo \ZJU@typeinfotrue
\DeclareOption{notypeinfo}{\ZJU@typeinfofalse}
\newif\ifZJU@dvips \ZJU@dvipstrue
\DeclareOption{dvips}{\ZJU@dvipstrue}
\DeclareOption{dvipdfm}{\ZJU@dvipsfalse}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{ctexbook}}

\ProcessOptions
\LoadClass[cs4size,a4paper,fancyhdr]{ctexbook}[2004/08/14]

%% math packages
\RequirePackage{amsmath,amsthm,amsfonts,amssymb,bm}
%% graphics packages
\RequirePackage{graphicx,psfrag}
%% hyperref package
\ifx\pdfoutput\undefined % We're not running pdftex
  \ifZJU@dvips
    \RequirePackage[xetex]{hyperref}
  \else
    \RequirePackage[xetex]{hyperref}
  \fi
  \AtBeginDvi{\special{pdf:tounicode GBK-EUC-UCS2}} % GBK -> Unicode
\else
  \RequirePackage[xetex]{hyperref}
\fi
\hypersetup{CJKbookmarks,%
       bookmarksnumbered,%
              colorlinks,%
               linkcolor=blue,%
              plainpages=false,%
            pdfstartview=FitH}
\AtBeginDocument{\makeatletter\input{ZJUthesis.cfg}\makeatother}

\def\cleardoublepage{\clearpage\if@twoside \ifodd\c@page\else
  \thispagestyle{empty}%
  \hbox{}\if@twocolumn\hbox{}\fi\fi\fi}
\renewcommand{\floatpagefraction}{0.80}
\bibliographystyle{unsrt}
\newcommand\ZJUspace{\protect\CTEX@spaceChar\protect\CTEX@spaceChar}
\def\reserved@a#1 #2 #3\@nil{%
  \def\ZJUfiledate{#1}%
  \def\ZJUfileversion{#2}%
  \def\ZJUfileinfo{#3}}%
\edef\reserved@b{\csname ver@ZJUthesis.cls\endcsname}
\expandafter\reserved@a\reserved@b\@nil\relax
\def\ZJU@underline[#1]#2{%
  \underline{\hbox to #1{\hfill#2\hfill}}}
\def\ZJUunderline{\@ifnextchar[\ZJU@underline\underline}


% 封面
\newcommand\degree[1]{\def\ZJU@value@degree{#1}}
\renewcommand\title[2][\ZJU@value@title]{%
  \def\ZJU@value@title{#2}
  \def\ZJU@value@titlemark{\MakeUppercase{#1}}}
\renewcommand\author[1]{\def\ZJU@value@author{#1}}
\newcommand\supervisor[1]{\def\ZJU@value@supervisor{#1}}
\newcommand\major[1]{\def\ZJU@value@major{#1}}
\newcommand\institute[1]{\def\ZJU@value@institute{#1}}
\renewcommand\maketitle{%
  \cleardoublepage
  \thispagestyle{empty}
  \begin{center}
   \includegraphics[width=80mm]{ZJDX.EPS} \\
     \vspace{8mm}
      %% \ZJU@value@school \\  \zihao{-1}
     \centerline{\bf\fangsong \Huge{\ZJU@value@degree\ZJU@label@thesis} }
     \vspace{5mm}
    \includegraphics[width=45mm]{STANDXB.EPS}    \\
    \vspace{10mm}

\begin{tabular}{ll}
 \bf\fangsong\zihao{3} \ZJU@label@title & \fangsong\zihao{4} \ZJUunderline[300pt]{\ZJU@value@title}
\end{tabular}

 \vspace{30mm}  % skip for 3cm
    \fangsong\zihao{4}
    \begin{tabular}{llcrl}
     \bf \ZJU@label@author &
      \multicolumn{4}{l}{\ZJUunderline[250pt]{\ZJU@value@author}}

      \\[3mm]
     \bf \ZJU@label@supervisor &
      \multicolumn{4}{l}{\ZJUunderline[250pt]{\ZJU@value@supervisor}}

    \\[3mm]

   \bf \ZJU@label@major &
      \multicolumn{4}{l}{\ZJUunderline[250pt]{\ZJU@value@major}}

    \\[3mm]
    \bf \ZJU@label@institute &
      \multicolumn{4}{l}{\ZJUunderline[250pt]{\ZJU@value@institute}}
    \end{tabular}
\end{center}
}


% 封面第二页
\newcommand\englishtitle[1]{\def\ZJU@value@englishtitle{#1}}
\newcommand\classes[1]{\def\ZJU@value@classes{#1}}
\newcommand\studentid[1]{\def\ZJU@value@studentid{#1}}
\newcommand\signiture[1]{\def\ZJU@value@signiture{#1}}
\newcommand\signitureyear[1]{\def\ZJU@value@signitureyear{#1}}
\newcommand\signituremonth[1]{\def\ZJU@value@signituremonth{#1}}
\newcommand\signitureday[1]{\def\ZJU@value@signitureday{#1}}

\newcommand\makeenglishtitle
{
  \clearpage
  \thispagestyle{empty}
  \begin{center}
  \vspace{20ex}
  \bf \heiti\zihao{-3}{\ZJU@label@englishtitle}\\
  \end{center}

\zihao{4} \ZJU@label@content
\vspace{20ex}

\begin{flushright}
\begin{tabular}{llc}
     \ZJU@label@classes \ZJUunderline[150pt]{\ZJU@value@classes}&
     \ZJU@label@studentid \ZJUunderline[100pt]{\ZJU@value@studentid}

    \\[3mm]
      \ZJU@label@signiture &
      \multicolumn{2}{l}{\ZJUunderline[130pt]{\ZJU@value@signiture}}

    \\[3mm]
    \multicolumn{3}{l}{
      \ZJUunderline[50pt]{\ZJU@value@signitureyear} \ZJU@label@signitureyear
      \ZJUunderline[50pt]{\ZJU@value@signituremonth} \ZJU@label@signituremonth
      \ZJUunderline[50pt]{\ZJU@value@signitureday} \ZJU@label@signitureday
      }
    \end{tabular}
\end{flushright}


  \if@twoside
    \thispagestyle{empty}
    \cleardoublepage
  \fi
}

\fancypagestyle{plain}{%
  \fancyhf{}%
  \renewcommand{\headrulewidth}{0pt}%
  \renewcommand{\footrulewidth}{0pt}%
}
\pagestyle{fancy}
  \fancyhf{}
  \fancyhead[RE]{\small \ZJU@value@titlemark}
  \fancyhead[LO]{\small \leftmark}
  \fancyhead[LE,RO]{\small ~\thepage~}


% 摘要和关键词

\newenvironment{abstract}
  {\Nchapter{\ZJU@label@abstract}}
  {}
\newcommand\keywords[1]{%
  \vspace{2ex}\noindent{\heiti \ZJU@label@keywords} #1}

\newenvironment{englishabstract}
  {\Nchapter{\ZJU@label@englishabstract}}
  {}
\newcommand\englishkeywords[1]{%
  \vspace{2ex}\noindent{\bf \ZJU@label@englishkeywords} #1}


\renewcommand\tableofcontents{%
    \if@twocolumn
      \@restonecoltrue\onecolumn
    \else
      \@restonecolfalse
    \fi
    \Nchapter{\contentsname}%
    \@mkboth{\MakeUppercase\contentsname~}{\MakeUppercase\contentsname~}%
    \@starttoc{toc}%
    \if@restonecol\twocolumn\fi
    }
\addtocontents{toc}{\let\string\CTEX@spaceChar\relax}


\newcommand\Nchapter[1]{%
  \if@mainmatter%
    \@mainmatterfalse%
    \chapter{#1}%
    \@mainmattertrue%
  \else
    \chapter{#1}%
  \fi}


\renewenvironment{thebibliography}[1]
     {\Nchapter{\bibname}%
      \@mkboth{\MakeUppercase\bibname}{\MakeUppercase\bibname}%
      \list{\@biblabel{\@arabic\c@enumiv}}%
           {\settowidth\labelwidth{\@biblabel{#1}}%
            \leftmargin\labelwidth
            \advance\leftmargin\labelsep
            \@openbib@code
            \usecounter{enumiv}%
            \let\p@enumiv\@empty
            \renewcommand\theenumiv{\@arabic\c@enumiv}}%
      \sloppy
      \clubpenalty4000
      \@clubpenalty \clubpenalty
      \widowpenalty4000%
      \sfcode`\.\@m}
     {\def\@noitemerr
       {\@latex@warning{Empty `thebibliography' environment}}%
      \endlist}


\renewenvironment{thanks}
  {\Nchapter{\ZJU@label@thanks}}
  {}
\setcounter{secnumdepth}{4}
\newtheoremstyle{break}% name
  {}%      Space above, empty = `usual value'
  {}%      Space below
  {\itshape}% Body font
  {}%         Indent amount (empty = no indent, \parindent = para indent)
  {\bfseries}% Thm head font
  {.}%        Punctuation after thm head
  {\newline}% Space after thm head: \newline = linebreak
  {}%         Thm head spec
\endinput
%%
%% End of file `ZJUthesis.cls'.
