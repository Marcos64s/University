clear all
close all

N=20;
npassos=10000; nequi=1000;

Tv=[0.1:0.1:1 , 1.5:0.5: 15];
H=0;


T=[0.1:0.01:15];
[m,mi,  s,si, e,ei, cv,cvi]=expTeoricasIsing1d(T,H,N);
figure(1)
plot(T,e,'k-',T,ei,'b-'); xlabel('T'); ylabel('E/N'); hold on
figure(2)
plot(T,cv,'k-',T,cvi,'b-'); xlabel('T'); ylabel('Cv/N'); axis([0, T(end), 0, 0.6]);hold on
figure(3)
plot(T,m,'k-',T,mi,'b-'); xlabel('T'); ylabel('M/N'); hold on
figure(4)
semilogy(T,s,'k-',T,si,'b-'); xlabel('T'); ylabel('S/N'); axis([0, T(end), 0, 50]); hold on

it=0;

for T=Tv
    it=it+1;

    [emedS(it), cvS(it), magS(it), suscS(it),dmed(it)]=SMC_Ising1d(T,H,N,npassos, nequi);
    fprintf(1,'Simulacao T=%f \n',T)
end
figure(1); plot(Tv,emedS/N,'r.');figure(2); plot(Tv,cvS/N,'r.')
figure(3); plot(Tv,magS/N,'r.');figure(4); semilogy(Tv,suscS/N,'r.')

pause


close all
N=200;
npassos=10000; nequi=1000;

Tv=[0.1:0.1:1 , 1.5:0.5: 15];
H=0;

T=[0.1:0.01:15]; 
[m,mi,  s,si,e,ei,cv,cvi]=expTeoricasIsing1d(T,H,N);
figure(1)
plot(T,e,'k-',T,ei,'b-'); xlabel('T'); ylabel('E/N'); hold on
figure(2)
plot(T,cv,'k-',T,cvi,'b-'); xlabel('T'); ylabel('Cv/N'); axis([0, T(end), 0, 0.6]);hold on
figure(3)
plot(T,m,'k-',T,mi,'b-'); xlabel('T'); ylabel('M/N'); hold on
figure(4)
semilogy(T,s,'k-',T,si,'b-'); xlabel('T'); ylabel('S/N'); axis([0, T(end), 0, 50]); hold on
figure(5)
csi=-1./log(tanh(1./T));
semilogy(T, csi,'b-'); axis([0, T(end) 0 N]); xlabel('T'); ylabel('csi'); hold on


it=0;
 for T=Tv
    it=it+1;

    [emedS(it), cvS(it), magS(it), suscS(it),dmed(it)]=SMC_Ising1d(T,H,N,npassos, nequi);
    fprintf(1,'Simulacao T=%f \n',T)
 end
figure(1); plot(Tv,emedS/N,'r.');figure(2); plot(Tv,cvS/N,'r.')
figure(3); plot(Tv,magS/N,'r.');figure(4); semilogy(Tv,suscS/N,'r.')
figure(5); semilogy(Tv, dmed,'r.')

% pode demonstrar-se que num sistema em que um spin é 1 com probabilidade
% 1/2 tem dmedio=2  ou seja dmedio = soma_k (k (1/2)^k 

        