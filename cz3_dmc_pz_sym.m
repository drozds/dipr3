%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%                                                                              %
%%    Przyk�adowy skrypt z implementacj� prostego regulatora DMC w wersji       %
%%  analitycznej, uzupe�niony o pomiar zak��cenia (cz. III - symulowanie        %
%%  dzia�ania uk�adu regulacji po uprzednim obliczeniu parametr�w regulatora    %
%%  i ustaleniu parametr�w scenariusza eksperymentu).                           %
%%    Przyj�te oznaczenia:                                                      %
%%    yk - bie��ca warto�� wyj�cia obiektu                                      %
%%    uk - bie��ca warto�� sterowania                                           %
%%    zk - bie��ca warto�� zak��cenia                                           %
%%    yk1 - poprzednia warto�� wyj�cia obiektu                                  %
%%    zk1 - poprzednia warto�� zak��cenia                                       %
%%    D - horyzont dynamiki                                                     %
%%    ke, ku, kz - parametry regulatora                                         %
%%                                                                              %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Autor: Piotr Marusak; 2001-2020
%   Wersja przeznaczona dla s�uchaczy wyk�adu Diagnostyka proces�w przemys�owych
% (DIPR) prowadzonego na Wydziale Elektroniki i Technik Informacyjnych 
% Politechniki Warszawskiej.


% G��wna p�tla programu

for i=1:czas_sym
   
   yk1=yk;
   zk1=zk;
   
   if i==chwila_zak
      zk=wart_zak;
   end
   
   % Obiekt
   
   yk=a1*yk+b1*uk+c1*zk;
      
   % Regulator DMC
   
   ek=y_zad-yk;
   
   if fl_pomiar_zak==1
      for n=D-1:-1:2;
         deltazp(n)=deltazp(n-1);
      end
      deltazp(1)=zk-zk1;
   end      
   
   %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
   % Prawo regulacji
   
   deltauk=ke*ek-ku*deltaup';
   if fl_pomiar_zak==1
      deltauk=deltauk-kz*deltazp';
   end         
   
   %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
   
   for n=D-1:-1:2;
      deltaup(n)=deltaup(n-1);
   end
   deltaup(1)=deltauk;
   uk=uk+deltaup(1);
   
   wyu(i)=uk;
   wyy(i)=yk;
end

% Graficzna prezentacja wynik�w oblicze�

plot(wyy,'b');hold on; grid on;
stairs(0:czas_sym,[yzad_pocz y_zad*ones(1,czas_sym)],'--');
stairs(0:czas_sym,[u_pocz wyu],'m');
xlabel('czas [Tp]');ylabel('u, y, y_{zad}')
title('Wynik dzialania ukladu z regulatorem DMC');

