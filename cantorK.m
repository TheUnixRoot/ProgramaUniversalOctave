function r = cantorK(x)
% r = cantorK(x)
% 	x : vector to apply Cantor function (vector of natural numbers)
% 	r : result value of the function (natural number)
% 
% Produce the Cantor codification of the vector of natural numbers for 
% not empty vectors
% 
% Examples:
% 	cantorK([1 2 5 6])
%	cantorK([1:10])
%	x = [1:5], cantorK(x)
%
%	Juan Pedro Domínguez Berdún
% 

  if (length(x) == 1)
    r = x;
  elseif (length(x) != 2)
    y = x(2:length(x));
    r = cantor2(x(1), cantorK(y));
  else
    r = cantor2(x(1), x(2));
  endif
endfunction

function s = cantor2(x,y)
% base case where the function is solved
% used for recursive calls

  s = (x+y)*(x+y+1)/2+y;
endfunction