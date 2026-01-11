% doc.cls - Custom resume document class
% Based on article class with custom resume commands

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{doc}[2025/01/10 Custom Resume Document Class]

% Load base class
\LoadClass[11pt,letterpaper]{article}

% Required packages
\RequirePackage[margin=0.75in]{geometry}
\RequirePackage{fontspec}
\RequirePackage{xcolor}
\RequirePackage{hyperref}
\RequirePackage{titlesec}
\RequirePackage{enumitem}
\RequirePackage{parskip}

% Define theme color
\definecolor{themecolor}{named}{MidnightBlue}

% Storage for metadata
\newcommand{\@name}{}
\newcommand{\@email}{}
\newcommand{\@mobile}{}
\newcommand{\@linkedin}{}
\newcommand{\@github}{}
\newcommand{\@website}{}

% Metadata setters
\newcommand{\setname}[2]{\renewcommand{\@name}{#1}}
\newcommand{\setmail}[1]{\renewcommand{\@email}{#1}}
\newcommand{\setmobile}[1]{\renewcommand{\@mobile}{#1}}
\newcommand{\setlinkedinaccount}[1]{\renewcommand{\@linkedin}{#1}}
\newcommand{\setgithubaccount}[1]{\renewcommand{\@github}{#1}}
\newcommand{\setwebsite}[1]{\renewcommand{\@website}{#1}}
\newcommand{\setthemecolor}[1]{\definecolor{themecolor}{named}{#1}}

% Header view
\newcommand{\headerview}{%
  \begin{center}
    {\Huge\bfseries\@name}\\[0.5em]
    \small
    \ifx\@email\empty\else\href{mailto:\@email}{\@email}\fi
    \ifx\@mobile\empty\else~|~\@mobile\fi
    \ifx\@linkedin\empty\else~|~\href{\@linkedin}{LinkedIn}\fi
    \ifx\@github\empty\else~|~\href{\@github}{GitHub}\fi
    \ifx\@website\empty\else~|~\href{\@website}{Website}\fi
  \end{center}
}

% Section formatting
\titleformat{\section}
  {\Large\bfseries\color{themecolor}}
  {}
  {0em}
  {}
  [\titlerule]

% Skill separator
\newcommand{\cpshalf}{~|~}

% Create skill entry
\newcommand{\createskill}[2]{%
  \textbf{#1:} #2%
}

% Create skills section
\newcommand{\createskills}[1]{%
  #1%
}

% Dated experience entry
\newcommand{\datedexperience}[2]{%
  \vspace{0.5em}
  \noindent\textbf{\large #1}\hfill\textit{#2}\\
}

% Job title/explanation
\newcommand{\explanation}[2]{%
  \noindent\textit{\color{themecolor}#1}%
  \ifx&#2&\else~--~#2\fi\\
}

% Explanation detail - takes content as argument (not environment)
\newcommand{\explanationdetail}[1]{%
  \begin{itemize}[leftmargin=1.5em,nosep,label={\textcolor{themecolor}{\textbullet}}]
  #1
  \end{itemize}
}

% Colored bullet - creates an \item
\newcommand{\coloredbullet}{\item}

% Override default spacing commands to work inside itemize
\renewcommand{\smallskip}{}
\renewcommand{\bigskip}{\vspace{0.3em}}

% Hyperref setup
\hypersetup{
  colorlinks=true,
  linkcolor=themecolor,
  urlcolor=themecolor,
}

% Remove page numbers
\pagestyle{empty}

\endinput
