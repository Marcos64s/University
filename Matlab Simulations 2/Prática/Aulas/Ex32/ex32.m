clear all
close all
nequi=5000; nmedidas=2000;
nmax=50;
N=100;
Tv=linspace(3,300,30);
ic=0;
for T=Tv
    ic=ic+1;
   
    [Emedio(ic),E2medio(ic), nkmedio] = metropolis(T ,nequi, nmedidas,N, nmax);
    z(ic)=nkmedio(1)/(1+nkmedio(1));
    zt = 1-exp(-4*N./(pi*T) );
    Et = (pi/4)*T.^2 .*dilog(1 - zt );
    fprintf(1,'Simulacao %d, T=%f, <E>=%f, Et=%f, z=%f, zt=%f\n', ic, T, Emedio(ic)-2*N, Et, z(ic),zt);
    
    mesh(reshape(nkmedio,nmax,nmax)); % plot do numero medio de particulas com um dado nx e ny
    xlabel('nx'); ylabel('ny'); zlabel('<nk>')
    drawnow
   
    
end