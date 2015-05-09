function e = imgentropy(x)
%C=imread(x);
C=x;s=size(x);
Z=repmat(0, [s(1) s(2)]);
A=cat(3, C, Z);
siz=size(A);
if (siz(3)==4)
   for i=1:siz(3)
   B=rgb2ycbcr(C);
   e=calculating(B(:,:,i),siz);
   i=i+1;
   end
else     
    e=calculating(C,size(C));
end
end
function f = calculating(A,sz)
%s=repmat(0, sz(1)*sz(2), 1);
var=myEntropy(A(:,1));
s=cat(1,0,var(1));
for i=2:sz(1)
    var=myEntropy(A(:,i));
    s=cat(1,s,var(1));
end

f=entropy(s);
f=f/sz(1);
end