evtools::install_github("skranz/svgdiagram")

### call the function gv.to.svg in your R code.

example.gv.to.svg = function(){
  gv = "
digraph boxes {
c [label='c'];
p [label='p'];
S [label='S'];
eta;
eps [label='epsilon'];
q [label='q = beta0 + beta1 p + eps'];

c->p;
S->p;
p->q;
S->eps;
eta->eps;
eps -> q;
}
"
  svg = gv.to.svg(gv)
  setwd("D:/libraries/svgdiagram")
  gv = "iv.gv"
  svg = gv.to.svg(gv)
  svg

  app = eventsApp()
  app$ui = bootstrapPage(
    HTML(svg)
  )
  viewApp(app)
}

.ViZGloB = new.env()

#' @export
get.viz.v8 = function() {
  if (is.null(.ViZGloB$v8)) {
    ctx = .ViZGloB$v8 = v8()
    file = paste0(path.package("svgdiagram"),"/www/viz.js")
    ctx$source(file)
  }
  .ViZGloB$v8
}

sep.lines = function (txt, collapse = "\n") {
  if (length(txt) > 1)
      txt = merge.lines(txt, collapse)
  stringr::str_split(txt, collapse)[[1]]
}

make.viz.svg.org = function(dot, ctx = get.viz.v8()) {
  restore.point("make.viz.svg.org")

  str = paste0(sep.lines(dot), collapse="\n")
  str = gsub(x = str, "'", "\"")

  ctx$call("Viz",str)
}


make.viz.mem = memoise(make.viz.svg.org)

#' Create a svg file from a gv (Graphiviz) file or text
#' @param gv filename or source code of graphiviz diagram
#' @param use.memoise if TRUE memoise results
#' @param to.clipboard copy SVG source code to cliboard
#' @param out.file if not NULL save to outfile
#' @export
gv.to.svg = function(gv, use.memoise=TRUE, to.clipboard=is.null(out.file), out.file = NULL, adapt.latex=TRUE) {
  restore.point("gv.to.svg")

  # Check for a connection or file
  if (inherits(gv, "connection") || file.exists(gv)){
    gv <- readLines(gv, warn = FALSE)
    gv <- paste0(gv, collapse = "\n")
  } else {
    # Check for vector with length > 1 and concatenate
    if (length(gv) > 1){
      gv <- paste0(gv, collapse = "\n")
    }
  }
  if (use.memoise) {
    svg = make.viz.mem(gv)
  } else {
    svg = make.viz.org(gv)
  }
  Encoding(svg) = "UTF-8"
  if (adapt.latex)
    svg = adapt.svg.gv.latex(svg)
  if (!is.null(out.file))
    writeLines(svg, out.file,useBytes = TRUE)
  if (to.clipboard)
    writeClipboard(svg)
  if (!is.null(out.file)) return(invisible(svg))
  svg
}

adapt.svg.gv.latex = function(svg) {
  restore.point("adapat.svg.gv.latex")
  library(stringtools)
  svg = sep.lines(svg)
  lines = str.starts.with(svg,"<text ")
  txt = svg[lines]
  right = str.left.of(str.right.of(txt,">"),"</text>")
  left = str.left.of(txt,">")
  right =sapply(right,latex.to.textspan)
  svg[lines] = paste0(left,">", right,"</text>")
  merge.lines(svg)
}

gvToSvgAddin = function() {

  library(svgdiagram)
  doc = rstudioapi::getActiveDocumentContext()
  restore.point("gvToSvgAddin")
  file = basename(doc$path)
  dir = dirname(doc$path)

  ext = tools::file_ext(file)
  if (!identical(ext,"gv")) {
    cat("\nRStudio has not a .gv file in the current tab.")
    return()
  }
  out.file = paste0(dir,"/", tools::file_path_sans_ext(file),".svg")
  cat("\nCreate svg, this can take a while...")
  gv.to.svg(gv=doc$path,out.file=out.file,to.clipboard = TRUE)
  cat(paste0("\nsvg code copied to clipboard and saved as \n", out.file))
}

