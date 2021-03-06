#### Matlab/Octave code implementation of block subspace filter (BSF) for removing radio interference artefacts in SAR images

# Function description
```
function data_flt = BSF(data,block_len,Ns)     
% Input:     
%   data      -----  single look complex SAR image data matrix, complex double datatype.     
%   block_len -----  block length use to perform block-wise processing, e.g., block_len = [1000 1000].
%   Ns        -----  number of subspace dimension. Tuning this parameter to obtain satisfactory results.
% Output:
%   data_flt  -----  filtered single look complex SAR image data matrix
```

# Usage example
```
load data                           % load SLC SAR data
block_len = [1000 1000];            % block lengths
Ns = 2;                             % emprical RFI subspace dimensions
data_flt = BSF(data,block_len,Ns);   
```
# Example results
<img src="imgs/input.jpg" width=256 height=256 /> <img src="imgs/output.jpg" width=256 height=256 /> <img src="imgs/res.jpg" width=256 height=256 />   
left: input image containing RFI;                       mid: filtered image;                              right: removed interference artefact

More descriptions can be found in the following paper:    
##### Huizhang Yang et al., “BSF: Block Subspace Filter for Removing Narrowband and Wideband Radio Interference Artefacts in Single Look Complex SAR Images,” IEEE Trans. Geosci. Remote Sens., 2021. DOI:10.1109/TGRS.2021.3096538  
If you find this repo useful, consider to cite this paper in your research.  If you have any question, send an email to hzyang@njust.edu.cn or huizhang.yang@outlook.com
