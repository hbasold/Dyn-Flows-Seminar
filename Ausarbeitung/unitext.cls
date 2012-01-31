\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{unitext}[2009/06/03 v1.7 unitext, Werner Struckmann]

\newcommand{\@subjekt}{}
\newcommand{\@institut}{}
\newcommand{\@bib}{plain}
\newcommand{\@din}{din}
\newcommand{\@bibstyle}{}
\newcommand{\@sprache}{}
%\newcommand{\@logo}{\includegraphics[scale=0.11]{tu-logo}}
\newcommand{\@logo}{\includegraphics{tu-logo-4c}}

\AtBeginDocument{%
\addto\captionsngerman{%
    % Typen von Arbeiten
    \def\bachelorsThesis{Bachelorarbeit}%
    \def\suggestedSolution{L\"osungsvorschlag}%
    \def\projectReport{Projektarbeit}%
    %
    % Verwendete Bezeichnungen
    \def\prefaceName{Vorwort}%
    \def\bibname{Literatur}%
    \def\abstractname{Zusammenfassung}%
    \def\keywordsname{Stichw\"orter}%
    \def\titlePageName{Titel}%
    \def\betreutDurch{betreut durch:}%
}%
%
\addto\captionsenglish{%
    % document types
    \def\bachelorsThesis{Bachelor's Thesis}%
    \def\suggestedSolution{Suggested Solution}%
    \def\projectReport{Project Report}%
    %
    % used namings
    \def\prefaceName{Preface}%
    \def\bibname{Bibliography}%
    \def\abstractname{Abstract}%
    \def\keywordsname{Keywords}%
    \def\titlePageName{Title}%
    \def\betreutDurch{supervised by:}%
}%
}
\newcommand{\setSubject}[1]{\AtBeginDocument{\renewcommand{\@subjekt}{#1}}}

\DeclareOption{seminar}{\setSubject{Ausarbeitung eines Seminarvortrags}}
\DeclareOption{praktikum}{\setSubject{Praktikumsbericht}}
\DeclareOption{teamprojekt}{\setSubject{Teamprojekt}}
\DeclareOption{bachelorarbeit}{\setSubject{\bachelorsThesis}}
\DeclareOption{projektarbeit}{\setSubject{\projectReport}}
\DeclareOption{masterarbeit}{\setSubject{Masterarbeit}}
\DeclareOption{studienarbeit}{\setSubject{Studienarbeit}}
\DeclareOption{diplomarbeit}{\setSubject{Diplomarbeit}}
\DeclareOption{bericht}{\setSubject{Informatik-Bericht}}
\DeclareOption{script}{\setSubject{Vorlesungsskript}}
\DeclareOption{uebungsScript}{\setSubject{\"Ubungsskript}}
\DeclareOption{loesungsVorschlag}{\setSubject{\suggestedSolution}}
\DeclareOption{dissertation}{%
  \setSubject{Dissertation}%
  \AtBeginDocument{%
    \renewcommand{\maketitle}{\input{titelseite}}
  }
}
\DeclareOption{titelseite}{\AtBeginDocument{\renewcommand{\maketitle}{\input{titelseite}}}}

\DeclareOption{ipslogo}{\renewcommand{\@logo}%
  {~\hfill\@logo\hfill\includegraphics[scale=0.20]{ipslogo}\hfill~}}
\DeclareOption{idalogo}{
    \let\currentLogo\@logo
    \renewcommand{\@logo}{
        \currentLogo
        \vskip08mm
        \includegraphics[scale=0.8]{ida-logo}
    }
}

\DeclareOption{inf}{\renewcommand{\@institut}{Institute f\"ur Informatik}}
\DeclareOption{ips}{\renewcommand{\@institut}{Institut f\"ur Programmierung und Reaktive Systeme}}
\DeclareOption{idb}{\renewcommand{\@institut}{Institut f\"ur Informationssysteme}}
\DeclareOption{ida}{\renewcommand{\@institut}{Institut f\"ur Datentechnik und Kommunikationsnetze}}
\DeclareOption{iti}{\renewcommand{\@institut}{Institut f\"ur Theoretische Informatik}}
\DeclareOption{eis}{\renewcommand{\@institut}{Institut f\"ur Theoretische Informatik\\%
  Abteilung Entwurf Integrierter Schaltungen}}
\DeclareOption{sse}{\renewcommand{\@institut}{Institut f\"ur Software Systems Engineering}}
\DeclareOption{alg}{\renewcommand{\@institut}{Institut f\"ur Betriebssysteme und Rechnerverbund\\%
  Abteilung Algorithmik}}

\newcommand{\betreutDurch}{betreut durch:}

\DeclareOption{abbrv}{\renewcommand{\@bib}{abbrv}}
\DeclareOption{alpha}{\renewcommand{\@bib}{alpha}}
\DeclareOption{plain}{\renewcommand{\@bib}{plain}}
\DeclareOption{unsrt}{\renewcommand{\@bib}{unsrt}}

\DeclareOption{english}{%
  \AtEndOfClass{%
    \RequirePackage[left]{eurosym}
    \AtBeginDocument{%
        \InputIfFileExists{unitext-english.cfg}{}{}
        \renewcommand{\keywordsname}{Keywords}
        \renewcommand{\glossaryname}{Glossary}
        \renewcommand{\symbolname}{Symbols}
        \renewcommand{\abkuerzungname}{List of Abbreviations}
        \renewcommand{\zahlname}{Numbers}
        \renewcommand{\@bibstyle}{\@bib}
        \bibliographystyle{\@bibstyle}
        \selectlanguage{USenglish}
      }
  }
}

\DeclareOption{ngerman}{%
  \AtEndOfClass{%
    \RequirePackage[right]{eurosym}
    \AtBeginDocument{%
        \InputIfFileExists{unitext-ngerman.cfg}{}{}
        \renewcommand{\@bibstyle}{\@bib\@din}
        \bibliographystyle{\@bibstyle}
        \selectlanguage{ngerman}
      }
  }
}

\DeclareOption{pdf}{%
  \AtEndOfClass{%
   \pdfoptionpdfminorversion=5
   \RequirePackage[pdftex]{color}
   \RequirePackage[pdftex]{graphicx}
   \RequirePackage[pdftex,pagebackref,plainpages=false,pdfpagelabels,bookmarksnumbered,
     colorlinks,urlcolor=black,linkcolor=black,citecolor=black]{hyperref}
   \RequirePackage{thumbpdf}
   \pdfstringdefDisableCommands{\let\and~}
  }
}

\DeclareOption{ps}{%
  \AtEndOfClass{%
   \RequirePackage[dvips]{color}
   \RequirePackage[dvips]{graphicx}
   \RequirePackage[hypertex,pagebackref,plainpages=false,pdfpagelabels,bookmarksnumbered,
     colorlinks,urlcolor=black,linkcolor=black,citecolor=black]{hyperref}
  }
}

\DeclareOption{dvi}{%
  \AtEndOfClass{%
   \RequirePackage[xdvi]{color}
   \RequirePackage[xdvi]{graphicx}
   \RequirePackage[hypertex,pagebackref,plainpages=false,pdfpagelabels,bookmarksnumbered,
     colorlinks,urlcolor=black,linkcolor=black,citecolor=black]{hyperref}
  }
}

\ExecuteOptions{inf,plain}
\ProcessOptions\relax

\newcommand*{\LoadRequiredPackages}{}
\DeclareOption{article}{%
\g@addto@macro\LoadRequiredPackages{\LoadClass[a4paper,12pt,twoside,DIV12,BCOR08mm]{scrartcl}}%
\g@addto@macro\LoadRequiredPackages{\KOMAoptions{abstract=on,cleardoublepage=empty,numbers=noenddot,headings=normal,listof=totoc,index=totoc,bibliography=totoc}}%
}
\DeclareOption{report}{%
\g@addto@macro\LoadRequiredPackages{\LoadClass[a4paper,12pt,twoside,DIV12,BCOR08mm]{scrreprt}}%
\g@addto@macro\LoadRequiredPackages{\KOMAoptions{abstract=on,cleardoublepage=empty,numbers=noenddot,headings=normal,listof=totoc,index=totoc,bibliography=totoc}}%
\g@addto@macro\LoadRequiredPackages{\renewcommand*{\partpagestyle}{empty}}%
\g@addto@macro\LoadRequiredPackages{\renewcommand*{\chapterformat}{\chapappifchapterprefix{\ }\thechapter\enskip}}%
}
% ...
\ExecuteOptions{% was auch immer
}
\ProcessOptions\relax
\LoadRequiredPackages

\RequirePackage[english,ngerman]{babel}

\RequirePackage[T1]{fontenc}
\RequirePackage{textcomp}
\RequirePackage{lmodern}
\RequirePackage{cmmib57}
% \RequirePackage[psamsfonts]{amssymb}
\RequirePackage{amssymb}
\RequirePackage{amsmath}

\RequirePackage{makeidx}
\RequirePackage{multicol}
\RequirePackage{ifthen}
\RequirePackage{xspace}
\RequirePackage[thinspace,thinqspace,squaren,textstyle]{SIunits}
%\RequirePackage[dvips]{thumbpdf} % pdflatex wird automatisch erkannt
%\RequirePackage[pagebackref,plainpages=false,pdfpagelabels,bookmarksnumbered,
%  colorlinks,urlcolor=black,linkcolor=black,citecolor=black]{hyperref}
\RequirePackage{nomencl}

%\renewcommand*{\partpagestyle}{empty}
%\renewcommand*{\chapterformat}{\chapappifchapterprefix{\ }\thechapter\enskip}

\newcommand{\@uni}{{\sffamily\bfseries%
\makebox[\textwidth]{TECHNISCHE UNIVERSIT\"AT CAROLO-WILHELMINA ZU BRAUNSCHWEIG}}}

\titlehead{%
  \hfill\@uni\hfill
  \pdfbookmark[0]{\titlePageName}{titelblatt}
}

\newcommand{\@nummer}{}
\newcommand{\nummer}[1]{\renewcommand{\@nummer}{~#1}}

\renewcommand*{\subject@font}{\normalfont\normalcolor\mdseries\Large}
\subject{{\sffamily\@subjekt\@nummer}}

\newcommand\titelblatt{{\sffamily\maketitle}}

\newcommand{\@dozent}{}
\newcommand{\dozent}[1]{\renewcommand{\@dozent}{#1}}

\newcommand{\@betreuer}{}
\newcommand{\betreuer}[2][\betreutDurch]{%
  \renewcommand{\@betreuer}{#1\par#2}
}

\newcommand{\@keywords}{}
\newcommand{\keywords}[1]{\renewcommand{\@keywords}{#1}}

\publishers{%
  \enlargethispage{10mm}
  \vskip08mm\@logo\par
  {\sffamily\normalsize\vskip15mm\@institut\par\@dozent\par\vskip08mm\@betreuer}
}

\newcommand{\erklaerungname}{Eidesstattliche Erkl\"arung}
\newcommand{\erklaerung}{%
  \cleardoublepage
  \pdfbookmark[0]{\erklaerungname}{erklaerungname}
  \thispagestyle{empty}
  \hskip 0mm
  \vfill
  \begin{center}\sffamily\bfseries\large
    \erklaerungname
  \end{center}
  \bigskip\noindent Hiermit erkl\"are ich an Eides statt, dass
  ich die vorliegende Arbeit selbstst\"andig verfasst und keine
  anderen als die angegebenen Hilfsmittel verwendet habe.\par
  \bigskip\noindent Braunschweig,~\datum\par
  \vskip 10mm
  \hfill\hrulefill
}

\newcommand{\vorwort}{%
  \cleardoublepage
  \chapter*{\prefacename}
  \pdfbookmark[0]{\prefacename}{prefacename}
  \markboth{\prefacename}{\prefacename}
  \InputIfFileExists{preface}{}{}
}

\newcommand{\purposename}{Aufgabenstellung}
\newcommand{\purpose}{%
  \cleardoublepage
  \chapter*{\purposename}
  \pdfbookmark[0]{\purposename}{purposename}
  \markboth{\purposename}{\purposename}
  \InputIfFileExists{purpose}{}{}
}

\newcommand{\zusammenfassung}
  {\begin{abstract}
     \markboth{\abstractname}{\abstractname}
     \pdfbookmark[0]{\abstractname}{abstractname}
     \noindent
     \InputIfFileExists{abstract}{}{}\par\bigskip\noindent
     \ifthenelse{\equal{\@keywords}{}}{}
      {{\small{\sffamily\bfseries\keywordsname}\quad\@keywords}}
   \end{abstract}
  }

\renewcommand{\contentsname}{Inhaltsverzeichnis}
\let\orig@toc\tableofcontents
\newcommand{\my@toc}{%
  \cleardoublepage
  \pdfbookmark[0]{\contentsname}{contentsname}
  \orig@toc
}
\let\tableofcontents\my@toc

\renewcommand{\listfigurename}{Verzeichnis der Abbildungen}

\renewcommand{\listtablename}{Verzeichnis der Tabellen}

\newcommand{\abkuerzungname}{Verzeichnis der Abk\"urzungen}

\newcommand{\abkuerzung}{%
  %\newpage
  \renewcommand{\nomname}{\abkuerzungname}
  \makenomenclature
  %\chapter*{\abkuerzungname}
  %\markboth{\abkuerzungname}{\abkuerzungname}
  %\addcontentsline{toc}{chapter}{\abkuerzungname}
  \InputIfFileExists{abbreviation}{}{}
  \printnomenclature 
}

\newcommand{\starttext}{%
  \cleardoublepage
  \pagenumbering{arabic}
}

\renewcommand{\appendixname}{Anhang}
\newcommand{\anhang}{%
  \begin{appendix}
    \InputIfFileExists{appendix}{}{}
  \end{appendix}
}

\newcommand{\glossaryname}{Glossar}
\newenvironment{theglossary}
  {\chapter*{\glossaryname}
   \markboth{\glossaryname}{\glossaryname}
   \addcontentsline{toc}{chapter}{\glossaryname}
   \setlength{\parindent}{0pt}
   \setlength{\parskip}{0pt plus 0.4pt}
   \begin{description}}
  {\end{description}}
\newcommand{\glossar}[2]{\glossary{[#1]\quad#2|hyperpage}}
\newcommand{\printglossary}{\@input@{\jobname.gls}}

\newcommand{\symbolname}{Symbole}
\newcommand{\zahlname}{Zahlen}
\renewcommand{\indexname}{Sachwortregister}
\renewenvironment{theindex}
  {\section*{\indexname}
   \markboth{\indexname}{\indexname}
   \addcontentsline{toc}{section}{\indexname}
   \vspace*{-10pt}
   \setlength{\parindent}{0pt}
   \setlength{\parskip}{0pt plus 0.4pt}
   \setlength{\columnsep}{35pt}
   \setlength{\columnseprule}{0.0pt}
   \renewcommand{\item}{\@idxitem}
   \begin{multicols}{2}}
  {\end{multicols}}

\renewcommand{\theenumi}{\arabic{enumi}}
\renewcommand{\theenumii}{\alph{enumii}}
\renewcommand{\labelenumi}{\theenumi.}
\renewcommand{\labelenumii}{\theenumii)}
\renewcommand{\labelitemi}{\textbullet}
\renewcommand{\labelitemii}{\textopenbullet}

\DeclareRobustCommand{\xdot}{\@ifnextchar.{}{.\xspace}}

\pagestyle{headings}
\pagenumbering{roman}

\InputIfFileExists{unitext.cfg}{}{}
\InputIfFileExists{glossar.tex}{}{}

\setlength{\overfullrule}{4pt}

\raggedbottom

\AtBeginDocument{%
  \let\datum\@date
  \hypersetup{%
    pdftitle={\@title},
    pdfauthor={\@author},
    pdfsubject={\@subject},
    pdfkeywords={\@keywords},
    pdfcreator={\LaTeX{} with local class \dq{}unitext\dq{}
      (based on \dq{}scrreprt\dq) and package \dq{}hyperref\dq},
  }
}

\endinput
