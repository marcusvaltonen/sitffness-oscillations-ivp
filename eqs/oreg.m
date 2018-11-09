function varargout = oreg(varargin)

if nargout==2
varargout{1}=[1,1,2]';
varargout{2}='Oregonator';
return
end

if nargin==1
    x=varargin{1};
elseif nargin==2
    t=varargin{1};
    x=varargin{2};
end
   
% Normalized Oregonator equation

global s q w
if isempty(s)
    s=77.27;
end
if isempty(q)
    q=8.375e-6;
end
if isempty(w)
    w=.161;
end


varargout{1} = 320*[s*(x(1)-x(1).*x(2)+x(2)-q*x(1).^2);
        (x(3)-x(2)-x(1).*x(2))/s;
        w.*(x(1)-x(3))];

end