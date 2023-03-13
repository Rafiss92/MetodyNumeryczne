% Autor - Rafał Mastalerz
function X=Lab8_1(A, Y)
  %dane testowe - w przypadku normalnego uzytkowania ponizszej funkcji zdefiniowane macierze A i Y  nalezy usunac (ew. wykomentowac) ponieważ nadpisza dane przekazane jako parametry funkcji
  A=[2, 1, -2; 4, 1, 2; -2, 0, 1];
  Y=[-1;15;-1];

  [Aw, Ak]=size(A);
  [Yw, Yk]=size(Y);
  X=zeros(Aw,1);

  if Aw==Ak && Aw==Yw
    detA=det(A);
    if detA!=0
      %algorytm obliczajacy wartosci niewiadomych
    else
      disp("Podany uklad rownan nie jest oznaczony (wyznacznik z macierzy wsplczynnikow rowny jest 0)");
    end    

  else
    disp("Podano nieprawidlowe wartosci: macierz wspolczynnikow nie jest kwadratowa lub podane macierze maja rozne liczby wierszy");
  end

endfunction

