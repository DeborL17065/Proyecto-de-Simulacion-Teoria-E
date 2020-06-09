%% Universidad del Valle de Guatemala
% Departamento de Ingenieria
% Teoría Electromagnética 1       Secci?n:    10
% Debora López               Carne:   17065

%% GLOBAL

global a
global b
global k
global k1
global e

%% Computar los valores
a = 15;
b = 30;
k = 2;
k1 = 5;
e = 1;


figure(1)
x1 = 0:a;
y1 = 0:pi;
[x, y] = meshgrid(x1, y1);
F = (x<a).*(((k1/2).*(1-(x/a).*cos(y))));

meshc(F);
colormap (hsv)
colorbar; 
grid off


xticks([0 a ])
%%xticklabels({'0', '500', '1000'})
xlabel('r')
%%yticks([0 (3*pi)/4 pi])
%%yticklabels({'0', '25', '50'})
ylabel('theta')
zlabel('V(r,theta)');
title('Potencial en 3D');

figure(2)
x1 = 0:a;
y1 = 0:pi;
[x, y] = meshgrid(x1, y1);
F = (x<a).*(((k1/2).*(1-(x/a).*cos(y))));

U= gradient(F);
quiver3(x,y,U,U)


figure(3)
x1 = a:b;
y1 = 0:pi;
[x, y] = meshgrid(x1, y1);
F = (a<x<b).*(((k1/2)*(a-((x).*cos(y))))-((k*b.*x)/e)+ ((2*k*(x.^2))/(5*e*b)).*((3/2)*((cos(y)).^2)-(1/2)));

meshc(F);
colormap (hsv)
colorbar; 
grid off


xticks([ a  b ])
%%xticklabels({'0', '500', '1000'})
xlabel('r')
%%yticks([0 (3*pi)/4 pi])
%%yticklabels({'0', '25', '50'})
ylabel('theta')
zlabel('V(r,theta)');
title('Potencial en 3D');

figure(4)
x1 = a:b;
y1 = 0:pi;
[x, y] = meshgrid(x1, y1);
F = (a<x<b).*(((k1/2)*(a-((x).*cos(y))))-((k*b.*x)/e)+ ((2*k*(x.^2))/(5*e*b)).*((3/2)*((cos(y)).^2)-(1/2)));


U= gradient(F);
quiver3(x,y,U,U)


figure(5)
x1 = b:50;
y1 = 0:pi;
[x, y] = meshgrid(x1, y1);
F = (x>=b).*(((k1/2)*(a-((x).*cos(y))))-((k*b^2)./e*x)+ ((2*k*(b^4))./(5*e*x.^3)).*((3/2)*((cos(y)).^2)-(1/2)));

meshc(F);
colormap (hsv)
colorbar; 
grid off


xticks([ b 50])
%%xticklabels({'0', '500', '1000'})
xlabel('r')
%%yticks([0 (3*pi)/4 pi])
%%yticklabels({'0', '25', '50'})
ylabel('theta')
zlabel('V(r,theta)');
title('Potencial en 3D');

figure(6)
x1 = b:50;
y1 = 0:pi;
[x, y] = meshgrid(x1, y1);
F = (x>=b).*(((k1/2)*(a-((x).*cos(y))))-((k*b^2)./e*x)+ ((2*k*(b^4))./(5*e*x.^3)).*((3/2)*((cos(y)).^2)-(1/2)));



U= gradient(F);
quiver3(x,y,U,U)

