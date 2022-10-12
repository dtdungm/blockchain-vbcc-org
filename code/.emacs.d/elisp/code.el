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
\\usepackage[fontsize=13pt]{scrextend}
\\usepackage{fontspec}
\\usepackage{polyglossia}
\\setdefaultlanguage{vietnamese}
\\usepackage{indentfirst}
\\setmainfont{Times New Roman}
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
{§}{{\\S}}1
{©}{{\\raisebox{.125ex}{\\copyright}\\enspace}}1
{«}{{\\guillemotleft}}1
{»}{{\\guillemotright}}1
{Á}{{\\'A}}1
{Ä}{{\\\"A}}1
{É}{{\\'E}}1
{Í}{{\\'I}}1
{Ó}{{\\'O}}1
{Ö}{{\\\"O}}1
{Ú}{{\\'U}}1
{Ü}{{\\\"U}}1
{ß}{{\\ss}}2
{à}{{\\`a}}1
{á}{{\\'a}}1
{ä}{{\\\"a}}1
{é}{{\\'e}}1
{í}{{\\'i}}1
{ó}{{\\'o}}1
{ö}{{\\\"o}}1
{ú}{{\\'u}}1
{ü}{{\\\"u}}1
{¹}{{\\textsuperscript1}}1
{²}{{\\textsuperscript2}}1
{³}{{\\textsuperscript3}}1
{ı}{{\\i}}1
{—}{{---}}1
{’}{{'}}1
{…}{{\\dots}}1
{⮠}{{$\\hookleftarrow$}}1
{␣}{{\\textvisiblespace}}1,
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
[DEFAULT-PACKAGES]
\\hypersetup{linkcolor=Blue,urlcolor=DarkBlue,
citecolor=DarkRed,colorlinks=true}
\\AtBeginDocument{\\renewcommand{\\UrlFont}{\\ttfamily}}
[PACKAGES]
[EXTRA]
\\setlength{\\parindent}{1cm}
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
\\vspace*{25\\p@}%
{\\customchapterfont
\\centering
\\vspace{5pt}% % thêm khoảng cách theo chiều dọc
\\ifnum \\c@secnumdepth >\\m@ne
\\MakeUppercase{ \\@chapapp } \\space \\thechapter % đánh số chương
\\par\\nobreak
%\vskip 10\p@
\\fi
\\interlinepenalty\\@M
\\MakeUppercase{#1}\\par % tiêu đề chương
\\vspace{5pt}% % thêm khoảng cách chiều dọc
\\nobreak
\\vskip 20\\p@
}}
\\renewcommand{\\@makeschapterhead}[1]{%
\\vspace*{25\\p@}%
{\\customchapterfont
\\centering
\\vspace{5pt}% % thêm khoảng cách chiều dọc
\\interlinepenalty\\@M
\\MakeUppercase{#1}\\par % tiêu đề chương
\\vspace{5pt}% % thêm khoảng cách chiều dọc
\\nobreak
\\vskip 20\\p@
}}
\\makeatother

% Font section
\\makeatletter
\\renewcommand{\\section}{\\@startsection
{section}% % tên
{1}% % thứ tự
{10mm}% % thụt đầu dòng
{-0.2\\baselineskip}% % trước khi cách
{0.2\\baselineskip}% % sau khi cách
{\\bfseries}} % kiểu font

\\renewcommand{\\subsection}{\\@startsection
{subsection}% % tên
{2}% % thứ tự
{10mm}% % thụt đầu dòng
{-0.2\\baselineskip}% % trước khi cách
{0.2\\baselineskip}% % sau khi cách
{\\bfseries}} % kiểu font

\\renewcommand{\\subsubsection}{\\@startsection
{subsubsection}% % tên
{3}% % thứ tự
{10mm}% % thụt đầu dòng
{-0.2\\baselineskip}% % trước khi cách
{0.2\\baselineskip}% % sau khi cách
{\\bfseries}} % kiểu font
\\makeatother

% Tùy biến mục lục các chương, mục
\\RequirePackage[titles]{tocloft}
\\setlength\\cftchapnumwidth{5em}
\\renewcommand\\cftchappresnum{Chương~}
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
\\newtheorem{theorem}{Định lý}[section]
\\newtheorem{lemma}[theorem]{Lemma}
\\newtheorem{conj}[theorem]{Conjecture}
\\newtheorem{algorithm}{Thuật toán}[section]
\\newtheorem{definition}{Định nghĩa}[section]
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
