function y_win = hamm_win(y, f0,  fs, w_time, N, f_num)
w_len = w_time*fs;
y_hamm = hamming(w_len);
y_win = y_hamm.*y(1:w_len)';
y_win = fftshift(fft(y_win,N));

mid = floor(size(y_win,1)/2);
f_max = 4e3;
f_len = N*f_max/fs;
f = linspace(0,f_max,f_len);
figure(f_num), stem(f, 20*log(abs(y_win(mid+1:mid+f_len))), '.');
hold on
plot(f, 20*log(abs(y_win(mid+1:mid+f_len))), 'r');
grid on;
xlabel('Frequency (in Hz)');
ylabel('Magnitude (in dB)');
str = w_time*1e3;
str = strcat(num2str(str), ' ms Hamming window'); 
title(str);
saveas(gcf,strcat(str,num2str(f0),'.png'))
end