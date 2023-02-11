\ProvidesClass{ad-conference}[2020/04/14 Arman Dabiri]
\NeedsTeXFormat{LaTeX2e}

% for easy color definitions; provides \definecolor; load before background pkg
\RequirePackage[dvipsnames, svgnames, x11names]{xcolor}
% for positioning text within the side column | use showboxes for visible frame
\RequirePackage[absolute,overlay]{textpos}
% provides key-value class options via \DeclareOptionX
\RequirePackage{xkeyval}
% provides \ifnumgreater{<int expr.>}{<int expr.>}{<true>}{<false>},
% \apptocmd{<command>}{<code>}{<success>}{<failure>} and \newtoggle{<name>}
\RequirePackage{etoolbox}
% provides basic conditional expressions
\RequirePackage{ifthen}
% enable simple math like +/- etc. on lengths
\RequirePackage{calc}

\def \@fontsize {11pt}
\def \@aspectratio {169}
\def \@setbeamer {Copenhagen}
\def \hightsection {1.05cm}
\def \rightlogo {}
\def \leftlogo {}
\def \leftbottomlogo {}




\DeclareOptionX{fontsizes}{\def \@fontsize {#1}}
\DeclareOptionX{aspectratio}{\def \@aspectratio {#1}}
\DeclareOptionX{setbeamer}{\def \@setbeamer {#1}}
\DeclareOptionX{highseticon}{\def \hightsection {#1}}
\DeclareOptionX{rightlogo}{\def \rightlogo {#1}}
\DeclareOptionX{leftlogo}{\def \leftlogo {#1}}
\DeclareOptionX{leftbottomlogo}{\def \leftbottomlogo {#1}}

\DeclareOptionX{date}{\def \@date {#1}}

\ProcessOptionsX\relax
\LoadClass[aspectratio=\@aspectratio,\@fontsize]{beamer}
\usefonttheme[onlymath]{serif}
\mode<presentation> {
	\usetheme{\@setbeamer}
}

\RequirePackage{booktabs,amsmath,amsthm,amsfonts,mathtools,amssymb,bibentry,forest,graphicx,epstopdf,subfigure,caption,units,subfigure,booktabs,tikz,dsfont,tabularx,tabu,mathpazo,mathbbol,bbm,multicol,graphicx,animate, color,xcolor,epstopdf,colortbl,physics,pifont,todonotes,hyperref,tcolorbox,moresize}


\usetikzlibrary{spy,calc,decorations.markings,mindmap,matrix,arrows.meta,positioning,trees,backgrounds,shadows,shapes,arrows,shapes,backgrounds,decorations.pathreplacing}

\usepackage[export]{adjustbox}
\usepackage[]{algorithm2e}
\usepackage[inline]{enumitem}
\setlist[enumerate]{itemsep=3pt,topsep=3pt}
\setlist[enumerate,1]{label=(\roman*)}
\setlist[itemize]{itemsep=3pt,topsep=3pt}
\setlist[itemize,1]{label=$\triangleright$}
\setlist[itemize,2]{label=$-$}

\hypersetup{
	%    colorlinks,
	linkcolor={blue!50!black},
	citecolor={blue!50!black},
	urlcolor={blue!80!black}
}

\DeclareMathAlphabet{\mathpzc}{OT1}{pzc}{m}{it}
\DeclareFontFamily{OT1}{pzc}{}
\DeclareFontShape{OT1}{pzc}{m}{it}{<-> s * [1.10] pzcmi7t}{}
\DeclareMathAlphabet{\mathpzc}{OT1}{pzc}{m}{it}



%%%%% =============== {Format Beamer} ==============================
\renewcommand{\raggedright}{\leftskip=0pt \rightskip=0pt plus 0cm} 
\setbeamercovered{dynamic}


\makeatletter

\def \iconwl {\hightsection}
\def \iconwr {\hightsection}

\def\includelogol{\includegraphics[height=\hightsection,width=\iconwl]{\leftlogo}}
\def\includelogor{\includegraphics[height=\hightsection,width=\iconwr]{\rightlogo}}
\def\includelogolb{\includegraphics[height=.29cm]{\leftbottomlogo}}



\defbeamertemplate*{headline}{mytheme}
{%
	\leavevmode%
	\@tempdimb=2.1ex%
	\ifnum\beamer@subsectionmax<\beamer@sectionmax%
	\multiply\@tempdimb by\beamer@sectionmax%
	\else%
	\multiply\@tempdimb by\beamer@subsectionmax%
	\fi%
	\ifdim\@tempdimb>0pt%
	\advance\@tempdimb by 3ex%
	\begin{beamercolorbox}[wd=.5\paperwidth,ht=\@tempdimb]{section in head/foot}%
		\vbox to\@tempdimb{%
			\smash{\raisebox{-\height}{\includelogol}}%
			\vfil\insertsectionnavigation{.5\paperwidth}\vfil%
		}%
	\end{beamercolorbox}%
	\begin{beamercolorbox}[wd=.5\paperwidth,ht=\@tempdimb]{subsection in head/foot}%
		\vbox to\@tempdimb{%
			\hfill
			\smash{\raisebox{-\height}{\includelogor}}
			\vfil\insertsubsectionnavigation{.5\paperwidth}\vfil%
		}%
	\end{beamercolorbox}%
	\fi%
}
\setbeamertemplate{navigation symbols}{}
%


\setbeamertemplate{frametitle}
{
	\nointerlineskip
	\begin{beamercolorbox}[sep=0.01cm,ht=1.5em,wd=\paperwidth,center]{frametitle}
		\strut\centering {\large\textbf{\insertframetitle}}\strut
	\end{beamercolorbox}
}






%%%%% =============== {Format footnote} ==============================
\renewcommand{\footnotesize}{\tiny}
\newcommand\blfootnote[1]{%
	\begingroup
	\renewcommand\thefootnote{}\footnote{#1}%
	\addtocounter{footnote}{-1}%
	\endgroup
}
\newcommand{\tikzmarkm}[2]{\tikz[remember picture,inner sep=0pt,outer sep=0pt,baseline,anchor=base]  \node (#1) {\ensuremath{#2}};}
\newcommand\tikzmark[1]{\tikz[remember picture,overlay] \node (#1) {};}




\setbeamertemplate{footline}
{
	\leavevmode%
	
	\hbox{%
		\begin{beamercolorbox}[wd=.5\paperwidth,ht=2.25ex,dp=1ex,center]{author in head/foot}%
			\usebeamerfont{author in head/foot}\smash{\raisebox{-.1cm}{\includelogolb}}\hspace*{1em}\insertshortauthor
		\end{beamercolorbox}%
		\begin{beamercolorbox}[wd=.5\paperwidth,ht=2.25ex,dp=1ex,center]{institute in head/foot}%
			\insertshortdate\hspace*{20em} 
			%            \hskip1em\usebeamercolor[fg]{navigation symbols dimmed}%
			%            \insertslidenavigationsymbol%
			%            \insertframenavigationsymbol%
			%            \insertsectionnavigationsymbol%
			%            \insertsubsectionnavigationsymbol%
			%            \insertdocnavigationsymbol%
			%            \insertbackfindforwardnavigationsymbol%
			%            \hspace*{5em}
			\insertframenumber{} \hspace*{1ex}
	\end{beamercolorbox}}%
	\vskip0pt%
}




\setbeamerfont{frametitle}{size=\small,series=\mdseries}
\setbeamertemplate{blocks}[rounded][shadow=true]



\setbeamercolor{structure}{fg=rightcolor,bg=white}
\setbeamercolor{palette quaternary}{fg=white,bg=leftcolor}

\setbeamercolor{navigation symbols}{fg=white, bg=white}

\setbeamercolor{background canvas}{fg=black,bg=white}
\setbeamercolor{background}{parent=background canvas}

\setbeamercolor{institute in head/foot}{fg=white}
\setbeamercolor{author in head/foot}{fg=white}

\setbeamercolor{section in toc}{fg=blue!80!black}
\setbeamercolor{subsection in toc}{fg=blue!50!black}


\setbeamercolor{section in head/foot}{fg=yellow}
\setbeamercolor{subsection in head/foot}{fg=yellow}
\setbeamertemplate{section in head/foot shaded}{\color{white!95!black}\usebeamertemplate{section in head/foot}}
\setbeamertemplate{subsection in head/foot shaded}{\color{white!95!black}\usebeamertemplate{subsection in head/foot}}

\setbeamertemplate{section in toc}{    \textbf{\inserttocsection} \par}
\setbeamertemplate{subsection in toc}{     \color{black}{-- \inserttocsubsection} \par}




\setbeamercolor*{frametitle}{use=structure,fg=white,bg=structure.fg!80!black}
\setbeamercolor*{item projected}{fg=white,bg=black}
\setbeamercolor*{block title example}{fg=white,bg=blue}







\newenvironment<>{blockQ}[1]{%
	\setbeamercolor{block title}{fg=white,bg=yellow!50!blue!50!black}%
	\begin{block}#2{\circled{$ \mathcal Q$} #1}}{\end{block}}   

\newenvironment<>{blockI}[1]{%
	\setbeamercolor{block title}{fg=white,bg=yellow!50!red!50!black}%
	\begin{block}#2{\circled{$ \mathcal I$} #1}}{\end{block}}   

\newenvironment<>{blockE}[1]{%
	\setbeamercolor{block title}{fg=white,bg=red!50!blue!50!black}%
	\begin{block}#2{\circled{$ \mathcal E$} #1}}{\end{block}}   

\newenvironment<>{blockN}[1]{%
	\setbeamercolor{block title}{fg=white,bg=yellow!30!black}%
	\begin{block}#2{\circled{$ \mathcal N$} #1}}{\end{block}}   

\newenvironment<>{blockA}[1]{%
	\setbeamercolor{block title}{fg=white,bg=orange!50!black}%
	\begin{block}#2{#1}}{\end{block}}   

\newenvironment<>{blockT}[1]{%
	\setbeamercolor{block title}{fg=white,bg=orange!50!black}%
	\begin{block}#2{#1}}{\end{block}}   

\newenvironment<>{blockD}[1]{%
	\setbeamercolor{block title}{fg=white,bg=green!50!black}%
	\begin{block}#2{\circled{$ \mathcal D$} #1}}{\end{block}}   

\newenvironment<>{blockR}[1]{%
	\setbeamercolor{block title}{fg=white,bg=blue!50!black}%
	\begin{block}#2{\circled{$ \mathcal R$} #1}}{\end{block}}   

\newenvironment<>{blockB}[1]{%
	\setbeamercolor{block title}{fg=black,bg=yellow!90!white}%
	\begin{block}#2{\circled{$ ! $} #1}}{\end{block}}   


\newenvironment<>{blockt}[1]{%
	\setbeamercolor{block title}{fg=white,bg=red!100!black}%
	\begin{block}#2{ #1}}{\end{block}}

\newenvironment<>{blockb}[1]{%
	\setbeamercolor{block title}{fg=white,bg=blue!100!black}%
	\begin{block}#2{#1}}{\end{block}}

\newenvironment<>{blockg}[1]{%
	\setbeamercolor{block title}{fg=white,bg=green!30!black}%
	\begin{block}#2{ #1}}{\end{block}}


\newenvironment<>{blockr}[1]{%
	\setbeamercolor{block title}{fg=white,bg=red!50!black}%
	\begin{block}#2{ #1}}{\end{block}}

\newenvironment<>{titleblock}[1]{%
	\setbeamercolor{block title}{fg=black,bg=black!50!black}%
	\begin{block}{\centering \large Section}\centering\huge {{#1}}}{\end{block}}



\setbeamertemplate{theorem begin}
{%
	\begin{\inserttheoremblockenv}
		{%
			\inserttheoremheadfont
			\inserttheoremname
			\inserttheoremnumber
			\ifx\inserttheoremaddition\empty\else\ (\inserttheoremaddition)\fi
			:
		}%
	}
	\setbeamertemplate{theorem end}{\end{\inserttheoremblockenv}}



\newcommand{\ChangeThmEnvirColor}[3]{
	\BeforeBeginEnvironment{#1}
	{
		\setbeamercolor{structure}{fg=#2}
		\setbeamertemplate{block begin}{%
			\begin{beamerboxesrounded}[shadow=true]{\circled{$ \mathcal #3 $} \insertblocktitle}%
			}
		}
		\AfterEndEnvironment{#1}{
			\setbeamercolor{structure}{fg=rightcolor}
			\setbeamertemplate{block begin}{%
				\begin{beamerboxesrounded}[shadow=true]{\insertblocktitle}%
				}
			}
		}
		
		\ChangeThmEnvirColor{theorem}{orange!50!black}{T}
		\ChangeThmEnvirColor{thm}{orange!50!black}{T}
		\ChangeThmEnvirColor{lem}{orange!80!black}{L}
		\ChangeThmEnvirColor{cor}{orange!80!black}{C}
		
		
		\ChangeThmEnvirColor{defn}{green!50!black}{D}
		\ChangeThmEnvirColor{ass}{orange!80!black}{A}
		\ChangeThmEnvirColor{exmp}{red!50!blue!50!black}{E}
		\tcbuselibrary{skins}
		
		%\addtobeamertemplate{footnote}{\vspace{-6pt}\advance\hsize-0.5cm}{\vspace{6pt}}
		
		
		\makeatletter
		
		
		\setbeamerfont{footnote}{size=\ssmall}
		\setbeamertemplate{footnote}{
			[\insertfootnotemark]  \insertfootnotetext
		}
		\renewcommand*{\footnoterule}{\kern-30pt \hrule \@width .5\paperwidth \kern 0pt}
		
		\renewcommand*{\thefootnote}{\fnsymbol{footnote}}
		
		\setbeamercolor{alerted text}{bg=yellow,fg=black}
		
		\def \alertbox#1#2#3{\alt<#2>
			{
				\colorbox{#1}{\textbf{#3}}
			}
			{#3}} 
		
\makeatother
\usepackage{bibentry}
\usepackage[backend=bibtex,maxbibnames=99,maxnames=10]{biblatex}


\include{ad-conf-var}

