function v = decantorKi(z, k, i)
% v = decantorKi(z, k, i)
% 	z : number to decode using the inverse of the Cantor coding function (natural number)
% 	k : size of the original vector (natural number)
% 	i : index of the component to get from coded vector (natural number)
% 	v : result of decoding number z as a vector of k components
% 
% Where 1 <= i <= k
% 
% Produce the ith componente from a vector coded using Cantor function
% 
% Examples:
%	decantorKi(0, 3, 2)
% 	decantorKi(4, 1, 1)
%
%	Juan Pedro Domínguez Berdún
%

  if (k == 1)
    v = z;
  elseif (i == 1)
    v = decantor21(z);
  else
    v = decantorKi((decantor22(z)), (k-1), (i-1));
  endif

endfunction

function u2 = decantor22(z)
% returns the 2nd component of a coded vector of 2 components

u2 = z - cantorK([d(z) 0]);
endfunction

function u1 = decantor21(z)
% returns the 1st component of a coded vector of 2 components

u1 = d(z) - decantor22(z);
endfunction

function t = d(z)    
% returns the minimun natural number where: cantorK([t 0]) > z; minus 1
% d(z) = min{t in N | cantorK([t o]) > z} -1

  t = floor((sqrt(8*z+1)-1)/2);
endfunction
