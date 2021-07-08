function   plot_sar(varargin)
% Plot complex-valued SAR data as gray scale images
% by Huizhang Yang, 2021.7
% Email: hzyang@njust.edu.cn; huizhang.yang@outlook.com
% Copyright @ 2021 <Huizhang Yang>
% Permission to use these scripts for SAR processing and related research
% is granted. Please acknowledge the author.
% The author disclaims any responsibility for or liability related to this
% software.
I=abs(varargin{1});
d=[1 1];
if nargin==1
    I_max=2*mean(I(:));
end
if nargin>=2
    I_max=varargin{2};
end
if nargin>=3
    d=varargin{3};
end
imagesc(abs(I(1:d(1):end,1:d(2):end)));
colormap gray
caxis([0 I_max])

end

