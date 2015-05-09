function y = huffman(X)

[me,mes]=myEntropy(X);
me=me.*(max(size(me)));
sz=max(size(me));
total=entropy(me);
index=1;
for i = 1:sz
huffmat(i,1)=int32(mes(i));
huffmat(i,2)=me(i);
if (i~=1)
index=cat(1, index, i);
end
end
[values, order] = sort(huffmat(:,2),'descend');
huffmat = huffmat(order,:);
negone=repmat(-1, [sz 3]);
huffmat=cat(2, huffmat, negone);
huffmat=cat(2, huffmat, index);
sortedhuff=huffmat;
tracker=sz;help=-1;j=sz+1;

for k=1:sz-1
   if (sortedhuff(tracker-(k+help),3)==-1 && sortedhuff(tracker-(k+help)-1,3)==-1)

    sortedhuff(tracker+1,2)=sortedhuff(tracker-(k+help),2)+sortedhuff(tracker-(k+help)-1,2);
    sortedhuff(tracker-(k+help),3)=tracker+1;sortedhuff(tracker-(k+help)-1,3)=tracker+1;
    sortedhuff(tracker+1,4)=sortedhuff(tracker-(k+help),6);sortedhuff(tracker+1,5)=sortedhuff(tracker-(k+help)-1,6);
    huffmat(tracker+1,3)=tracker+1;huffmat(tracker+1,2)=sortedhuff(tracker-(k+help),2)+sortedhuff(tracker-(k+help)-1,2);
    sortedhuff(tracker+1,6)=j;
     sortedhuff(tracker+1,3)=-1;
    tracker=tracker+1;help=help+1;j=j+1;
  	[values, order] = sort(sortedhuff(:,2),'descend');
    sortedhuff = sortedhuff(order,:);
    
   end 
   
end
  	[values, order] = sort(sortedhuff(:,6));
    sortedhuff = sortedhuff(order,:);
 %   disp(sortedhuff)
codebook=gencode(sortedhuff)
%disp(num2str(codebook))
y=sequence(codebook, int32(X));
%disp(sortedhuff)
%y=huffmat;
end

function out = sequence(cbook, aseq)
out='Sequence: ';test='';counter=0;
for i=1:max(size(aseq))
    if (i==10000 || i==50000 || i==100000 || i==200000)
        disp(i)
    end
    for k=3:cbook(aseq(i)+1,2)              
        test = strcat(test, num2str(cbook(aseq(i)+1,k))); 
        counter=counter+1;
    end
    out = strcat(out, test, ';');
    test='';
end
out=strcat(out, ':END');
disp(counter)
disp(total)
end

function f= gencode(tree)
siz=max(size(tree));
f=repmat(2, [siz 2]);
for i=1:siz
    [x,y]=parent(tree,i);
    for j=1:siz
    if (x~=-1)
        f(i,f(i,1))=x;
        f(i,1)=f(i,1)+1;
        [x,y]=parent(tree,y);
    end
    end

end
f=cat(2, tree(:,1), f)
s=size(f);
D= repmat(0, [1 s(2)]);
for d = 1:256
   D(d,1)=d-1; 
end

for i=1:siz


         if (f(i,1)==D(f(i,1)+1,1))

            D(f(i,1)+1,:)=f(i,:);
        end

end
disp('D2')
disp(D)
f=D;
  	[values, order] = sort(f(:,1),'ascend');
    f = f(order,:);
end

function [r, par] = parent(tree,index)
    r=-1;par=0;
    if (index > 0)
    if (tree(index,3) > 0)
    if (index==tree(tree(index,3),4))
        r=0;
    end
    if (index==tree(tree(index,3),5))
        r=1;
    end
    if (tree(tree(index,3),3)~=-1)
    par=tree(index,3);
    end
    end
    end
    
end

