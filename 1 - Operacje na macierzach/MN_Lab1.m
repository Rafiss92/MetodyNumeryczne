% Autor - Rafał Mastalerz
% Czyszczenie bufora
clear;
% Inicjalizacja macierzy zad 1
A=[3,1;2,4;1,3;2,2;5,6];
B=[-1,2,6,-3,-1;6,4,-5,1,5];

% Funkcja do zadania 1
function retval = zad1 (A, B)
  disp("Macierz wejściowa: A");
  disp(A);
  disp("Macierz wejściowa: B");
  disp(B);
  disp("Transponowanie macierzy A");
  [liczba_wierszy,liczba_kolumn]=size(A); % sprawdzam rozmiar macierzy A o wymiarach x,
  E=zeros(liczba_kolumn,liczba_wierszy); % macierz pomocnicza o wymiarach y,x
  printf("Macierz A ma rozmiar (%d,%d)\n",liczba_wierszy,liczba_kolumn);
  printf("Macierz pomocnicza E ma rozmiar (%d,%d)\n",liczba_kolumn,liczba_wierszy);
  for i=1:liczba_wierszy
    for j=1:liczba_kolumn
      E(j,i)=A(i,j); 
    endfor
  endfor
  disp("Macierz A po transpozycji:");
  disp(E);
  C=zeros(liczba_kolumn,liczba_wierszy); % Tworzę macierz C wyzerowaną (żeby pozbyć się przypadkowych danych)
  disp("Wynik odejmowania dwu macierzy A-B");
  for i=1:liczba_kolumn
    for j=1:liczba_wierszy
      C(i,j)=E(i,j)-B(i,j);
    endfor
  endfor
  disp("Oczekiwany wynik A(T) - B: ");
  disp(E-B);
  disp("Wynik otrzymany iteracyjnie pętlą for:");
  disp(C);
  if (E-B == C) disp("Wynik zgodny ze wzorcem = poprawny!");  % Sprawdzenie zgodności ze wzorcem
    else 
      disp("Wynik nie zgadza się z wzorcem!"); 
    endif
endfunction

% Funkcja wykonująca mnożenie dowolnych macierzy i stałej. Funkcja określa samodzielnie liczbę wierszy macerzy V na podstawie rozmiaru macierzy U. 

% Inicjalizacja mnożnika i macierzy U, V.
liczba=input("Podaj stałą do mnożenia macierzy: ");

rozm_wier_U=input("Podaj liczbę wierszy macierzy U: ");
rozm_kol_U=input("Podaj liczbę kolumn macierzy U: ");

% Wprowadzanie elementów macierzy U
for i=1:rozm_wier_U
  for j=1:rozm_kol_U
    printf("Podaj element %d, %d macierzy U: ", i, j);
    U(i,j)=input("");
  endfor
endfor

% Określenie rozmiaru macierzy V
printf("Liczba wierszy macierzy V ustalona na %d na podstawie liczby kolumn macierzy U.", rozm_kol_U);
rozm_kol_V=input("Podaj liczbę kolumn macierzy V: ");

% Pętla wypełniająca macierz V liczbami podanymi przez użytkownika
for i=1:rozm_kol_U
  for j=1:rozm_kol_V
    printf("Podaj element %d, %d macierzy V: ", i, j);
    V(i,j)=input("");
  endfor
endfor

% Funkcja zadania 2
function retval = zad2 (X,Y,z)
  %Dla czytelności wyświetlam dane wejściowe, przekazane do funkcji parametrem
  disp("Dane wejściowe");
  disp("Macierz U: ");
  disp(X);
  disp("Macierz V: ");
  disp(Y);
  disp("Mnożnik: ");
  disp(z);

  %Program obliczeniowy
  [l_wieX,l_kolX]=size(X);
  [l_wieY,l_kolY]=size(Y);
    if l_kolX == l_wieY % Sprawdzam warunek mnożenia macierzy (w moim skrypcie zawsze spełniony, ponieważ liczba kolumn X jest równa liczbie wierszy Y
      PROD=zeros(l_wieX,l_kolY); % Wypełniam macierz PROD zerami
        for i=1:l_wieX
          for j=1:l_kolY
            suma=0; % Zmienna pomocnicza do mnożenia macierzy
            for k=1:l_kolX
              suma=suma+X(i,k)*Y(k,j); 
            endfor
            PROD(i,j)=suma; % Przypisanie wartości zmiennej suma do odpowiedniego elementu macierzy
          endfor
        endfor
    
    [l_wierszy_PROD,l_kolumn_PROD]=size(PROD); % Określenie rozmiaru macierzy PROD po mnożeniu
    
    for i=1:l_wierszy_PROD
      for j=1:l_kolumn_PROD
        PROD(i,j)=PROD(i,j)*z; % Mnożenie macierzy PROD przez stałą
      endfor
    endfor
    %Wyświetlam wyniki działań
    disp("Wynik oczekiwany: ");
    disp(X*Y*z);
    disp("Wynik działania U*V*mnożnik za pomocą pętli: ");
    disp(PROD);
    
    %Sprawdzam rozwiązanie instrukcją warunkową ze wzorcem
    if (PROD == X*Y*z)
        disp("Wynik zgodny z oczekiwanym!");
      else
        disp("Błąd obliczeń!");
      endif
    else 
      disp("Macierze nie spełniają warunków do mnożenia!");
    endif
endfunction

disp("Zad. 1");

zad1(A,B); % Wywołanie funkcji z przekazaniem macierzy A i B jako parametry funkcji

disp("Zad. 2");

zad2(U,V,liczba); % Wywołanie funkcji z przekazaniem macierzy U i V oraz liczby jako parametry
