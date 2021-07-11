clc
close all
clear all

tic

files=dir('D:\Users\Lenovo\Downloads\Dataset\Training\**\*.jpg');
s=1;
for k=1:length(files)
    inputfile=fullfile(files(k).folder, files(k).name);
    model = string(files(k).folder(44:end));
    imgorg = imread(inputfile);
    if size(imgorg,3)==3
        imggray=rgb2gray(imgorg);
    else
        imggray = imgorg;
    end
    imggray = imresize(imggray,[2000, 2000]);
    
    if model == 'iPhone-6'
        class = 1;
    elseif model == 'Sony-NEX-7'
        class = 2;
    elseif model == 'Samsung-Galaxy-S4'
        class = 3;
    elseif model == 'Samsung-Galaxy-Note3'
        class = 4;
    elseif model == 'Motorola-X'
        class = 5;
    elseif model == 'Motorola-Nexus-6'
        class = 6;
    elseif model == 'Motorola-Droid-Maxx'
        class = 7;
    elseif model == 'LG-Nexus-5x'
        class = 8;
    elseif model == 'iPhone-4s'
        class = 9;
    elseif model == 'HTC-1-M7'
        class = 10;
    end  
    
   
%     BS = 200;
%     l=1;
%     for i=1:BS:size(imggray,1)-1
%         for j=1:BS:size(imggray,2)-1
%             blockElements=imggray(i:i+BS-1,j:j+BS-1);
%             feature = calculateWavelet(blockElements);
%             feat(l,:) = [feature, class];
%             l=l+1;
%         end
%     end
    feat = calculateWavelet(imggray);
    featureVectors(k,:) = [feat class];
end



