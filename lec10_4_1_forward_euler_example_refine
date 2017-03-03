%dy/dx = -y + x + 1; y(0)=1
%Forward(Explicit) Euler and %Backward(Implicit) Euler with refinement level

%End points and initial condition
x0=0; xN=1; y0=1;

%Do implicit
implicit_on=1;

%Analytic soluttion y = x + e(-x)
x_ana=linspace(x0,xN,10001); y_ana(1)=y0;
for i=2:length(x_ana)
    y_ana(i) = x_ana(i) + exp(-x_ana(i));
end
%Plot
figure(1); hold on; plot(x_ana,y_ana,'k')
if(implicit_on==1)
    figure(2); hold on; plot(x_ana,y_ana,'k')
end
%Explicit Euler solution for different refine h = (x1-x0)/N
Nlist = [10,20,50,100];
Plist = {'r*';'g*';'b*';'c*'};


for j=1:length(Nlist)
N=Nlist(j);
h=(xN-x0)/N;

%Create array of x and y_app
x=linspace(x0,xN,N+1);
y_app_exp=zeros(length(x),1); y_app_exp(1)=y0;
if(implicit_on==1)
	y_app_imp=zeros(length(x),1); y_app_imp(1)=y0;
end

for i=2:length(x)
    %Explicit Euler steps
    y_app_exp(i) = y_app_exp(i-1) + h*(-y_app_exp(i-1) + x(i-1) + 1);

    %Implicit Euler steps
	if(implicit_on==1)
    	y_app_imp(i) = ( y_app_imp(i-1) + h*(x(i) +1) ) / (1+h);
    end

    y_ana_lecs(i) = x(i) + exp(-x(i));

    
end

figure(1); hold on;
plot(x,y_app_exp,Plist{j}); hold on

if(implicit_on==1)
    figure(2); hold on;
    plot(x,y_app_imp,Plist{j}); hold on
end

%Print the lecture values
if(N==10)
    x_lec=x;
    y_app_exp_lec=y_app_exp;
	if(implicit_on==1)
	    y_app_imp_lec=y_app_imp;
	end
    y_ana_lec=y_ana_lecs;
end

end

figure(1); title('Explicit Euler')
legend('Analytic',sprintf('h = %1.5f',(xN-x0)/Nlist(1)),...
sprintf('h = %1.5f',(xN-x0)/Nlist(2)),...
sprintf('h = %1.5f',(xN-x0)/Nlist(3)),...
sprintf('h = %1.5f',(xN-x0)/Nlist(4)),'Location','NorthWest');

if(implicit_on==1)
    figure(2); title('Implicit Euler')
    legend('Analytic',sprintf('h = %1.5f',(xN-x0)/Nlist(1)),...
    sprintf('h = %1.5f',(xN-x0)/Nlist(2)),...
    sprintf('h = %1.5f',(xN-x0)/Nlist(3)),...
    sprintf('h = %1.5f',(xN-x0)/Nlist(4)),'Location','NorthWest');
end

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


