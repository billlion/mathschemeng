%dy/dx = Ay
%A < 0
% Forward Euler Stable h < 2/|A|
% Backward Euler Stable for all h
%A > 0
% Forward Euler unstable for all h
% Bakcward Euler stablt h > 2/A (but inaccurate!)

x0=0; xN=5; y0=1;

%Negative A
A = -4; %2/|A| = 0.2
Nlist = [5,10,25,50]; %h =5/N = [1,0.5,0.2,0.1], 2/A=0.5

%Analytic solution
x_ana=linspace(x0,xN,1000)';
y_ana=zeros(length(x_ana),1);
y_ana(1)=1; x_ana(1)=x0;
for i=2:length(x_ana)
    y_ana(i) = exp(A*x_ana(i));    
end

%Loop through some different h
for j=1:length(Nlist)
N=Nlist(j);
h=(xN-x0)/N;

x=linspace(x0,xN,N+1);
y_app_FE=zeros(length(x),1);
y_app_BE=zeros(length(x),1);

y_app_FE(1)=1;
y_app_BE(1)=1;
for i=2:length(x)
    y_app_FE(i) = (1+h*A)*y_app_FE(i-1);
    y_app_BE(i) = (1-h*A)\y_app_BE(i-1);      
end

figure;
plot(x,y_app_FE,'b*'); hold on
plot(x,y_app_BE,'g*'); 
plot(x_ana,y_ana,'r')

hleg = legend(sprintf('FORWARD h = %1.1f, 2/A = %1.1f',h,2/A),...
    sprintf('BACKWARD h = %1.1f, 2/A = %1.1f',h,2/A),'ANALYTIC','Location','NorthWest');
set(hleg,'FontSize',15);
% The array mTextBoxPosition has four elements
% [x y length height]

end