function varargout = vdpn(varargin)

if nargout==2
varargout{1}=[2,0]';
varargout{2}='Van der Pol-equation';
return
end

if nargin==1
    x=varargin{1};
elseif nargin==2
    t=varargin{1};
    x=varargin{2};
end
   
% Normalized Van der Pol equation

global mu
if isempty(mu)
    mu=1e3;
end

varargout{1} = [2*mu*x(2);
            2*mu^2*(1-x(1).^2).*x(2)-2*mu*x(1)];

end