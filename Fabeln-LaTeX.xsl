<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:t="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="xs"
    version="2.0">
    <xsl:strip-space elements="*"/> <!-- for LaTeX -->
    <xsl:output method="text" encoding="UTF-8" indent="no" omit-xml-declaration="yes"/>
  
    <xsl:param name="mode"/>
    <xsl:variable name="filepath">//gams.uni-graz.at/gamsdev/slang/graf/latex/</xsl:variable>

    <xsl:template match="/">
        


        <xsl:if test="//t:biblStruct">
            <xsl:text>\begin{filecontents}{references.bib}
</xsl:text>
            <xsl:for-each select="//t:listBibl[@type='Textgrundlage' or 'Sekundärliteratur' or 'Primärliteratur']/t:biblStruct">
                <xsl:choose>
                    <xsl:when test="not(t:citedRange) and not(t:editor)">
                        <xsl:text>@incollection{</xsl:text><xsl:value-of select="translate(translate(translate(translate(@xml:id, '-_.,;: ',''),'ä','ae'),'ö','oe'),'ü','ue')"/><xsl:text>,
author = {</xsl:text><xsl:value-of select="t:analytic/t:author/t:persName[1]"/><xsl:for-each select="t:analytic/t:author/t:persName[position() > 1]"><xsl:text> and </xsl:text><xsl:value-of select="."/></xsl:for-each><xsl:text>},
title = {</xsl:text><xsl:value-of select="t:analytic/t:title"/><xsl:text>},
editor = {</xsl:text><xsl:value-of select="t:monogr/t:editor/t:persName[1]"/><xsl:for-each select="t:monogr/t:editor/t:persName[position() > 1]"><xsl:text> and </xsl:text><xsl:value-of select="."/></xsl:for-each><xsl:text>},
booktitle = {</xsl:text><xsl:value-of select="t:monogr/t:title"/><xsl:text>},
year = {</xsl:text><xsl:value-of select="t:monogr/t:imprint/t:date"/><xsl:text>},
address = {</xsl:text><xsl:value-of select="t:monogr/t:imprint/t:pubPlace/t:placeName"/><xsl:text>},
pages = {</xsl:text><xsl:value-of select="t:citedRange"/><xsl:text>}
}
</xsl:text>       
                    </xsl:when>
                    <xsl:when test="not(t:citedRange) and not(t:editor)">
                        <xsl:text>@article{</xsl:text><xsl:value-of select="translate(translate(translate(translate(@xml:id, '-_.,;: ',''),'ä','ae'),'ö','oe'),'ü','ue')"/><xsl:text>,
author = {</xsl:text><xsl:value-of select="t:analytic/t:author/t:persName[1]"/><xsl:for-each select="t:analytic/t:author/t:persName[position() > 1]"><xsl:text> and </xsl:text><xsl:value-of select="."/></xsl:for-each><xsl:text>},
title = {</xsl:text><xsl:value-of select="t:analytic/t:title"/><xsl:text>},
journaltitle = {</xsl:text><xsl:value-of select="t:monogr/t:title"/><xsl:text>},
year = {</xsl:text><xsl:value-of select="t:monogr/t:imprint/t:date"/><xsl:text>},
address = {</xsl:text><xsl:value-of select="t:monogr/t:imprint/t:pubPlace/t:placeName"/><xsl:text>},
pages = {</xsl:text><xsl:value-of select="t:citedRange"/><xsl:text>},
}
</xsl:text>      
                    </xsl:when>
                    <xsl:when test="not(t:citedRange)">
                        <xsl:text>@book{</xsl:text><xsl:value-of select="translate(translate(translate(translate(@xml:id, '-_.,;: ',''),'ä','ae'),'ö','oe'),'ü','ue')"/><xsl:text>,
author = {</xsl:text><xsl:value-of select="t:analytic/t:author/t:persName[1]"/><xsl:for-each select="t:analytic/t:author/t:persName[position() > 1]"><xsl:text> and </xsl:text><xsl:value-of select="."/></xsl:for-each><xsl:text>},
title = {</xsl:text><xsl:value-of select="t:analytic/t:title"/><xsl:text>},
editor = {</xsl:text><xsl:value-of select="t:monogr/t:editor/t:persName[1]"/><xsl:for-each select="t:monogr/t:editor/t:persName[position() > 1]"><xsl:text> and </xsl:text><xsl:value-of select="."/></xsl:for-each><xsl:text>},
year = {</xsl:text><xsl:value-of select="t:monogr/t:imprint/t:date"/><xsl:text>},
address = {</xsl:text><xsl:value-of select="t:monogr/t:imprint/t:pubPlace/t:placeName"/><xsl:text>},
pages = {</xsl:text><xsl:value-of select="t:citedRange"/><xsl:text>},
}
</xsl:text>  
                    </xsl:when>
                </xsl:choose>
            </xsl:for-each>
            
            <xsl:for-each select="//t:listBibl[@type='Onlinezitation']/t:biblStruct">
                <xsl:text>@online{</xsl:text><xsl:value-of select="translate(translate(translate(translate(@xml:id, '-_.,;: ',''),'ä','ae'),'ö','oe'),'ü','ue')"/><xsl:text>,
author = {</xsl:text><xsl:value-of select="t:analytic/t:author/t:persName[1]"/><xsl:for-each select="t:analytic/t:author/t:persName[position() > 1]"><xsl:text> and </xsl:text><xsl:value-of select="."/></xsl:for-each><xsl:text>},
title = {</xsl:text><xsl:value-of select="t:analytic/t:title"/><xsl:text>},
year = {</xsl:text><xsl:value-of select="t:monogr/t:imprint/t:date"/><xsl:text>},
address = {</xsl:text><xsl:value-of select="t:monogr/t:imprint/t:pubPlace/t:placeName"/><xsl:text>},
url = {</xsl:text><xsl:value-of select="normalize-space(t:ref)"/><xsl:text>},
urldate = {</xsl:text><xsl:value-of select="t:ref/time/@when"/><xsl:text>},
pages = {</xsl:text><xsl:value-of select="t:citedRange"/><xsl:text>},
}
</xsl:text>
            </xsl:for-each>
            <xsl:text>\end{filecontents}</xsl:text>
        </xsl:if> 

        <xsl:text>
\documentclass[10pt, a4paper]{article}

\usepackage[utf8x]{inputenx} %
\usepackage[LGR, T1]{fontenc}
\usepackage{textcomp} % defines \textmu, which is now what inputenx seems to use for μ - probably due inpmath.. also \textdegree... but not \textrho
\usepackage{textgreek}

%-------------------------------------------------------------------------------- document settings
\usepackage{geometry} % Allows the configuration of document margins
\geometry{a4paper, textwidth=0.87\paperwidth, textheight=0.8\paperheight,
%lmargin=0.3cm, rmargin=0.3cm, margin=0.5cm,marginparsep=7pt, marginparwidth=0.3cm
} % Document margin settings


\setlength\parindent{0in} % Remove paragraph indentation
\usepackage[onehalfspacing]{setspace}

\usepackage{environ}
\usepackage{atveryend}
\usepackage{paracol}

\usepackage{enumitem}
\usepackage{graphicx}
%\usepackage{fontawesome} % kennt die GAMS nicht, mag die GAMS nicht
\usepackage{multicol}
\usepackage{epigraph} % for blockquotes etc
% \epigraph{All human things are subject to decay, and when fate  summons, Monarchs must obey}{\textit{Mac Flecknoe \\ John Dryden}}
   
\setlength{\emergencystretch}{.5em} % deals with most line overflows
% emergency hack: \sloppy ; only to be used for single paragraphs and only if REALLY necessary
% Hurenkinder und Schusterjungen verhindern
\clubpenalty10000
\widowpenalty10000
\displaywidowpenalty=10000




%-----------------------------------------
%Quote-Environments
\renewenvironment{quote}
               {\list{}{\rightmargin\leftmargin}%
                \item\relax\footnotesize\ignorespaces}
               {\unskip\unskip\endlist}

