% Autor - Rafał Mastalerz
%Metoda Newtona (stycznych)
%f(x) = 3x^4 + 2x^3 - 2x^2 + 3x -2
%funkcja=[-1, 2, -2, 3, -2];

%f(x) = 3x^6 - 4x^5 + 2x^4 + x^3 + 3x - 5
funkcja=[3, -4, 2, 1, 0, 3, -5];

disp("Wspolczynniki wielomianu f(x)");
disp(funkcja);
disp("Rzeczywiste pierwiastki rownania f(x)=0 to");
% roots - oblicza miejsca zerowe wielomianu czyli pierwiastki
disp(roots(funkcja));
x=15; %Podajemy wartosc pierwszego przyblizena
disp(['Pierwsze przyblizenie wynosi ', num2str(x)]);
%polyder - oblicza pochodna -> wektor wspolczynnikow wielomianu pochodnej
pochodna=polyder(funkcja);
i=1;
while(abs())
  %polyval - oblicza wartosc wielomianu dla danego x
  x=x-polyval(funkcja,x)/polyval(pochodna,x);
  disp(['Przyblizenie obliczone w ramach ',num2str(i),' iteracji wynosi ',num2str(x)]);   
end