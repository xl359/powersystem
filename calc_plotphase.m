clc
clear all

Zta = 0.03 + j*0.3; Ztb = 0.02+j*0.2; Iload = 1.05*cosd(-45) + j*1.05*sind(-45);
V2 = 1; 

alpha = -45:1:45;
Sa = zeros(length(alpha),1);
Sb = zeros(length(alpha),1);
Sa_flow_real = zeros(length(alpha),1);
Sa_flow_img = zeros(length(alpha),1);
Sb_flow_real = zeros(length(alpha),1);
Sb_flow_img = zeros(length(alpha),1);
for i = 1:length(alpha)

    [Sa_temp, Sb_temp, Sa_flow, Sb_flow] = power_and_flow(alpha(i),Iload,Zta,V2,Ztb);
    Sa(i) = abs(Sa_temp);
    Sb(i) = abs(Sb_temp);
    Sa_flow_real(i) = real(Sa_flow);
    Sa_flow_img(i) = imag(Sa_flow);
    Sb_flow_real(i) = real(Sb_flow);
    Sb_flow_img(i) = imag(Sb_flow);

end
figure
hold on
plot(alpha,Sa + Sb,'LineWidth',3)
xlabel("high side Phase angle value j(degree)")
ylabel("Complex Power j(PU)")
hold off

figure
hold on
plot(alpha,Sa_flow_real,'LineWidth',3)
plot(alpha,Sb_flow_real,'LineWidth',3)
legend("Sa flow real","Sb flow real")
xlabel("high side Phase angle value (degree)")
ylabel("Complex Power flow real(PU)")
hold off

figure
hold on
plot(alpha,Sa_flow_img,'LineWidth',3)
plot(alpha,Sb_flow_img,'LineWidth',3)
legend("Sa flow imag","Sb flow imag")
xlabel("high side Phase angle value (degree)")
ylabel("Complex Power flow reactive(PU)")
hold off

function [Sa, Sb, Sa_flow,Sb_flow] = power_and_flow(alpha,Iload,Zta,V2,Ztb)

    Ib = (Zta*Iload - V2*((cosd(-alpha) + j*sind(-alpha))-1))/((cosd(alpha) + j*sind(alpha))*Zta + Ztb);
    Ia = Iload - (cosd(alpha) + j*sind(alpha))*Ib;
    Vta = Ia*Zta;
    Vtb = Ib*Ztb;
    Sa = Vta*conj(Ia);
    Sb = Vtb*conj(Ib);
    V1 = V2 + Vta;
    Sa_flow = V1*conj(Ia);
    Sb_flow = V1*conj(Ib);
end