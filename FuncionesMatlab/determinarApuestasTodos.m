function [c,pag] = determinarApuestasTodos(nApuesta)

[ptas,pathAG]=encontrarPaths;
s=[pathAG,'JornadaAbril57.xlsx'];
[n,t,x]=xlsread(s);

equi=x(:,2:3);
pagos=x(:,4:6);
ap=load([pathAG,'apuestasTodos2.txt']);
ap=ap/100;

nap=roundn(nApuesta*ap,-3);
c(:,1:2)=equi;

for f=1:size(x,1)
    for i=1:3
        c(f,i+2)={nap(f,i)};
    end
end
pag=nap.*cell2mat(pagos);
esperado=sum(sum(nap.*cell2mat(pagos)))
retorno=esperado/nApuesta
end