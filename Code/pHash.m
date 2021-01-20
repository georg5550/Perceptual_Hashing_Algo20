function [dist] = pHash(pic,ref_pic)

%pHash 
%This function takes 2 input:
%
%pic = grayscale picture
%ref_pic = Reference picture (grayscale) to compare with the firs picutre
% 
%Function computes pHash for each picture and computes the Hamming Distance
%between the two.
%
%
% EXAMPLE
%
% input =  
%         [dist] = pHash('vana_UT.jpeg','UT_grayscale.jpeg')
%
% output=
%         dist =  14 



p1= imread(pic);
p2= imread(ref_pic);

%Downsample both picture to desired 
y=imresize(p1,[32,32]);
x=imresize(p2,[32,32]);

%DCT
dct_1 = dct2(y);
dct_2 = dct2(x);

%top left 8x8
g = dct_1(1:8,1:8);
d = dct_2(1:8,1:8);

%Find the average value for the entire matrix
M = mean(g,'all'); 
N = mean(d,'all');

%reshape the matrix to 1D vector
B = reshape(g,1,[]);
D = reshape(d,1,[]);


for i =1:length(B)
    if B(i) > M
        B(i) = 1;
    else
        B(i) = 0;
    end    
end

for i =1:length(D)
    if D(i) > N
        D(i) = 1;
    else
        D(i) = 0;
    end    
end


dist = sum(D~=B);

end

