function y = f2_out(f0, F1, B1, fs, f_name)
%%Used for Q4: Sounds for given vowels and multiple formants
%Q1 code
T = 1/fs;
r1 = exp(-B1*pi*T);
th1 = 2*pi*F1*T;
syms z;
a = -2*r1*cos(th1);
b = r1.^2;
H(z) = 1/(1 + a(1)*(z.^-1) + b*(z.^-2)); %Transfer function
for i = 2:length(F1)
    H(z) = H(z)*(1/(1 + a(i)*(z.^-1) + b*(z.^-2)));
end
[nz, dz] = numden(H(z));
nz = sym2poly(expand(nz));
dz = sym2poly(expand(dz));
fvtool(nz,dz) %magnitude response

%Q2 code
t = 0:1/fs:0.5;
d = 0:1/f0:0.5;
width = 1e-4;
x = rectpuls(t,width); 
s_n = pulstran(t,d,x,fs); %source input signal
coeff = -1*dz./nz(1);
y = zeros(1,length(t));
y(1) = s_n(1);
y(2) = s_n(2) + coeff(2)*y(1);
y(3) = s_n(3) + coeff(2)*y(2) + coeff(3)*y(1);
y(4) = s_n(4) + coeff(2)*y(3) + coeff(3)*y(2) + coeff(4)*y(1);
y(5) = s_n(5) + coeff(2)*y(4) + coeff(3)*y(3) + coeff(4)*y(2) + coeff(5)*y(1);
y(6) = s_n(6) + coeff(2)*y(5) + coeff(3)*y(4) + coeff(4)*y(3) + coeff(5)*y(2) + coeff(6)*y(1);
for n = 7:length(t)
   y(n) = s_n(n) + coeff(2)*y(n-1) + coeff(3)*y(n-2) + coeff(4)*y(n-3) + coeff(5)*y(n-4) + coeff(6)*y(n-5) + coeff(7)*y(n-6); 
end
%Scaling
y = (y - min(y))./(max(y) - min(y));
y = 2*y - 1;
%sound(y, fs);

%file_name = "./audio/" + f_name + ".wav";
%audiowrite(file_name,y,fs);
end