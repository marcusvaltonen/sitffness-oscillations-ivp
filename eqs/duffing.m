function varargout=duffing(varargin)

if nargout==2
varargout{1}=[1,1]';
varargout{2}='Duffing oscillator';
return
end

if nargin==1
    x=varargin{1};
    t=0;
elseif nargin==2
    t=varargin{1};
    x=varargin{2};
end

global delta beta alpha gamma omega

if isempty(delta)
    delta = .2;
end
if isempty(beta)
    beta = -1;
end
if isempty(alpha)
    alpha = 1;
end
if isempty(gamma)
    gamma = .3;
end
if isempty(omega)
    omega = 1;
end

varargout{1} = [x(2);
                gamma*cos(omega*t)-delta*x(2)-beta*x(1)-alpha*x(1)^3];
end