\newcommand{\gap}{ \lbrack\dots\rbrack \phantom{ }}
\newcommand{\sep}{%
{\Large ~$\cdot$~}%
}

% ------------------------------------------------------------------------------------------------change footnote style
%\usepackage{scrextend}
%\deffootnote[2em]{0.5em}{1em}{\thefootnotemark . }



%------------------------------------------------------------------------------------ Language support  

\usepackage[english,greek,latin.classic,ngerman]{babel} % last argument is active by default, others need to be called specifically
\usepackage[babel,german=quotes]{csquotes}
\languageattribute{greek}{polutoniko} %The commands \greektext and \latintext can be used to switch to greek or latin fonts. These are declarations.  The commands \textgreek and \textlatin : short snippet, no further commands allowed inside
\selectlanguage{ngerman}
\newcommand{\ancientgreek}[1]{\selectlanguage{polutonikogreek}#1} % usage: \ancientgreek{GREEK TEXT GOES HERE}
  

%--------------------- GRaF-Schrift
\usepackage{rustic}
        </xsl:text>

        <xsl:text>
% main fonts
\usepackage{lmodern} % http://www.tug.dk/FontCatalogue/latinmodernroman/
\usepackage{libertine} % http://www.tug.dk/FontCatalogue/linuxlibertine/
\usepackage[sfdefault,lf]{carlito}

\renewcommand{\baselinestretch}{1.15}
        </xsl:text>
        
        <xsl:text>
            
%--------------------------------------------------------------------------------------------------- URLs

\usepackage{url} % usage: \protect\url{http://url.com/lalalala}
\usepackage{hyperref} % https://www.sharelatex.com/learn/Hyperlinks

\usepackage[
backend=bibtex,
style=authoryear,
citestyle=chicago-authordate %authoryear
]{biblatex}
\bibliography{references}
        </xsl:text>
        
        <!-- PDF metadata set-up here -->
        <xsl:text>
    %--------------------- PDF-Info
    \hypersetup{
    pdftitle={</xsl:text><xsl:value-of select="//t:teiHeader/t:fileDesc/t:titleStmt/t:title"/><xsl:text>},
    pdfauthor={</xsl:text><xsl:value-of select="//t:teiHeader/t:fileDesc/t:titleStmt/t:author"/><xsl:text>},
    pdfsubject={</xsl:text><xsl:value-of select="//t:teiHeader/t:fileDesc/t:titleStmt/t:title"/><xsl:text>},
    pdfkeywords={</xsl:text><xsl:value-of select="//t:teiHeader/t:fileDesc/t:titleStmt/t:title"/><xsl:text>},
    colorlinks=false,           % no link border color
    pdfa,
    }</xsl:text>
        
        
        <xsl:text>
\usepackage{lgreek}
%\usepackage{dtklogos} % http://mirror.easyname.at/ctan/usergrps/dante/dtk/doc/beispiel.pdf

%\usepackage{CJKutf8} % example for typesetting Japanese
%\newcommand\jap[1]{\begin{CJK}{UTF8}{min}#1\end{CJK}}  </xsl:text>
        
        
        <!-- define custom colours here: insert RGB values of project colour into projectcolour -->
        <xsl:text>
%------------------------------------------------------------------------------------------- custom colors  
\usepackage[usenames, dvipsnames]{color} %  https://de.sharelatex.com/learn/Using_colours_in_LaTeX#!#Reference_guide z.B. \color{RubineRed} - use ColorNames
%------------------------- define your own colors:
\definecolor{projectcolour}{RGB}{102,0,34} %#660022
\definecolor{GrafBeige}{RGB}{226,212,186}
\definecolor{Lightprojectcolour}{RGB}{152,51,85} %#A3244E

\definecolor{CornflowerBlue}{RGB}{100,149,237} %#6495ed
\definecolor{BrightPurple}{RGB}{128, 0, 255} %#8000ff
%HTML Colors
\definecolor{MediumSlateBlue}{RGB}{123, 104, 238} %#7B68EE
\definecolor{RebeccaPurple}{RGB}{102, 51, 153} %#663399
\definecolor{DarkOrchid}{RGB}{153, 50, 204} %#9932CC
    


\usepackage{xcolor}
\usepackage{tikz}

\newcommand{\topictag}[1]{% from alta-cv: https://www.overleaf.com/latex/templates/altacv-template/trgqjpwnmtgv
  \tikz[baseline]\node[draw=black!40,fill=black!10,rounded corners,inner sep=0.4em]{\color{black!50}#1};
}

\newcommand{\persontag}[1]{% from alta-cv: https://www.overleaf.com/latex/templates/altacv-template/trgqjpwnmtgv
  \tikz[baseline]\node[draw=black!60,fill=black!30,rounded corners,inner sep=0.4em]{\color{black!70}#1};
}

\usepackage{framed}
\definecolor{shadecolor}{gray}{0.9}       
  
% ---------------------------------------------------------------------------------------------------Sectiontitle style
\usepackage{titlesec} % Allows customizing section titles: https://tex.stackexchange.com/questions/314008/titleformat-rule-the-underline
% Format of the section titles

 
%------------------------------
%Change the footnote numbers from superscript to on-baseline
%numbering in the footnotes. (Preferred by Turabian, but not required.)
\makeatletter
\renewcommand\@makefntext{\hspace*{0em}\@thefnmark .\phantom{} }
\makeatother
%Add empty line between footnotes, and print in same
%font size as main text
%\footnotesep\baselineskip
        </xsl:text>
        
        <xsl:text>
%--------------------------------------------------------------------------------       Header / Footer
\usepackage{lastpage}
\usepackage{fancyhdr} % http://mirror.easyname.at/ctan/macros/latex/contrib/fancyhdr/fancyhdr.pdf
\pagestyle{fancy}
\fancyhf{}
\renewcommand{\headrulewidth}{2pt}
\setlength{\footskip}{40pt}

</xsl:text>       
        
        <!-- Header / footer settings: Header for every page, footer only if not last page because of the special extended end of document footer. TODO: Standard-Zitiervorschlag basteln 
    Warning: Final footer needs to compile at least 2 times to adjust!! -->
        <xsl:text>
\rhead{\includegraphics[width=0.04\textwidth]{</xsl:text><!-- <xsl:value-of select="$filepath"/> --><xsl:text>//gams.uni-graz.at/archive/objects/context:graf/datastreams/ZIMLOGO/content}}
\lhead{\footnotesize\textbf{Zitation:}  </xsl:text><xsl:text>\emph{</xsl:text><xsl:choose>
    <xsl:when test="contains(//t:titleStmt/t:title,'==')">
        <xsl:value-of select="substring-before(//t:titleStmt/t:title,'==')"/>
    </xsl:when>
    <xsl:otherwise><xsl:value-of select="//t:titleStmt/t:title"/></xsl:otherwise>
</xsl:choose><xsl:text>}, in: </xsl:text><xsl:value-of select="//t:seriesStmt/t:respStmt/t:persName"/><xsl:text> (Hg.): </xsl:text><xsl:value-of select="//t:seriesStmt/t:title"/><xsl:text>, </xsl:text><xsl:value-of select="//t:teiHeader/t:fileDesc/t:publicationStmt/t:date"/><xsl:text>. \\{\rmfamily\textsc{Permalink:}} \protect\url{gams.uni-graz.at/</xsl:text><xsl:value-of select="//t:idno"/><xsl:text>}{  } \lbrack{}\today\rbrack{}.} % Buchstabe davor (l, r, c) bestimmt Position
\cfoot{\ifnum\getpagerefnumber{VeryLastPage}=\value{page}\else\thepage
%/\pageref{LastPage}%
\fi} % \lfoot - left-hand side OR \rfoot right-handside   % \thesection gibt Section-Nummer \sectionmark \rightmark \leftmark
\rfoot{\ifnum\getpagerefnumber{VeryLastPage}=\value{page}\else\includegraphics[width=0.1\textwidth]{//gams.uni-graz.at/archive/objects/context:graf/datastreams/GAMSLOGO/content}\fi}
\lfoot{\ifnum\getpagerefnumber{VeryLastPage}=\value{page}\else\begin{tikzpicture}[fill opacity=0.5]\includegraphics[width=0.15\textwidth]{//gams.uni-graz.at/archive/objects/context:graf/datastreams/CCBYNC/content}\end{tikzpicture}\fi}</xsl:text>
        
        
        
        <xsl:text>
% if condition only prints footer if not last page
% to get rid of pagenumbering if unwanted: \pagenumbering{gobble}

    

%------------------------------------------------------------------------ different last page footer
\usepackage[pages=some]{background} % credit: https://tex.stackexchange.com/questions/120773/footer-on-last-page
\usepackage{tikzpagenodes}
\usepackage{pageslts,refcount}

\backgroundsetup{
  scale=1,angle=0,color=black,
  contents={%
  \tikz[remember picture,overlay]{
    \fill[gray!70,ultra thick] 
    ([yshift=120pt]current page.south west) 
    rectangle 
    (current page.south east);
    \node[anchor=north west,inner sep=0pt,text width=.3\paperwidth,align=left] at ([yshift=-20pt,xshift=50pt]current page.south west|-current page text area.south west) {Some information \\ Additional information \\ Some articles};
    \node[anchor=north,inner sep=0pt,text width=.3\paperwidth,align=left] at ([yshift=-20pt,xshift=-25pt]current page text area.south) {Some information \\ Additional information \\ Some articles};
    \node[anchor=north east,inner sep=0pt,text width=.3\paperwidth,align=left] at ([yshift=-20pt,xshift=-10pt]current page.south east|-current page text area.south east) {Some information \\ Additional information \\ Some articles};
  }
  }
}
</xsl:text>
        
        <!-- modify last page footer here, for layout changes, see above -->
        <xsl:text>
\newcommand{\footercustomlastpage}[3]{%
\backgroundsetup{%
  scale=1,angle=0,color=black,%
  contents={%
  \tikz[remember picture,overlay]{%
    \fill[gray!70,ultra thick]%
    ([yshift=120pt]current page.south west)%
    rectangle%
    (current page.south east);%
    \node[anchor=north west,inner sep=0pt,text width=.45\paperwidth,align=left] at ([yshift=5pt,xshift=50pt]current page.south west|-current page text area.south west) {#1};%
    \node[anchor=north,inner sep=0pt,text width=.3\paperwidth,align=right] at ([yshift=-5pt,xshift=-40pt]current page text area.south) {#2};%
    \node[anchor=north east,inner sep=0pt,text width=.3\paperwidth,align=right] at ([yshift=-5pt,xshift=-50pt]current page.south east|-current page text area.south east) {#3};%
  }}}%
}
\footercustomlastpage{
\includegraphics[width=0.1\textwidth]{//gams.uni-graz.at/archive/objects/context:graf/datastreams/CC/content} \includegraphics[width=0.1\textwidth]{//gams.uni-graz.at/archive/objects/context:graf/datastreams/CCBY/content} 
\includegraphics[width=0.1\textwidth]{//gams.uni-graz.at/archive/objects/context:graf/datastreams/CCNC/content} \hspace{1em} \href{https://creativecommons.org/licenses/by-nc/4.0/deed.de}{\large\textbf{CC-BY-NC}} \\[0.5em]
\scriptsize {\color{ForestGreen}\faCheck\phantom{ }} \textbf{Teilen} -- das Material vervielfältigen und weiterverbreiten. \\
{\color{ForestGreen}\faCheck\phantom{ }} \textbf{Bearbeiten} -- z.B. verändern und darauf aufbauen. \\
\vspace{1em}
{\color{NavyBlue}\faArrowRight\phantom{ }} \textbf{Namensnennung} -- Mit Lizenz zitieren und angeben, ob verändert. \\
{\color{BrickRed}\faBan\phantom{ }} \textbf{Nicht kommerzielle Verwendung}}{
\includegraphics[width=0.3\textwidth]{//gams.uni-graz.at/archive/objects/context:graf/datastreams/GRAFLOGO/content}
}{
{\color{projectcolour}\textbf{Grazer Repositorium antiker Fabeln}} \\ 
\footnotesize
Univ.-Prof. Dr.phil. Ursula Gärtner \\ 
Institut für Klassische Philologie \\ 
Universitätsplatz 3/II, 8010 Graz \\ 
\protect\url{klassphil@uni-graz.at}
}</xsl:text>
        
        
        <!-- wird gebraucht für den lastpage-footer -->
        <xsl:text>

%--------------------------------------------------------------------------------- End footer placement    
\usepackage{everypage}
\AddEverypageHook{\ifnum\getpagerefnumber{VeryLastPage}=\value{page}\clearpage\BgThispage\else\fi}
%\AfterEndDocument{\clearpage\vfill\fancyhf{}\cfoot{}\rfoot{}\lfoot{}\BgThispage}
        </xsl:text>
        
<!-- ////////////////////////////////////////////////////////////////////////////////////////////////////// -->
<!-- Ende Präambel -->
<xsl:text>
%--------------------------------

\title{</xsl:text><xsl:choose>
    <xsl:when test="contains(//t:titleStmt/t:title,'==')">
        <xsl:value-of select="substring-before(//t:titleStmt/t:title,'==')"/>
    </xsl:when>
    <xsl:otherwise><xsl:value-of select="//t:titleStmt/t:title"/></xsl:otherwise>
</xsl:choose>
        <xsl:text>}
\author{</xsl:text><xsl:apply-templates select="//t:teiHeader/t:fileDesc/t:titleStmt/t:author"/>
        <xsl:text>}\date{\today}
\begin{document}
\pagenumbering{arabic}
%\maketitle\tableofcontents

\newpage</xsl:text>
        
        <xsl:text>
{\centering\huge\rustfamily\color{projectcolour} Grazer Repositorium antiker Fabeln} \\[2em]</xsl:text>
        
        <xsl:for-each select="//t:div[@type='originaltext']">
            <xsl:text>
   \setlength{\columnsep}{1cm}
     \columnratio{0.53}[0.38]
     \begin{paracol}{2}
     \hbadness7000
     
     \backgroundcolor{c[0](4pt,4pt)(0.5\columnsep,4pt)}[rgb]{1,1,1}
     \backgroundcolor{c[1](0.5\columnsep,4pt)(4pt,4pt)}[rgb]{0.9,0.9,0.9}
     
     \backgroundcolor{C[0](10000pt,10000pt)(0.5\columnsep,10000pt)}[rgb]{1,1,1}
     %\backgroundcolor{C[1](0.5\columnsep,10000pt)(10000pt,10000pt)}[rgb]{0.9,0.9,0.9}</xsl:text>
            
            <xsl:text>
{\par\centering\LARGE </xsl:text><xsl:choose>
    <xsl:when test="contains(//t:titleStmt/t:title,'==')">
        <xsl:value-of select="substring-before(//t:titleStmt/t:title,'==')"/>
    </xsl:when>
    <xsl:otherwise><xsl:value-of select="//t:titleStmt/t:title"/></xsl:otherwise>
</xsl:choose><xsl:text>} \\[0.5em]
\vspace{-3em}</xsl:text>

            <xsl:apply-templates select="//t:div[@type='originaltext']"/>    
            <xsl:text>  

\vspace{-1em}
\switchcolumn
\footnotesize
\vspace{0.5em}</xsl:text>
            <xsl:if test="//t:listBibl[@type='Vergleichsstellen']/t:bibl">
                <xsl:text>{\small\color{black!40} \underline{Vergleichsstellen:} \\[0.2em] </xsl:text><xsl:for-each select="//t:listBibl[@type='Vergleichsstellen']/t:bibl">
                    <!-- <xsl:text>%\faBook\phantom{x}
                </xsl:text> --><xsl:apply-templates/><xsl:if test="not(position()=last())">
                        <xsl:text>\sep </xsl:text>
                    </xsl:if></xsl:for-each><xsl:text>}\\[1.5em] 
                        
                        \vspace{-2em}
                    </xsl:text>
            </xsl:if>   
            <xsl:if test="//t:listPerson/t:person">
                <xsl:text>{\small\color{black!40} \underline{Vorkommende Akteure:} \\[0.2em] </xsl:text><xsl:for-each select="//t:listPerson/t:person"><!-- <xsl:text>%\faUser\phantom{x} </xsl:text> --><xsl:value-of select="."/><xsl:if test="not(position()=last())"><xsl:text> \sep </xsl:text>
                </xsl:if></xsl:for-each><xsl:text>}\\[1.5em] 
                    
                    \vspace{-2em}
                </xsl:text>
            </xsl:if>
            <xsl:if test="//t:span[@ana = 'Thema']">
                <xsl:text>{\small\color{black!40} \underline{Themen:} \\[0.2em] </xsl:text><xsl:for-each select="//t:span[@ana = 'Thema']">
                    <xsl:text>%\faUser\phantom{x}
                </xsl:text><xsl:apply-templates/><xsl:if test="not(position()=last())">
                    <xsl:text>\sep </xsl:text>
                </xsl:if></xsl:for-each><xsl:text>}\\ 
                
               
                </xsl:text>
            </xsl:if>
            
            
            <xsl:if test="//t:hi[@rend='Vokabel']">
                <xsl:text>
                    \switchcolumn\switchcolumn
                    
\subsubsection*{Vokabelangaben}
\begin{enumerate}[noitemsep,topsep=0pt,parsep=0pt,partopsep=0pt,leftmargin=*]\footnotesize
</xsl:text><xsl:for-each select="//t:hi[@rend='Vokabel']"><xsl:text>\item </xsl:text>
                                                      <xsl:choose>
                                                          <xsl:when test="ancestor::t:head">
                                                              <xsl:text>{\lbrack{}Überschrift\rbrack{}}~~</xsl:text>
                                                          </xsl:when>
                                                          <xsl:when test="ancestor::t:l">
                                                              <xsl:text>{\lbrack{}Zeile </xsl:text>
                                                                  <xsl:value-of select="ancestor::t:l/@n"/>
                                                                  <xsl:text>\rbrack{}}~~</xsl:text>
                                                          </xsl:when>
                                                      </xsl:choose>
    <xsl:for-each select="t:note"><xsl:apply-templates mode="angaben"/>    <xsl:text>
        
    </xsl:text>
</xsl:for-each>
</xsl:for-each><xsl:text>
    \end{enumerate}
    
\bigskip</xsl:text>
            </xsl:if> 
            <xsl:if test="//t:hi[@rend='Grammatik']">
                <xsl:text>
                    \switchcolumn\switchcolumn
                    
\subsubsection*{Grammatik}
\begin{enumerate}[noitemsep,topsep=0pt,parsep=0pt,partopsep=0pt,leftmargin=*]\footnotesize
</xsl:text><xsl:for-each select="//t:hi[@rend='Grammatik']"><xsl:text>\item </xsl:text>
    <xsl:choose>
        <xsl:when test="ancestor::t:head">
            <xsl:text>{\lbrack{}Überschrift\rbrack{}}~~</xsl:text>
        </xsl:when>
        <xsl:when test="ancestor::t:l">
            <xsl:text>{\lbrack{}Zeile </xsl:text>
            <xsl:value-of select="ancestor::t:l/@n"/>
            <xsl:text>\rbrack{}}~~</xsl:text>
        </xsl:when>
    </xsl:choose><xsl:for-each select="t:note"><xsl:apply-templates mode="angaben"/>
    <xsl:text>
        
    </xsl:text></xsl:for-each></xsl:for-each><xsl:text>
    \end{enumerate}</xsl:text>
            </xsl:if>
            <xsl:if test="//t:hi[@rend='Stilistik']">
                <xsl:text>\switchcolumn\switchcolumn
                    
\subsubsection*{Stilistik}
\begin{enumerate}[noitemsep,topsep=0pt,parsep=0pt,partopsep=0pt,leftmargin=*]\footnotesize
</xsl:text><xsl:for-each select="//t:hi[@rend='Stilistik']"><xsl:text>\item </xsl:text>
    <xsl:choose>
        <xsl:when test="ancestor::t:head">
            <xsl:text>{\lbrack{}Überschrift\rbrack{}}~~</xsl:text>
        </xsl:when>
        <xsl:when test="ancestor::t:l">
            <xsl:text>{\lbrack{}Zeile </xsl:text>
            <xsl:value-of select="ancestor::t:l/@n"/>
            <xsl:text>\rbrack{}}~~</xsl:text>
        </xsl:when>
    </xsl:choose><xsl:for-each select="t:note"><xsl:apply-templates mode="angaben"/>
        <xsl:text>
        
    </xsl:text></xsl:for-each></xsl:for-each><xsl:text>
    \end{enumerate}
</xsl:text>
            </xsl:if>
            <xsl:if test="//t:hi[@rend='Sacherklärung']">
                <xsl:text>\switchcolumn\switchcolumn
                    \subsubsection*{Sacherklärungen}
\begin{enumerate}[noitemsep,topsep=0pt,parsep=0pt,partopsep=0pt,leftmargin=*]\footnotesize
</xsl:text><xsl:for-each select="//t:hi[@rend='Sacherklärung']"><xsl:text>\item </xsl:text>
    <xsl:choose>
        <xsl:when test="ancestor::t:head">
            <xsl:text>{\lbrack{}Überschrift\rbrack{}}~~</xsl:text>
        </xsl:when>
        <xsl:when test="ancestor::t:l">
            <xsl:text>{\lbrack{}Zeile </xsl:text>
            <xsl:value-of select="ancestor::t:l/@n"/>
            <xsl:text>\rbrack{}}~~</xsl:text>
        </xsl:when>
    </xsl:choose><xsl:for-each select="t:note"><xsl:apply-templates mode="angaben"/>
        <xsl:text>
        
    </xsl:text></xsl:for-each></xsl:for-each><xsl:text>
    \end{enumerate}</xsl:text>
            </xsl:if>
            
            \end{paracol}
            
            \bigskip
            
            <xsl:text>
\normalsize </xsl:text>
        <xsl:if test="$mode='interpretation'">
            <xsl:text>
                
                \section*{Übersetzung}
            
            </xsl:text>
            <xsl:for-each select="//t:div[@type='translation']">
                <xsl:apply-templates/>
            </xsl:for-each>
        </xsl:if>
<xsl:text>%\clearpage

</xsl:text>
        </xsl:for-each>
        

        
        <xsl:text>\section*{Arbeitsaufträge}\footnotesize</xsl:text>
        <xsl:text>\begin{enumerate}[noitemsep,topsep=0pt,parsep=0pt,partopsep=0pt,leftmargin=*]</xsl:text>
        <xsl:if test="$mode='interpretation'">
            <xsl:text>\small</xsl:text>
        </xsl:if>
        <xsl:for-each select="//t:div[@type='Interpretationsfrage']">
            <xsl:apply-templates mode="interp"/>
        </xsl:for-each>
        <xsl:text>\end{enumerate}</xsl:text>
        
        
        <xsl:text>\normalsize
            
            \section*{Vergleichsstellen}</xsl:text>
        <xsl:text>
        \columnratio{0.47}[0.48]
        \begin{paracol}{2}
        \backgroundcolor{c[0](4pt,4pt)(0.5\columnsep,4pt)}[rgb]{1,1,1}
        \backgroundcolor{c[1](0.5\columnsep,4pt)(4pt,4pt)}[rgb]{1,1,1}
        
        \backgroundcolor{C[0](10000pt,10000pt)(0.5\columnsep,10000pt)}[rgb]{1,1,1}
        %\backgroundcolor{C[1](0.5\columnsep,10000pt)(10000pt,10000pt)}[rgb]{1,1,1}
        \small</xsl:text>
        <!-- Vergleichsstellen reinladen.. hier funktioniert scheinbar was nicht.. in der Webansicht funktioniert genau dasselbe ja... -->
        <xsl:for-each select="//t:listBibl[@type='Vergleichsstellen']/t:bibl/t:ref">
            <!--  <xsl:variable name="vglautor"  select="lower-case(translate(translate(@target,':#-',''),',','.'))"/>-->

            <xsl:text>
                
                
            </xsl:text>
            <!-- da sind geschützte Leerzeichen drin... von Word.. kann das sein?  JA!!! -->
            <xsl:variable name="vglautor"  select="translate(@target,'#;:–- ','')"/>
            
<!-- zum Testen:
                        <xsl:value-of select="$vglautor"/><xsl:text> sollte gleich sein wie: </xsl:text>
            <xsl:value-of select="document(concat('/context:graf/', 'VGLSTELLEN'))/t:TEI//t:div[@type = 'text'][child::t:ref[translate(@n,'–- ','')=$vglautor]]/child::t:ref/@n"/>
            <xsl:text>\\
            
            alle: 
            </xsl:text> 

            <xsl:for-each select="document(concat('/context:graf/', 'VGLSTELLEN'))/t:TEI//t:div[@type = 'text']//t:ref/translate(@n,'–- ','')">
                <xsl:value-of select="."/><xsl:text> </xsl:text>
            </xsl:for-each>
            -->
            <xsl:for-each select="document(concat('/context:graf/', 'VGLSTELLEN'))/t:TEI//t:div[@type = 'text'][t:span[@type='Vergleichstextidentitaet']/t:ref[translate(@xml:id,'–- ','')=$vglautor]]">
                  <xsl:text>\subsubsection*{</xsl:text>
                <xsl:value-of
                    select="t:span[@type = 'Vergleichstextidentitaet']/t:ref/@n"
                /><xsl:text>}</xsl:text>
                
<!-- das ist der Autor der Vglstelle:
                    <xsl:text>\paragraph{</xsl:text><xsl:value-of select="t:span[@type = 'Vergleichstextidentitaet']/t:ref/@ana"/><xsl:text>}</xsl:text>

    -->
                <xsl:apply-templates mode="vgl"/>
                <!-- hierher kommt er schon gar nicht mehr, weil wohl keine der XML-IDs nicht übereinstimmen.. hier gibt es wie -->
                
                <xsl:text>  </xsl:text>
                
                
                \switchcolumn
                
            </xsl:for-each>
            
            
        </xsl:for-each>
        <xsl:text>\end{paracol}</xsl:text>
        
        
        
        <!-- end document (with the bibliography settings) -->
        
        
        <!-- if you want to cite everything in the bib file: -->
        <xsl:text>\nocite{*}</xsl:text>
        
        <!-- bibliography settings --> 
        
        <xsl:choose>
            <xsl:when test="$mode='interpretation'">
                <xsl:text>\AtNextBibliography{\small}</xsl:text>
            </xsl:when>
            <xsl:otherwise>
                <xsl:text>\AtNextBibliography{\footnotesize}</xsl:text>
            </xsl:otherwise>
        </xsl:choose>
        <xsl:text>
\defbibheading{head}{\section*{Literaturverzeichnis}}
\printbibliography%[heading=head]
</xsl:text>
        <xsl:text>
            \end{document}</xsl:text>
    </xsl:template>
    
  <!-- /////////////////////////////////////////////////////////////////////////// -->  

    <!-- ____________________________________________________________________________ einzelne template matches ______________________________________________________________ -->
    
    
    <xsl:template match="t:body">
        <xsl:apply-templates/>
    </xsl:template>
    
    <xsl:template match="t:div[@type='originaltext']">
        <xsl:text>{</xsl:text>
        <xsl:if test="not($mode='interpretation')">
            <xsl:text>\setstretch{2}</xsl:text> <!-- nur in der Schuelerversion -->
        </xsl:if>
        <xsl:apply-templates/>
        <xsl:text>
            
            }</xsl:text>
    </xsl:template>
    
    
    <xsl:template match="t:div[@type='translation']">
        <xsl:text>\section*{Übersetzung} </xsl:text>
        <xsl:apply-templates/>
    </xsl:template>
    
    <xsl:template match="t:div">
        <xsl:apply-templates/>
    </xsl:template>
    
    
    <xsl:template match="t:head[parent::t:div[@type='translation']]">
        <xsl:text>\textbf{</xsl:text><xsl:if test="ancestor-or-self::*[@xml:lang='grc']">\selectlanguage{greek}
        </xsl:if><xsl:value-of select="."/><xsl:text>} </xsl:text>
    </xsl:template>
    
    <xsl:template match="t:head[@n='Gliederung']">
        <xsl:apply-templates/>
    </xsl:template>
    
    <xsl:template match="t:head[@rend='chapter']">
        <xsl:text>\subsection*{</xsl:text><xsl:if test="ancestor-or-self::*[@xml:lang='grc']">\selectlanguage{greek}
        </xsl:if><xsl:apply-templates/><xsl:text>} </xsl:text>
        
    </xsl:template>
    
    <xsl:template match="t:head[@rend='sub']">
        <xsl:text>\subsubsection*{</xsl:text><xsl:if test="ancestor-or-self::*[@xml:lang='grc']">\selectlanguage{greek}
        </xsl:if><xsl:apply-templates/><xsl:text>} </xsl:text>
    </xsl:template>  
    
    
    <xsl:template match="t:head">
        <!-- <xsl:text>{\bfseries</xsl:text> --><xsl:text>\subsection*{</xsl:text>
        <xsl:if test="//t:div[@type='originaltext']/descendant::t:p[@xml:lang='grc']"><xsl:text>\selectlanguage{greek}</xsl:text></xsl:if><xsl:apply-templates/><xsl:text>} </xsl:text>
    </xsl:template>

    <xsl:template match="t:seg[@type = 'Struktur' or @type = 'Inhalt']">
        <!-- loeschen außer im Lehrermodus -->
        <xsl:if test="$mode='interpretation'">
            <xsl:text>
                
                {\color{black!50}\MakeUppercase{</xsl:text><xsl:value-of select="."/><xsl:text>}}
            
            </xsl:text>
        </xsl:if>
    </xsl:template>
    
    <xsl:template match="t:milestone">
        <!-- danke, Ende. -->
    </xsl:template>
    
    <!-- l and p (old) 
    <xsl:template match="t:l">
       <xsl:if test="parent::t:lg[@xml:lang='grc']"><xsl:text>\textgreek</xsl:text></xsl:if>
        <xsl:text>{</xsl:text><xsl:apply-templates/><xsl:text>}\\</xsl:text>
    </xsl:template>
    
    <xsl:template match="t:p">
        <xsl:if test="@xml:lang[.='grc']"><xsl:text>\textgreek</xsl:text></xsl:if>
        <xsl:text>{</xsl:text><xsl:apply-templates/><xsl:text>}</xsl:text>\\
    </xsl:template>-->  
    

    
    <xsl:template match="t:l">
        <xsl:if test="$mode = 'interpretation' and not(. = '')">
            <xsl:text>{\color{black!60}\footnotesize </xsl:text><xsl:value-of select="replace(replace(@met, '[aáà]', '--- '), '[uúù]', 'v ')"/> <xsl:text>} \\ \vspace{-0.5em} </xsl:text>
        </xsl:if>
        <xsl:if test="contains(@met,'pentameter') or contains(@real,'pentameter')"><xsl:text>\phantom{xxxx} </xsl:text>
        </xsl:if>
        <xsl:apply-templates/><xsl:text>\\             
        </xsl:text>
    </xsl:template>
    
    <xsl:template match="t:p[ancestor::t:div[@type='originaltext']]">
        <!--  \paragraphnr --><xsl:apply-templates/>
        <xsl:text xml:space="preserve">\\[0.5em]
           
       </xsl:text>
    </xsl:template>
    
     <xsl:template match="t:p">
        <!--  \paragraphnr --><xsl:apply-templates/>
        <xsl:text xml:space="preserve">
           
       </xsl:text>
    </xsl:template>
    
    
    
    
    <xsl:template match="t:hi[matches(@rend,'(Vokabel|Sacherklärung|Stilistik|Grammatik)')]">
        <xsl:text>\textbf{</xsl:text><xsl:apply-templates/><xsl:text>} </xsl:text>
    </xsl:template>   
    
    <xsl:template match="t:hi[@rend='italic' or @rend='Einzelwort-Latein']">
        <xsl:text>\emph{</xsl:text><xsl:apply-templates/><xsl:text>} </xsl:text>
    </xsl:template>   
    

    
    <xsl:template match="t:ab"><xsl:apply-templates/><xsl:text>\\ </xsl:text></xsl:template>
    
    <xsl:template match="t:hi[@rend='superscript']">
        <xsl:text>\textsuperscript{</xsl:text><xsl:apply-templates/><xsl:text>} </xsl:text>
    </xsl:template>  
    
    <xsl:template match="t:cit">
        <xsl:text>\begin{quote} </xsl:text><xsl:apply-templates/><xsl:text>\end{quote} </xsl:text>
    </xsl:template>
    
    <xsl:template match="t:code">
        <!-- in this LaTeX stylesheet, some XML highlighting is enabled. If code highlighting in another language is wanted, specify above (listings environment \lstset) -->
        <xsl:text>\begin{lstlisting} </xsl:text><xsl:apply-templates/><xsl:text>\end{lstlisting}</xsl:text>
    </xsl:template>
    
    <!-- wird dies noch gebraucht? ich finde ja xml:lang?? oder steht das nicht ueberall dabei?  -->
    <xsl:template match="t:seg[@xml:lang='grc']">
        <xsl:text>\textgreek{</xsl:text>
        <xsl:apply-templates/>
        <xsl:text>} </xsl:text>
    </xsl:template>

    
    <xsl:template match="t:seg[@xml:lang='la']">
        <xsl:text>\emph{</xsl:text>
        <xsl:apply-templates/>
        <xsl:text>} </xsl:text>
    </xsl:template>

    <!-- TODO: Verarbeitung der Intext-Referenzen fehlt hier noch!
    bzw. die werden hier dann halt behandelt wie "echte Zitate" für die BibTeX natuerlich keine Aufloesung / Eintrag findet-->   
    
    <xsl:template match="t:ref[not(ancestor::t:teiHeader)]">
        <!-- insert or delete space before "\cite" for (author YEAR) or footnotes respectively, depending on desired citation style-->
  
        <xsl:choose>
            <xsl:when test="contains(.,'::')">
                <xsl:text>\emph{</xsl:text><xsl:value-of select="substring-before(.,'::')"/><xsl:text>}, </xsl:text><xsl:value-of select="substring-after(.,'::')"/>
            </xsl:when>
            <xsl:otherwise><xsl:text>\emph{</xsl:text><xsl:value-of select="."/><xsl:text>} </xsl:text></xsl:otherwise>
        </xsl:choose>
        
        <!-- 
        <ref target="#King-1998::836">King, 1998::836.</ref>
        biblStruct xml:id="King-1998"
        if not contains '::'
        #Phaedrus (fixe Anzahl / Keywords für unsere Texte
        if matches vgl-stelle ID
        für alle anderen contains(.  = Zitatname
        -->
    </xsl:template>
   

    
    <xsl:template match="t:note">
        <!-- loeschen
            <xsl:template match="t:note">
        <xsl:text>\footnote{</xsl:text><xsl:apply-templates/><xsl:text>}</xsl:text>
    </xsl:template>
        -->
    </xsl:template>
    

    
    
    <xsl:template match="*[@xml:lang]">
        <xsl:choose>
            <xsl:when test="@xml:lang='grc'">
                <xsl:text>{\selectlanguage{greek}</xsl:text><xsl:apply-templates/><xsl:text>} </xsl:text>
            </xsl:when>
            <!-- superfluous selectlang latin - omitting: 
            <xsl:when test="@xml:lang='la'">
                <xsl:text>{\selectlanguage{latin} </xsl:text><xsl:apply-templates/><xsl:text>}</xsl:text>
            </xsl:when> -->
            <xsl:otherwise><xsl:apply-templates/></xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
    
    <!-- ................................. mode ANGABEN ................................. -->
    
    <xsl:template match="t:note" mode="angaben">
        <xsl:apply-templates mode="angaben"/>
    </xsl:template>
    
    
    <xsl:template match="t:hi[@rend = 'italic']" mode="angaben">
        <xsl:text>\emph{</xsl:text>
            <xsl:apply-templates mode="angaben
                "/>
        <xsl:text>} </xsl:text>
    </xsl:template>
    
    <xsl:template match="t:seg[@xml:lang='la'] | t:seg[@xml:lang='grc']" mode="angaben">
        <xsl:text>\emph{</xsl:text><xsl:apply-templates mode="angaben
                "/>
        <xsl:text>} </xsl:text>
    </xsl:template>
    
    <xsl:template match="t:ref" mode="angaben">
        <xsl:choose>
            <xsl:when test="contains(.,'::')">
                <xsl:text>\emph{</xsl:text><xsl:value-of select="substring-before(.,'::')"/><xsl:text>},</xsl:text><xsl:value-of select="substring-after(.,'::')"/>
            </xsl:when>
            <xsl:otherwise><xsl:apply-templates/></xsl:otherwise>
        </xsl:choose>
        
        <!-- 
        <ref target="#King-1998::836">King, 1998::836.</ref>
        biblStruct xml:id="King-1998"
        if not contains '::'
        #Phaedrus (fixe Anzahl / Keywords für unsere Texte
        if matches vgl-stelle ID
        für alle anderen contains(.  = Zitatname
        -->
    </xsl:template>
    
    <xsl:template match="t:seg[@xml:lang='grc']" mode="angaben">
        <xsl:text>\textgreek{</xsl:text>
        <xsl:apply-templates/>
        <xsl:text>} </xsl:text>
    </xsl:template>
    
    <xsl:template match="*[@xml:lang]" mode="angaben">
        <xsl:choose>
            <xsl:when test="@xml:lang='grc'">
                <xsl:text>{\selectlanguage{greek}</xsl:text><xsl:apply-templates/><xsl:text>} </xsl:text>
            </xsl:when>
            <xsl:when test="@xml:lang='la'">
                <xsl:text>\emph{</xsl:text><xsl:apply-templates/><xsl:text>}</xsl:text>
            </xsl:when> 
            <xsl:otherwise><xsl:apply-templates/></xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
    <!-- ///////////  mode = INTERP //////////////////////////////////////////////////////////////// -->  
    
    <xsl:template match="t:head[ancestor::t:div[@type='Interpretationsfrage']]" mode="interp">
        <xsl:choose>
            <xsl:when test="$mode='interpretation'">
                <xsl:text>\vspace{1em} \item {\bfseries\normalsize </xsl:text><xsl:apply-templates mode="interp"/><xsl:text>} \\</xsl:text>
            </xsl:when>
            <xsl:otherwise>
                <xsl:text>\item {</xsl:text><xsl:apply-templates mode="interp"/><xsl:text>}</xsl:text>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
    
    <xsl:template match="t:p[@n='Fließtext-Antwort']"  mode="interp">
        <!-- loeschen falls Schuelermodus -->
        <xsl:if test="$mode='interpretation'">
            <xsl:apply-templates mode="interp"/> <xsl:text>\\ </xsl:text> 
        </xsl:if> 
    </xsl:template>
    
    <!-- Achtung, die Tabelle geht nur mit 2 Spalten! -->
    
    <xsl:template match="t:table[@subtype='Vergleichstabelle']" mode="interp">
        <!-- nur in der Lehrerversion zeigen -->
       <xsl:if test="$mode='interpretation'">
           <xsl:text>\vspace{2em}\small\begin{tabular}{p{0.43\textwidth}|p{0.47\textwidth}}</xsl:text>
           <xsl:text>\textbf{</xsl:text> <xsl:value-of select="t:row[1]/t:cell[@role='label']"/><xsl:text>}</xsl:text> <xsl:text disable-output-escaping="yes"> <![CDATA[&]]> </xsl:text>  <xsl:text>\textbf{</xsl:text> <xsl:value-of select="t:row[2]/t:cell[@role='label']"/><xsl:text>}  \\ \hline </xsl:text>
           <xsl:for-each select="//t:row[1]/t:cell[@rend]">
               <xsl:variable name="cellposition" select="position()"/>
               <xsl:if test="string-length(@rend) > 1"><xsl:text>\textbf{\lbrack{}</xsl:text><xsl:value-of select="@rend"/><xsl:text>\rbrack{}}~ </xsl:text></xsl:if>
               <xsl:value-of select="."/> <xsl:text disable-output-escaping="yes"> <![CDATA[&]]> </xsl:text>
               <!-- <xsl:value-of select="$cellposition"/> -->
               <xsl:if test="string-length(ancestor::t:row/ancestor::t:table/t:row[2]/t:cell[@rend][$cellposition]/@rend) > 1"><xsl:text>\textbf{\lbrack{}</xsl:text><xsl:value-of select="ancestor::t:row/ancestor::t:table/t:row[2]/t:cell[@rend][$cellposition]/@rend"/><xsl:text>\rbrack{}}~ </xsl:text>
               </xsl:if>
               <xsl:value-of select="ancestor::t:row/ancestor::t:table/t:row[2]/t:cell[@rend][$cellposition]"/><xsl:text>\\
            
            </xsl:text>   
           </xsl:for-each>
           <xsl:text>\end{tabular}\normalsize\\[1em] 
        
        </xsl:text>
       </xsl:if>
    </xsl:template>
    
    <xsl:template match="t:seg[@xml:lang='grc']" mode="interp">
        <xsl:text>\textgreek{</xsl:text>
        <xsl:apply-templates mode="interp"/>
        <xsl:text>} </xsl:text>
    </xsl:template>
    
    
    <xsl:template match="t:seg[@xml:lang='la']" mode="interp">
        <xsl:text>\emph{</xsl:text>
        <xsl:apply-templates mode="interp"/>
        <xsl:text>}  </xsl:text>
    </xsl:template>
    
    <!-- TODO: Verarbeitung der Intext-Referenzen fehlt hier noch!
    bzw. die werden hier dann halt behandelt wie "echte Zitate" für die BibTeX natuerlich keine Aufloesung / Eintrag findet-->   
    
    <xsl:template match="t:ref[not(ancestor::t:teiHeader)]" mode="interp">
        <!-- insert or delete space before "\cite" for (author YEAR) or footnotes respectively, depending on desired citation style-->
        <!-- 
                <xsl:text> \cite</xsl:text>
        <xsl:for-each select="@target">
            <xsl:choose>
                <xsl:when test="contains(.,'::')">
                    <xsl:text>[</xsl:text><xsl:value-of select="translate(translate(substring-after(.,'::'),'-–','-'),'#äöü,.','')"/><xsl:text>]{</xsl:text><xsl:value-of select="translate(translate(substring-before(.,'::'),'-–#äöü,.',''),' ','')"/>
                </xsl:when>
                <xsl:otherwise><xsl:text>{</xsl:text><xsl:value-of select="translate(.,'#äöü.,-–','')"/></xsl:otherwise>
            </xsl:choose><xsl:text>}</xsl:text>
        </xsl:for-each>  
        -->
        <xsl:choose>
            <xsl:when test="contains(.,'$$Glossar')">
                    <xsl:text>\emph{</xsl:text><xsl:value-of select="substring-before(.,'$$')"/><xsl:text>}, </xsl:text><xsl:value-of select="substring-after(.,'::')"/>
                </xsl:when>
            
            <xsl:when test="contains(.,'::')">
                <xsl:text>\emph{</xsl:text><xsl:value-of select="substring-before(.,'::')"/><xsl:text>}, </xsl:text><xsl:value-of select="substring-after(.,'::')"/>
            </xsl:when>
            <xsl:otherwise><xsl:text>\emph{</xsl:text><xsl:apply-templates/><xsl:text>} </xsl:text></xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
    
    
    <!-- ................................. mode VGL ................................. -->
    
    
    <xsl:template match="t:l" mode="vgl"> <!-- doppelte Regel?? -->
        <xsl:if test="contains(@met,'pentameter') or contains(@real,'pentameter')"><xsl:text> \phantom{x}~ </xsl:text></xsl:if>
        <xsl:text>{</xsl:text>
        <xsl:if test="ancestor-or-self::*[@xml:lang='grc']"><xsl:text>\selectlanguage{greek} </xsl:text>
        </xsl:if>
        <xsl:apply-templates mode="vgl"/><xsl:text xml:space="preserve">}\vspace{0.2em} 

        </xsl:text>
    </xsl:template>
    
    
    <xsl:template match="t:p" mode="vgl">
        <xsl:if test="contains(@met,'pentameter') or contains(@real,'pentameter')"><xsl:text> \phantom{x}~ </xsl:text></xsl:if>
        <xsl:if test="ancestor-or-self::*[@xml:lang='grc']"><xsl:text>\selectlanguage{greek} </xsl:text>
        </xsl:if>
        <xsl:apply-templates mode="vgl"/>
        <xsl:text xml:space="preserve">\vspace{0.2em} 
           
       </xsl:text>
    </xsl:template>
    
    <xsl:template match="t:head" mode="vgl">
        <xsl:text>\subsubsection*{</xsl:text><xsl:if test="ancestor-or-self::*[@xml:lang='grc']"><xsl:text>\selectlanguage{greek} </xsl:text>
        </xsl:if><xsl:apply-templates/><xsl:text xml:space="preserve">} 
        
        </xsl:text>
    </xsl:template>

    <xsl:template match="t:head[parent::t:div[@type='translation']]" mode="vgl">
        <xsl:text>\subsubsection*{</xsl:text><xsl:if test="ancestor-or-self::*[@xml:lang='grc']"><xsl:text>\selectlanguage{greek} </xsl:text>
        </xsl:if><xsl:apply-templates/><xsl:text xml:space="preserve">} 
        
        </xsl:text>
    </xsl:template>
    
    <xsl:template match="t:div[@type='translation']" mode="vgl">
        <xsl:text>
        {\color{black!60}
        </xsl:text>
        <xsl:if test="ancestor-or-self::*[@xml:lang='grc']"><xsl:text>\selectlanguage{greek} </xsl:text>
        </xsl:if>
        <xsl:apply-templates mode="vgl"/>
        <xsl:text xml:space="preserve">} \\
            
        </xsl:text>
    </xsl:template>
   
    <!-- durch fehlenden Zeilenumbruch nach dem \phantom ist das quasi auskommentiert im finalen Output -->
  <xsl:template match="t:span[@type = 'Textgrundlage']" mode="vgl">
        <xsl:text> %\faBook\phantom{x} </xsl:text><xsl:value-of select="translate(t:ref/@target, '-', '')"/>
        <xsl:text>\phantom{xxx} </xsl:text>
    </xsl:template> 
    
    <xsl:template match="t:span[@ana = 'Akteur']" mode="vgl">
        <xsl:choose>
            <xsl:when test="t:persName[@type = 'animal']">
                <xsl:text> %\faBug\phantom{x} 
                    \persontag{</xsl:text><xsl:value-of select="translate(t:persName,';',' ')"/>
                <xsl:text>}\phantom{xxx} </xsl:text>
            </xsl:when>
            <xsl:when test="t:persName[@type = 'person']">
                <xsl:text> %\faUser\phantom{x}
                \persontag{</xsl:text><xsl:value-of select="translate(t:persName,';',' ')"/>
                <xsl:text>}\phantom{x} </xsl:text>
            </xsl:when>
            <xsl:otherwise>
                <xsl:text> %\faUser\phantom{x} 
                \persontag{</xsl:text><xsl:value-of select="translate(t:persName,';',' ')"/>
                <xsl:text>}\phantom{x} </xsl:text>
            </xsl:otherwise>
        </xsl:choose> 
    </xsl:template>
    
    <xsl:template match="t:span[@ana = 'keyword']" mode="vgl">
        <xsl:text>%\faCommentsO\phantom{x} 
        \topictag{</xsl:text><xsl:value-of select="t:term"/>
        <xsl:text>}\phantom{x} </xsl:text>
    </xsl:template>
    

    
    <xsl:template match="t:l" mode="vgl">
        <xsl:if test="contains(@met,'pentameter') or contains(@real,'pentameter')"><xsl:text> \phantom{x}~ </xsl:text>
        </xsl:if>
        <xsl:text>{</xsl:text>
        <xsl:if test="ancestor-or-self::*[@xml:lang='grc']">\selectlanguage{greek}
        </xsl:if>
        <xsl:apply-templates mode="vgl"/><xsl:text>}\\ 
            
        </xsl:text>
    </xsl:template>
    
    <xsl:template match="*[@xml:lang]" mode="vgl">
        <xsl:if test="contains(@met,'pentameter') or contains(@real,'pentameter')"><xsl:text> \phantom{x}~~ </xsl:text></xsl:if>
        <xsl:choose>
            <xsl:when test="@xml:lang='grc'">
                <xsl:text>{\selectlanguage{greek}</xsl:text><xsl:apply-templates mode="vgl"/><xsl:text>} \vspace{0.2em} 
                
                </xsl:text>
            </xsl:when>
            <!-- superfluous selectlang latin - omitting: 
            <xsl:when test="@xml:lang='la'">
                <xsl:text>{\selectlanguage{latin} </xsl:text><xsl:apply-templates/><xsl:text>}</xsl:text>
            </xsl:when> -->
            <xsl:otherwise><xsl:apply-templates mode="vgl"/><xsl:text>\vspace{0.2em} 
                
            </xsl:text></xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <xsl:template match="text()" mode="vgl">
        <xsl:analyze-string select="." regex="([&amp;])|([_])|([$])|([\]])|([\[])|([&gt;])|([&lt;])|([#])|([\\])">
            <xsl:matching-substring>
                <xsl:choose>
                    <xsl:when test="regex-group(1)">
                        <xsl:text>\&amp; </xsl:text>
                    </xsl:when>
                    <xsl:when test="regex-group(2)">
                        <xsl:text>\_ </xsl:text>
                    </xsl:when>
                    <xsl:when test="regex-group(3)">
                        <xsl:text> </xsl:text><!-- \$ -->
                    </xsl:when>
                    <xsl:when test="regex-group(4)">
                        <xsl:text>\rbrack{}</xsl:text>
                    </xsl:when>
                    <xsl:when test="regex-group(5)">
                        <xsl:text>\lbrack{}</xsl:text>
                    </xsl:when>
                    <xsl:when test="regex-group(6)">
                        <xsl:text>\textgreater{}</xsl:text>
                    </xsl:when>
                    <xsl:when test="regex-group(7)">
                        <xsl:text>\textless{}</xsl:text>
                    </xsl:when>
                    <xsl:when test="regex-group(8)">
                        <xsl:text> </xsl:text> <!-- \# -->
                    </xsl:when>
                    <xsl:when test="regex-group(9)">
                        <xsl:text>\textbackslash </xsl:text>
                    </xsl:when>
                    <xsl:otherwise/>
                </xsl:choose>
            </xsl:matching-substring>
            <xsl:non-matching-substring>
                <xsl:value-of select="." />
            </xsl:non-matching-substring>
        </xsl:analyze-string>
    </xsl:template>
    
 <!-- ///////////////// muss die letzte Regel sein ////////////////////////////////////////77 -->
    
    <xsl:template match="text()">
        <xsl:analyze-string select="." regex="([&amp;])|([_])|([$])|([\]])|([\[])|([&gt;])|([&lt;])|([#])|([\\])"> <!-- |([\{])|([\}]) geht nicht -->
            <xsl:matching-substring>
                <xsl:choose>
                    <xsl:when test="regex-group(1)">
                        <xsl:text>\&amp; </xsl:text>
                    </xsl:when>
                    <xsl:when test="regex-group(2)">
                        <xsl:text>\_ </xsl:text>
                    </xsl:when>
                    <xsl:when test="regex-group(3)">
                        <xsl:text> </xsl:text><!-- \$ -->
                    </xsl:when>
                    <xsl:when test="regex-group(4)">
                        <xsl:text>\rbrack{}</xsl:text>
                    </xsl:when>
                    <xsl:when test="regex-group(5)">
                        <xsl:text>\lbrack{}</xsl:text>
                    </xsl:when>
                    <xsl:when test="regex-group(6)">
                        <xsl:text>\textgreater{}</xsl:text>
                    </xsl:when>
                    <xsl:when test="regex-group(7)">
                        <xsl:text>\textless{}</xsl:text>
                    </xsl:when>
                    <xsl:when test="regex-group(8)">
                        <xsl:text> </xsl:text> <!-- \# -->
                    </xsl:when>
                    <xsl:when test="regex-group(9)">
                        <xsl:text>\textbackslash </xsl:text>
                    </xsl:when>
                    <xsl:otherwise/>
                </xsl:choose>
            </xsl:matching-substring>
            <xsl:non-matching-substring>
                <xsl:value-of select="." />
            </xsl:non-matching-substring>
        </xsl:analyze-string>
    </xsl:template>
    
    <xsl:template match="text()" mode="interp">
        <xsl:analyze-string select="." regex="([&amp;])|([_])|([$])|([\]])|([\[])|([&gt;])|([&lt;])|([#])|([\\])"> <!-- |([\{])|([\}]) geht nicht -->
            <xsl:matching-substring>
                <xsl:choose>
                    <xsl:when test="regex-group(1)">
                        <xsl:text>\&amp; </xsl:text>
                    </xsl:when>
                    <xsl:when test="regex-group(2)">
                        <xsl:text>\_ </xsl:text>
                    </xsl:when>
                    <xsl:when test="regex-group(3)">
                        <xsl:text> </xsl:text><!-- \$ -->
                    </xsl:when>
                    <xsl:when test="regex-group(4)">
                        <xsl:text>\rbrack{}</xsl:text>
                    </xsl:when>
                    <xsl:when test="regex-group(5)">
                        <xsl:text>\lbrack{}</xsl:text>
                    </xsl:when>
                    <xsl:when test="regex-group(6)">
                        <xsl:text>\textgreater{}</xsl:text>
                    </xsl:when>
                    <xsl:when test="regex-group(7)">
                        <xsl:text>\textless{}</xsl:text>
                    </xsl:when>
                    <xsl:when test="regex-group(8)">
                        <xsl:text> </xsl:text> <!-- \# -->
                    </xsl:when>
                    <xsl:when test="regex-group(9)">
                        <xsl:text>\textbackslash </xsl:text>
                    </xsl:when>
                    <xsl:otherwise/>
                </xsl:choose>
            </xsl:matching-substring>
            <xsl:non-matching-substring>
                <xsl:value-of select="." />
            </xsl:non-matching-substring>
        </xsl:analyze-string>
    </xsl:template>
    
    <!-- würde stattdessen auch funktionieren...
     <xsl:template match="text()">
     <xsl:value-of select="translate(., '&#xA0;', ' ')"/>
 </xsl:template>
    -->
</xsl:stylesheet>