clear;
clc;
% Autor - Rafał Mastalerz
function newton(x=15, sigma=0.1, nmax=100)
  %Metoda Newtona (stycznych)
  disp("Metoda Newtona (stycznych) dla funkcji: 3x^6 - 4x^5 + 2x^4 + x^3 + 3x - 5 = 0");

  %Funkcja przyjmuje parametry, wiec mozna ja wywolac dla roznych opcji przyblizen
  funkcja=[3, -4, 2, 1, 0, 3, -5];

  n=0;

  disp("Rzeczywiste pierwiastki rownania f(x)=0 to");
  disp(roots(funkcja));
  disp(['Przyblizenie poczatkowe: x = ',num2str(x)]);
  pochodna=polyder(funkcja);

  xpoprz=0; % inicjalizacja zmiennej xpoprz

  disp("\nKolejne iteracje:");
  while(abs(x-xpoprz)>sigma && n<nmax) % petla sprawdzajaca dokladnosc
    xpoprz=x;
    x=x-polyval(funkcja,x)/polyval(pochodna,x)
    n=n+1;

  endwhile
  disp(['Przyblizenie obliczone w ramach ',num2str(n),' iteracji i przy przyblizeniu ',num2str(sigma),' wynosi: ',num2str(x)]);
  disp(['Przyblizony blad wynosi: ',num2str(x-xpoprz)]);
endfunction

function bisekcja(x1=-2, x2=20, sigma=0.01, nmax=50)

  %Metoda bisekcji
  %Funkcja przyjmuje parametry, wiec mozna ja wywolac dla roznych opcji przyblizen i liczby iteracji a takze przedzialow

  disp('Metoda bisekcji dla funkcji: x^3 + 2x^2 - 88x - 320 = 0');
  funkcja=[1,2,-88,-320];

  if(x1>x2) % zamiana x1 z x2, jeśli w wywolaniu funkcji bedzie x1 > x2
    pom=x1;
    x1=x2;
    x2=pom;
  endif

  disp("Rzeczywiste pierwiastki rownania f(x)=0 to:");
  disp(roots(funkcja));
  disp("\n");

  disp(['Badany przedzial to: (',num2str(x1),', ',num2str(x2),')']);

  yx1=polyval(funkcja,x1);
  yx2=polyval(funkcja,x2);
  n=1;
  x=(x1+x2)/2;
  disp("\nKolejne iteracje: ");
  while(abs((x2-x1>sigma)) && (n<nmax))
    y=polyval(funkcja,x);
    if(y*polyval(funkcja,yx1)>=0)
     yx1=y;
     x1=x;
    else
     yx2=y;
     x2=x;
    end
     x=(x1+x2)/2
     n++;
  endwhile
  disp(['Wynik uzyskany metoda bisekcji w ',num2str(n), ' iteracji przy dokladnosci: ',num2str(sigma),': ',num2str(x,5)]);
  blad=(1/2^n)*abs(x1-x2);
  if (sigma>=blad)
    disp(['Wynik jest w granicy dokladnosci, blad wynosi: ',num2str(blad)]);
  else
    disp(['Wynik jest poza granica dokladnosci, blad wynosi: ',num2str(blad)]);
  endif
endfunction

function sieczne(x1=30, x2=25, sigma=0.001, nmax=50)
  %Metoda Siecznych
  disp("Metoda siecznych dla funkcji: x^4 - 3x^3 - 9x^2 - 5x = 0");
  %Funkcja przyjmuje parametry, wiec mozna ja wywolac dla roznych opcji przyblizen

  funkcja=[1,-3,-9,-5];

  n=0;

  disp("Rzeczywiste pierwiastki rownania f(x)=0 to");
  disp(roots(funkcja));
  disp(['Przyblizenia poczatkowe: x1 = ',num2str(x1),', x2 = ',num2str(x2)]);
  disp("\nKolejne iteracje:")
  while(abs(x2-x1) > sigma && n<nmax)
    x=x2-((polyval(funkcja,x2)*(x2-x1))/(polyval(funkcja,x2)-polyval(funkcja,x1)))
    x1=x2;
    x2=x;
    n++;
  endwhile
  disp(['Ostateczny wynik uzyskany metoda siecznych w ',num2str(n),' iteracjach przy dokladnosci: ',num2str(sigma),': ',num2str(x)]);
  disp(['Przyblizony blad wynosi: ',num2str(x2-x1)]);
endfunction

newton();
disp("\n");
bisekcja();
disp("\n");
sieczne();
