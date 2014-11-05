% quizbowl.cls
% 
% quizbowl.cls is adapted in very small part from Jonah Greenthal's qbpacket.cls
% <jonah@jonahgreenthal.com>; fancyhdr bits adapted from Ankur Dave's
% ib-assignment.cls <ankurdave@gmail.com>.
%
% quizbowl.cls is used to format quizbowl packets and was used to great success
% for PADAWAN 2014. Basic document structure, with optional options, is:
%
% \begin{tus}
%   \tu{\power{Clues in power}; clues out of power. \ce{CO2} is a chemical formula.}
%      {\bu{required part} of answer [or \bu{required part} of alternate answer]}
% \end{tus}
%
% \begin{bons}
%   \bon{Bonus lead-in. For 10 points each:}
%       {First part prompt.}
%       {\bu{first part} answer}
%       {Second part prompt.}
%       {\bu{second part} answer}
%       {Third part prompt.}
%       {\bu{third part} answer}
% \end{bons}
%
% Questions are automatically numbered and other nice formatting is applied.
%
% Do whatever you want with this. 

% --- Identification -----------------------------------------------------------
\ProvidesClass{quizbowl}[2014/11/04 Quizbowl]

% --- Options ------------------------------------------------------------------
\DeclareOption{option}{code}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax
\LoadClass{article}

% --- Preliminary Declarations -------------------------------------------------
% *** Font requirements; bitstream-charter
\RequirePackage[bitstream-charter]{mathdesign}
  \renewcommand*{\rmdefault}{bch}
\RequirePackage[T1]{fontenc}
\RequirePackage[utf8]{inputenc}
% *** Layout & Formatting
\RequirePackage[margin=1in,headheight=44pt]{geometry}
\RequirePackage{microtype}
\RequirePackage{ragged2e}
\RequirePackage{amsmath}
% Automatic smart quotes; you'll need to do `` '' if quotes break across power.
\RequirePackage{csquotes}
% Changes \emph to underline.
\RequirePackage{ulem}
% For numbering tossup lines.
\RequirePackage{lineno}
% \ce to format chemical formulas.
\RequirePackage[version=3]{mhchem}
% *** fancyhdr requirements
\RequirePackage{lastpage}
\RequirePackage{fancyhdr}
\RequirePackage[colorlinks=true,urlcolor=blue,linkcolor=blue,citecolor=red]{hyperref}

% --- Main Declarations --------------------------------------------------------
% *** fancyhdr
\makeatletter
  \newcommand{\tourn}[1]{\def \@tourn {#1}}
  \tourn{}
  \newcommand{\tournauthor}[1]{\def \@tournauthor {#1}}
  \packet{}
  \newcommand{\packet}[1]{\def \@packet {#1}}
  \tournauthor{}

  \pagestyle{fancy}
  \fancyhf{}

  \fancyhead[L]{\large \@tourn\\Packet \@packet\\\normalsize\hyperref[tossups]{Tossups}}
  \fancyhead[R]{\large \@tournauthor\\\normalsize\hyperref[bonuses]{Bonuses}}
  \fancyfoot[R]{\large p. \textbf{\thepage} of \pageref{LastPage}}
\makeatother

% *** Formatting
\newcommand{\bu}[1]{\textbf{\emph{#1}}}
\newcommand{\power}[1]{\textbf{{#1} (*)}}
\renewcommand{\i}[1]{\textit{#1}}
\linespread{1.05}
% Font size.
\renewcommand{\normalsize}{\fontsize{10pt}{12pt}\selectfont}
% Make line numbers smaller & italic.
\renewcommand\linenumberfont{\normalfont\small\itshape}
% Uncomment to use ragged right instead of justified.
%\AtBeginDocument{\raggedright}
\MakeOuterQuote{"}

% *** Tossup & Bonus environments
\newenvironment{tus}
  {\newpage\section*{Tossups}\label{tossups}
   \modulolinenumbers[3]
   \newcounter{tunum}
   \begin{list}
     {\arabic{tunum}.}
     {\usecounter{tunum}
      \setlength{\leftmargin}{0in}
      \setlength{\rightmargin}{0in}}}
  {\end{list}}

\newenvironment{bons}
  {\newpage\section*{Bonuses}\label{bonuses}
   \newcounter{bnum}
   \begin{list}
     {\arabic{bnum}.}
     {\usecounter{bnum}
      \setlength{\leftmargin}{0in}
      \setlength{\rightmargin}{0in}}}
  {\end{list}}

% *** Tossup & Bonus commands
\newcommand{\tu}[2]
  {\filbreak
   \item\par   #1
   {\linenumbers*\par\vspace*{-0.125cm}}
   ANSWER:     #2}

\newcommand{\bon}[7]
  {\filbreak
   \item\par      #1
   \\* $ [10] $   #2
   \\*    ANSWER: #3
   \\* $ [10] $   #4
   \\*    ANSWER: #5
   \\* $ [10] $   #6
   \\*    ANSWER: #7}
