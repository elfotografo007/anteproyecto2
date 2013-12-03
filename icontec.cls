%%
%% Este es el archivo 'icontec.cls', basado en el archivo 'book.cls'.
%% Autor: Juan Pablo García Hernández.
%% Basado en las normas técnicas colombianas para la presentación
%%  de trabajos de grado.
%% Se autoriza su uso, distribución y modificación.
%% El autor no se hace responsable por los daños o perjuicios
%%  resultantes del uso de este archivo.
%%

\ProvidesClass{icontec}
              [2011/02/16 v0.2
 Standard LaTeX document class]
\newcommand\@ptsize{}
\newif\if@restonecol
\newif\if@titlepage
\@titlepagetrue
\newif\if@openright
\newif\if@mainmatter \@mainmattertrue
\if@compatibility\else
\DeclareOption{a4paper}
   {\setlength\paperheight {297mm}%
    \setlength\paperwidth  {210mm}}
\DeclareOption{a5paper}
   {\setlength\paperheight {210mm}%
    \setlength\paperwidth  {148mm}}
\DeclareOption{b5paper}
   {\setlength\paperheight {250mm}%
    \setlength\paperwidth  {176mm}}
\DeclareOption{letterpaper}
   {\setlength\paperheight {11in}%
    \setlength\paperwidth  {8.5in}}
\DeclareOption{legalpaper}
   {\setlength\paperheight {14in}%
    \setlength\paperwidth  {8.5in}}
\DeclareOption{executivepaper}
   {\setlength\paperheight {10.5in}%
    \setlength\paperwidth  {7.25in}}
\DeclareOption{landscape}
   {\setlength\@tempdima   {\paperheight}%
    \setlength\paperheight {\paperwidth}%
    \setlength\paperwidth  {\@tempdima}}
\fi
\if@compatibility
  \renewcommand\@ptsize{0}
\else
\DeclareOption{10pt}{\renewcommand\@ptsize{0}}
\fi
\DeclareOption{11pt}{\renewcommand\@ptsize{1}}
\DeclareOption{12pt}{\renewcommand\@ptsize{2}}
\if@compatibility\else
\DeclareOption{oneside}{\@twosidefalse \@mparswitchfalse}
\fi
\DeclareOption{twoside}{\@twosidetrue  \@mparswitchtrue}
\DeclareOption{draft}{\setlength\overfullrule{5pt}}
\if@compatibility\else
\DeclareOption{final}{\setlength\overfullrule{0pt}}
\fi
\DeclareOption{titlepage}{\@titlepagetrue}
\if@compatibility\else
\DeclareOption{notitlepage}{\@titlepagefalse}
\fi
\if@compatibility
\@openrighttrue
\else
\DeclareOption{openright}{\@openrighttrue}
\DeclareOption{openany}{\@openrightfalse}
\fi
\if@compatibility\else
\DeclareOption{onecolumn}{\@twocolumnfalse}
\fi
\DeclareOption{twocolumn}{\@twocolumntrue}
\DeclareOption{leqno}{\input{leqno.clo}}
\DeclareOption{fleqn}{\input{fleqn.clo}}
\DeclareOption{openbib}{%
  \AtEndOfPackage{%
   \renewcommand\@openbib@code{%
      \advance\leftmargin\bibindent
      \itemindent -\bibindent
      \listparindent \itemindent
      \parsep \z@
      }%
   \renewcommand\newblock{\par}}%
}
%
% Modificado
%
\ExecuteOptions{letterpaper,10pt,oneside,onecolumn,final,openright}
\ProcessOptions
\input{bk1\@ptsize.clo}
\setlength\lineskip{1\p@}
\setlength\normallineskip{1\p@}
\renewcommand\baselinestretch{}
\setlength\parskip{0\p@ \@plus \p@}
\@lowpenalty   51
\@medpenalty  151
\@highpenalty 301
\setcounter{topnumber}{2}
\renewcommand\topfraction{.7}
\setcounter{bottomnumber}{1}
\renewcommand\bottomfraction{.3}
\setcounter{totalnumber}{3}
\renewcommand\textfraction{.2}
\renewcommand\floatpagefraction{.5}
\setcounter{dbltopnumber}{2}
\renewcommand\dbltopfraction{.7}
\renewcommand\dblfloatpagefraction{.5}
%
% Nuevo
%
\newcommand\@institution\@empty
\newcommand\@faculty\@empty
\newcommand\@city\@empty
\newcommand\@legend\@empty
\newcommand\@directortitle\@empty
\newcommand\@director\@empty
\newcommand\@approbationcity\@empty
\newcommand\@approbationdate\@empty
\def\institution#1{\gdef\@institution{#1}}
\def\faculty#1{\gdef\@faculty{#1}}
\def\city#1{\gdef\@city{#1}}
\def\legend#1{\gdef\@legend{#1}}
\def\directortitle#1{\gdef\@directortitle{#1}}
\def\director#1{\gdef\@director{#1}}
\def\approbationcity#1{\gdef\@approbationcity{#1}}
\def\approbationdate#1{\gdef\@approbationdate{#1}}
%
% Nuevo
% Configura las márgenes de la página para impresión por
% una cara o por las dos caras.
% (NTC 1486:2008 5.1.2)
% Se usó cálculo visual y pruebas de generación del documento.
%
\setlength{\topmargin}{-0.65cm}
\if@twoside
  \setlength{\oddsidemargin}{0.5cm}
  \setlength{\evensidemargin}{0.5cm}
