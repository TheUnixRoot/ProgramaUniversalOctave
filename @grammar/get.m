function s = get (o, f, n)

  if (~exist ("f", "var"))
    s = fieldnames (o);
  else
    if (~ischar (f))
      error ([mfilename "  ::::  Expecting the property to be a string."]);
    endif

    switch (f)
      case "N" s = o.N;
      case "T" s = o.T;
      case "P"
        if (~exist ("n", "var"))
          error ([mfilename "  ::::  A rule number must be specified."]);
        endif
        if (n > 0 && n <= size (o.P, 2))
          s.left  = o.P{n}{1};
          s.right = o.P{n}{2};
        else
          error ([mfilename "  ::::  Rule out of range."]);
        endif
      case "S" s = o.S;
      otherwise error ([mfilename "  ::::  Invalid property """ f """."]);
    endswitch
  endif

endfunction
