function [E,ag]=generarDatos(path,datoscomp,datosequipo, jornada)

ventana=3;


teams=textread([path,'AllTeams.txt'],'%s');

r= strcmp(datosequipo(:,1),jornada);
rival=datosequipo(r,2);
riv=strcmp(teams(:,1),rival);
datosrival=datoscomp(:,:,riv);

part=str2double(jornada(5:end));

%Definir Local y Visitante
ha=datosequipo{r,3};
ftr=datosequipo{r,6};
gh=datosequipo(r,4);
ga=datosequipo(r,5);

z=zeros(1,8);
ag=1;

if ha==1 %Local
    datoshome=datosequipo;
    datosaway=datosrival;
    nomLocal=datosrival(r,2);
    nomAway=rival;

else %Visitante 
    datosaway=datosequipo;
    datoshome=datosrival;
    nomAway=datosrival(r,2);
    nomLocal=rival;

end

%resultado Gano(1), Empato(2), Perdio(3)
switch ftr
    case 1,%gano el local
        if ha==1%es local
            resultado=1;
        else%es visitante
            resultado=3;
        end
    case 2,%empataron

            resultado=2;

    case 3,%Gano el visitante
        if ha==1%es local
            resultado=3;
        else%es visitante
            resultado=1;
        end
end


[dgeneral,ptslocal,poslocal]=encontrarPartido(datoshome, 'general', ventana, jornada);%Se cambio de datosequipo a datoshome

if dgeneral==z
    ag=0;
end

[dgeneralrival,ptsvis,posvis]=encontrarPartido(datosaway, 'general', ventana, jornada);

if dgeneralrival==z
    ag=0;
end

[dlocallocal]=encontrarPartido(datoshome,'local',ventana,jornada);%ultimos 5 partidos local

if dlocallocal==z
    ag=0;
end

[dvisvis]=encontrarPartido(datosaway,'visitante',ventana,jornada);%ultimos 5 partidos visitante

if dvisvis==z
    ag=0;
end

[ddir]=encontrarPartido(datosequipo,'equipo',ventana,jornada,rival);%enfrentamiento directo

if ddir==z
    ag=0;
end

%[ddirL]=encontrarPartido(datoshome,'equipolocal',5,jornada,nomAway);

%[ddirV]=encontrarPartido(datosaway,'equipovisitante',5,jornada,nomLocal);

    part=part-1;
if part==0
    puntosh=0;
    puntosa=0;
else

puntosh=100*(ptslocal)/(part);
puntosa=100*(ptsvis)/(part);
end

posrelativa=abs(poslocal-posvis)/20;

E=[dgeneral,dgeneralrival,dlocallocal,dvisvis,ddir,...
    puntosh,puntosa,poslocal,posvis,posrelativa,ftr];%Cambiado el ultimo termino de resultado -> goles
                                                                    %Agregado cell2mat
            

end