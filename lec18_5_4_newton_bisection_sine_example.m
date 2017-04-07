%F(x) = 0
%1. sin(x) x = n*pi, if x0 \approx (n+1)*pi/2, derivative is 0 and Newton's
%method can diverge

%Plot sine over 6 wavelengths
Np=1001;
xp=linspace(-pi/2,pi/2,Np);
for j=1:Np
   Fx_p(j) = sin(xp(j));
end

%Good initial guess for Newton
figure; plot(xp,Fx_p,'b'); hold on;
x(1) = pi/20;
N=10;
for j=1:N
    %Function and derivative
    Fx(j) = sin(x(j)); DFx(j) = cos(x(j));
    plot(x(j),Fx(j),'r*');
    
    x(j+1) = x(j) - Fx(j)/DFx(j);
    plot([x(j),x(j+1)],[Fx(j),0],'g');    
end
plot(x(N+1),sin(x(N+1)),'r*');
title('Initial guess close to minimum')

fprintf(1,' xi  yi   y(xi) Error = |yexp_i - y(xi)|  \n')
for ii=1:length(x)
   fprintf(1,' %0.20f   %1.20f \n', x(ii), sin(x(ii)) )    
end

%Plot over 3 wavelengths
Np=1001;
xp=linspace(-5*pi/2,pi/2,Np);
for j=1:Np
   Fx_p(j) = sin(xp(j));
end

%Far away initial guess for Newton i.e. derivative is nearly 0
figure; plot(xp,Fx_p,'b'); hold on;
pert_ = 0.2; x(1) = pi/(2+pert_)
N=10;
for j=1:N
    %Function and derivative
    Fx(j) = sin(x(j)); DFx(j) = cos(x(j));
    plot(x(j),Fx(j),'r*');   
    
    x(j+1) = x(j) - Fx(j)/DFx(j);    
    plot([x(j),x(j+1)],[Fx(j),0],'g');
end
plot(x(N+1),sin(x(N+1)),'r*');

title('Initial guess far from minimum and near critical point')

fprintf(1,' xi  yi   y(xi) Error = |yexp_i - y(xi)|  \n')
for ii=1:length(x)
   fprintf(1,' %0.20f   %1.20f \n', x(ii), sin(x(ii)) )    
end


