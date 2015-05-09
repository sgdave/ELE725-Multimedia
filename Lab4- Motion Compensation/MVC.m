function MVC(video,macro,k)
obj=mmreader(video);
video=obj.read();
frameone=rgb2ycbcr(video(1:352,:,:,1));
frametwo=rgb2ycbcr(video(1:352,:,:,2));
%mdif=frameone;
siz=size(frameone);count=0;
disp(siz)  

for i=0:(siz(1)/macro)-1
    for j=0:(siz(2)/macro)-1
        count=count+1;
%[mvector(count,1),mvector(count,2),mdif(i*macro:i*macro+macro,j*macro:j*macro+macro,1)]=cMV(frameone(:,:,1),frametwo(:,:,1),i*macro,j*macro,k,macro,siz);        
        
        
        if (i==0 && j~=0 && j~=(siz(2)/macro)-1)
            [mvector(count,1),mvector(count,2),mdif(i*macro+1:i*macro+macro,j*macro+1:j*macro+macro)]=findmacro(i*macro+1:i*macro+macro,j*macro+1:j*macro+macro,i*macro+1:i*macro+macro+k,j*macro-1:j*macro+macro+k,k,frametwo,frameone);
        elseif (j==0 && i~=0 && i~=(siz(1)/macro)-1)
            [mvector(count,1),mvector(count,2),mdif(i*macro+1:i*macro+macro,j*macro+1:j*macro+macro)]=findmacro(i*macro+1:i*macro+macro,j*macro+1:j*macro+macro,i*macro-1:i*macro+macro+k,j*macro+1:j*macro+macro+k,k,frametwo,frameone);
        elseif (i==(siz(1)/macro)-1 && j~=0 && j~=(siz(2)/macro)-1)
            [mvector(count,1),mvector(count,2),mdif(i*macro+1:i*macro+macro,j*macro+1:j*macro+macro)]=findmacro(i*macro+1:i*macro+macro,j*macro+1:j*macro+macro,i*macro-1:i*macro+macro,j*macro-1:j*macro+macro+k,k,frametwo,frameone);
        elseif (j==(siz(2)/macro)-1 && i~=0 && i~=(siz(1)/macro)-1)
            [mvector(count,1),mvector(count,2),mdif(i*macro+1:i*macro+macro,j*macro+1:j*macro+macro)]=findmacro(i*macro+1:i*macro+macro,j*macro+1:j*macro+macro,i*macro-1:i*macro+macro+k,j*macro-1:j*macro+macro,k,frametwo,frameone);    
        elseif (i==0 && j==0)
            [mvector(count,1),mvector(count,2),mdif(i*macro+1:i*macro+macro,j*macro+1:j*macro+macro)]=findmacro(i*macro+1:i*macro+macro,j*macro+1:j*macro+macro,i*macro+1:i*macro+macro+k,j*macro+1:j*macro+macro+k,k,frametwo,frameone);
        elseif (i==0 && j==(siz(2)/macro)-1)
            [mvector(count,1),mvector(count,2),mdif(i*macro+1:i*macro+macro,j*macro+1:j*macro+macro)]=findmacro(i*macro+1:i*macro+macro,j*macro+1:j*macro+macro,i*macro+1:i*macro+macro+k,j*macro-1:j*macro+macro,k,frametwo,frameone);    
        elseif (i==(siz(1)/macro)-1 && j==0)
            [mvector(count,1),mvector(count,2),mdif(i*macro+1:i*macro+macro,j*macro+1:j*macro+macro)]=findmacro(i*macro+1:i*macro+macro,j*macro+1:j*macro+macro,i*macro-1:i*macro+macro,j*macro+1:j*macro+macro+k,k,frametwo,frameone);    
        elseif (i==(siz(1)/macro)-1 && j==(siz(2)/macro)-1)
            [mvector(count,1),mvector(count,2),mdif(i*macro+1:i*macro+macro,j*macro+1:j*macro+macro)]=findmacro(i*macro+1:i*macro+macro,j*macro+1:j*macro+macro,i*macro-1:i*macro+macro,j*macro-1:j*macro+macro,k,frametwo,frameone);        
        else
            [mvector(count,1),mvector(count,2),mdif(i*macro+1:i*macro+macro,j*macro+1:j*macro+macro)]=findmacro(i*macro+1:i*macro+macro,j*macro+1:j*macro+macro,i*macro-1:i*macro+macro+k,j*macro-1:j*macro+macro+k,k,frametwo,frameone);
        end






    end
end

disp('total number of macros and total size of frame')
disp(siz(1)*siz(2)/(1024))
disp(siz)
disp('mvector and it size')
disp(mvector)
disp(size(mvector))
disp('mdif')
figure;
imshow(mdif(:,:,1))
%disp(mdif)
disp(size(mdif))
disp(entropy(mdif(:,:,1)))
disp(entropy(frametwo(:,:,1)-frameone(:,:,1)))
end