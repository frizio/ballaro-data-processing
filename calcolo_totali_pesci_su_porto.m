clear all
close all

csvfilein = 'lista_sbarcato_per_porto_cleaned.csv';
csvfileout = 'lista_sbarcato_per_porto_cleaned_tot.csv';

%[id, data, nomeporto, LAT,LON, SPECIE, quantity]

opts = detectImportOptions(csvfilein);
%preview(csvfile,opts)
C=readtable(csvfilein,opts);

nomeporto=table2cell(C(:,3));
DN=unique(nomeporto);

nomespecie=table2cell(C(:,6));
DS=unique(nomespecie);

quantita = table2cell(C(:,end));
Latitudine = table2cell(C(:,4));
Longitudine = table2cell(C(:,5));
DATA = table2cell(C(:,2));

Id=[];
Data=[];
Nomeporto={};
Lat=[];
Lon=[];
Specie={};
Quantity=[];
 
for i=1:length(DS)
 [~,L]=ismember(nomespecie,DS(i));
 nspecie = nomespecie(find(L));
 porti = nomeporto(find(L));
 Q = quantita(find(L));
 La = Latitudine(find(L));
 Lo = Longitudine(find(L));
 Dt = DATA(find(L));
 DP = unique(porti);
 for j=1:length(DP)
  [~,M]=ismember(porti,DP(j));
  S=sum(cell2mat(Q(find(M))));
  A=cell2mat(Dt(find(M)));
  A(:,11)=' ';
  A(:,end)='0';
  Dat=datetime(A,'InputFormat','yyyy-MM-dd HH:mm:ss.SSSS');
  Dm=max(Dat);
  DAt=cellstr(Dm);
  DAt{1}(12)='T';
  Id=[Id; length(Id)+1];
  Nomeporto = [Nomeporto; DP(j)];
  Z=find(M);
  Lat=[Lat;La(Z(1))];
  Lon=[Lon;Lo(Z(1))];
  Data = [Data;DAt];
  Specie = [Specie; DS(i)];
  Quantity =[Quantity; S];
 end
end

T = table(Id,Data,Nomeporto,Lat,Lon,Specie,Quantity);

writetable(T,csvfileout)

