function [feature] = calculateWavelet(image)
BlockSize = 4; 
[cA1] = dwt2(image,'db1');
[cA2] = dwt2(cA1, 'db1');
%[cA3] = dwt2(cA2, 'db1');
[cA4, cH4, cV4, cD4] = dwt2(cA2, 'db1');

cD4=cD4(1:floor(size(cD4,1)/BlockSize)*BlockSize,1:floor(size(cD4,2)/BlockSize)*BlockSize);
Block=zeros(floor(size(cD4,1)/BlockSize),floor(size(cD4,2)/BlockSize),BlockSize.^2);

for ii=1:BlockSize:size(cD4,1)-1
    for jj=1:BlockSize:size(cD4,2)-1
        blockElements=cD4(ii:ii+BlockSize-1,jj:jj+BlockSize-1);
        Block((ii-1)/BlockSize+1,(jj-1)/BlockSize+1,:)=reshape(blockElements,[1 1 numel(blockElements)]);
    end
end
Map=median(abs(Block),3)./0.6745;
meanfeat =  mean(Map);

feature=[meanfeat];
end 