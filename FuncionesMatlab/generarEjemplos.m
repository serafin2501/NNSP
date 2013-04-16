function Ej=generarEjemplos(liga)

ptas=encontrarPaths;

switch liga
        case 'Espana'
            load datosEsp0506_1213.mat
            path=ptas{1};
            Equipos=textread([ptas{1} '\' 'AllTeams.txt'],'%s');
            prefijo='SP';
            temp='0506%0607%0708%0809%0910%1011%1112%1213';
            dir='EjemplosSP.mat';
            tp=31;
            ppt=38;

        case 'Inglaterra'
            load datosIng0506_1213.mat
            path=ptas{2};
            Equipos=textread([ptas{2} '\' 'AllTeams.txt'],'%s');
            prefijo='EP';
            temp='0506%0607%0708%0809%0910%1011%1112%1213';
            dir='EjemplosEP.mat';
            tp=31;
            ppt=38;
            
        case 'Alemania'
            load datosAle0506_1213.mat
            path=ptas{3};
            Equipos=textread([ptas{3} '\' 'AllTeams.txt'],'%s');
            prefijo='DP';
            temp='0607%0708%0809%0910%1011%1112%1213';
            dir='EjemplosDP.mat';
            tp=28;
            ppt=34;
            
        case 'Italia'
            load datosIta0506_1213.mat
            path=ptas{4};
            Equipos=textread([ptas{4} '\' 'AllTeams.txt'],'%s');
            prefijo='IP';
            temp='0506%0607%0708%0809%0910%1011%1112%1213';
            dir='EjemplosIP.mat';
            tp=31;
            ppt=38;
            
        case 'Francia'
            load datosFra0506_1213.mat
            path=ptas{5};
            Equipos=textread([ptas{5} '\' 'AllTeams.txt'],'%s');
            prefijo='FP';
            temp='0708%0809%0910%1011%1112%1213';
            dir='EjemplosFP.mat';
            tp=31;
            ppt=38;
end

r=regexp(temp,'%','split');

Ej=[];
for i=3:size(temporadas,2) %for de todas las temporadas empezando por la 0708
      tempo=r(i)
      totalPartidos=ppt;
      
      if i==size(temporadas,2)
         totalPartidos=tp; 
      end
      
    for j=1:size(temporadas,1)%For de los equipos

        nombreEquipo=temporadas(j,i)
        equipo=strcmp(Equipos(:,1),nombreEquipo);
        datosequipo=datos(:,:,equipo);
    
        for jornada=1:totalPartidos

        part=strcat(char(tempo),num2str(jornada));
        [E,ag]=generarDatos(path,datos,datosequipo,part);
        
        if ag==1
        Ej=[Ej;E];
        end
        
        end
    end
    
end

save (dir,'Ej');
end