### example gv file
# -*- graphviz-dot -*-
digraph FP
{
	graph[ranksep=1.5,
	      ratio="compress",
	      overlap=prism,
	      concentrate=true,
	      label="Mighty family spaghetti of programming languages",
	      labelloc=t];

	subgraph cluster_Lisps
	{
		edge[color=red constraint=true];
		node[color=red];
		graph[pencolor=red,
		      label="Lisp family",
		      labelloc=b];

		"IPL" -> "Lisp" -> "InterLisp" -> "Lisp Machine Lisp" -> "ZetaLisp" -> "Common Lisp";
		"Lisp" -> "MacLisp" -> "Lisp Machine Lisp" -> "LMI Lisp" -> "Common Lisp";
		"MacLisp" -> "Scheme" -> "MultiLisp";
		"Scheme" -> "XLISP" -> "AutoLisp" -> "Vital-Lisp" -> "Visual Lisp";
		"MacLisp" -> "Emacs Lisp";
		"MacLisp" -> "NIL" -> "Common Lisp" -> "Dylan";
		"NIL" -> "T";
		"Common Lisp" -> "Clojure" -> "LFE";
		"Scheme" -> "Clojure";
		"Lisp" -> "Logo";
		"Lisp" -> "Franz Lisp";
		"Lisp" -> "Scheme" -> "T";
		"Scheme" -> "Racket" -> "Arc";
		"Racket" -> "Typed Racket" -> "Hackett";
		"Racket" -> "Lazy Racket" -> "Hackett";
		"Scheme" -> "Kawa";
		"Clojure" -> "Hy" -> "LFE";
		"Scheme" -> "newLISP";
		"Scheme" -> "Logo";
		"Common Lisp" -> "PicoLisp";
		"MacLisp" -> "Le Lisp" -> "EuLisp";
		"Le Lisp" -> "ISLISP";
		"Common Lisp" -> "EuLisp" -> "Dylan";
		"T" -> "EuLisp" -> "ISLISP" -> "OpenLisp";
		"Common Lisp" -> "Carp";
	}

	subgraph cluster_SASLs
	{
		edge[color=forestgreen constraint=true];
		node[color=forestgreen];
		graph[pencolor=forestgreen,
		      label="SASL family",
		      labelloc=b];

		subgraph foo
		{
			graph[rank=same];

			"NPL";
			"SASL";
		}

		"NPL" -> "Hope" -> "Miranda";
		"SASL" -> "KRC";
		"KRC" -> "Miranda" -> "Clean";
		"Miranda" -> "Orwell" -> "Haskell" -> "MetaHaskell";
		"Miranda" -> "Haskell" -> "Clean";
		"Haskell" -> "Curry";
		"Haskell" -> "O'Haskell";
		"Haskell" -> "Idris";
		"Haskell" -> "Elm";
	}

	subgraph cluster_MLs
	{
		edge[color=blue constraint=true];
		node[color=blue];
		graph[pencolor=blue,
		      label="ML family",
		      labelloc=b];

		"ML" -> "Standard ML" -> "Alice";
		"ML" -> "Dependent ML" -> "ATS";
		"ML" -> "CAML" -> "OCaml" -> "F*";
		"OCaml" -> "F#" -> "F*";
		"OCaml" -> "Nemerle";
		"OCaml" -> "Coq";
		"OCaml" -> "Grain";
	}

	subgraph cluster_APLs
	{
		edge[color=purple constraint=true];
		node[color=purple];
		graph[pencolor=purple,
		      label="APL family",
		      labelloc=b];

		"APL" -> "PPL";
		"APL" -> "J";
		"APL" -> "K" -> "Q";
		"APL" -> "A" -> "A+" -> "K";
		"APL" -> "FP" -> "FL" -> "J";
	}

	subgraph cluster_ALGOLs
	{
		edge[color=sienna constraint=true];
		node[color=sienna];
		graph[pencolor=sienna,
		      label="Algol family",
		      labelloc=b];

		"Algol 58" -> "Algol 60";
		"Algol 60" -> "Algol 68";
		"Algol 60" -> "ABC Algol";
		"Algol 60" -> "Algol X";
	}

	subgraph cluster_Cs
	{
		edge[color=orange constraint=true];
		node[color=orange];
		graph[pencolor=orange,
		      label="C family",
		      labelloc=b];

		"CPL" -> "BCPL";
		"BCPL" -> "B";
		"B" -> "C" -> "D";
		"C" -> "C++";
		"C" -> "Cyclone";
		"C" -> "Objective C";
		"C" -> "Alef";
		"C" -> "LPC" -> "Pike";
	}

	subgraph cluster_Pascals
	{
		edge[color=darkslateblue constraint=true];
		node[color=darkslateblue];
		graph[pencolor=darkslateblue,
		      label="Pascal family",
		      labelloc=b];

		"Euler";
		"Algol W" -> "Pascal";
		"Pascal" -> "Delphi";
		"Pascal" -> "Modula";
		"Delphi" -> "Nim";
		"Modula" -> "Modula-2";
		"Modula-2" -> "Modula-3";
		"Modula-2" -> "Oberon";
		"Modula-3" -> "Nim";
		"Oberon" -> "Oberon-2";
	}

	subgraph cluster_shells
	{
		edge[color=darkslategrey constraint=true];
		node[color=darkslategrey];
		graph[pencolor=darkslategrey,
		      label="Shell family",
		      labelloc=b];

		"Multics shell" -> "Unix shell";
		"Unix shell" -> "sh" -> "bash";
		"sh" -> "rc" -> "es";
		"sh" -> "csh";
		"sh" -> "ksh" -> "zsh";
		"sh" -> "scsh";
		"sh" -> "wish";
	}

	subgraph cluster_Squeakies
	{
		edge[color=cadetblue3 constraint=true];
		node[color=cadetblue3];
		graph[pencolor=cadetblue3,
		      label="Squeaky family",
		      labelloc=b];

		"Simula" -> "BETA";
		"Simula" -> "Smalltalk";
		"Smalltalk" -> "Self";
		"Smalltalk" -> "Squeak";
		"Self" -> "Io";
		"Squeak" -> "Newsqueak";
		"Newsqueak" -> "Scratch";
		"Scratch" -> "ScratchJr"
		"Simula" -> "CLU";
	}

	subgraph cluster_Prolog
	{
		edge[color=burlywood3 constraint=true];
		node[color=burlywood3];
		graph[pencolor=burlywood3,
		      label="Prolog family",
		      clusterrank=local
		      labelloc=b];

		"Planner" -> "Prolog";
		"Prolog" -> "Datalog";
		"Prolog" -> "Logtalk";
		"Prolog" -> "Pilog";
		"Prolog" -> "Poplog";
		"Prolog" -> "Mercury";
	}

	subgraph cluster_Basic
	{
		edge[color=maroon constraint=true];
		node[color=maroon];
		graph[pencolor=maroon,
		      label="Basic family",
		      clusterrank=local];

		"Dartmouth Basic" -> "HP Basic" -> "Integer Basic" -> "Applesoft Basic";
		"HP Basic" -> "VAX BASIC";
		"Dartmouth Basic" -> "Altair Basic" -> "Microsoft Basic" -> "IBM Basic" -> "GW-BASIC";
		"Microsoft Basic" -> "MS Basic for Macintosh" -> "Applesoft Basic" -> "Apple Business Basic";
		"Altair Basic" -> "MBASIC" -> "MSX Basic";
		"GW-BASIC" -> "MSX Basic" -> "Vilnius Basic";
		"GW-BASIC" -> "Quick Basic" -> "Visual Basic" -> "Visual Basic.NET";
		"Visual Basic" -> "Gambas";
		"Visual Basic" -> "VBScript";
		"Quick Basic" -> "QBasic" -> "QB32/QB64";
		"QBasic" -> "SmallBASIC";
		"Quick Basic" -> "Liberty Basic";
		"Quick Basic" -> "FreeBASIC";
		"GW-BASIC" -> "QBasic" -> "Microsoft Small Basic";
	}

	"Datalog" -> "SQL"[color=burlywood3];
	"Planner" -> "Scheme"[color=burlywood3];
	"Planner" -> "Smalltalk"[color=burlywood3];

	"ISWIM" -> "ML";
	"ISWIM" -> "SASL";
	"Lisp" -> "CLU"[color=red]; 
	"Lisp" -> "ISWIM"[color=red];
	"Lisp" -> "COWSEL"[color=red];
	"Lisp" -> "Forth"[color=red];
	"Logo" -> "Smalltalk"[color=red];
	"Scheme" -> "Pico"[color=red];
	"Scheme" -> "scsh"[color=red];

	"Smalltalk" -> "Logtalk"[color=cadetblue3];
	"Smalltalk" -> "Erlang"[color=cadetblue3];
	"Smalltalk" -> "Objective C"[color=cadetblue3];
	"Smalltalk" -> "Ruby"[color=cadetblue3];
	"CLU" -> "Lua"[color=cadetblue3];
	"CLU" -> "Python"[color=cadetblue3];
	"CLU" -> "Ruby"[color=cadetblue3];
	"Simula" -> "Eiffel"[color=cadetblue3];
	"Self" -> "Rebol"[color=cadetblue3];

	"COWSEL" -> "POP-2" -> "POP-11" -> "Poplog";

	"PicoLisp" -> "Pilog"[color=red];

	"Algol 58" -> "JOSS"[color=sienna];
	"Algol 60" -> "Algol W"[color=sienna];
	"Algol 60" -> "Euler"[color=sienna];
	"Algol 60" -> "CPL"[color=sienna];
	"Algol 60" -> "Simula"[color=sienna];
	"Algol 68" -> "Ada"[color=sienna];

	"Ada" -> "Chapel";

	"JOSS" -> "Dartmouth Basic";
	"JOSS" -> "Mumps";
	"Fortran" -> "IPL";
	"Fortran" -> "Dartmouth Basic";
	"Fortran" -> "Chapel";
	"Fortran" -> "Speakeasy" -> "MatLab" -> "Julia";
	"Fortran" -> "Comtran" -> "Cobol" -> "PL/I" -> "Rexx";
	"PL/I" -> "B";
	"PL/I" -> "Unix shell";

	"C" -> "csh"[color=orange];
	"C" -> "ZPL";
	
	"Newsqueak" -> "Alef";
	"Alef" -> "Limbo"[color=orange];
	"CSP" -> "Limbo" -> "Go";
	"CSP" -> "occam" -> "Go";

	"ALF" -> "Epigram" -> "Coq";
	"Epigram" -> "Agda";
	"Erlang" -> "Oz" -> "Alice";
	"Erlang" -> "Elixir";
	"Erlang" -> "LFE";

	"Forth" -> "Rebol" -> "Red";
	"Forth" -> "Factor";
	"Forth" -> "PostScript";

	"Coq" -> "Agda"[color=blue];
	"Haskell" -> "Agda"[color=forestgreen];
	"Haskell" -> "Hackett"[color=forestgreen];

	"Modula" -> "Lua"[color=darkslateblue];
	"Pascal" -> "Ada"[color=darkslateblue];
	"Pascal" -> "newLISP"[color=darkslateblue];

	"OCaml" -> "O'Haskell"[color=blue];
	"ML" -> "Miranda"[color=blue];

	"Cobol" -> "SNOBOL" -> "AWK" -> "Tcl" -> "wish";
	"AWK" -> "Perl" -> "PHP";
	"AWK" -> "sh";
	"COMIT" -> "SNOBOL" -> "SPITBOL";
	"Perl" -> "Perl 6";
	"Perl" -> "Python" -> "Hy";
	"Perl" -> "Ruby" -> "Crystal";
	"sh" -> "Perl"[color=darkslategrey];

	"APL" -> "Speakeasy"[color=purple];
	"J" -> "ZPL" -> "Chapel";
	"FP" -> "Joy"[color=purple];
	"S" -> "R" -> "Julia";
	"Speakeasy" -> "R";
	"PPL" -> "S"[color=purple];

	// subgraph cluster_old
	// {
	// 	pencolor=invis;
	// 	label="";
	// 	newrank=true;
	// }

	"First order logic" -> "Begriffsschrift" -> "PlankalkÃ¼l";
	"First order logic" -> "Combinatory logic" -> "Untyped lambda calculus";
	"First order logic" -> "Untyped lambda calculus";
	"Untyped lambda calculus" -> "Simply typed lambda calculus" -> "Higher order logic";
	"Turing machine";
	"Simply typed lambda calculus" -> "ML";
	"First order logic" -> "JavaScript" -> "INTERCAL";
	"Turing machine" -> "P''";
	"Combinatory logic" -> "P''" -> "Brainfuck";
	"Combinatory logic" -> "Unlambda";

	"Turing machine" -> "various autocodes" -> "IPL";
	"Machine code" -> "various autocodes" -> "Cobol";
	"various autocodes" -> "Fortran" -> "Algol 58";
	"First order logic" -> "APL";
	"Untyped lambda calculus" -> "Lisp";
	"PlankalkÃ¼l" -> "Algol 58";

	edge[style=dashed constraint=false];
	splines=true;
	concentrate=false;

	// "APL" -> "Forth"[color=purple];
	"APL" -> "MatLab"[color=purple];
	// "Ada" -> "C++";
	// "Ada" -> "Eiffel";
	// "Ada" -> "Ruby";
	// "Agda" -> "Idris";
	// "Algol 60" -> "Dartmouth Basic"[color=sienna];
	// "Algol 60" -> "PL/I"[color=sienna];
	// "Algol 60" -> "POP-2"[color=sienna];
	// "C" -> "Perl"[color=orange];
	// "C" -> "FreeBASIC"[color=orange];
	"C++" -> "Chapel";
	"Common Lisp" -> "PicoLisp"[color=red];
	// "Common Lisp" -> "Poplog"[color=red];
	"Coq" -> "Idris"[color=blue];
	// "Elm" -> "Grain"[color=forestgreen];
	// "Erlang" -> "Clojure";
	// "Erlang" -> "F#"
	// "Forth" -> "Joy";
	// "Fortran" -> "VAX BASIC";
	// "FP" -> "Haskell"[color=purple];
	// "Haskell" -> "Mercury"[color=forestgreen];
	// "Hope" -> "Mercury"[color=forestgreen];
	// "Hope" -> "Standard ML"[color=forestgreen];
	"InterLisp" -> "MultiLisp"[color=red];
	// "MetaHaskell" -> "Nemerle"[color=forestgreen];
	// "Modula" -> "Go"[color=darkslateblue];
	// "Prolog" -> "Curry"[color=burlywood3];
	// "Prolog" -> "Erlang"[color=burlywood3];
	// "Prolog" -> "Oz"[color=burlywood3];
	// "Prolog" -> "Erlang"[color=burlywood3];
	// "Rexx" -> "Perl";
	// "scsh" -> "newLISP"[color=darkslategrey];
	"Scheme" -> "Dylan"[color=red];
	// "Scheme" -> "K"[color=red];
	// "Scheme" -> "Lua"[color=red];
	// "Scheme" -> "R"[color=red];
	// "Scheme" -> "Tcl"[color=red];
	// "Self" -> "Factor"[color=cadetblue3];
	// "Simula" -> "C++"[color=cadetblue3];
	// "Smalltalk" -> "Dylan"[color=cadetblue3];
	// "SNOBOL" -> "Lua";
	// "Standard ML" -> "Poplog"[color=blue];
}
