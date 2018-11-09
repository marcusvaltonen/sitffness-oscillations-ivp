function varargout=dpend(varargin)

if nargout==2
varargout{1}=[pi/2,0,pi/2,0]';
varargout{2}='Double pendulum';
return
end

if nargin==1
    x=varargin{1};
elseif nargin==2
    t=varargin{1};
    x=varargin{2};
end

global m1 m2 l1 l2 g

if isempty(m1)
    m1 = 1;
end
if isempty(m2)
    m2 = 1;
end
if isempty(l1)
    l1 = 1;
end
if isempty(l2)
    l2 = 1;
end
if isempty(g)
    g = 9.81;
end

a=(m1+m2)*l1;
b=m2*l2*cos(x(1)-x(3));
c=m2*l1*cos(x(1)-x(3));
d=m2*l2;
e=-m2*l2*x(4)^2*sin(x(1)-x(3))-g*(m1+m2)*sin(x(1));
f=m2*l1*x(2)^2*sin(x(1)-x(3))-m2*g*sin(x(3));

varargout{1} = [x(2);
                (e*d-b*f)/(a*d-c*b);
                x(4); 
                (a*f-c*e)/(a*d-c*b)];
end
