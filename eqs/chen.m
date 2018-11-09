function varargout=chen(varargin)

if nargout==2
varargout{1}=[1,1,1]';
varargout{2}='Chens equation';
return
end

if nargin==1
    x=varargin{1};
elseif nargin==2
    t=varargin{1};
    x=varargin{2};
end

global a b c
 
if isempty(a)
    a = 35;
end
if isempty(b)
    b = 8/3;
end
if isempty(c)
    c = 28;
end

varargout{1} = [a*(x(2)-x(1));
                (c-a)*x(1)-x(1).*x(3)+c*x(2);
                x(1).*x(2)-b*x(3)];
end