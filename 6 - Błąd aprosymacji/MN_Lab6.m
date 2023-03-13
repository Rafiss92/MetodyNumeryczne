% Autor - Rafał Mastalerz

%Ocena jakości aproksymacji i interpolacji, skrypt uniwersalny dla zmiennej liczby punktow

%czysczenie danych i konsoli dla czytelnosci wyjscia
clear;
clc;

% Punkty wejsciowe
disp("Punkty wejsciowe: ");
x=[0,1,2,3,4,5,6,7,8,9,10]
Fy=[-1,2,4,3,2,-5,6,5,7,9,8]

function retval=Wy_R(x,A,stopien,n)
	Wy=zeros(1,n);
	for i=1:n
      for j=1:stopien+1
        Wy(1,i)=Wy(1,i)+A(1,j)*x(1,i)^(stopien+1-j);
      end
    end
	retval=Wy;
endfunction

% Funkcja obliczajaca blad wzgledny
function retval=bw_R(Fy,Wy,n)
    bw=0;
    for i=1:n
       bw=bw+abs(Fy(1,i)-Wy(1,i));
    endfor
    retval=bw;
endfunction

% Funkcja obliczajaca blad kwadratowy
function retval=bk_R(Fy,Wy,n)
    bk=0;
    for i=1:n
      bk=bk+(Fy(1,i)-Wy(1,i))^2;
    endfor
    retval=bk;
endfunction

% Funkcja obliczajaca sredni blad procentowy
function retval=sbp_R(Fy,Wy,n)
    sbp=0;
    for i=1:n
      sbp=sbp+(abs((Fy(1,i)-Wy(1,i))/Fy(1,i)));
    endfor
    retval=1/n*(sbp*100);
endfunction

% Funkcja obliczajaca srednie odchylenie od krzywej
function retval=sook_R(Fy,Wy,n,stopien)
    sook=0;
    for i=1:n
      sook=sook+((Fy(1,i)-Wy(1,i))^2);
    endfor
    retval=sqrt(sook/(n-stopien-1));
endfunction

% Funkcja wygladzajaca wykres
function gladki_wykres(x,stopien,A,num)
    step=(max(x)-min(x))/num;
    Ry=zeros(1,num+1);
    Rx=zeros(1,num+1);
    %obliczanie wartosci funkcji Ry na podstawie ustalonych wspolczynnikow wielomianu
    for i=1:num+1
      Rx(1,i)=min(x)+(i-1)*step;
      for j=1:stopien+1
         Ry(1,i)=Ry(1,i)+A(1,j)*Rx(1,i)^(stopien+1-j);
      end
    end
    plot(Rx, Ry,'--r');
endfunction

if length(x)==length(Fy)
  n=length(x);

  % Oczekiwane stopnie wielomianu
  stopien=4;
  stopien2=6;
  stopien3=8;

  if stopien<n-1
    %A -macierz (wektor) wspolczynnikow wielomianu o stopniu 'stopien'
    %B -macierz (wektor) wspolczynnikow wielomianu o stopniu 'stopien2'
    %C -macierz (wektor) wspolczynnikow wielomianu o stopniu 'stopien3'
    A=polyfit(x,Fy,stopien);
    B=polyfit(x,Fy,stopien2);
    C=polyfit(x,Fy,stopien3);

    % Wy -macierz wartości funkcji W dla wielomianu stopnia 'stopien'
    % Wy2 -macierz wartości funkcji W dla wielomianu stopnia 'stopien2'
    % Wy3 -macierz wartości funkcji W dla wielomianu stopnia 'stopien3'
    % Obliczanie wartosci funkcji W na podstawie ustalonych wspolczynnikow
    % za pomocą funkcji Wy_R
    Wy=Wy_R(x,A,stopien,n);
    Wy2=Wy_R(x,B,stopien2,n);
    Wy3=Wy_R(x,C,stopien3,n);

	  % Tworzenie wykresu subplot(3,1,3) i wlaczanie na nim siatki oraz funkcji hold
    for i_plot = 1:3
     hax(i_plot) = subplot (3, 1, i_plot);
      hold (hax(i_plot), "on");
      grid (hax(i_plot), "on");
    endfor

    % rysowanie wykresu 3,1,1 i zapełnienie go danymi
    subplot(3,1,1) % Rysowanie wykresu 3,1,1
    plot(x,Fy,'rx');
    plot(x, Wy);

    #*******************
    % obliczenia poszczegolnych miar dopasowania funkcji aproksymujacych
	  % bwX, gdzie X oznacza stopien wielomianu itd.
    #*******************

    disp("Sprawdzenie (cyfra przy zmiennej oznacza stopien wielomianu)");
    disp("Bład wzgledny za pomoca funkcji Octave")
    bw=sum(abs(Fy-Wy))
    disp("Bład wzgledny w petli")
    bw4=bw_R(Fy,Wy,n)
    bw6=bw_R(Fy,Wy2,n)
    bw8=bw_R(Fy,Wy3,n)
    disp("\nBlad kwadratowy Octave");
    bk=sum((Fy-Wy).^2)
    disp("Blad kwadratowy za pomocą pętli");
    bk4=bk_R(Fy,Wy,n)
    bk6=bk_R(Fy,Wy2,n)
    bk8=bk_R(Fy,Wy3,n)

    disp("\nSredni blad procentowy Octave");
    sbp=1/n*sum(abs((Fy-Wy)./Fy))*100
    disp("Sredni blad procentowy pętle");
    sbp4=sbp_R(Fy,Wy,n)
    sbp6=sbp_R(Fy,Wy2,n)
    sbp8=sbp_R(Fy,Wy3,n)

    disp("\nSrednie odchylenie od krzywej Octave");
    sook=sqrt(sum((Fy-Wy).^2)/(n-stopien-1))
    disp("Srednie odchylenie od krzywej pętle");
    sook4=sook_R(Fy,Wy,n,stopien)
    sook6=sook_R(Fy,Wy2,n,stopien2)
    sook8=sook_R(Fy,Wy3,n,stopien3)

    opis=sprintf("Stopien=%d, Bw=%f, Bk=%f, Sbp=%f, Sook=%f", stopien, bw4, bk4, sbp4, sook4);
    title(opis);

    subplot(3,1,2) % Rysowanie wykresu 3,1,2
    plot(x,Fy,'go');
    plot(x, Wy2);
    opis2=sprintf("Stopien=%d, Bw=%f, Bk=%f, Sbp=%f, Sook=%f", stopien2, bw6, bk6, sbp6, sook6);
    title(opis2);

    subplot(3,1,3) % Rysowanie wykresu 3,1,3
    plot(x,Fy,'r+');
    plot(x, Wy3);
    opis3=sprintf("Stopien=%d, Bw=%f, Bk=%f, Sbp=%f, Sook=%f", stopien3, bw8, bk8, sbp8, sook8);
    title(opis3);

    % Opcjonalne dodanie na wykres funkcji wygladzajacej wykres gladki
    % dla 2500 punktow
    liczba_punktow=2500;
    subplot(3,1,1)
    gladki_wykres(x,stopien,A,liczba_punktow);
    subplot(3,1,2)
    gladki_wykres(x,stopien2,B,liczba_punktow);
    subplot(3,1,3)
    gladki_wykres(x,stopien3,C,liczba_punktow);

  else
    disp("Za duzy stopien wielomianu aproksymujacego");
  end
else
disp("Liczba wspolrzednych x nie jest rowna liczbie wspolrzednych Fy");
end