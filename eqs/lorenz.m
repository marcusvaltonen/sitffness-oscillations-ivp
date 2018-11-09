function varargout=lorenz(varargin)

if nargout==2
varargout{1}=[1,1,1]';
varargout{2}='Lorenz equation';
return
end

if nargin==1
    x=varargin{1};
elseif nargin==2
    t=varargin{1};
    x=varargin{2};
end

global s r b

if isempty(b)
    b = 8/3;
end
if isempty(s)
    s = 10;
end
if isempty(r)
    r = 28;
end

varargout{1} = [s*(x(2)-x(1));
                r*x(1)-x(2)-x(1)*x(3);
                x(1)*x(2)-b*x(3)];
end