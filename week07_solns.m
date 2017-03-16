%dy/dt = -10(t-1)y; y(0)=e(-5)
%Forward(Explicit) Euler

%End points and initial condition
t0=0; tN=2; y0=exp(-5);

%Analytic soluttion y = x + e(-x)
t_ana=linspace(t0,tN,201); y_ana(1)=y0;
for i=2:length(t_ana)
    y_ana(i) = exp(-5*(t_ana(i)-1)^2);
end
%Plot
figure(1); hold on; plot(t_ana,y_ana,'k');title('EXPLICIT')
figure(2); hold on; plot(t_ana,y_ana,'k');title('IMPLICIT')

%Explicit Euler solution for different refine h = (x1-t0)/N
Nlist = [10,40,4000];
Plist = {'r*';'g*';'b*'};


for j=1:length(Nlist)
N=Nlist(j);
h=(tN-t0)/N;

%Create array of x and y_app
t=linspace(t0,tN,N+1);
y_app_exp=zeros(length(t),1); y_app_exp(1)=y0;
y_app_imp=zeros(length(t),1); y_app_imp(1)=y0;

for i=2:length(t)
    %Explicit Euler steps
    y_app_exp(i) = y_app_exp(i-1) + h*(-10*(t(i-1)-1))*y_app_exp(i-1);
    y_app_imp(i) = ( 1+h*10*(t(i)-1) )\y_app_imp(i-1);
        
end

figure(1); hold on;
plot(t,y_app_exp,Plist{j}); hold on;

figure(2); hold on;
plot(t,y_app_imp,Plist{j}); hold on;

end


%figure(1); title('Explicit Euler')
%legend('Analytic',sprintf('h = %1.5f',(tN-t0)/Nlist(1)),...
%sprintf('h = %1.5f',(tN-t0)/Nlist(2)),'Location','NorthWest');


%{
%Explicit error table
fprintf(1,' xi  yexp_i   y(xi) Error = |yexp_i - y(xi)|  \n')
for ii=1:length(x_lec)
   fprintf(1,' %0.1f   %1.3f    %1.3f     %1.3f \n', x_lec(ii), y_app_exp_lec(ii),y_ana_lec(ii), abs(y_app_exp_lec(ii)- y_ana_lec(ii)) )    
end

if(implicit_on==1)
	%Implicit error table
	fprintf(1,' xi  yimp_i   y(xi) Error = |yexp_i - y(xi)|  \n')
	for ii=1:length(x_lec)
	   fprintf(1,' %0.1f   %1.3f    %1.3f     %1.3f \n', x_lec(ii), y_app_imp_lec(ii),y_ana_lec(ii), abs(y_app_imp_lec(ii)- y_ana_lec(ii)) )    
	end
end

%}
