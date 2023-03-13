% Autor - Rafał Mastalerz
%zalozenie uklad rownan z 3-ma rownaniami i 3-ma niewiadomymi
%zastosowana metoda rozwiazania: "na piechote" ;)
%A=[2, 1, -2; 4, 1, 2; -2, 0, 1]
%Y=[-1; 15; -1]
A=[0, 2, 2; 0, 0, 5; 2, -3, -2]
Y=[2; 10; 7]
X=zeros(3,1);

if det(A)!=0
  %tworzenie macierzy rozszerzonej
  R=[A Y];
  %wektor pomocniczy
  vec_pom=zeros(1,4);

 %Zerowanie w ramach 1-ej kolumny
 %procedury majace na celu zadbanie aby element R(1,1) byl rozny od 0
  if R(1,1)==0
    if R(2,1)!=0
      %zamiana pozycji wierszy 1 i 2 
      vec_pom=R(1,:);
      R(1,:)=R(2,:);
      R(2,:)=vec_pom;
    else
      %jezeli R(1,1) i R(2,1) =0 to R(3,1) musi byc rozne od 0 - inaczej wyznacznik nie moglby miec wartosci innej niz 0
      %zamiana pozycji wierszy 1 i 3 
      vec_pom=R(1,:);
      R(1,:)=R(3,:);
      R(3,:)=vec_pom;
    end;    
  end
  %zerowanie R(2,1)
  mnoznik=-R(2,1)/R(1,1);
  vec_pom=R(1,:)*mnoznik+R(2,:);
  R(2,:)=vec_pom;
  %zerowanie R(3,1)
  mnoznik=-R(3,1)/R(1,1);
  vec_pom=R(1,:)*mnoznik+R(3,:);
  R(3,:)=vec_pom;
  disp("Macierz R po wyzerowaniu elementow pod R(1,1)");
  disp(R);
  
  %Zerowanie w ramach 2-ej kolumny
  %procedury majace na celu zadbanie element R(2,2) byl rozny od 0
  if R(2,2)==0
     %jezeli R(2,2)=0 to R(3,2) musi byc rozne od 0 - inaczej wyznacznik nie moglby miec wartosci innej niz 0
     %zamiana pozycji wierszy 2 i 3 
      vec_pom=R(2,:);
      R(2,:)=R(3,:);
      R(3,:)=vec_pom;      
  end
  %zerowanie R(3,2)
  mnoznik=-R(3,2)/R(2,2);
  vec_pom=R(2,:)*mnoznik+R(3,:);
  R(3,:)=vec_pom;
  disp("Macierz R po wyzerowaniu elementow pod R(2,2)");
  disp(R);
  %obliczanie wartosci niewiadomych - odwrotna eliminacja Gaussa
  X(3,1)=R(3,4)/R(3,3);
  X(2,1)=(R(2,4)-R(2,3)*X(3,1))/R(2,2);
  X(1,1)=(R(1,4)-R(1,2)*X(2,1)-R(1,3)*X(3,1))/R(1,1);
  disp("Rozwiazanie rownania X");
  disp(X);
  disp("Sprawdzenie X=inv(A)*Y")
  disp(inv(A)*Y);
else
  disp("Podany uklad rownan nie jest ukladem oznaczonym (wyznacznik z macierzy wspolczynnikow rowny jest 0)");
end





