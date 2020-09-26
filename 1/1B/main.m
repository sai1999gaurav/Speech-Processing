%% FILES OVERVIEW
%This is the main file wherein each cell runs each (sub)question.
%f2_out: generates response for /u/ (same as in assignment 1A)
% rect_win: rectangular window for given window length. Plots and stores
% the response.
%hamm_win: hamming window
%All figures saved in ./figures folder.
%Separate report made and results analysed.
%% Q4 low pitch, /u/
fs = 16e3;
f0 = 120;
y = f2_out(f0,[300, 870, 2240], 100, fs, 'u_lp'); %f0, f1, b1, fs, pitch_name
%%
% N = size(y, 2);
% dft_len = 10*N;
% y_dft = fftshift(fft(y, dft_len));
% f = linspace(-1,1,dft_len);
% figure(1), plot(f, 20*log(abs(y_dft)));
%% rectangular window for 5, 10, 20, 40ms
rect_win(y, f0, fs, 5e-3, 1000, 2);
rect_win(y, f0, fs, 10e-3, 1500, 3);
rect_win(y, f0, fs, 20e-3, 3000, 4);
rect_win(y, f0, fs, 40e-3, 4000, 5);
%% hann window for 5, 10, 20, 40ms
hamm_win(y, f0, fs, 5e-3, 1000, 6);
hamm_win(y, f0, fs, 10e-3, 1000, 7);
hamm_win(y, f0, fs, 20e-3, 1000, 8);
hamm_win(y, f0, fs, 40e-3, 2000, 9);
%% Q4 high pitch, /u/
f0 = 220;
y = f2_out(f0,[300, 870, 2240], 100, fs, 'u_hp');
%% rectangular window for 5, 10, 20, 40ms
rect_win(y, f0, fs, 5e-3, 1000, 10);
rect_win(y, f0, fs, 10e-3, 1500, 11);
rect_win(y, f0, fs, 20e-3, 3000, 12);
rect_win(y, f0, fs, 40e-3, 4000, 13);
%% hann window for 5, 10, 20, 40ms
hamm_win(y, f0, fs, 5e-3, 1000, 14);
hamm_win(y, f0, fs, 10e-3, 1000, 15);
hamm_win(y, f0, fs, 20e-3, 1000, 16);
hamm_win(y, f0, fs, 40e-3, 2000, 17);
