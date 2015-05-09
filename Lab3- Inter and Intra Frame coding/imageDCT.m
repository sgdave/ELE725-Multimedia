function [F E T]= imageDCT(A)

A=imread(A);
siz=size(A);

dctinput=A(1:4,1:4);
F=dct2(dctinput);
dctinput=A(1:8,1:8);
E=dct2(dctinput);
dctinput=A(1:32,1:32);
T=dct2(dctinput);

dctin1=dct2(F);
dctin2=dct2(E);
dctin3=dct2(T);
figure;
imshow(int8(dctin1));
figure;
imshow(int8(dctin2));
figure;
imshow(int8(dctin3));
disp('DCT coefficients Part 2')
disp(log(dctin1(1)));
disp(log(dctin2(1)));
disp(log(dctin3(1)));


%idctin1=round(idct2(dctin1))
%idctin2=round(idct2(dctin2));
%idctin3=round(idct2(dctin3));



fbyf=A(481:512,1:32);
ebye=A(1:32,481:512);
tbyt=A(481:512,481:512);

dctin1=dct2(fbyf);
dctin2=dct2(ebye);
dctin3=dct2(tbyt);

disp('DCT coefficients Part 3')
disp(log(dctin1(1)));
disp(log(dctin2(1)));
disp(log(dctin3(1)));

test=dct2(fbyf);
test(1)=0;
figure;
imshow(int8(idct2(test)));
test=dct2(fbyf);
test(2:20,:)=0;
test(:,2:20)=0;
figure;
imshow(int8(idct2(test)));
test=dct2(fbyf);
test(25:32,:)=0;
test(:,25:32)=0;
figure;
imshow(int8(idct2(test)));

idctin1=round(idct2(dctin1));
idctin2=round(idct2(dctin2));
idctin3=round(idct2(dctin3));


figure;
imshow(int8(idctin1));
figure;
imshow(int8(idctin2));
figure;
imshow(int8(idctin3));

dctin1(1,1)=0;dctin2(1,1)=0;dctin3(1,1)=0;
zerodc1=round(idct2(dctin1));
zerodc2=round(idct2(dctin2));
zerodc3=round(idct2(dctin3));

disp('These prove that recovered image is EXACTLY the same as original :)')
if (fbyf == idctin1)
    disp('FbyF is correct!')
end
if (ebye == idctin2)
    disp('EbyE is correct!')
end
if (tbyt == idctin3)
    disp('TbyT is correct!')
end

dctin1=(abs(dctin1(1,1)));
dctin2=(abs(dctin2(1,1)));
dctin3=(abs(dctin3(1,1)));

F=log(abs(F(1,1)));
E=log(abs(E(1,1)));
T=log(abs(T(1,1)));


fun=@(block_struct) dct2(block_struct.data);
output=blockproc(imread('lenagray.jpg'),[8 8], fun);
orig=output;


Q = [16 11 10 16 24 40 51 61;
    12 12 14 19 26 58 60 55;
    14 13 16 24 40 57 69 56;
    14 17 22 29 51 87 80 62;
    18 22 37 56 68 109 103 77;
    24 35 55 64 81 104 113 92;
    49 64 78 87 103 121 120 101;
    72 92 95 98 112 100 103 99;];

Qdc = [0 11 10 16 24 40 51 61;
    12 12 14 19 26 58 60 55;
    14 13 16 24 40 57 69 56;
    14 17 22 29 51 87 80 62;
    18 22 37 56 68 109 103 77;
    24 35 55 64 81 104 113 92;
    49 64 78 87 103 121 120 101;
    72 92 95 98 112 100 103 99;];
figure;
fun=@(block_struct) (block_struct.data./Q);
output=blockproc(output ,[8 8], fun);
%imshow(round(output))

fun=@(block_struct) (block_struct.data.*Q);
output=blockproc(round(output),[8 8],fun);
imshow(output)

figure;
fun=@(block_struct) idct2(block_struct.data);
output=blockproc(output,[8 8], fun);
imshow(int8(output))
summation=sum(sum(((int8(output)-int8(A)).^2)));
totsiz=siz(1)*siz(2);
disp(summation/totsiz);
disp(snr(output,A));
end