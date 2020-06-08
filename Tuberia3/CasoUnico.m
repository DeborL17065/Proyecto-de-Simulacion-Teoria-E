clc
clear
%% Universidad del Valle de Guatemala
% Departamento de Ingenieria
% Teor�a Electromagn�tica 1       Secci?n:    10
% Renato Mendiz�bal               Carne:   18007
% Proyecto de Simulaci�n - Ecuacin de Laplace en coordenadas rectangulares
% Tuberia 3

%--------------------------------------------------------------------------
% Informaci�n:
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

%% Computar los valores
a = 1;
b = 1;
N = 100;

VOLTAJE = @(x, y, z)SUPER(x, y, z);

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

function v = fx(x)
    v = x;  
end

function v = fy(y)
    v = y.^2; 
end

%% Soluciones

function v1 = V1(x, y)
    global a b N
    v1 = 0;
    for n = 2 : N
        c1 = integral((@(v) sin(n*pi*v/a).*fx(v)), 0, a);
        c2 = integral((@(w) sin(2*pi*w/a).*fy(w)), 0, b);
        c  = c1 .* c2 .* sin(n*pi*x/a) .* sin(2*pi*y/b) .* exp(-pi*sqrt( ((n/a)^2) + ((2/b)^2) ));
        v1 = v1 + c;
    end
    v1 = (4/a*b)*v1;
end

function V = SUPER(x, y)  
    V = V1(x, y);
end
