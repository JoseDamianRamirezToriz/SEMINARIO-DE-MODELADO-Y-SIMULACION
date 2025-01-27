function dz=doblependulo (t,z)
%---definicion de los parametros---%
Lp=0.0079;
Mp=0.7031;
Ip=0.3302;
Mc=0.23;
Fc=0;
Bp=4.3;
g=9.81;
Beq=0.0024;
%---Estados del sistema---%
dz=zeros(4, 1);

%---Definicion de la dinamica del sistema---%
denom= (Mc+Mp)*Ip+Mc*Mp*Lp^2+Mp^2*Lp^2*sin(z(3))^2;
dz(1)=z(2);
dz(2)= ((Ip+Mp*Lp^2)*Fc+Mp^2*Lp^2*g*cos(z(3))*sin(z(3))-(Ip+Mp*Lp^2)*Beq*z(2)-(Ip*Mp*Lp-Mp^2*Lp^3)*z(4)^2*sin(z(3))-Mp*Lp*z(4)*cos(z(3))*Bp) / denom;
dz(3)=z(4);
dz(4)= (Mc+Mp)*Mp*g*Lp*sin(z(3))-(Mc+Mp*Bp*z(4)+Fc*Mp*Lp*cos(z(3))-Mp^2-Lp^2*z(4)^2*sin(z(3))*cos(z(3))-Beq*Mp*Lp*z(2)*cos(z(3))) / denom;