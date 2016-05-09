function d = DECODI(z) 
% d = DECODI(z)
% 	z : natural number that refers to a WHILE program 
% 	d : the result of decoding. Its a vector of 3 strings 
%		n: amount of input params
%		p: amount of total params
%		s: WHILE code
%
% Produce a syntactically correct program in WHILE language
% 
% Example:
% 	DECODI(5)
% 
% Juan Pedro Domínguez Berdún
%

  s = DeCodi (decantorKi (z, 3, 3));
  k = max (varRegExp (s));
  n = num2str (decantorKi (z, 3, 1));
  p = num2str ((decantorKi (z, 3, 2) + max (decantorKi (z, 3, 1), k)));

  d = strcat ("\n", n, " \n", p, " \n", s);

endfunction


  function dec = DeCodi (z) 
  % Generate WHILE-code from a natural number
  % Uses a loop to decode each sentence from a given WHILE-code encoded in a natural number

    dec = "";
    if(L(z) < 1)
      dec = decodi(degod (z+1, 0))
    else
      for i = 1:L(z)
        aux = decodi (degod (z+1, i));
        dec = strcat (dec, aux, ";");
      endfor
    endif

endfunction


function s = decodi (z)
% Generate sentences from a natural number depending on the value
% Matches the number given to a decoding function which returns the 
% correct sentence (in WHILE-code)

  var = typeSent (z);
  switch (var)
  case 0
    s = strcat("X", num2str (extr(z, 1)), ":=0");                                               # Returns X_:=0
  case 1
    s = strcat("X", num2str (extr(z, 1)), ":=X", num2str (extr(z, 2)));                         # Returns X_:=X_
  case 2
    s = strcat("X", num2str (extr(z, 1)), ":=X", num2str (extr(z, 2)), "+1");                   # Returns X_:=X_+1
  case 3
    s = strcat("X", num2str (extr(z, 1)), ":=X", num2str (extr(z, 2)), "-1");                   # Returns X_:=X_-1
  otherwise 
    s = strcat("while X", num2str (extr (z, 1)), "!=0 do ", DeCodi ((extr (z, 2)-1)), " od");   # Returns while X_!=0 do ^code^ od
  endswitch                                                                                     # Where _ is the index of the variable
  
endfunction


function t = typeSent (z)
% Returns the type of sentence of the code, from a natural number

  t = mod (z, 5);

endfunction


function e = extr (z, i)
% Gets the subindex of the variables in the assingment sentence or the 
% encoded number of other WHILE-code. Depending on the kind of the sentece

  if (typeSent (z) == 0)
    e = 1 + z / 5;
  else
    e = 1 + (decantorKi (((z - typeSent (z)) / 5), 2, i));
  endif

endfunction


function l = L (z)
% Size of the vector encoded in z

  if (z == 0)
    l = 0;
  else
    l = decantorKi (z-1, 2, 1) + 1;
  endif

endfunction


function n = varRegExp (s)
% Vector of numeric indexes of all variables in a WHILE-code as a string

  n = [];                                # Initializes the return variable as an empty vector
  indx     = regexp(s, "\\d+(\:|!)");    # Find the indexes of each number from a variable in the code
  if ~isempty (indx)
    lastChar = regexp(s, "(\:|!)");        # Find the indexes of next char after a variable in the code
    numSize  = lastChar - indx;            # Vector of sizes of the numbers
    for i = 1:length (numSize)
      n = [n, str2num((substr (s, indx(i), numSize(i))))]; # Extract the indexes from the code and convert as numbers to store in a vector
    endfor
    n = unique(n);                         # Sort and delete repeated numbers
  else 
    n = 0;
  endif

endfunction
