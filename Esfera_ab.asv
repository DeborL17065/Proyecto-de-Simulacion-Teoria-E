%% Universidad del Valle de Guatemala
% Departamento de Ingenieria
% Teoría Electromagnética 1       Secci?n:    10
% Debora López               Carne:   17065

%% GLOBAL

global a
global b
global k
global e

%% Computar los valores
a = 1500;
b = 3000;
k = 200;
e = 4;


figure(1)
x1 = 0:10:5000;
y1 = 0:pi;
[x, y] = meshgrid(x1, y1);
F = (x<a).*(((k/2).*(1-(x/a).*cos(y))))+ (a<x>b).*(((k/2)*(a-((x.*(a^2)).*cos(y))))-((k*b.*x)/e)+ ((2*k*(x.^2))/(5*e*b)).*((3/2)*((cos(y)).^2)-(1/2)))+(x>b).*(((k/2)*(a-((x.*(a^2)).*cos(y))))-((k*b^2)/e*x)+ ((2*k*(b^4))./(5*e*(x.^3))).*((3/2)*((cos(y)).^2)-(1/2)));




meshc(x,y,F);
colormap (hsv)
colorbar; 
grid off

xticks([0 1500  3000 5000])
%%xticklabels({'0', '500', '1000'})
xlabel('r')
%%yticks([0 (3*pi)/4 pi])
%%yticklabels({'0', '25', '50'})
ylabel('theta')
zlabel('V(r,theta)');
title('Potencial en 3D');
