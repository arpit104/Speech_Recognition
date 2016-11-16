%%
% Dynamic Time Warping
% % inputs %
% a = first time series
% b = second time series
% % output %
% DTW normalised dtw distance between the two time series
function DTW = dtw_dist(a,b)
a_siz = size(a);
b_siz = size(b);
% c_cmn_sz = intersect(a_siz,b_siz);
c_cmn_sza = setdiff(a_siz,b_siz);
c_cmn_szb = setdiff(b_siz,a_siz);
DTW = zeros(c_cmn_sza+1,c_cmn_szb+1);

for i = 1:c_cmn_sza+1
    DTW(i,1) = inf;
end
for i = 1:c_cmn_szb+1
    DTW(1,i) = inf;
end
DTW(1,1) = 0;

for i = 1:c_cmn_sza
    for j = 1:c_cmn_szb
%         cost = d(a(i), b(j));
        cost = sqrt((a(:,i)-b(:,j))'*(a(:,i)-b(:,j)));
        aa = [DTW(i+1-1, j+1), DTW(i+1,j+1-1),DTW(i+1-1, j+1-1)];
        DTW(i+1,j+1) = cost + min(aa);
    end
end
% DTW = DTW(length(a)+1,length(b)+1)/(length(a)+length(b));
DTW = DTW(c_cmn_sza,c_cmn_szb)/(c_cmn_sza+c_cmn_szb);
