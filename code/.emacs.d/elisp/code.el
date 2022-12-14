(require 'org-tempo)
(require 'org)
(require 'ob-js)
(org-babel-do-load-languages 'org-babel-load-languages org-babel-load-languages)
(add-to-list 'org-babel-tangle-lang-exts '("js" . "js"))
(cond ((eq system-type 'windows-nt)
;; Windows-specific code goes here.
(setq python-shell-interpreter "C:\\Users\\pc\\AppData\\Local\\Programs\\Python\\Python310\\python.exe"
      org-babel-python-command "C:\\Users\\pc\\AppData\\Local\\Programs\\Python\\Python310\\python.exe"
)
)
((eq system-type 'gnu/linux)
;; Linux-specific code goes here.
(setq org-babel-python-command "python3")

))
(setq org-src-preserve-indentation t
org-export-with-smart-quotes t
org-export-with-toc nil
;org-latex-classes nil
org-export-with-author nil
org-export-with-title nil
org-src-fontify-natively t
org-export-latex-listings t
org-latex-listings 'listings
org-latex-prefer-user-labels t
org-confirm-babel-evaluate nil
org-latex-pdf-process '("latexmk -xelatex -bibtex -f %f")

;org-babel-python-command "/usr/bin/env python3"
)

(add-to-list 'org-latex-packages-alist '("" "listings"))
(require 'ox-latex)
(eval-after-load "org"
(progn
(org-babel-do-load-languages
'org-babel-load-languages
'(
(python . t)
(ditaa . t)
(shell . t)
(js . t)
))
)
)

; links:
; https://so.nwalsh.com/2020/01/05-latex
; https://www.linuxjournal.com/content/org-mode-latex-exporter-latex-non-texers
; https://github.com/wonrax/vietnamese-bibtex/blob/main/example/example.tex
; https://rgoswami.me/posts/org-arb-tex/

(setq org-latex-classes
'(("article"
"\\RequirePackage{fix-cm}
\\PassOptionsToPackage{svgnames}{xcolor}
\\documentclass{article}
\\usepackage{graphicx}
\\usepackage{grffile}
\\usepackage{longtable}
\\usepackage{wrapfig}
\\usepackage{rotating}
\\usepackage[normalem]{ulem}
\\usepackage{amsmath}
\\usepackage{textcomp}
\\usepackage{amssymb}
\\usepackage{capt-of}
\\usepackage{hyperref}
\\usepackage{enumitem}
\\usepackage[a4paper,left=3cm,right=2cm,top=2cm,bottom=2cm]{geometry}
\\usepackage[fontsize=13pt]{scrextend}
\\usepackage{indentfirst}
\\usepackage{polyglossia}
\\setdefaultlanguage{vietnamese}
\\usepackage{fontspec}
\\setmainfont{Times New Roman}
%\\setromanfont{Times New Roman}
%\\setsansfont[Scale=MatchLowercase]{Times New Roman}
%\\setmonofont[Scale=MatchLowercase]{Arial}
%\\usepackage{sectsty}
%\\allsectionsfont{\\rmfamily}
\\usepackage{listings}
\\usepackage{amsthm}
\\usepackage{xpatch}

% Khoang cach 1cm dau doan
\\setlength{\\parindent}{1cm}

%\\setsansfont[Scale=MatchLowercase]{Times New Roman}
%\\setmonofont[Scale=MatchLowercase]{Arial}
%\\usepackage{sectsty}
%\\allsectionsfont{\\rmfamily}
\\usepackage{enumitem}
\\usepackage{listings}
\\lstset{frame=single,aboveskip=1em,
framesep=.5em,backgroundcolor=\\color{AliceBlue},
rulecolor=\\color{LightSteelBlue},framerule=1pt}
\\usepackage{setspace}
\\usepackage{xcolor}
\\newcommand\\basicdefault[1]{\\scriptsize\\color{Black}\\rmfamily#1}
\\lstset{basicstyle=\\basicdefault{\\spaceskip1em}}
\\lstset{literate=
{??}{{\\S}}1
{??}{{\\raisebox{.125ex}{\\copyright}\\enspace}}1
{??}{{\\guillemotleft}}1
{??}{{\\guillemotright}}1
{??}{{\\'A}}1
{??}{{\\\"A}}1
{??}{{\\'E}}1
{??}{{\\'I}}1
{??}{{\\'O}}1
{??}{{\\\"O}}1
{??}{{\\'U}}1
{??}{{\\\"U}}1
{??}{{\\ss}}2
{??}{{\\`a}}1
{??}{{\\'a}}1
{??}{{\\\"a}}1
{??}{{\\'e}}1
{??}{{\\'i}}1
{??}{{\\'o}}1
{??}{{\\\"o}}1
{??}{{\\'u}}1
{??}{{\\\"u}}1
{??}{{\\textsuperscript1}}1
{??}{{\\textsuperscript2}}1
{??}{{\\textsuperscript3}}1
{??}{{\\i}}1
{???}{{---}}1
{???}{{'}}1
{???}{{\\dots}}1
{???}{{$\\hookleftarrow$}}1
{???}{{\\textvisiblespace}}1,
keywordstyle=\\color{DarkGreen}\\bfseries,
identifierstyle=\\color{DarkRed},
commentstyle=\\color{Gray}\\upshape,
stringstyle=\\color{DarkBlue}\\upshape,
emphstyle=\\color{Chocolate}\\upshape,
showstringspaces=false,
columns=fullflexible,
keepspaces=true}
\\usepackage[a4paper,left=3cm,right=2cm,top=2cm,bottom=2cm]{geometry}
\\usepackage{parskip}
\\makeatletter
\\renewcommand{\\maketitle}{%
\\begingroup\\parindent0pt
\\sffamily
\\Huge{\\bfseries\\@title}\\par\\bigskip
\\LARGE{\\bfseries\\@author}\\par\\medskip
\\normalsize\\@date\\par\\bigskip
\\endgroup\\@afterindentfalse\\@afterheading}
\\makeatother

\\hypersetup{linkcolor=Blue,urlcolor=DarkBlue,
citecolor=DarkRed,colorlinks=true}
\\AtBeginDocument{\\renewcommand{\\UrlFont}{\\ttfamily}}
\\setlength{\\parindent}{1cm}

[NO-DEFAULT-PACKAGES]
[NO-PACKAGES]
"
("\\section{%s}" . "\\section*{%s}")
("\\subsection{%s}" . "\\subsection*{%s}")
("\\subsubsection{%s}" . "\\subsubsection*{%s}")
("\\paragraph{%s}" . "\\paragraph*{%s}")
("\\subparagraph{%s}" . "\\subparagraph*{%s}"))



("report" "\\documentclass[11pt]{report}

[NO-DEFAULT-PACKAGES]
[NO-PACKAGES]

"
("\\part{%s}" . "\\part*{%s}")
("\\chapter{%s}" . "\\chapter*{%s}")
("\\section{%s}" . "\\section*{%s}")
("\\subsection{%s}" . "\\subsection*{%s}")
("\\subsubsection{%s}" . "\\subsubsection*{%s}"))




("book" "\\documentclass[11pt]{book}"
("\\part{%s}" . "\\part*{%s}")
("\\chapter{%s}" . "\\chapter*{%s}")
("\\section{%s}" . "\\section*{%s}")
("\\subsection{%s}" . "\\subsection*{%s}")
("\\subsubsection{%s}" . "\\subsubsection*{%s}"))))



(add-to-list 'org-latex-classes
'("simple"
"\\RequirePackage{fix-cm}
\\PassOptionsToPackage{svgnames}{xcolor}
\\documentclass{report}
\\usepackage[utf8]{inputenc}
%\\usepackage[T1]{fontenc} % cause fontspec error
\\usepackage{graphicx}
\\usepackage{grffile}
\\usepackage{longtable}
\\usepackage{wrapfig}
\\usepackage{rotating}
\\usepackage[normalem]{ulem}
\\usepackage{amsmath}
\\usepackage{textcomp}
\\usepackage{amssymb}
\\usepackage{capt-of}
\\usepackage{hyperref}
\\usepackage{enumitem}
\\usepackage[a4paper,left=3cm,right=2cm,top=2cm,bottom=2cm]{geometry}
\\usepackage[fontsize=13pt]{scrextend}
\\usepackage{indentfirst}
\\usepackage{polyglossia}
\\setdefaultlanguage{vietnamese}
\\usepackage{fontspec}
\\setmainfont{Times New Roman}
%\\setromanfont{Times New Roman}
%\\setsansfont[Scale=MatchLowercase]{Times New Roman}
%\\setmonofont[Scale=MatchLowercase]{Arial}
%\\usepackage{sectsty}
%\\allsectionsfont{\\rmfamily}
\\usepackage{listings}
\\usepackage{amsthm}
\\usepackage{xpatch}

% Khoang cach 1cm dau doan
\\setlength{\\parindent}{1cm}
\\usepackage[nottoc,notlof,notlot,numbib]{tocbibind}
\\usepackage{setspace}

% Format chuong
\\newcommand{\\customchapterfont}{%
    \\large%
    \\bfseries%
}
\\makeatletter
\\renewcommand{\\@makechapterhead}[1]{%
%\\vspace*{25\\p@}%
{\\customchapterfont
\\centering
\\vspace{5pt}% % th??m kho???ng c??ch theo chi???u d???c
\\ifnum \\c@secnumdepth >\\m@ne
\\MakeUppercase{ \\@chapapp } \\space \\thechapter % ????nh s??? ch????ng
\\par\\nobreak
%\vskip 10\p@
\\fi
\\interlinepenalty\\@M
\\MakeUppercase{#1}\\par % ti??u ????? ch????ng
\\vspace{5pt}% % th??m kho???ng c??ch chi???u d???c
\\nobreak
\\vskip 20\\p@
}}
\\renewcommand{\\@makeschapterhead}[1]{%
\\vspace*{25\\p@}%
{\\customchapterfont
\\centering
\\vspace{5pt}% % th??m kho???ng c??ch chi???u d???c
\\interlinepenalty\\@M
\\MakeUppercase{#1}\\par % ti??u ????? ch????ng
\\vspace{5pt}% % th??m kho???ng c??ch chi???u d???c
\\nobreak
\\vskip 20\\p@
}}
\\makeatother

% Font section
\\makeatletter
\\renewcommand{\\section}{\\@startsection
{section}% % t??n
{1}% % th??? t???
{10mm}% % th???t ?????u d??ng
{-0.2\\baselineskip}% % tr?????c khi c??ch
{0.2\\baselineskip}% % sau khi c??ch
{\\bfseries}} % ki???u font

\\renewcommand{\\subsection}{\\@startsection
{subsection}% % t??n
{2}% % th??? t???
{10mm}% % th???t ?????u d??ng
{-0.2\\baselineskip}% % tr?????c khi c??ch
{0.2\\baselineskip}% % sau khi c??ch
{\\bfseries}} % ki???u font

\\renewcommand{\\subsubsection}{\\@startsection
{subsubsection}% % t??n
{3}% % th??? t???
{10mm}% % th???t ?????u d??ng
{-0.2\\baselineskip}% % tr?????c khi c??ch
{0.2\\baselineskip}% % sau khi c??ch
{\\bfseries}} % ki???u font
\\makeatother

% T??y bi???n m???c l???c c??c ch????ng, m???c
\\RequirePackage[titles]{tocloft}
\\setlength\\cftchapnumwidth{5em}
\\renewcommand\\cftchappresnum{Ch????ng~}
\\renewcommand{\\cftchapaftersnum}{:}
\\renewcommand{\\cftchapleader}{\\cftdotfill{\\cftdotsep}}
\\renewcommand\\cftchapafterpnum{\\vskip1mm}
%\\renewcommand{\\cftchapfont}{\\normalfont}
\\renewcommand{\\cftchappagefont}{\\normalfont}
\\setlength{\\cftbeforechapskip}{0mm}

% Dinh nghia Dinh ly
\\newtheoremstyle{plainindent}
  {0pt}   % ABOVESPACE
  {0pt}   % BELOWSPACE
  {\\normalfont}  % BODYFONT
  {\\parindent}% INDENT (empty value is the same as 0pt)
  {\\bfseries} % HEADFONT
  {.}         % HEADPUNCT
  {5pt plus 1pt minus 1pt} % HEADSPACE
  {}          % CUSTOM-HEAD-SPEC
\\xpatchcmd{proof}{\\itshape}{\\hspace{\\parindent}\\itshape}{}{}

\\theoremstyle{plainindent}
\\newtheorem{theorem}{?????nh l??}[section]
\\newtheorem{lemma}[theorem]{Lemma}
\\newtheorem{conj}[theorem]{Conjecture}
\\newtheorem{algorithm}{Thu???t to??n}[section]
\\newtheorem{definition}{?????nh ngh??a}[section]
\\theoremstyle{plainindent}
\\setlist[enumerate]{style=unboxed,topsep=0pt,leftmargin=0pt,labelindent=\\parindent}
\\setlist{noitemsep}
\\setlist[itemize]{style=unboxed,topsep=0pt,leftmargin=0pt,labelindent=\\parindent}

[NO-DEFAULT-PACKAGES]
%[PACKAGES]
%[EXTRA]

"
("\\chapter{%s}" . "\\chapter*{%s}")
("\\section{%s}" . "\\section*{%s}")
("\\subsection{%s}" . "\\subsection*{%s}")
("\\subsubsection{%s}" . "\\subsubsection*{%s}")
("\\paragraph{%s}" . "\\paragraph*{%s}")
("\\subparagraph{%s}" . "\\subparagraph*{%s}")))
