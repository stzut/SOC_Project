
A_fix = zeros(1,256);
B_fix = zeros(256,676);
C_fix = zeros(1,676);
snr = zeros(1,7);


% for i = 1:256
%     A_fix(i) = round(A_fix)*scale;
% end

% for i = 1:256
%     for j = 1:676
%     B_fix(i,j) = round(B_fix)*scale;
%     end
% end

for i =6:12
scale = 2^i;  
a = i-5;
A_fix = round(A*scale);
B_fix = round(B*scale);

% C = A_fix * B_fix/scale;
C_fix = A_fix * B_fix/scale/scale;
C_flp = A * B;
ddif = C_fix - C_flp;
snr(a)=(10*log10(sum(C_flp(:).^2)/sum(ddif(:).^2)))
% disp(['SNR is', num2str(10*log10(sum(C_flp(:).^2)/sum(ddif(:).^2))), 'dB']);
end