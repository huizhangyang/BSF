# BSF
Block subspace filter for RFI removal in SAR images
Matlab/Octave code

# Function description
function data_flt = BSF(data,block_len,Ns)
% Input:
%   data      -----  single look complex SAR image data matrix, complex double
%                    datatype.
%   block_len -----  block length use to perform block-wise processing,
%                    e.g., block_len = [1000 1000].
%   Ns        -----  number of subspace dimension. Tuning this parameter to
%                    obtain satisfactory results.
% Output:
%   data_flt -----   filtered single look complex SAR image data matrix

# Usage example

load data                                   % load data
Nb = [1000 1000];                           % block lengths
Ns = 2;                                     % RFI subspace dimensions
data_flt = BSF(data,Nb,Ns);   

If you find this code useful, please consider citing the following paper
Huizhang Yang et al., “BSF: Block Subspace Filtering for Removing Narrowband and Wideband Radio
Interference Artefacts in Single Look Complex SAR Images,” IEEE Trans. Geosci. Remote Sens, 2021.