\else
  \setlength{\oddsidemargin}{1.5cm}
  \setlength{\evensidemargin}{1.5cm}
\fi
\setlength{\textwidth}{15.59cm}
\setlength{\textheight}{21.94cm}
\setlength{\footskip}{1cm}
%
% Modificado
%
\if@twoside
  \def\ps@headings{%
      \let\@oddhead\@empty\let\@evenhead\@empty
      \def\@evenfoot{\hfil\thepage\hfil}%
      \def\@oddfoot{\hfil\thepage\hfil}%
      \let\@mkboth\markboth
    \def\chaptermark##1{%
      \markboth {\MakeUppercase{%
        \ifnum \c@secnumdepth >\m@ne
          \if@mainmatter
            \@chapapp\ \thechapter. \ %
          \fi
        \fi
        ##1}}{}}%
    \def\sectionmark##1{%
      \markright {\MakeUppercase{%
        \ifnum \c@secnumdepth >\z@
          \thesection. \ %
        \fi
        ##1}}}}
%
% Modificado
%
\else
  \def\ps@headings{%
    \def\@oddfoot{\hfil\thepage\hfil}%
    \let\@oddhead\@empty
    \let\@mkboth\markboth
    \def\chaptermark##1{%
      \markright {\MakeUppercase{%
        \ifnum \c@secnumdepth >\m@ne
          \if@mainmatter
            \@chapapp\ \thechapter. \ %
          \fi
        \fi
        ##1}}}}
\fi
%
% Modificado
%
\def\ps@myheadings{%
    \let\@oddhead\@empty\let\@evenhead\@empty
    \def\@evenfoot{\hfil\thepage\hfil}%
    \def\@oddfoot{\hfil\thepage\hfil}%
    \let\@mkboth\@gobbletwo
    \let\chaptermark\@gobble
    \let\sectionmark\@gobble
    }
%
% Modificado
% Página título: Cubierta del documento.
% Llena la página en bloques simétricos. (NTC 1486:2008 5.2.1.3)
%
\if@titlepage
  \newcommand\maketitle{
  \begin{titlepage}%
  \begin{center}%
    {\large \bf \@title }
    \vfill
    {\large \bf \@author }%
    \vfill
	{\large \bf \@institution \\}
	{\large \bf \@faculty \\}
	{\large \bf \@city \\}
    {\large \bf \@date}
  \end{center}
  \end{titlepage}%
  % Página título: Portada del documento.
  % Incluye un espacio más amplio del título del documento hacia las líneas de autores,
  % los otros apartes van en bloques simétricos. (NTC 1486:2008 5.2.1.4)
  \begin{titlepage}
	\begin{center}
		{\large \bf \@title }
		\vfill
		{\large \bf \@author }
		\vfill
		{\large \bf \@legend }
		\vfill
		{\large \bf \@directortitle \@director \par}
		\vfill
		{\large \bf \@institution \\}
		{\large \bf \@faculty \\}
		{\large \bf \@city \\}
		{\large \bf \@date}
	\end{center}
  \end{titlepage}
  \setcounter{footnote}{0}%
  \global\let\thanks\relax
  \global\let\maketitle\relax
  \global\let\@thanks\@empty
  \global\let\@author\@empty
  \global\let\@date\@empty
  \global\let\@title\@empty
  \global\let\@institution\@empty
  \global\let\@faculty\@empty
  \global\let\@city\@empty
  \global\let\@legend\@empty
  \global\let\@directortitle\@empty
  \global\let\@director\@empty
  \global\let\director\relax
  \global\let\directortitle\relax
  \global\let\legend\relax
  \global\let\city\relax\
  \global\let\faculty\relax
  \global\let\institution\relax
  \global\let\title\relax
  \global\let\author\relax
  \global\let\date\relax
  \global\let\and\relax
}
\else
% Si se ha definido notitlepage, imprimir nada.
\newcommand\maketitle{}
\fi
\newcommand\qsep{
	\hspace{0.1cm}
}
%
% Nuevo
% Definición de página de aceptación del documento.
% (NTC 1486:2008 5.2.1.5.)
%
\newcommand\makeapprobation{
  \begin{titlepage}
  % Restar espacio para contraarrestar el espacio creado por tabular.
  \vspace{-0.5cm}
  \begin{tabular}{p{6.8cm} p{7.7cm}}
    & Nota de aceptación: \\ 
    &  \\ 
  \cline{2-2}  &  \\ [1ex]
  \cline{2-2}  &  \\ [1ex]
  \cline{2-2}  &  \\ [1ex]
  \cline{2-2}  &  \\ [1ex]
  \cline{2-2}  &  \\ [1ex]
  \cline{2-2}  &  \\ [1ex]
  \cline{2-2}  &  \\ [6cm]
  \cline{2-2}  & \hfil Director de Trabajo de Grado \hfil \\
    &  \\ [1.5cm]
  \cline{2-2}  & \hfil Jurado \hfil \\
    &  \\ [1.5cm]
  \cline{2-2}  & \hfil Jurado \hfil \\
  \end{tabular}
  \vfill
  \@approbationcity, \@approbationdate
  \newpage
  \setcounter{footnote}{0}%
  \global\let\@approbationcity\@empty
  \global\let\@approbationdate\@empty
  \global\let\approbationcity\relax
  \global\let\approbationdate\relax
  \end{titlepage}
}
%
\newcommand*\chaptermark[1]{}
\setcounter{secnumdepth}{2}
\newcounter {part}
\newcounter {chapter}
\newcounter {section}[chapter]
\newcounter {subsection}[section]
\newcounter {subsubsection}[subsection]
\newcounter {paragraph}[subsubsection]
\newcounter {subparagraph}[paragraph]
\renewcommand \thepart {\@Roman\c@part}
\renewcommand \thechapter {\@arabic\c@chapter}
\renewcommand \thesection {\thechapter.\@arabic\c@section}
\renewcommand\thesubsection   {\thesection.\@arabic\c@subsection}
\renewcommand\thesubsubsection{\thesubsection.\@arabic\c@subsubsection}
\renewcommand\theparagraph    {\thesubsubsection.\@arabic\c@paragraph}
\renewcommand\thesubparagraph {\theparagraph.\@arabic\c@subparagraph}
\newcommand\@chapapp{\chaptername}
\newcommand\frontmatter{%
    \cleardoublepage
  \@mainmatterfalse
  \pagenumbering{roman}}
\newcommand\mainmatter{%
    \cleardoublepage
  \@mainmattertrue
  \pagenumbering{arabic}}
\newcommand\backmatter{%
  \if@openright
    \cleardoublepage
  \else
    \clearpage
  \fi
  \@mainmatterfalse}
\newcommand\part{%
  \if@openright
    \cleardoublepage
  \else
    \clearpage
  \fi
  \thispagestyle{plain}%
  \if@twocolumn
    \onecolumn
    \@tempswatrue
  \else
    \@tempswafalse
  \fi
  \null\vfil
  \secdef\@part\@spart}

\def\@part[#1]#2{%
    \ifnum \c@secnumdepth >-2\relax
      \refstepcounter{part}%
      \addcontentsline{toc}{part}{\thepart\hspace{1em}#1}%
    \else
      \addcontentsline{toc}{part}{#1}%
    \fi
    \markboth{}{}%
    {\centering
     \interlinepenalty \@M
     \normalfont
     \ifnum \c@secnumdepth >-2\relax
       \huge\bfseries \partname\nobreakspace\thepart
       \par
       \vskip 20\p@
     \fi
	 \Huge \bfseries #2\par}%
    \@endpart}
\def\@spart#1{%
    {\centering
     \interlinepenalty \@M
     \normalfont
     \Huge \bfseries #1\par}%
    \@endpart}
\def\@endpart{\vfil\newpage
              \if@twoside
               \if@openright
                \null
                \thispagestyle{empty}%
                \newpage
               \fi
              \fi
              \if@tempswa
                \twocolumn
              \fi}
%
% Modificado
%
\newcommand\chapter{
                    \thispagestyle{plain}%
                    \global\@topnum\z@
                    \@afterindentfalse
                    \secdef\@chapter\@schapter}
%
% Modificado
%
\def\@chapter[#1]#2{\ifnum \c@secnumdepth >\m@ne
                       \if@mainmatter
                         \refstepcounter{chapter}%
                         %\typeout{\@chapapp\space\thechapter.}%
                         \addcontentsline{toc}{chapter}%
                                   {\protect\numberline{\thechapter}#1}%
                       \else
                         \addcontentsline{toc}{chapter}{#1}%
                       \fi
                    \else
                      \addcontentsline{toc}{chapter}{#1}%
                    \fi
                    \addtocontents{lof}{\protect\addvspace{10\p@}}%
                    \addtocontents{lot}{\protect\addvspace{10\p@}}%
                    \if@twocolumn
                      \@topnewpage[\@makechapterhead{#2}]%
                    \else
                      \@makechapterhead{#2}%
                      \@afterheading
                    \fi}
%
% Modificado
%
\def\@makechapterhead#1{%
  {\parindent \z@ \begin{center} \normalfont
    \ifnum \c@secnumdepth >\m@ne
      \if@mainmatter
		\Large \bfseries \thechapter . \quad
      \fi
    \fi
	\Large \bfseries #1\par\nobreak
    \end{center}
  }}
%
% Modificado
%
\def\@schapter#1{
                 %\addcontentsline{toc}{chapter}{#1}%
                 \if@twocolumn
                   \@topnewpage[\@makeschapterhead{#1}]%
                 \else
                   \@makeschapterhead{#1}%
                   \@afterheading
                 \fi
                 }
%
% Modificado
%
\def\@makeschapterhead#1{%
  {
%  \addcontentsline{toc}{chapter}{#1}%
  \parindent \z@ \begin{center}
    \normalfont
    \Large \bfseries  #1\par\nobreak
	\end{center}
  }}
  
\newcommand\section{\@startsection {section}{1}{\z@}%
                                   {-3.5ex \@plus -1ex \@minus -.2ex}%
                                   {2.3ex \@plus.2ex}%
                                   {\normalfont\large\bfseries}}
\newcommand\subsection{\@startsection{subsection}{2}{\z@}%
                                     {-3.25ex\@plus -1ex \@minus -.2ex}%
                                     {1.5ex \@plus .2ex}%
                                     {\normalfont\normalsize\bfseries}}
\newcommand\subsubsection{\@startsection{subsubsection}{3}{\z@}%
                                     {-3.25ex\@plus -1ex \@minus -.2ex}%
                                     {1.5ex \@plus .2ex}%
                                     {\normalfont\normalsize\bfseries}}
\newcommand\paragraph{\@startsection{paragraph}{4}{\z@}%
                                    {3.25ex \@plus1ex \@minus.2ex}%
                                    {-1em}%
                                    {\normalfont\normalsize\bfseries}}
\newcommand\subparagraph{\@startsection{subparagraph}{5}{\parindent}%
                                       {3.25ex \@plus1ex \@minus .2ex}%
                                       {-1em}%
                                      {\normalfont\normalsize\bfseries}}
\if@twocolumn
  \setlength\leftmargini  {2em}
\else
  \setlength\leftmargini  {2.5em}
\fi
\leftmargin  \leftmargini
\setlength\leftmarginii  {2.2em}
\setlength\leftmarginiii {1.87em}
\setlength\leftmarginiv  {1.7em}
\if@twocolumn
  \setlength\leftmarginv  {.5em}
  \setlength\leftmarginvi {.5em}
\else
  \setlength\leftmarginv  {1em}
  \setlength\leftmarginvi {1em}
\fi
\setlength  \labelsep  {.5em}
\setlength  \labelwidth{\leftmargini}
\addtolength\labelwidth{-\labelsep}
\@beginparpenalty -\@lowpenalty
\@endparpenalty   -\@lowpenalty
\@itempenalty     -\@lowpenalty
\renewcommand\theenumi{\@arabic\c@enumi}
\renewcommand\theenumii{\@alph\c@enumii}
\renewcommand\theenumiii{\@roman\c@enumiii}
\renewcommand\theenumiv{\@Alph\c@enumiv}
\newcommand\labelenumi{\theenumi.}
\newcommand\labelenumii{(\theenumii)}
\newcommand\labelenumiii{\theenumiii.}
\newcommand\labelenumiv{\theenumiv.}
\renewcommand\p@enumii{\theenumi}
\renewcommand\p@enumiii{\theenumi(\theenumii)}
\renewcommand\p@enumiv{\p@enumiii\theenumiii}
\newcommand\labelitemi{\textbullet}
\newcommand\labelitemii{\normalfont\bfseries \textendash}
\newcommand\labelitemiii{\textasteriskcentered}
\newcommand\labelitemiv{\textperiodcentered}
\newenvironment{description}
               {\list{}{\labelwidth\z@ \itemindent-\leftmargin
                        \let\makelabel\descriptionlabel}}
               {\endlist}
\newcommand*\descriptionlabel[1]{\hspace\labelsep
                                \normalfont\bfseries #1}
\newenvironment{verse}
               {\let\\\@centercr
                \list{}{\itemsep      \z@
                        \itemindent   -1.5em%
                        \listparindent\itemindent
                        \rightmargin  \leftmargin
                        \advance\leftmargin 1.5em}%
                \item\relax}
               {\endlist}
\newenvironment{quotation}
               {\list{}{\listparindent 1.5em%
                        \itemindent    \listparindent
                        \rightmargin   \leftmargin
                        \parsep        \z@ \@plus\p@}%
                \item\relax}
               {\endlist}
\newenvironment{quote}
               {\list{}{\rightmargin\leftmargin}%
                \item\relax}
               {\endlist}
			   
%
% Modificado para dar cumplimiento a la NTC1486:2008 5.1.3.1.
%
\if@compatibility
\newenvironment{titlepage}
    {%
      %\cleardoublepage
      \thispagestyle{empty}%
    }%
    {
		\if@twoside
			\newpage
			\mbox{}
			\thispagestyle{empty}
			\addtocounter{page}{-1}
			\newpage
		\else
			\newpage
		\fi
    }
\else
\newenvironment{titlepage}
    {%
      %\cleardoublepage
      \thispagestyle{empty}%
    }%
    {
		\if@twoside
			\newpage
			\mbox{}
			\thispagestyle{empty}
			\addtocounter{page}{-1}
			\newpage
		\else
			\newpage
		\fi
    }
\fi

\newcommand\appendix{\par
  \setcounter{chapter}{0}%
  \setcounter{section}{0}%
  \gdef\@chapapp{\appendixname}%
  \gdef\thechapter{\@Alph\c@chapter}}
\setlength\arraycolsep{5\p@}
\setlength\tabcolsep{6\p@}
\setlength\arrayrulewidth{.4\p@}
\setlength\doublerulesep{2\p@}
\setlength\tabbingsep{\labelsep}
\skip\@mpfootins = \skip\footins
\setlength\fboxsep{3\p@}
\setlength\fboxrule{.4\p@}
\@addtoreset {equation}{chapter}
\renewcommand\theequation
  {\ifnum \c@chapter>\z@ \thechapter.\fi \@arabic\c@equation}
%
% Modificado. El contador de figuras debe ser continuo.
%
\newcounter{figure}
\renewcommand{\thefigure}{\@arabic\c@figure}
\def\fps@figure{tbp}
\def\ftype@figure{1}
\def\ext@figure{lof}
\def\fnum@figure{\figurename\nobreakspace\thefigure}
\newenvironment{figure}
               {\@float{figure}}
               {\end@float}
\newenvironment{figure*}
               {\@dblfloat{figure}}
               {\end@dblfloat}
%
% Modificado. El contador de tablas debe ser continuo.
%
\newcounter{table}
\renewcommand{\thetable}{\@arabic\c@table}
\def\fps@table{tbp}
\def\ftype@table{2}
\def\ext@table{lot}
\def\fnum@table{\tablename\nobreakspace\thetable}
\newenvironment{table}
               {\@float{table}}
               {\end@float}
\newenvironment{table*}
               {\@dblfloat{table}}
               {\end@dblfloat}

\newlength\abovecaptionskip
\newlength\belowcaptionskip
\setlength\abovecaptionskip{10\p@}
\setlength\belowcaptionskip{0\p@}
%
% Modificado: Agrega negrilla a los títulos de las descripciones,
% además de permitir que la descricpión aparezca al margen de la figura.
% (NTC 1486:2008 5.2.2.4)
%
\long\def\@makecaption#1#2#3{%
  \vskip\abovecaptionskip
    \hfil\parbox{#3\textwidth}{\textbf{#1.} #2\par}\hfil
  \vskip\belowcaptionskip}
  
\DeclareOldFontCommand{\rm}{\normalfont\rmfamily}{\mathrm}
\DeclareOldFontCommand{\sf}{\normalfont\sffamily}{\mathsf}
\DeclareOldFontCommand{\tt}{\normalfont\ttfamily}{\mathtt}
\DeclareOldFontCommand{\bf}{\normalfont\bfseries}{\mathbf}
\DeclareOldFontCommand{\it}{\normalfont\itshape}{\mathit}
\DeclareOldFontCommand{\sl}{\normalfont\slshape}{\@nomath\sl}
\DeclareOldFontCommand{\sc}{\normalfont\scshape}{\@nomath\sc}
\DeclareRobustCommand*\cal{\@fontswitch\relax\mathcal}
\DeclareRobustCommand*\mit{\@fontswitch\relax\mathnormal}
\newcommand\@pnumwidth{1.55em}
\newcommand\@tocrmarg{2.55em}
\newcommand\@dotsep{9999}

%
% Modificado
% Configura la tabla de contenidos para que muestre hasta el
% cuarto nivel. (NTC 1486:2008 5.2.1.8)
% Además configura la numeración hasta el nivel de subsubsecciones.
\setcounter{tocdepth}{3}
\setcounter{secnumdepth}{3}

%
% Modificado
%
\newcommand\tableofcontents{%
    \if@twocolumn
      \@restonecoltrue\onecolumn
    \else
      \@restonecolfalse
    \fi
	% Cambia el nombre de la tabla de contenidos (NTC 1486:2008 5.2.1.8)
	\renewcommand\contentsname{CONTENIDO}
    \chapter*{\contentsname
        \@mkboth{%
           \MakeUppercase\contentsname}{\MakeUppercase\contentsname}}%
	% Añade partícula pág. requerida en el lado derecho de la página a dos interlíneas
	% de distancia del titulo y de la primera entrada de la TdC (NTC 1486:2008 5.2.1.8.1)
	\addtocontents{toc}{\bfseries \hfill p\IeC {\'a}g.\par \normalfont}
    \@starttoc{toc}%
    \if@restonecol\twocolumn\fi
    }
\newcommand*\l@part[2]{%
  \ifnum \c@tocdepth >-2\relax
    \addpenalty{-\@highpenalty}%
    \addvspace{2.25em \@plus\p@}%
    \setlength\@tempdima{3em}%
    \begingroup
      \parindent \z@ \rightskip \@pnumwidth
      \parfillskip -\@pnumwidth
      {\leavevmode
       \large \bfseries #1\hfil \hb@xt@\@pnumwidth{\hss #2}}\par
       \nobreak
         \global\@nobreaktrue
         \everypar{\global\@nobreakfalse\everypar{}}%
    \endgroup
  \fi}
\newcommand*\l@chapter[2]{%
  \ifnum \c@tocdepth >\m@ne
    \addpenalty{-\@highpenalty}%
    %\vskip 1.0em \@plus\p@
	\vskip \baselineskip
    \setlength\@tempdima{1.5em}%
    \begingroup
      \parindent \z@ \rightskip \@pnumwidth
      \parfillskip -\@pnumwidth
      \leavevmode \bfseries
      \advance\leftskip\@tempdima
      \hskip -\leftskip
      #1\nobreak\hfil \nobreak\hb@xt@\@pnumwidth{\hss #2}\par
      \penalty\@highpenalty
    \endgroup
  \fi}
\newcommand*\l@section{\normalfont \@dottedtocline{1}{0em}{2.3em}}
\newcommand*\l@subsection{\normalfont \@dottedtocline{2}{0em}{3.2em}}
\newcommand*\l@subsubsection{\normalfont\@dottedtocline{3}{0em}{4.1em}}
\newcommand*\l@paragraph{\normalfont\@dottedtocline{4}{0em}{5em}}
\newcommand*\l@subparagraph{\normalfont\@dottedtocline{5}{0em}{6em}}

\newcommand\listoffigures{%
    \if@twocolumn
      \@restonecoltrue\onecolumn
    \else
      \@restonecolfalse
    \fi
    \renewcommand\listfigurename{LISTA DE FIGURAS}
    \chapter*{\listfigurename}%
      \@mkboth{\MakeUppercase\listfigurename}%
              {\MakeUppercase\listfigurename}%
	% Añade partícula pág. requerida en el lado derecho de la página a dos interlíneas
	% de distancia del titulo y de la primera entrada de la LdF (NTC 1486:2008 5.2.1.9)
    \addtocontents{lof}{\bfseries \hfill p\IeC {\'a}g.\par \normalfont}
    \@starttoc{lof}%
    \if@restonecol\twocolumn\fi
    }
\newcommand*\l@figure{\@dottedtocline{1}{0em}{0em}}
\newcommand\listoftables{%
    \if@twocolumn
      \@restonecoltrue\onecolumn
    \else
      \@restonecolfalse
    \fi
    \renewcommand\listtablename{LISTA DE TABLAS}
    \chapter*{\listtablename}%
      \@mkboth{%
          \MakeUppercase\listtablename}%
         {\MakeUppercase\listtablename}%
	% Añade partícula pág. requerida en el lado derecho de la página a dos interlíneas
	% de distancia del titulo y de la primera entrada de la LdT (NTC 1486:2008 5.2.1.9)
    \addtocontents{lot}{\bfseries \hfill p\IeC {\'a}g.\par \normalfont}
    \@starttoc{lot}%
    \if@restonecol\twocolumn\fi
    }
\let\l@table\l@figure
\newdimen\bibindent
\setlength\bibindent{1.5em}
\newenvironment{thebibliography}[1]
     {\chapter*{\bibname}%
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
\newcommand\newblock{\hskip .11em\@plus.33em\@minus.07em}
\let\@openbib@code\@empty
\newenvironment{theindex}
               {\if@twocolumn
                  \@restonecolfalse
                \else
                  \@restonecoltrue
                \fi
                \twocolumn[\@makeschapterhead{\indexname}]%
                \@mkboth{\MakeUppercase\indexname}%
                        {\MakeUppercase\indexname}%
                \thispagestyle{plain}\parindent\z@
                \parskip\z@ \@plus .3\p@\relax
                \columnseprule \z@
                \columnsep 35\p@
                \let\item\@idxitem}
               {\if@restonecol\onecolumn\else\clearpage\fi}
\newcommand\@idxitem{\par\hangindent 40\p@}
\newcommand\subitem{\@idxitem \hspace*{20\p@}}
\newcommand\subsubitem{\@idxitem \hspace*{30\p@}}
%%%%%%%\newcommand\indexspace{\par \vskip 10\p@ \@plus5\p@ \@minus3\p@\relax}
\newcommand\indexspace{\par \@plus5\p@ \@minus3\p@\relax}
\renewcommand\footnoterule{%
  \kern-3\p@
  \hrule\@width.4\columnwidth
  \kern2.6\p@}
\@addtoreset{footnote}{chapter}
\newcommand\@makefntext[1]{%
    \parindent 1em%
    \noindent
    \hb@xt@1.8em{\hss\@makefnmark}#1}
\newcommand\contentsname{Contents}
\newcommand\listfigurename{List of Figures}
\newcommand\listtablename{List of Tables}
\newcommand\bibname{Bibliography}
\newcommand\indexname{Index}
\newcommand\figurename{Figure}
\newcommand\tablename{Table}
\newcommand\partname{Part}
\newcommand\chaptername{Chapter}
\newcommand\appendixname{Appendix}
%
% Nuevo. Permite crear las descripciones de figuras y tablas ajustándose
% al margen izquierdo de las figuras, con el formato sugerido.
% (NTC 1486:2008 5.2.2.4)
%
\def\captionfigs#1#2{
  \caption[\hspace{0.5cm} #1]{#1. #2}
  \vspace{0.3cm}
}
%
% Nuevo. Permite crear las descripciones de figuras y tablas ajustándose
% al margen izquierdo de las figuras, con el formato sugerido.
% (NTC 1486:2008 5.2.2.4)
%
\def\captionfig#1#2#3{%
   \ifx\@captype\@undefined
     \@latex@error{\noexpand\caption outside float}\@ehd
     \expandafter\@gobble
   \else
     \refstepcounter\@captype
     \expandafter\@firstofone
   \fi
   {\@captionfig{\@captype}{#1}{#2}{#3}}%
}
\def\@captionfig#1#2#3#4{%
  \par
  \addcontentsline{\csname ext@#1\endcsname}{#1}%
    {\csname #1name\endcsname\nobreakspace\csname the#1\endcsname.\nobreakspace\ignorespaces #2}%
  \begingroup
    \@parboxrestore
    \if@minipage
      \@setminipage
    \fi
    \normalsize
    \@makecaption{\csname fnum@#1\endcsname}{\ignorespaces #2. #3}{#4}\par
  \endgroup}
%
% Nuevo. Crea comando figura para agregar fácilmente gráficos.
% Recordar convertir las imagenes a EPS/PDF.
%
\newcommand{\figura}[5]{
  \begin{figure}[htb]
  \centering
    \begin{minipage}{#5\textwidth}
      \caption[\hspace{0.5cm} #2]{#2. #3}
      %\vspace{1.0\baselineskip}
      \label{fig:#1}
      %\includegraphics[width=#5\textwidth]{#1}
      \includegraphics[width=1.0\textwidth]{#1}
      %\ifthenelse{\equal{#4}{}}{}{#4}
      #4
    \end{minipage}
  \end{figure}
}
\def\today{\ifcase\month\or
  January\or February\or March\or April\or May\or June\or
  July\or August\or September\or October\or November\or December\fi
  \space\number\day, \number\year}
\setlength\columnsep{10\p@}
\setlength\columnseprule{0\p@}
\pagestyle{headings}
\pagenumbering{arabic}
\if@twoside
\else
  \raggedbottom
\fi
\if@twocolumn
  \twocolumn
  \sloppy
  \flushbottom
\else
  \onecolumn
\fi
\endinput
%%
%% End of file `icontec.cls'.
