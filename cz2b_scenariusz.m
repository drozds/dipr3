%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%                                                                              %
%%    Przyk³adowy skrypt z implementacj¹ prostego regulatora DMC w wersji       %
%%  analitycznej, uzupe³niony o pomiar zak³ócenia (cz. II - ustalanie           %
%%  parametrów scenariusza eksperymentu).                                       %
%%    Przyjête oznaczenia:                                                      %
%%    y_pocz - pocz¹tkowa wartoœæ wyjœcia obiektu                               %
%%    u_pocz - pocz¹tkowa wartoœæ sterowania                                    %
%%    z_pocz - pocz¹tkowa wartoœæ zak³ócenia                                    %
%%    D - horyzont dynamiki (horyzont dynamiki zak³ócenia Dz przyjêto taki sam) %
%%                                                                              %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Autor: Piotr Marusak; 2001-2020
%   Wersja przeznaczona dla s³uchaczy wyk³adu Diagnostyka procesów przemys³owych
% (DIPR) prowadzonego na Wydziale Elektroniki i Technik Informacyjnych 
% Politechniki Warszawskiej.

% Wartoœæ zadana

y_zad=0;

% Horyzont symulacji

czas_sym=10;

% Parametry obiektu

a1=0.7; b1=0.8; c1=0.1;

% Zak³ócenie mierzalne

wart_zak=1; % wartoœæ skoku zak³ócenia
chwila_zak=2; % chwila skoku zak³ócena
fl_pomiar_zak=1; % 1 - pomiar zak³ócenia wykorzystany w regulatorze

% Warunki pocz¹tkowe

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
