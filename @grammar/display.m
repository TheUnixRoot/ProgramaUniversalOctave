function display (g)

  fprintf ("\nnon terminal symbols:  {");
  for idSymb = 1:length (g.N) - 1
    fprintf ("%c, ", g.N(idSymb));
  endfor
  fprintf ("%c}\n\n", g.N(end));

  fprintf ("terminal symbols:  {");
  for idSymb = 1:length (g.T) - 1
    fprintf ("%c, ", g.T(idSymb));
  endfor
  fprintf ("%c}\n\n", g.T(end));

  fprintf ("rules:  {\n");
  for idRule = 1:size (g.P, 2)
    rule = get (g, "P", idRule);
    fprintf ("\t%2d: %s -> %s\n", idRule, rule.left, rule.right);
  endfor
  fprintf ("}\n\n");

  fprintf ("axiom:  %c\n\n", g.S);

endfunction
