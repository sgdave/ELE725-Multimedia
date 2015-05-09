function e = imghuff(x)
C=imread(x);
Y=0;
Z=repmat(0, [512 512]);
A=cat(3, C, Z);
siz=size(A);
ft=size(C);
if (siz(3)==4)
   for i=1:siz(3)
       for j=1:siz(2)
       Y=cat(1,Y,C(:,j,i));
       end
   end
   huffman(Y);
else 
   for j=1:siz(2)
       Y=cat(1,Y,C(:,j));
   end
   e=huffman(Y);
end
end