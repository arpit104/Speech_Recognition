function yy = vad(x,fs,cntr,threshold)
x = x./(max(x));
len = length(x);

frm_len = (20/1000)*fs;
no_frms = floor(length(x)/frm_len);
i = 0;
y = zeros(size(x));
for i = 1:no_frms
% while(i < no_frms)
    ip_buf = x((i-1)*frm_len + 1:(i-1)*frm_len + frm_len);
    ip_buf_en = ip_buf'*ip_buf;
    ip_buf_en = ip_buf_en/frm_len;
    if(ip_buf_en > threshold)
        cntr = 1 + cntr;
    else
        cntr = 0;
    end
    if(cntr>2)
        y((i-1)*frm_len + 1:(i-1)*frm_len + frm_len) = ones(frm_len,1); 
    else
        y((i-1)*frm_len + 1:(i-1)*frm_len + frm_len) = zeros(frm_len,1);
    end
%      yy = y;
% i = i+1;
end

yy = y;
