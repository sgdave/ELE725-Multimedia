function [y,a]=myEntropy(X)
B=char(X);
sz=(max(size(X)));
D= repmat(0, [sz 2]);
A= repmat(0, [sz 2]);
C= repmat(0, [1 2]);
track=1;
for d = 1:256
   D(d,1)=d-1; 
end
for i=1:sz
   D(B(i)+1,2) = D(B(i)+1,2)+1; 
end
for i=1:max(255,sz)
    if (D(i,2)~=0)
        C(track,:)=D(i,:);
        track=track+1;
    end
end

%track=1;
%for i = 1:sz
%    c=0;
%    for j = 1:sz
%        if (B(i,1)==char(A(j,1)))
%           A(j,2)=A(j,2)+1;
%           c=1;
%        end
%        if (c==0 && j==sz)
%            A(track,1)=B(i,1);
%            A(track,2)=A(track,2)+1;
%            track=track+1;
%        end
%    end
%end
plot(C(:,1),C(:,2))
a=C(:,1);
y=C(:,2)/sz;
end

