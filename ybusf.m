function Y = ybusf(ld)
fb = ld(:,1);    tb = ld(:,2);
y = 1./ld(:,3);   b = ld(:,4) + y;
nb = max(max(fb,tb));
Y = zeros(nb);
Y(nb*(fb-1)+tb)=-y;
Y(nb*(tb-1)+fb)=-y;
for m=1:nb
    Y(m,m)=Y(m,m)+sum(b(fb==m))+sum(b(tb==m));
end