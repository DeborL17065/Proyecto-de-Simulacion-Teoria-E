%% Universidad del Valle de Guatemala
% Departamento de Ingenieria
% Teoría Electromagnética 1       Secci?n:    10
% Debora López               Carne:   17065

%% GLOBAL

global R
global e

%% Computar los valores
R = 10;
e = 1;


figure(1)
x1 = 0:50;
y1 = 0:2*pi/100:pi;
[x, y] = meshgrid(x1, y1);
F = (x<R).*((((3*x)/(2*e)).*cos(y))-((6*(x.^3))/(7*e*(R^2))).*((5/2).*((cos(y)).^3)-((3/2).*cos(y))))+ (x>=R).*((((3*(R^3))./(2*e*(x.^2))).*cos(y))-((6*(R^5))./(7*e*(x.^4))).*((5/2).*((cos(y)).^3)-((3/2).*cos(y))));
mesh(F);
colormap (hsv)
colorbar; 
%%grid off


xticks([0 R 50])
%%xticklabels({'0', '500', '1000'})
%%xlabel('r')
%%yticks([0  pi])
%%yticklabels({'0', '25', '50'})
%%ylabel('theta')
zlabel('V(r,theta)');
title('Potencial en 3D');

figure(2)
x1 = 0:50;
y1 = 0:pi;
[x, y] = meshgrid(x1, y1);
F = (x<R).*((((3*x)/(2*e)).*cos(y))-((6*(x.^3))/(7*e*(R^2))).*((5/2).*((cos(y)).^3)-((3/2).*cos(y))))+ (x>=R).*((((3*(R^3))./(2*e*(x.^2))).*cos(y))-((6*(R^5))./(7*e*(x.^4))).*((5/2).*((cos(y)).^3)-((3/2).*cos(y))));
E = gradient(F);
quiver3(x,y,E,E)
