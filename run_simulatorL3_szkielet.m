%UWAGA:
% * Symulator pracuje z czasem pr�bkowania Tp=1sec - jeden krok to 1 sec.
% * Symulator pami�ta stan i zaczyna symulacj� od warunk�w,
%   kt�re si� ustali�y po ostatnim uruchomieniu.

% init_simulator.m ustawia stan pocz�tkowy i powinien by� wykonany
% na pocz�tku symulacji, chyba �e u�ytkownik z jakiego� powodu chce
% kontynuowa� symulacj� dla ostatnich warunk�w.

% Takim powodem mo�e by� np. pr�ba zabrania odpowiedzi skokowej w punkcie
% pracy (hl, hr, fl, fr, tl, tr), gdzie:
%  hl - grza�ka lewa (0,100)
%  hr - grza�ka prawa (0,100)
%  fl - wentylator lewy (0,100)
%  fr - wentylator prawy (0,100)
%  tl - temperatura lewa C
%  tr - temperatura prawa C 
% Przeprowadzenie takiego eksperymentu wymaga wprowadzenie symulatora w
% zadany punkt pracy. W tym celu nale�y ustawi� sygna�y MV i DV i wykona�
% symulacj� na horyzoncie ok. 1800 krok�w, �eby zmienne procesowe PV (tl i
% tr) ustawi�y si� na warto�ciach punktu pracy. Nast�pnie mo�na wykona� 
% eksperyment w celu np identyfikacji transmitancji zak��cenia.
init_simulator
cz1_par_reg
tl_flt=0;
tr_flt=0;
simLength = 3000;
global HLv;
global TLv;
%inicjalizacja
FLv = zeros(1,simLength);
FRv = zeros(1,simLength);
HRv = zeros(1,simLength);
fl = 40;
fr = 50;
hr = 15;
stpt = 30;
HLv = zeros(1,simLength);
hl = 0;
TLv = zeros(1,simLength);
TRv = zeros(1,simLength);
tl = TLamb;
tr = TRamb;

deltauk = zeros(1, simLength);
deltaupk = zeros(1, D-1);
deltazp=  zeros(1, D-1);
for k = 1:1:simLength
   % /* REGULATOR generuj�cy hl*/
   if( k == 800) 
    stpt = 50;
   end
%    if( k == 1500) 
%     stpt = 20;
%    end
%    Temperatura przekazywana do regulatora
   
   if(k >= 850 && k <= 855)
    tl_reg = TLv(849);
    fl = 74;%40 + 0.1*40
   else
       tl_reg = tl;
   end
   uchyb = stpt - tl_reg;
   for n=D-1:-1:2
    deltazp(n)=deltazp(n-1);
   end
   if k==1
       deltazp(1)=0;
   else
       deltazp(1)=fl-FLv(k-1);
   end
   deltauk=ke*uchyb-ku*deltaupk'-kz*deltazp';
   for n=D-1:-1:2
      deltaupk(n)=deltaupk(n-1);
   end
   deltaupk(1)=deltauk;
    
   for n=D-1:-1:2
      deltaupk(n)=deltaupk(n-1);
   end
   deltaupk(1)=deltauk;
   hl = hl + deltaupk(1);
   %    OGRANICZENIA
   if(hl > 100)
        hl = 100;
   end
    if(hl < 0)
        hl = 0;
    end
   % obiekt regulacji
   
   [tl, tr] = step_simulator(hl, hr, fl, fr,tl_flt, tr_flt);
   TLv(k) = tl;
   TRv(k) = tr;
   FLv(k) = fl;
   FRv(k) = fr;
   HLv(k) = hl;
   HRv(k) = hr;
end

figure;
    subplot(2,1,1);
    plot(FLv,'r');
    hold on;
    grid on;
    plot(FRv, 'b--');
    xlabel('k');
    ylabel('U(k)');
    title('Sterowanie wentylator�w');
    legend('FLU', 'FRU');
    
    subplot(2,1,2);
    plot(HLv,'r');
    hold on;
    grid on;
    plot(HRv, 'b--');
    xlabel('k');
    ylabel('U(k)');
    title('Sterowanie grza�ek');
    legend('HL', 'HR');
    
    figure;
    subplot(2,1,1);
    plot(TLv,'r');
    hold on;
    grid on;
    xlabel('k');
    ylabel('TL(k)');
    title('Temperatura lewa TL');
    
    subplot(2,1,2);
    plot(TRv,'r');
    hold on;
    grid on;
    xlabel('k');
    ylabel('TR(k)');
    title('Temperatura prawa TR');

