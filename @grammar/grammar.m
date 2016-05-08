## -*- texinfo -*-
## @deftypefn  {Function File} {} grammar ()
## @deftypefnx {Function File} {} grammar (@var{a})
## Creates a grammar from a JSON file.
##
## @example
## g = grammar ('myGrammar')
## @end example
##
## @noindent
## as an object of class grammar.
##
## The grammar in JSON format would look like in this example
## @example
## {
##   "N": "A",
##   "T": "a",
##   "P": [ [ "A", "Aa" ],
##          [ "A", "a"  ]
##        ],
##   "S": "A"
## }
## @end example
##
## and the file must be in the "defs" folder and have the ".json" extension.
## @end deftypefn
## 
## UMAFOL - grammar 1.0, fjvico, 2015/01/12
## Checked for Octave 3.2.4 and higher versions, not checked for Matlab.
## Distrubuted under CC0 (i.e. do not waste time attributing).


function g = grammar (fileName)

  if (nargin == 0)
    error ([mfilename "  ::::  the name of a JSON file is expected as argument."]);
  endif

  g = loadjson (["defs/" fileName ".json"]);
  g.emptyString = "ε";

  if (isempty (g.N))
    error ([mfilename "  ::::  Non-terminal set must have at least one symbol."]);
  endif
  if (ismember (g.emptyString, g.N))
    error ([mfilename "  ::::  The empty string cannot be a non-terminal symbol."]);
  endif
  if (isempty (g.T))
    error ([mfilename "  ::::  Terminal set must have at least one symbol."]);
  endif
  if (ismember (g.emptyString, g.T))
    error ([mfilename "  ::::  The empty string cannot be a terminal symbol."]);
  endif
  if (isempty (g.P))
    error ([mfilename "  ::::  Production rules set must have at least one rule."]);
  endif
  for idRule = 1:size (g.P, 2)
    for idPart = 1:2
      strg = g.P{idRule}{idPart};
      if (isempty (strg))
        error ([mfilename "  ::::  Elements of a rule cannot be empty, use the empty-string instead (" g.emptyString ")."]);
      endif    
      for idSymb = 1:length (strg)
        if ((~ismember (strg(idSymb), g.N)) && (~ismember (strg(idSymb), g.T)) && (strg(idSymb) ~= g.emptyString))
          error ([mfilename "  ::::  Symbol " strg(idSymb) " is not terminal nor non-terminal."]);
        endif
      endfor
    endfor
  endfor
  if (length (g.S) ~= 1)
    error ([mfilename "  ::::  The axiom must be one symbol."]);
  endif
  if (~ismember (g.S, g.N))
    error ([mfilename "  ::::  The axiom must be a non-terminal symbol."]);
  endif

  g = class (g, "grammar");

endfunction
