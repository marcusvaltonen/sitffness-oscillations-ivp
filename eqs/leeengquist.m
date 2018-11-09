function varargout=leeengquist(varargin)

%   Lee, Y., Engquist, B. "Variable Step Size Multiscale Methods for Stiff
%   and Highly Oscillatory Dynamical Systems"

if nargout==2
varargout{1}=[1,0,1,0]';
varargout{2}='Stellar Orbit Problem with Resonance';
return
end

if nargin==1
    x=varargin{1};
elseif nargin==2
    t=varargin{1};
    x=varargin{2};
end

global a b epsilon 

if isempty(a)
    a = 2;
end
if isempty(b)
    b = 1;
end
if isempty(epsilon)
    epsilon = 1e-4;
end

varargout{1} = [ a/epsilon*x(2);
                -a/epsilon*x(1)+x(3)^2/a;
                 b/epsilon*x(4);
                -b/epsilon*x(3)+2*x(1)*x(2)/b];
end
