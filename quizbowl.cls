% quizbowl.cls
% liberally adapted from Jonah Greenthal's qbpacket.cls <jonah@jonahgreenthal.com>;
% fancyhdr bits adapted from Ankur Dave's ib-assignment.cls <ankurdave@gmail.com>.
% do whatever you want with this.

% --- Identification -----------------------------------------------------------
\ProvidesClass{quizbowl}[2014/04/03 

% --- Options ------------------------------------------------------------------
\DeclareOption{option}{code}
\DeclareOption*{
  \PassOptionsToClass{\CurrentOption}{article}
}
\ProcessOptions\relax
\LoadClass{article}

% --- Preliminary Declarations -------------------------------------------------
% fonts
%\RequirePackage{mathpazo}
%  \renewcommand*{\rmdefault}{ppl}
%\RequirePackage[scaled]{helvet}
%  \renewcommand*{\sfdefault}{phv}
%  \renewcommand*{\familydefault}{\sfdefault}
\RequirePackage{helvet,eulervm}
  \renewcommand*{\familydefault}{\sfdefault}
\RequirePackage[T1]{fontenc}
\RequirePackage[utf8]{inputenc}
% margins
\RequirePackage[margin=1in,headheight=44pt]{geometry}
% change \emph{} to underline
\RequirePackage{ulem}
% need amsmath package
\RequirePackage{amsmath}
\RequirePackage{lineno}
% space things a little
\linespread{1.05}

% --- Main Declarations --------------------------------------------------------
% *** fancyhdr
\makeatletter
  \newcommand{\tourn}[1]{\def \@tourn {#1}}
  \newcommand{\tournauthor}[1]{\def \@tournauthor {#1}}
  \newcommand{\packet}[1]{\def \@packet {#1}}
  \tourn{}
  \packet{}
  \tournauthor{}
  
  \RequirePackage{lastpage}
  \RequirePackage{fancyhdr}
  \pagestyle{fancy}
  \fancyhf{}

  \fancyhead[C]{\Large \@tourn}
  \fancyhead[L]{\large \@tournauthor}
  \fancyhead[R]{\large Packet \@packet}
  \fancyfoot[R]{\large Page \thepage of \pageref{LastPage}}
\makeatother
% *** Font Size
\renewcommand{\normalsize}{\fontsize{10pt}{12pt}\selectfont}

% *** TU/B commands
\newcommand{\tu}[2]{%
  \filbreak\item
  \par        #1
  {\linenumbers*\par\vspace*{-0.125cm}}
  ANSWER:     #2
}

\newcommand{\bonus}[7]{%
  \filbreak\item
  \par#1
  \\* $ [10] $   #2
  \\*    ANSWER: #3
  \\* $ [10] $   #4
  \\*    ANSWER: #5
  \\* $ [10] $   #6
  \\*    ANSWER: #7
}

% formatting stuff
\newcommand{\bu}[1]{\textbf{\emph{#1}}}
\newcommand{\power}[1]{\textbf{{#1} (*)}}
\renewcommand{\i}[1]{\textit{#1}}

% line number formatting
\renewcommand\linenumberfont{\normalfont\small\itshape}

% tossup & bonus environments
\newenvironment{tus}{%
  \newpage\section*{Tossups}
  \modulolinenumbers[3]
  \newcounter{tunum}
  \begin{list}{%
    \arabic{tunum}.
    }{%
    \usecounter{tunum}
    \setlength{\leftmargin}{0in}
    \setlength{\rightmargin}{0in}
  }
}{%
  \end{list}
}

\newenvironment{bonuses}{%
  \newpage\section*{Bonuses}
  \newcounter{bnum}
  \begin{list}{%
    \arabic{bnum}.
    }{%
    \usecounter{bnum}
    \setlength{\leftmargin}{0in}
    \setlength{\rightmargin}{0in}
  }
}{%
  \end{list}
}
