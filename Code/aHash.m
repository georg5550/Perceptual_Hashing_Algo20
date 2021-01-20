function [dist] = aHash(pilt,ref_picture)
% aHash 
%This function takes 2 input:
%
%pic = grayscale picture
%ref_pic = Reference picture (grayscale) to compare with the firs picutre
% 
%Function computes aHash for each picture and computes the Hamming Distance
%between the two.
%
%
%EXAMPLE
%
% input =  
%         [dist] = aHash('UT_01.jpeg','UT_grayscale.jpeg')
%
% output=
%         dist =  2

pic = imread(pilt);
ref_pic = imread(ref_picture);

%Downsample both picture to desired 
y=imresize(pic,[8, 8]);
x=imresize(ref_pic,[8,8]);

%Find the average value for the entire matrix
M = mean(y,'all'); 
N = mean(x,'all');
%reshape the matrix to 1D vector
B = reshape(y,1,[]);
D = reshape(x,1,[]);
% This for loop puts array element value 1 or 0 depending, if it is smaller
% or greater than average value of the whole matrix.

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

dist = sum(B~=D);

end
