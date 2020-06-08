clc
clear
%% Universidad del Valle de Guatemala
% Departamento de Ingenieria
% Teoría Electromagnética 1       Secci?n:    10
% Renato Mendizábal               Carne:   18007
% Proyecto de Simulación - Ecuacin de Laplace en coordenadas rectangulares
% Tuberia 1 - Caso 1

%--------------------------------------------------------------------------
% Información:
% Paredes en:            X = 0, X = a,     Y = 0, Y = b
% Potencial en paredes:  Para X = 0     -> V = g(y) = 0
%                        Para X = a     -> V = h(y) = Arctan(y/a)
%                        Para Y = 0 y b -> Estan estacionadas (V = 0)

%% Valores generales en todas las ecuaciones
global a
global b
global N

%% Graficar funciones
a = 1;
b = 1;
N = 100;

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
[ex,ey]=gradient(F, 7, 3);
quiver(-ex,-ey);

Vq = griddata(X, Y, F, X, Y);

save('TEORICO.mat', 'Vq');

%% Funciones del potencial de las superficies
function v = h(y)
    global a;
    v = atan(y/a); 
end

%% Funciones a graficar
function v1 = V1(x, y)
    global a b N
    v1 = 0;
    for n = 10 : N
        c = integral((@(w) sin(n*pi*w/b) .* h(w)), 0, b);
        c = c .* sinh(n*pi*x/b) .* (sin(n*pi*y/b)) ./ (sinh(n*pi*a/b));
        v1 = v1 + c;
    end
    v1 = (2/b)*v1;
end

function V = SUPER(x, y)  
    V = V1(x, y);
end