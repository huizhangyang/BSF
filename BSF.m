function data_flt = BSF(data,block_len,Ns)
% Block Subspace Filter for RFI removel in SAR images
% ====================================================================
% Input:
%   data      -----  single look complex SAR image data matrix, complex double
%                    datatype.
%   block_len -----  block length use to perform block-wise processing,
%                    e.g., block_len = [1000 1000].
%   Ns        -----  number of subspace dimension. Tuning this parameter to
%                    obtain satisfactory results.
% Output:
%   data_flt -----   filtered single look complex SAR image data matrix
% Documentation:   ¡°BSF: Block Subspace Filtering for Removing Narrowband
%                    and Wideband Radio Interference Artefacts in Single Look
%                    Complex SAR Images¡±,Huizhang Yang et al., IEEE Trans.
%                    Geosci. Remote Sens, 2021.
% ========================================================================
% By Huizhang Yang, 2021.7
% Email: hzyang@njust.edu.cn; huizhang.yang@outlook.com
% Copyright ? 2021 <Huizhang Yang>
% Permission to use these scripts for SAR processing and related research
% is granted. Please acknowledge the author.
% The author disclaims any responsibility for or liability related to this
% software.

[Na,Nr] = size(data);
block_len_a = block_len(1);
block_len_r = block_len(2);
if block_len_r>= Nr
    block_len_r = Nr;
end
if block_len_a>= Na
    block_len_a = Na;
end
Nb_a = floor(Na/block_len_a);
Nb_r = floor(Nr/block_len_r);

data_flt = zeros(size(data));
for kk = 1:Nb_a
    if kk == 1
        idx_i = (kk-1)*block_len_a+1:block_len_a;
        idx = (kk-1)*block_len_a+(1:block_len_a);
        idx_o = 1:length(idx_i);
    elseif kk<Nb_a
        idx_i = (kk-1)*block_len_a+(1:block_len_a);
        idx = (kk-1)*block_len_a+(1:block_len_a);
        idx_o = 1:length(idx_i);
    else
        idx_i = (kk-1)*block_len_a+1:Na;
        idx = (kk-1)*block_len_a+1:Na;
        idx_o = 1:length(idx_i);
    end
    if  Nb_a==1
        idx_i =1:Na;
        idx = 1:Na;
        idx_o = 1:Na;
    end
    for nn = 1:Nb_r
        if nn == 1
            idr_i = (nn-1)*block_len_r+1:block_len_r;
            idr = (nn-1)*block_len_r+(1:block_len_r);
            idr_o = 1:length(idr_i);
        elseif nn<Nb_r
            idr_i = (nn-1)*block_len_r+(1:block_len_r);
            idr = (nn-1)*block_len_r+(1:block_len_r);
            idr_o = 1:length(idr_i);
        else
            idr_i = (nn-1)*block_len_r+1:Nr;
            idr = (nn-1)*block_len_r+1:Nr;
            idr_o = 1:length(idr_i);
        end
        if Nb_r==1
            idr_i = 1:Nr;
            idr = 1:Nr;
            idr_o = 1:Nr;
        end
        patch = data(idx_i,idr_i);
        if size(patch,1)<size(patch,2)
            [S, ~] = eigs(patch*patch',Ns);
            patch_rec = data(idx_i,idr_i)-S*S'*(patch);
        else
            [S, ~] = eigs(patch'*patch,Ns);
            patch_rec = data(idx_i,idr_i)-(patch)*S*S';
        end
        data_flt(idx,idr) = patch_rec(idx_o,idr_o);
    end
end
data_flt(isnan(data_flt))  =  0;
end

