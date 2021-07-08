% test code for BSF
% by Huizhang Yang, 2021.7
clear
load data                                   % load data
Nb = [1000 1000];                           % block lengths
Ns = 2;                                     % RFI subspace dimensions

data_flt = BSF(data,Nb,Ns);                 % BSF filtering
res = data-data_flt;                        % estimated RFI

I_max = 1.5*std(data(1:100:end));           % for plot SAR data as gray images 
subsampling = [5 5];
figure
plot_sar(data,I_max,subsampling)
title('input')
figure
plot_sar(data_flt,I_max,subsampling)
title('output')
figure
plot_sar(res,I_max,subsampling)
title('res')

sz = [1000 1000];
imwrite(imresize(uint8(min(abs(data),I_max)/I_max*255),sz), 'imgs/input.jpg')
imwrite(imresize(uint8(min(abs(res),I_max)/I_max*255),sz), 'imgs/res.jpg')
imwrite(imresize(uint8(min(abs(data_flt),I_max)/I_max*255),sz), 'imgs/output.jpg')
