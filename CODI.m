function z = CODI (n, p, s)

r = max (n, max (varRegExp (s)));

z = cantorK([n (p + r) Codi(s)]);

endfunction

function z = Codi (s)

ptoscoma = regexp(s, ";");
sub = s;
dec = [];
for i = 1:length (ptoscoma)
	aux = substr (sub, 1, ptoscoma(i));
	dec = [dec (codi (aux))];
	sub = substr (sub, ptoscoma (i), length (s) - ptoscoma (i));
endfor

z = god (dec);

endfunction

function z = codi (s)

vars = regexp (s, "\\d+");
dospts = regexp (s, "\:");
ptoYcoma = regexp (s, ";|\\+|\\-");

i = (substr(s, vars(1), dospts - vars (1)));
if (length(s) > 2)
j = substr(s, vars(2), ptoYcoma(1) - vars (2));
end
if (regexp(s, "0;"))
	z = 5 * (i - 1);
elseif (regexp(s, "X\\d+;"))
	z = 5 * cantorK (i - 1, j - 1) + 1;
elseif ~isempty (regexp(s, "X\\d+(\\+1)"))
	z = 5 * cantorK (i - 1, j - 1) + 2;
elseif (regexp(s, "X\\d+(\\-1)"))
	z = 5 * cantorK (i - 1, j - 1) + 3;
else
	z = 5 * cantorK (i - 1, Codi (j)) + 4;
end
	

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
