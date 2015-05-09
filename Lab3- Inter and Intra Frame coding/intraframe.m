function y = intraframe(video)
%obj=mmreader(video);
%   video=obj.read();
%twoframes=video(:,:,1:2);
sze=size(video);
orig=0;
for i=1:sze(4)-1
    A(i)=(entropy(video(:,:,:,i)-video(:,:,:,i+1))); 
    %figure;
    %imshow(((video(:,:,:,i)-video(:,:,:,i+1))));
    orig=orig+8;
end
figure;
    plot(A)
   disp(orig);
x=orig/(sum(A,2)-A(1)+8)

   DPCM_A=video;DPCM_B=video;DPCM_C=video;DPCM_F=video;
for i=2:sze(4)
    DPCM_A(:,2:sze(2),:,i)=video(:,1:sze(2)-1,:,i)-video(:,2:sze(2),:,i-1);
    e1(i)=entropy(DPCM_A(:,:,:,i));
    DPCM_B(2:sze(1),:,:,i)=video(1:sze(1)-1,:,:,i)-video(2:sze(1),:,:,i-1);
    e2(i)=entropy(DPCM_B(:,:,:,i)); 
    DPCM_C(2:sze(1),2:sze(2),:,i)=video(1:sze(1)-1,1:sze(2)-1,:,i)-video(2:sze(1),2:sze(2),:,i-1);
    e3(i)=entropy(DPCM_C(:,:,:,i));
    DPCM_F(2:sze(1),2:sze(2),:,i)=DPCM_A(2:sze(1),2:sze(2),:,i)+DPCM_B(2:sze(1),2:sze(2),:,i)-DPCM_C(2:sze(1),2:sze(2),:,i);
    e4(i)=entropy(DPCM_F(:,:,:,i)); 
end

implay(DPCM_A);
x=orig/((sum(e1,2))-(e1(1)+8))
implay(DPCM_B);
x=orig/((sum(e2,2))-(e2(1)+8))
implay(DPCM_C);
x=orig/((sum(e3,2))-(e3(1)+8))
implay(DPCM_F);
x=orig/((sum(e4,2))-(e4(1)+8))


end