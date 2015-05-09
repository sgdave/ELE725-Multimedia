function [dx,dy,A]=findmacro(ti,tj,oi,oj,k,ftwo,fone)
sizeone=size(fone);
sizetwo=size(ftwo);

sizeoi=size(oi);
sizeoj=size(oj);
sizeti=size(ti);
macros=sizeti(2);
minimum=256*macros*macros;
count=0;
for i=1:sizeoi(2)-macros-1
    for j=1:sizeoj(2)-macros-1
        count=count+1;
        if((sum(sum(ftwo(ti,tj)-fone(oi(i):oi(macros+i-1),oj(j):oj(macros+j-1))))/macros*macros)<minimum)
            dx=oi(i)-ti(1);dy=oj(j)-tj(1);
            A=ftwo(ti,tj)-fone(oi(i):oi(macros+i-1),oj(j):oj(macros+j-1));
            minimum=sum(sum(ftwo(ti,tj)-fone(oi(i):oi(macros+i-1),oj(j):oj(macros+j-1))))/macros*macros;
        end
    end
end
end
