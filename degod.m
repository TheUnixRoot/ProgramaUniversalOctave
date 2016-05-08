function deg = degod(z, k)
% deg = degod(z, k)
% 	z : number to decode using the inverse of the Gödel coding function (natural number)
% 	k : index of the component to get from coded vector (natural number)
% 	deg : ith component of the coded vector as z (natural number)
% 
% Where 0 < k
% 
% Returns the kth component of a vector coded using Gödel function
% if the kth component is greater than vector's size, returns 0
% 
% Example:
% 	degod(0, 0)
%	degod(46, 2)
%
%	Juan Pedro Domínguez Berdún
%

  if(z == 0 || k > l(z))
    deg = 0;
  else
    deg = decantorKi(decantorKi(z-1, 2, 2), l(z), k);
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