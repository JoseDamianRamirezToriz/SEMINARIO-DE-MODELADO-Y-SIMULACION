%funcion ode45 que resuelve numericamente el sistema doblependulo%
[t,x]=ode45(@doblependulo, [0 100], [0 1 0 0]);
%son parametros que retorna la funcion ode45%

figure(1)
subplot (2,1,1);
plot (t,x(:,1));
grid on
title("dinamica del pendulo");
xlabel("Tiempo");
ylabel("posicion y angulo");

subplot (2,1,2);
plot (t,x(:,2));
grid on
title("velocidad del pendulo");
xlabel("Tiempo");
ylabel("velocidad y velocidad angular");