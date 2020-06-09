%% Universidad del Valle de Guatemala
% Departamento de Ingenieria
% Teoría Electromagnética 1       Secci?n:    10
% Debora López               Carne:   17065

%% GLOBAL

global R
global E_0

%% Computar los valores
R = 10;
E_0 = 5;

figure(1)
x1 = R:50;
y1 = 0:2*pi;
[x, y] = meshgrid(x1, y1);

F= (x>R).*(-E_0.*x.*cos(y).*(1-(R^2./x.^2)));


meshc(F);
colormap (hsv)
colorbar; 
grid off

xticks([R 50])
%%xticklabels({'0', '500', '1000'})
xlabel('r')
%%yticks([0 (3*pi)/4 pi])
%%yticklabels({'0', '25', '50'})
ylabel('theta')
zlabel('V(r,theta)');
title('Potencial en 3D');