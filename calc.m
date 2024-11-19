clc
clear all

Zta = j*0.3; Ztb = j*0.2; Iload = 1.05*cosd(-45) + j*1.05*sind(-45);
V2 = 1; 

%% (a)
Zload = V2/Iload;
Ia = Iload*Ztb/(Zta + Ztb);
Ib = Iload*Zta/(Zta + Ztb);
Vt = Ia*Zta;
Sa = Vt*conj(Ia)
Sb = Vt*conj(Ib)
V1 = V2 + Vt;
Sa_flow = V1*conj(Ia)
Sb_flow = V1*conj(Ib)


%angle = atand(imag(V2)/real(V2)) - atand(imag(Vt)/real(Vt));
%P1 = abs(Vt)*abs(V2)/abs(Zta)*sind(angle)

%% (b)
low_side = 1.05;
c = 1/low_side;
Ib = (Iload*Zta - V2*(c-1))/(Ztb + Zta*c);
Ia = Iload - Ib*c;
Vta = Ia*Zta;
Vtb = Ib*Ztb;
Sa = Vta*conj(Ia)
Sb = Vtb*conj(Ib)
V1 = V2 + Vta;
Sa_flow = V1*conj(Ia)
Sb_flow = V1*conj(Ib)
%angle = atand(imag(V2)/real(V2)) - atand(imag(Vt)/real(Vt));
%P1 = abs(Vt)*abs(V2)/abs(Zta)*sind(angle)

%% (c)
alpha = 3; 
Ib = (Zta*Iload - V2*((cosd(-alpha) + j*sind(-alpha))-1))/((cosd(alpha) + j*sind(alpha))*Zta + Ztb);
Ia = Iload - (cosd(alpha) + j*sind(alpha))*Ib;
Vta = Ia*Zta;
Vtb = Ib*Ztb;
Sa = Vta*conj(Ia)
Sb = Vtb*conj(Ib)
V1 = V2 + Vta;
Sa_flow = V1*conj(Ia)
Sb_flow = V1*conj(Ib)
%angle = atand(imag(V2)/real(V2)) - atand(imag(Vta)/real(Vta));
%P1 = abs(Vta)*abs(V2)/abs(Zta)*sind(angle)


