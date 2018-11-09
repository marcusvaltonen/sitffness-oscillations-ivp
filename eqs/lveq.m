function varargout = lveq(varargin)

if nargout==2
varargout{1}=[1,1]';
varargout{2}='Lotka-Volterra';
return
end

if nargin==1
    x=varargin{1};
elseif nargin==2
    t=varargin{1};
    x=varargin{2};
end

global a b c d
if isempty(a)
    a = 3;
end
if isempty(b)
    b = 9;
end
if isempty(c)
    c = 15;
end
if isempty(d)
    d = 15;
end

varargout{1} = [a*x(1)-b*x(1)*x(2);
                 c*x(1)*x(2)-d*x(2)];

end