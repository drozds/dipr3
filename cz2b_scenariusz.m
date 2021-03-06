%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%                                                                              %
%%    Przykładowy skrypt z implementacją prostego regulatora DMC w wersji       %
%%  analitycznej, uzupełniony o pomiar zakłócenia (cz. II - ustalanie           %
%%  parametrów scenariusza eksperymentu).                                       %
%%    Przyjęte oznaczenia:                                                      %
%%    y_pocz - początkowa wartość wyjścia obiektu                               %
%%    u_pocz - początkowa wartość sterowania                                    %
%%    z_pocz - początkowa wartość zakłócenia                                    %
%%    D - horyzont dynamiki (horyzont dynamiki zakłócenia Dz przyjęto taki sam) %
%%                                                                              %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Autor: Piotr Marusak; 2001-2020
%   Wersja przeznaczona dla słuchaczy wykładu Diagnostyka procesów przemysłowych
% (DIPR) prowadzonego na Wydziale Elektroniki i Technik Informacyjnych 
% Politechniki Warszawskiej.

% Wartość zadana

y_zad=0;

% Horyzont symulacji

czas_sym=10;

% Parametry obiektu

a1=0.7; b1=0.8; c1=0.1;

% Zakłócenie mierzalne

wart_zak=1; % wartość skoku zakłócenia
chwila_zak=2; % chwila skoku zakłócena
fl_pomiar_zak=1; % 1 - pomiar zakłócenia wykorzystany w regulatorze

% Warunki początkowe

y_pocz=0;
u_pocz=0;
z_pocz=0;
yzad_pocz=0;

yk=y_pocz;
uk=u_pocz;
zk=z_pocz;
for i=1:D-1
   deltaup(i)=0;
   deltazp(i)=0;
end
