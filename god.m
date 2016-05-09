function g = god(x)
% g = god(x)
% 	x : vector to apply Gödel function (vector of natural numbers)
% 	g : result value of the function (natural number)
% 
% Produces the coded number result of the Gödel function apllied to any vector
% 
% Examples:
%	god([1 2 5 6])
%	god([])
%	x = [1:5], god(x)
%
%	Juan Pedro Domínguez Berdún
%  

  if (length(x) == 0)
    g = 0;
  else
    g = cantorK ([(length(x) - 1) cantorK(x)]) + 1;
  endif

endfunction
