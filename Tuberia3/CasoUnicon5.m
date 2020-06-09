clc
clear
%% Universidad del Valle de Guatemala
% Departamento de Ingenieria
% Teoría Electromagnética 1       Secci?n:    10
% Renato Mendizábal               Carne:   18007
% Proyecto de Simulación - Ecuacin de Laplace en coordenadas rectangulares
% Tuberia 3

%--------------------------------------------------------------------------
% Información:
% Paredes en:            X = 0, X = a,          Y = 0, Y = b
% Potencial en paredes:  Para X = 0          -> Estan estacionadas (V = 0)
%                        Para X = a          -> Estan estacionadas (V = 0)
%                        Para Y = 0 y b      -> Estan estacionadas (V = 0)
%                        Para Z = 0          -> F(x,y) = x*(y^2)
%                        Para Z = infinto    -> v = 0

%% GLOBAL

global a
global b
global N
global d  % Representa el eje z = 0 donde esta el potencial

%% Computar los valores
a = 1;
b = 1;
N = 100;
d = 0;

VOLTAJE = @(x, y)SUPER(x, y);

figure(1)
fcontour(VOLTAJE, [0,a,0,b], 'fill','on');
colorbar
xticks([0 0.5 1])
xticklabels({'0', '25', '50'})
xlabel('x')
yticks([0 0.5 1])
yticklabels({'0', '25', '50'})
ylabel('y')
title('V(x,y)')

figure(2)
x1 = 0:0.02:a;
y1 = 0:0.02:b;
[X, Y] = meshgrid(x1, y1);
F = VOLTAJE(X, Y);
mesh(X,Y,F);
xticks([0 0.5 1])
xticklabels({'0', '25', '50'})
xlabel('x')
yticks([0 0.5 1])
yticklabels({'0', '25', '50'})
ylabel('y')
zlabel('V(x,y)');
title('Potencial en 3D');

figure(3)
[ex,ey]=gradient(F, a, b);
quiver(-ex,-ey);

Vq = griddata(X, Y, F, X, Y);

save('TEORICO.mat', 'Vq');

%% Funciones de condicion de frontera

function v = f1(x)
    v = x ;        
end

function v = f2(y)
    v = y.^2 ;        
end

%% Soluciones

function v1 = V1(x, y)
    global a b N d
    v1 = 0;
    for n = 5 : N
        I1 = integral((@(w) sin(n*pi*w/a).*f1(w)), 0, a);
        I2 = integral((@(v) sin(n*pi*v/b).*f2(v)), 0, b);
        c = I1 .* I2;
        c = c .* sin(n*pi*x/a) .* sin(n*pi*y/b) .* exp(-d*pi*sqrt( ((n/a)^2) + (n/b)^2) );
        v1 = v1 + c;
    end
    v1 = (4/a*b)*v1;
end

function V = SUPER(x, y)  
    V = V1(x, y);
end