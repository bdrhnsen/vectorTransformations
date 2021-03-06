% vector transformations
%rand coordinate
psi=pi/4;
theta=pi/6;
fi=pi/8;

%input vector
vx0=3;
vy0=-6;
vz0=14;

Lpsi_matris=Lpsi(psi);
Lfi_matris=Lfi(fi);
Ltheta_matris=Ltheta(theta);

L=Lfi_matris*Ltheta_matris*Lpsi_matris;


vector_input=[
    vx0
    vy0
    vz0];
vector_output=L*vector_input;

%to go back

Lpsi_matris=Lpsi(-psi);
Lfi_matris=Lfi(-fi);
Ltheta_matris=Ltheta(-theta);

L_inverse=Lpsi_matris*Ltheta_matris*Lfi_matris;
%output 2 should be same with vector_input
vector_output2=L_inverse*L*vector_input;


%transform matrices around z axis yaw
function Lpsi_matris = Lpsi(psi)
Lpsi_matris =[
    cos(psi) sin(psi) 0
    -sin(psi) cos(psi) 0
    0   0   1];
end

%around y axis pitch
function Ltheta_matris = Ltheta(theta)
Ltheta_matris=[
    cos(theta) 0 -sin(theta)
    0   1   0
    sin(theta) 0 cos(theta)];
end

%around x axis roll
function Lfi_matris = Lfi(fi)
Lfi_matris=[
    1 0 0
    0 cos(fi) sin(fi)
    0 -sin(fi) cos(fi)];
end

