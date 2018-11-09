addpath('utils')
addpath('eqs')

% Select ODE and initialization
ode = @duffing;
x0 = [];
time = [0 10];

if isempty(x0) && isempty(time)
    [t,x,sigma,M,m,O,nmshe,nmhe,nmno,nmano,nmfull,name]=indicators(ode);
elseif isempty(time)
    [t,x,sigma,M,m,O,nmshe,nmhe,nmno,nmano,nmfull,name]=indicators(ode,x0);
else
    [t,x,sigma,M,m,O,nmshe,nmhe,nmno,nmano,nmfull,name]=indicators(ode,x0,time);
end

%% Indicators

om2 = nmshe ./ sqrt(nmno);
om2s = nmshe ./ sqrt(nmfull);

ga2 = sqrt(2*nmano ./ nmfull);
ga2s = sqrt(1/2*nmfull ./ nmno);

de2 = nmhe ./ sqrt(nmno);
de2s = nmhe ./ sqrt(nmfull);

%% Plotting

h = figure(1);
subplot(611)
plot(t,x);
title('Solution components','interpreter','latex')

subplot(612)
plot(t,sigma,'r-');
grid on
title('Stiffness indicator','interpreter','latex')

subplot(613)
plot(t,O,'b-');
grid on
title('Oscillatory indicator','interpreter','latex')

subplot(614)
plot(t,de2,'b-');
hold on
plot(t,de2s,'r--');
hold off
grid on
title('$\delta_2$ and $\hat{\delta}_2$','interpreter','latex')

subplot(615)
plot(t,om2,'b-');
hold on
plot(t,om2s,'r--');
hold off
grid on
title('$\omega_2$ and $\hat{\omega}_2$','interpreter','latex')

subplot(616)
plot(t,ga2,'b-');
hold on
plot(t,ga2s,'r--');
hold off
title('$\gamma$ and $\hat{\gamma}_2$','interpreter','latex')

set(h,'position',[1 62 580 744])
axis tight

%% Limit cycles

if size(x,2)==2
    figure(2)
    plot(x(:,1),x(:,2))
elseif size(x,2)==3
    figure(2)
    plot3(x(:,1),x(:,2),x(:,3))
end


%% Verwer's pollution model
% 
% figure(2);
% for j=1:5
%     for k=1:4
%         l=5*(k-1)+j;
%         subplot(5,4,l)
%         plot(t,x(:,l))
%         xlim(time)
%         grid
%     end
% end