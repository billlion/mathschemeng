%md2y/dx2 + d dy/dx + k y = 0 y(0)=1, dy/dx(0)=0
%Substitution dy/dx=v
%System s=(y,dy/dx), s'=F(x)s with F(x)=[0,1;-k/m,-d/m],
%eigenvalues of F are 1,1000 => stifffness ratio = 1000
%x(t) = -1/999*exp(-1000t)+1000/999exp(-t)

%Parameter values
m=1; d=1001; k=1000;
x0=0; xN=5; y0=1; dy0=0;

%Analaytic displacement
x_ana = linspace(x0,xN,10001);
y_ana=zeros(length(x_ana),1); y_ana(1)=y0;
for i=2:length(x_ana)
    y_ana(i) = 1000/999*exp(-x_ana(i)) -1/999*exp(-1000*x_ana(i));
end

%Loop over some Ns
Nlist = [50,2495,2497,2499,2501,5000];  
for j=1:length(Nlist)
N=Nlist(j);
h=(xN-x0)/N; %2/stiffness ratio = 1/500 , h=(xN-x0)/N < 1/500 => N >2500 
x=linspace(x0,xN,N+1);

%Storage for 1st variable
y_exp_apps=zeros(length(x),1);
y_imp_apps=zeros(length(x),1);
%Initial conditions
y_exp_app=[y0;dy0];
y_exp_apps(1)=y0;
y_imp_app=[y0;dy0];
y_imp_apps(1)=y0;

for i=2:length(x)        
    %System matrix
    F=[0,1;-k/m,-d/m];
    %Explict and implicit step
    y_exp_app =  (eye(2) + h*F)*y_exp_app;
    y_imp_app =  (eye(2) - h*F)\y_imp_app;    
    %Store the 1st variable
    y_exp_apps(i)=y_exp_app(1);
    y_imp_apps(i)=y_imp_app(1);    
end

%Plot implicit Euler for j=1, 
if(j==1)
figure; hold on;
plot(x_ana,y_ana,'k');
plot(x,y_imp_apps,'b*');
hleg = legend('ANALYTIC',...
    sprintf('BACKWARD h = %3.0f',Nlist(j)),'Location','NorthWest');
set(hleg,'FontSize',15);

end

figure; hold on;
plot(x_ana,y_ana,'k');
plot(x,y_exp_apps,'b');
plot(x,y_imp_apps,'r');

hleg = legend('ANALYTIC',...
    sprintf('FORWARD  h = %1.7f (stable %1.3f)',h,1/500),...
    sprintf('BACKWARD h = %1.7f (stable %1.3f)',h,1/500),'Location','NorthWest');
set(hleg,'FontSize',15);

end

%figure; hold on;
%plot(x_ana,y_ana,'k');
%plot(x,y_imp_apps,'b');


