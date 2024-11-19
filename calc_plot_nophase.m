clc
clear all

Zta = 0.03 + j*0.3; Ztb = 0.02 + j*0.2; Iload = 1.05*cosd(-45) + j*1.05*sind(-45);
V2 = 1; 

low_side = 1:0.1:32;
Sa = zeros(length(low_side),1);
Sb = zeros(length(low_side),1);
Sa_flow_real = zeros(length(low_side),1);
Sa_flow_img = zeros(length(low_side),1);
Sb_flow_real = zeros(length(low_side),1);
Sb_flow_img = zeros(length(low_side),1);
for i = 1:length(low_side)

    [Sa_temp, Sb_temp, Sa_flow, Sb_flow] = power_and_flow(low_side(i),Iload,Zta,V2,Ztb);
    Sa(i) = abs(Sa_temp);
    Sb(i) = abs(Sb_temp);
    Sa_flow_real(i) = real(Sa_flow);
    Sa_flow_img(i) = imag(Sa_flow);
    Sb_flow_real(i) = real(Sb_flow);
    Sb_flow_img(i) = imag(Sb_flow);

end
figure
hold on
ax.YScale = 'log';
plot(low_side,Sa + Sb,'LineWidth',3)
xlabel("high side tab value")
ylabel("Complex Power j(PU)")
hold off
figure
hold on
plot(low_side,Sa_flow_real,'LineWidth',3)
plot(low_side,Sb_flow_real,'LineWidth',3)
legend("Sa flow real","Sb flow real")
xlabel("high side tab value")
ylabel("Complex Power Flow Real(PU)")
hold off

figure
hold on
plot(low_side,Sa_flow_img,'LineWidth',3)
plot(low_side,Sb_flow_img,'LineWidth',3)
legend("Sa flow imag","Sb flow imag")
xlabel("high side tab value")
ylabel("Complex Power Flow Reactive(PU)")
hold off

[Sa, Sb, Sa_flow,Sb_flow] = power_and_flow(1.05,Iload,Zta,V2,Ztb)

function [Sa, Sb, Sa_flow,Sb_flow] = power_and_flow(low_side,Iload,Zta,V2,Ztb)

    c = 1/low_side;
    Ib = (Iload*Zta - V2*(c-1))/(Ztb + Zta*c);
    Ia = Iload - Ib*c;
    Vta = Ia*Zta;
    Vtb = Ib*Ztb;
    Sa = Vta*conj(Ia);
    Sb = Vtb*conj(Ib);
    V1 = V2 + Vta;
    Sa_flow = V1*conj(Ia);
    Sb_flow = V1*conj(Ib);
end