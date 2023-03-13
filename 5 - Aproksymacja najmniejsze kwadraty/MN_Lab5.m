% Autor - Rafał Mastalerz
%Program realizuje opcję 4. + opcja dodatkowa - polyfit.

%liczba punkt�w
%wsp��rz�dne punkt�w z zadania 3
x=[-12,-9,-6,-2,1,4,6,8,9,12];
y=[3,-1,-4,-2,2,2,7,1,0,5];
%wsp��rz�dne punkt�w z zadania 1
x1=[-10,-5,1,6,9,11];
y1=[3,5,1,9,0,4]; % Współrzędna w2 zmieniona, czytaj poniżej

% UWAGA! Wystąpił błąd we współrzędnych podanych w zadaniu 1.
% Aby wykres wyglądał tak jak wykresy podane jako wzorcowe, konieczna była zmiana współrzędnej Y punktu w2 z -5 na 5.

function aproksy(x,y,n)
  if length(x)==length(y)
  %ustalamy stopie� wielomianu aproksymacyjnego
  stopien=n;
  n=length(x);

  X=zeros(stopien+1,stopien+1);
  A=zeros(stopien+1,1);
  Y=zeros(stopien+1,1);
  POLY=polyfit(x,y,stopien+1);

  %obliczanie macierzy X
  for i=1:stopien+1
    for j=1:stopien+1
      for k=1:n
        %algorytm ustalaj�cy warto�ci macierzy X
        X(i,j)+=x(1,k)^(i+(j-2));
      end
    end  
  end  
  disp("Macierz X");
  disp(X);
  %obliczanie macierzy Y
  for i=1:stopien+1
    for k=1:n
      Y(i,1)+=y(1,k)*x(1,k)^(i-1);
    end
  end  
  disp("Macierz Y");
  disp(Y);
  A=inv(X)*Y;
  disp("Macierz A - wspolczynnikow");
  disp(A);

  %obliczanie warto�ci funkcji na podstawie obliczonych warto�ci wsp��czynnik�w wielomianu
  yi=zeros(1,n);

  for i=1:n
    for j=1:stopien+1
      yi(1,i)+=A(j,1)*x(i)^(j-1);
    end
  end  
  disp("Macierz yi")
  disp(yi);

  % przy u�yciu polyfit
  for i=1:n
  ypoly(1,i)=0;
    for j=1:stopien+2
      ypoly(1,i)+=POLY(1,j)*x(1,i)^(stopien+2-j);     
    end 
  end
  
  plot(x,y, 'bx--');
  grid on;
  hold on;
  plot(x,yi, 'ro--');
  plot(x,ypoly, 'go--');
  tytul_rys=sprintf('Niebieskie - punkty rzeczywiste, czerwone - punkty obliczone na podstawie uzyskanego wielomianu %d stopnia, zielone - wsp��rz�dne ustalone funkcj� polyfit %d stopnia',stopien, stopien+1);
  title(tytul_rys);
  else
    disp("Liczba wspolrzednych x nie jest r�wna liczbie wspolrzednych y");
  end
endfunction

disp("Przyk�ad 3. - wielomian 7. stopnia");
aproksy(x,y,7);

% Nale�y odkomentowa� poni�sze linijki a zakomentowa� powy�sze w celu przetestowania
%disp("Przyk�ad 1. - wielomian 2. stopnia");
%aproksy(x1,y1,2);

