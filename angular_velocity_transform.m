syms a b c real;

fi_dot=a^2+2;
theta_dot=b^4+5;
psi_dot=2*c+7;

angle_dot=[fi_dot
            theta_dot
            psi_dot];
theta=pi/5;
fi=pi/6;
pqr_matrix=transform(theta,fi,angle_dot);



function transformed_matrix=transform(theta,fi,angular_velocity_vector)
    %angular_velocity vector is in terms of fi_dot theta_dot and psi_dot 
    transformation_matrix= [
                   1 0 -sin(theta)
                   0 cos(fi) sin(fi)*cos(theta)
                   0 -sin(fi) cos(fi)*cos(theta)];
               
              transformed_matrix=transformation_matrix*angular_velocity_vector; 
               
end