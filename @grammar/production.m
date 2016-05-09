function sentForm = production (gram, numbSteps, prnt)
% sentForm = production (fileName, numbSteps, prnt)
%     gram      : grammar (object of grammar class)
%     numbSteps : maximum steps (natural number)
%     prnt      : print derivation (boolean)
%     sentForm  : resulting sentential form (string)
%
% Produce a string with a grammar after a derivation of length not greater than numbSteps.
% If numbSteps not supplied, then there is no limit for the length of the derivation
% (the production can also enter an infinit loop).
%
% Example
%     production (grammar ('test'), 10, true)
%
% =========================================================================
%
% UMAFOL, fjvico, 2015/01/12    distributed under CC0 (public domain)
%
% =========================================================================

  if (~exist ('gram', 'var') || ~isa (gram, 'grammar'))
    error ([mfilename "  ::::  A grammar object must be specified."])
  endif
  if (~exist ('numbSteps', 'var'))                  % unlimited derivation
    numbSteps = Inf;
  endif
  if (~exist ('prnt', 'var'))
    prnt = true;                                    % default value is printing the derivation
  endif

  sentForm = gram.S;													      % the first value is the axiom
  if (prnt)
    fprintf ('\n%s', sentForm);
  endif
  numbRules = size (gram.P, 2);										  % number of production rules

  longDeriv = 0;
  prodc = sentForm;                                 % non-empty initial value
  while (longDeriv < numbSteps && ~isempty (prodc))
    order = randperm (numbRules);                   % rules are sorted out for random pick up
    for idRule = 1:numbRules
      prodc = step (sentForm, get (gram, "P", order(idRule)), gram.emptyString);
      if (~isempty (prodc))                         % a rule has been applied
        sentForm = prodc;                           % rewrite sentential form
        if (prnt)
          fprintf (' => %s', sentForm);
        endif
        longDeriv++;
        break                                       % stops searching for a rule
      endif
    endfor
  endwhile

  fprintf ('\n\n');
  
endfunction


function strg = step (strg, rule, emptyString)
% A derivation, where a randomly chosen substring of strg coincident with rule.left is rewrited with rule.right.
% Returns an empty string if the rule cannot be applied.

  if (length (rule.left) <= length (strg))            % corrects the findstr effect (longer/shorter)
    pos = findstr (strg, rule.left);                  % find the left side in the actual sentential form
    if (~isempty (pos))                               % if there are substrings to rewrite
      right = strrep (rule.right, emptyString, "");   % deletes the symbol that represents the empty string

      idSymb = pos (ceil (length (pos) * rand (1)));  % selects a substring
      if (idSymb > 1)
        pref = strg(1:idSymb - 1);                    % the part of the string before the substring
      else
        pref = '';
      endif
      if (idSymb < length (strg))
        sufx = strg(idSymb + length (rule.left):length (strg));   % the part of the string after the substring
      else
        sufx = '';
      endif

      strg = strcat (pref, right, sufx);              % putting all together
    else
      strg = "";
    endif
  else
    strg = "";
  endif

endfunction
