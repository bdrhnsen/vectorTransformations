%pqr is what we get from IMU lets say there is an assigned projection
%use in_tranform for pqr -> dot matrix
%use transform for dot -> pqr

syms a b c real;

p=a^2+2;
q=b^4+5;
r=2*c+7;

pqr_matrix=[p
            q
            r];
theta=pi/5;
fi=pi/6;
dot_matrix=in_transform(theta,fi,pqr_matrix);



function transformed_matrix=transform(theta,fi,angular_velocity_vector)
    %angular_velocity vector is in terms of fi_dot theta_dot and psi_dot 
    %dot vector to pqr
    transformation_matrix= [
                   1 0 -sin(theta)
                   0 cos(fi) sin(fi)*cos(theta)
                   0 -sin(fi) cos(fi)*cos(theta)];
               
              transformed_matrix=transformation_matrix*angular_velocity_vector; 
               
end
function transformed_matrix=in_transform(theta,fi,angular_velocity_vector)
    %pqr to dot_vector
    transformation_matrix= [
                   1 sin(theta)*tan(theta) cos(fi)*tan(theta)
                   0 cos(fi) -sin(theta)
                   0 sin(fi)*sec(theta) cos(fi)*sec(theta)];
               
              transformed_matrix=transformation_matrix*angular_velocity_vector; 
               
end
