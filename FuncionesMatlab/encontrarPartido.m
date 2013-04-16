function d=encontrarPartido(datosequipo, parametro, ventana, numpartido, nombreequipo)

%ventana puede ser un string o un numero
%datos es un cell de 2 dimensiones que es el resultado de cada equipo.

d={};

if strcmp(numpartido,'ultimo')
       numpartido=ultimoPartido(datosequipo);%Encontrar ultimo partido
end

if (strcmp(parametro,'local'))
    inddat=[datosequipo{:,3}]==1;
    dat=datosequipo(inddat,:);
        d1=size(dat,1);%Ultima Fila
    
     

     te=str2double(numpartido(1:4));
    pj=str2double(numpartido(5:end));

    flag=0;
    while d1>0 && flag==0
        ultenf=char(dat(d1,1));
        teult=str2double(ultenf(1:4));
        pjult=str2double(ultenf(5:end));

        %El ultimo partido debe ser de igual temporada y menor jornada O
        %de menor temporada
        if teult>te
            d1=d1-1;
        elseif teult == te %Si son de la misma temporada la jornada tiene que ser menor
            if pj>pjult
                numpartido=ultenf;
                flag=1;
            else
                d1=d1-1;
            end
        else
            numpartido=ultenf;
            flag=1;
        end
        
    end
    
    
%     r=find(strcmp(dat(:,1),numpartido));
%     if size(r,1)==0%Si el ultimo partido es de visitante, selecciona al ultimo de local
%         if size(dat,1)~=0
%             while size(r,1)==0
%                 te=numpartido(1:4);
%                 ppp=str2double(numpartido(5:end))-1;
%                 if ppp==0
%                     te1=str2double(te(1:2))-1;
%                     te2=str2double(te(3:4))-1;
%                     te12=[num2str(te1),num2str(te2)];
%                     if size(te12,2)==2
%                         te=['0' te12(1) '0' te12(2)];
%                     elseif size(te12,2)==3
%                         te=['0' te12];
%                     else
%                         te=te12;
%                     end
%                     ppp=38;
%                 end
%                 
%             numpartido=[te,num2str(ppp)];
%             r=find(strcmp(dat(:,1),numpartido));
%             end
%         end
%     end
    
    if size(dat,1)==0
        d=zeros(1,12);
    else
    
    d=Partidos(dat,ventana,numpartido);
    end
elseif(strcmp(parametro,'visitante'))
    inddat=[datosequipo{:,3}]==2;
    dat=datosequipo(inddat,:);
        d1=size(dat,1);%Ultima Fila
    
     

     te=str2double(numpartido(1:4));
    pj=str2double(numpartido(5:end));

    flag=0;
    while d1>0 && flag==0
        ultenf=char(dat(d1,1));
        teult=str2double(ultenf(1:4));
        pjult=str2double(ultenf(5:end));

        %El ultimo partido debe ser de igual temporada y menor jornada O
        %de menor temporada
        if teult>te
            d1=d1-1;
        elseif teult == te %Si son de la misma temporada la jornada tiene que ser menor
            if pj>pjult
                numpartido=ultenf;
                flag=1;
            else
                d1=d1-1;
            end
        else
            numpartido=ultenf;
            flag=1;
        end
        
    end
    
    
%         r=find(strcmp(dat(:,1),numpartido));
% 
%     if size(r,1)==0%Si el ultimo partido es de local, selecciona el ultimo de visitante
%         if size(dat,1)~=0
%         while size(r,1)==0
%                 te=numpartido(1:4);
%                 ppp=str2double(numpartido(5:end))-1;
%                 if ppp==0
%                     te1=str2double(te(1:2))-1;
%                     te2=str2double(te(3:4))-1;
%                     te12=[num2str(te1),num2str(te2)];
%                     if size(te12,2)==2
%                         te=['0' te12(1) '0' te12(2)];
%                     elseif size(te12,2)==3
%                         te=['0' te12];
%                     else
%                         te=te12;
%                     end
%                     ppp=38;
%                 end
%                 
%             numpartido=[te,num2str(ppp)];
% 
%             r=find(strcmp(dat(:,1),numpartido));
%         end
%         end
%     end    
    if size(dat,1)==0
        d=zeros(1,12);
    else
    
    d=Partidos(dat,ventana,numpartido);
    end
elseif(strcmp(parametro,'equipo'))
    
    inddat= strcmp(datosequipo(:,2),nombreequipo);
    dat=datosequipo(inddat,:);
    d1=size(dat,1);%Ultima Fila
    
    te=str2double(numpartido(1:4));
    pj=str2double(numpartido(5:end));

    flag=0;
    while d1>0 && flag==0
        ultenf=char(dat(d1,1));
        teult=str2double(ultenf(1:4));
        pjult=str2double(ultenf(5:end));

        %El ultimo partido debe ser de igual temporada y menor jornada O
        %de menor temporada
        if teult>te
            d1=d1-1;
        elseif teult == te %Si son de la misma temporada la jornada tiene que ser menor
            if pj>pjult
                numpartido=ultenf;
                flag=1;
            else
                d1=d1-1;
            end
        else
            numpartido=ultenf;
            flag=1;
        end
        
    end
    
    

    if size(dat,1)==0
        d=zeros(1,12);
    else

    d=Partidos(dat,ventana,numpartido);
    end
    
