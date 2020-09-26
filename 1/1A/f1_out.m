function [nz, dz,s_n, y] = f1_out(f0, F1, B1, fs, f_name)
%Used for Q1-3: calculates the frequency response and the signal output to
%a pulse train for a single formant
%Q1 code
T = 1/fs;
r1 = exp(-B1*pi*T);
th1 = 2*pi*F1*T;
syms z;
a = 2*r1*cos(th1);
b = r1.^2;
H(z) = 1/(1-a*(z.^-1) + b*(z.^-2)); %Transfer function
[nz, dz] = numden(H(z));
nz = sym2poly(expand(nz));
dz = sym2poly(expand(dz));

%Q2 code
t = 0:1/fs:0.5;
d = 0:1/f0:0.5;
width = 1e-3;
x = rectpuls(t,width); 
s_n = pulstran(t,d,x,fs); %source input signal
% Since Y(z)*D(z) = N(z)*X(z) where H(z) = N(Z)/D(Z)
% which gives: Y(z)*(1-a(z^-1) + b(z^-2)) = X(z)
% Difference equation: y[n] - ay[n-1] - by[n-2] = x[n]
y = zeros(1,length(t));
y(1) = s_n(1);
y(2) = s_n(2) + a*y(1);
for n = 3:length(t)
   y(n) = s_n(n) + a*y(n-1) - b*y(n-2); 
end
%Scaling
y = (y - min(y))./(max(y) - min(y));
y = 2*y - 1;
%sound(y, fs);
file_name = "./audio/" + f_name + ".wav";
audiowrite(file_name,y,fs);
end