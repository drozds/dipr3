%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%                                                                              %
%%    Przyk�adowy skrypt z implementacj� prostego regulatora DMC w wersji       %
%%  analitycznej, uzupe�niony o pomiar zak��cenia (cz. II - ustalanie           %
%%  parametr�w scenariusza eksperymentu).                                       %
%%    Przyj�te oznaczenia:                                                      %
%%    y_pocz - pocz�tkowa warto�� wyj�cia obiektu                               %
%%    u_pocz - pocz�tkowa warto�� sterowania                                    %
%%    z_pocz - pocz�tkowa warto�� zak��cenia                                    %
%%    D - horyzont dynamiki (horyzont dynamiki zak��cenia Dz przyj�to taki sam) %
%%                                                                              %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Autor: Piotr Marusak; 2001-2020
%   Wersja przeznaczona dla s�uchaczy wyk�adu Diagnostyka proces�w przemys�owych
% (DIPR) prowadzonego na Wydziale Elektroniki i Technik Informacyjnych 
% Politechniki Warszawskiej.

% Warto�� zadana

y_zad=0;

% Horyzont symulacji

czas_sym=10;

% Parametry obiektu

a1=0.7; b1=0.8; c1=0.1;

% Zak��cenie mierzalne

wart_zak=1; % warto�� skoku zak��cenia
chwila_zak=2; % chwila skoku zak��cena
fl_pomiar_zak=1; % 1 - pomiar zak��cenia wykorzystany w regulatorze

% Warunki pocz�tkowe

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
