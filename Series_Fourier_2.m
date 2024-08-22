%% Series de Fourier
clc
clear
% Periodo
T=2*pi;
t=linspace(-T, T, 1000);
% Funcion usada
 Funcion=@(t) square(t);
% Funcion=@(t) (pi-t)/2;
% Funcion con condiciones
 % Funcion=@(t) (t>0 & t<pi).*(-pi) + (-pi<t&t<0).*(-t) ;
N=30;

A_cero= (2/T) *integral(@(t) Funcion(t), -T/2, T/2);

Fourier=0;

for n = 1:N
    
    a= (2/T).* integral(@(t) Funcion(t).*cos((2*pi*n*t)/T), -T/2, T/2); 
    b= (2/T).* integral(@(t) Funcion(t).*sin((2*pi*n*t)/T), -T/2, T/2);

    Fourier=  Fourier + (a.*cos(2*pi*n*t/T) + b.*sin(2*pi*n*t/T));
end

Fourier1=Fourier + A_cero/2;

% Visualización
figure(1);
plot(t, Funcion(t), 'r', 'LineWidth', 1.5); 
hold on;
plot(t, Fourier1, 'c', 'LineWidth', 1);
xlabel('t');
ylabel('f(t)');
title('Serie de Fourier');
legend('Función original', 'Aproximación de Fourier');
grid on;

