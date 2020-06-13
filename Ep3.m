%% Program for FDLF 
b=busdat;   l=linedat;
nb=length(b(:,1));
n1=find(b(:,2)>1);  % finds index of non slack buses 
n2=find(b(:,2)>2);  % finds index of pq buses
Y=ybusf(l);         % Ybus function   
B1 =imag(Y(n1,n1));
B11=imag(Y(n2,n2));
Ps=b(:,5)-b(:,7);   dP=Ps;  % schedule powers and 
Qs=b(:,6)-b(:,8);   dQ=Qs;  % initial values 
d=b(:,4);V=b(:,3);
while (max(abs(dP(n1)))>0.0001||max(abs(dQ(n2)))>0.0001)
    S=(V.*exp(-1i*d)).*(Y*(V.*exp(1i*d)));  % S=(V L-d)x(Yx(V Ld))
    dP=Ps-real(S);  dQ=Qs+imag(S);          % S=V*I || S=P-jQ
    d(n1)=d(n1)-B1\ dP(n1) ./V(n1);
    V(n2)=V(n2)-B11\dQ(n2)./V(n2);
end
display(V); D=d*180/pi; display(D);  % Volt & Degrees