function deg = degod(z, i)
% deg = degod(z, i)
% 	z : number to decode using the inverse of the Gödel coding function (natural number)
% 	i : index of the component to get from coded vector (natural number)
% 	deg : ith component of the coded vector as z (natural number)
% 
% Where 0 < i
% 
% Returns the ith component of a vector coded using Gödel function
% if the ith component is greater than vector's size, returns 0
% 
% Example:
% 	degod(0, 0)
%	degod(46, 2)
%
%	Juan Pedro Domínguez Berdún
%

  if(z == 0 || i > l(z))
    deg = 0;
  else
    deg = decantorKi(decantorKi(z-1, 2, 2), l(z), i);
  endif

endfunction

function l = l(z)
% returns the size of the godelized vector

  if (z == 0)
    l = 0;
  else
    l = decantorKi(z - 1, 2, 1) + 1;
  endif

endfunction