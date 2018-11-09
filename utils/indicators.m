function [t,x,sigma,M,m,O,nmshe,nmhe,nmno,nmano,nmfull,name]=indicators(ode,x0,time,options)
%[t,x,sigma,M,m,tau,o,O]=indicators(ode,x0)
%   
%   Info coming soon.
%
%   Created by Marcus Valtonen �rnhag, 2014-10-16.

[x0_start,name]=ode();
if nargin<2
    x0=x0_start;
end
if nargin<3
    time=[0 1];
end
if nargin<4
    if isempty(x0)
        x0=x0_start;
    end
    options=odeset('AbsTol',1e-6,'RelTol',1e-6);
end

[t,x]=ode15s(ode,time,x0,options);

% ESTIMATE

N=length(x);
sigma=zeros(N,1);
M=zeros(N,1);
m=zeros(N,1);
O=zeros(N,1);
nmshe=zeros(N,1);
nmhe=zeros(N,1);
nmno=zeros(N,1);
nmano=zeros(N,1);
nmfull=zeros(N,1);

for j=1:N
    J=jacobianest(ode,x(j,:));
    
    HeJ=(J+J')/2;
    mu=eig(HeJ);
    M(j)=max(mu);
    m(j)=min(mu);
    sigma(j)=(M(j)+m(j))/2;
    
    SheJ=(J-J')/2/1i;
    omega=eig(SheJ);
    O(j)=max(omega);
    
    JhJ=J'*J;
    JJh=J*J';
    
    NoJ=(JhJ+JJh)/2;
    AnoJ=(JhJ-JJh)/2;
 
    nmshe(j)=norm(SheJ);
    nmhe(j)=norm(HeJ);
    nmno(j)=norm(NoJ);
    nmano(j)=norm(AnoJ);
    nmfull(j)=norm(JhJ);
    
end
end