elseif(strcmp(parametro,'equipovisitante'))%Contra un equipo jugando de visitante
    
    inddat= strcmp(datosequipo(:,2),nombreequipo);
    dat=datosequipo(inddat,:);
    inddat=[dat{:,3}]==2;
    dat=dat(inddat,:);
    d1=size(dat,1);%Ultima Fila
    
     

     te=str2double(numpartido(1:4));
    pj=str2double(numpartido(5:end));

    flag=0;
    while d1>0 && flag==0
        ultenf=char(dat(d1,1));
        teult=str2double(ultenf(1:4));
        pjult=str2double(ultenf(5:end));

        %El ultimo partido debe ser de igual temporada y menor jornada O
        %de menor temporada
        if teult>te
            d1=d1-1;
        elseif teult == te %Si son de la misma temporada la jornada tiene que ser menor
            if pj>pjult
                numpartido=ultenf;
                flag=1;
            else
                d1=d1-1;
            end
        else
            numpartido=ultenf;
            flag=1;
        end
        
    end
     
     
     
     
     
     
     
%       r=find(strcmp(dat(:,1),numpartido));
%       if size(r,1)==0%Si el ultimo partido no fue contra ese equipo, selecciona el ultimo contra el equipo
%       if size(dat,1)~=0
%         te=numpartido(1:4);
%                 d1=1;
%                while d1<size(dat,1) && size(r,1)==0
%                     f=char(dat(d1,1));
%                     rc=strcmp(te,f(1:4));
%                 if rc==1
%                 
%                 ppp=str2double(numpartido(5:end));
%                 pp2=str2double(f(5:end));
%                     if pp2>ppp
%                         if d1==1
%                             ind=1;
%                         else
%                             ind=d1-1;
%                         end
%                         numpartido=dat(ind,1);
%                     end
%                     
%                 end
%                 d1=d1+1;
%                 r=find(strcmp(dat(:,1),numpartido));
%                end
%         
%       end
%     end
%     
    if size(dat,1)==0
        d=zeros(1,12);
    else
    
    d=Partidos(dat,ventana,numpartido);
    end
elseif(strcmp(parametro,'equipolocal'))%Contra un equipo jugando de local
    
    inddat= strcmp(datosequipo(:,2),nombreequipo);
    dat=datosequipo(inddat,:);
    inddat=[dat{:,3}]==1;
    dat=dat(inddat,:);
    d1=size(dat,1);%Ultima Fila
    
     

     te=str2double(numpartido(1:4));
    pj=str2double(numpartido(5:end));

    flag=0;
    while d1>0 && flag==0
        ultenf=char(dat(d1,1));
        teult=str2double(ultenf(1:4));
        pjult=str2double(ultenf(5:end));

        %El ultimo partido debe ser de igual temporada y menor jornada O
        %de menor temporada
        if teult>te
            d1=d1-1;
        elseif teult == te %Si son de la misma temporada la jornada tiene que ser menor
            if pj>pjult
                numpartido=ultenf;
                flag=1;
            else
                d1=d1-1;
            end
        else
            numpartido=ultenf;
            flag=1;
        end
        
    end
    
    
    
    
%      r=find(strcmp(dat(:,1),numpartido));
% 
%     if size(r,1)==0%Si el ultimo partido no fue contra ese equipo, selecciona el ultimo contra el equipo
%       if size(dat,1)~=0
%             te=numpartido(1:4);
%                 d1=1;
%                while d1<size(dat,1) && size(r,1)==0
%                     f=char(dat(d1,1));
%                     rc=strcmp(te,f(1:4));
%                 if rc==1
%                 
%                 ppp=str2double(numpartido(5:end));
%                 pp2=str2double(f(5:end));
%                     if pp2>ppp
%                         if d1==1
%                             ind=1;
%                         else
%                             ind=d1-1;
%                         end
%                         numpartido=dat(ind,1);
%                     end
%                     
%                 end
%                 d1=d1+1;
%                 r=find(strcmp(dat(:,1),numpartido));
%                end
%       end
%     end


    if size(dat,1)==0
        d=zeros(1,12);
    else
    d=Partidos(dat,ventana,numpartido);
    end
    
elseif(strcmp(parametro,'general'))
    

    [dmy,d1]=ultimoPartido(datosequipo);%Ultima Fila
    dat=datosequipo;
    te=str2double(numpartido(1:4));
    pj=str2double(numpartido(5:end));

    flag=0;
    while d1>0 && flag==0
        ultenf=char(dat(d1,1));
        teult=str2double(ultenf(1:4));
        pjult=str2double(ultenf(5:end));

        %El ultimo partido debe ser de igual temporada y menor jornada O
        %de menor temporada
        if teult>te
            d1=d1-1;
        elseif teult == te %Si son de la misma temporada la jornada tiene que ser menor
            if pj>pjult
                numpartido=ultenf;
                flag=1;
            else
                d1=d1-1;
            end
        else
            numpartido=ultenf;
            flag=1;
        end
        
    end
    
    
    
    
    
    
%     te=numpartido(1:4);
%     r=find(strcmp(datosequipo(:,1),numpartido));
%                 d1=1;
%                while d1<size(datosequipo,1) && size(r,1)==0
%                     f=char(datosequipo(d1,1));
%                     rc=strcmp(te,f(1:4));
%                 if rc==1
%                 
%                 ppp=str2double(numpartido(5:end));
%                 pp2=str2double(f(5:end));
%                     if pp2>ppp
%                         if d1==1
%                             ind=1;
%                         else
%                             ind=d1-1;
%                         end
%                         numpartido=datosequipo(ind,1);
%                     end
%                     
%                 end
%                 d1=d1+1;
%                 r=find(strcmp(datosequipo(:,1),numpartido));
%                end

 if size(dat,1)==0
        d=zeros(1,12);
 else
 d=Partidos(datosequipo,ventana,numpartido);
 end
 
 
else
    d={};
end

end
