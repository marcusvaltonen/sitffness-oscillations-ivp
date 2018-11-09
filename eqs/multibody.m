function varargout=multibody(varargin)

%   Petzold, L. Jay, L., Yen,. J, "Numerical solution of highly oscillatory
%   ordinary differential equations".

if nargout==2
varargout{1}=[.9,.1,0,0]'; % (x,y,u,v)
varargout{2}='Multibody dynamics';
return
end

if nargin==1
    x=varargin{1};
elseif nargin==2
    t=varargin{1};
    x=varargin{2};
end

global epsilon 

if isempty(epsilon)
    epsilon = sqrt(1e-3);
end

r=sqrt(x(1)^2+x(2)^2);
lambda=1/epsilon^2*(r-1)/r;

varargout{1} = [x(3);
                x(4); 
                -lambda*x(1);
                1-lambda*x(2)];
                                
end
