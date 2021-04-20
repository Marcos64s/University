clear all;close all;clc;

N=100;
E=zeros(n,1);
epsilon=1;

nequi=1000; npassos=10000;



i=0;
for  E0=[-N+N/10:N/10:-N+9*N/10] 
    i=i+1;
    [Emedio,EDmedio]=fteste1_2a(N,E0,nequi,npassos);
    Emediod(i) = Emedio;
    T(i) = 2./(log((EDmedio+2))./EDmedio);

    fprintf(1,'E0=%f, T=%f, <E>=%f\n',E0,T(i),Emediod(i))

end
Tt = min(T):0.1:max(T);
Emediot = -N.*tanh(1./Tt);
figure(1)
plot(Tt,Emediot,'xk',T,Emediod,'r-')
xlabel('T'); ylabel('<E>')


N=100;
nequi=1000; npassos=10000;

i=0;
for E0=[-N+N/10:N/10:-N+9*N/10] 
    i=i+1;
    [Emedio,EDmedio] = fteste1_2b(N,E0,nequi,npassos);
    Emediod(i) = Emedio;
    T(i) = 2/(log((EDmedio+2))/EDmedio);    
    fprintf(1,'E0=%f, T=%f, <E>=%f\n',E0,T(i),Emediod(i))
end
Tt = min(T):0.1:max(T);
Emediot = -N+2./(exp(2./Tt)-1);
figure(2)
plot(T,Emediod,'*r',Tt,Emediot,'r-')
grid on
xlabel('T'); ylabel('<E>')