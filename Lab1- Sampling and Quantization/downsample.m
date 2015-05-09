function y = downsample(x,m);
  
  
  % this is not pretty: a want a smaller vector in the same
  % orientation as x and i don't know how to do it!
  [Xs,Ys] = size(x);
  if(Xs > Ys)
    N = Xs;
    y = zeros(floor(N/m),1);
  else
    N = Ys;
    y = zeros(1,floor(N/m));
  end
  

  for n=1:m:N
    y((n+m-1)/m) = x(n);
  end