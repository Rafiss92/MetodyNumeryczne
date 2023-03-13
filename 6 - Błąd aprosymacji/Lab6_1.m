% Autor - Rafa³ Mastalerz
%wspolrzedne punktow zadanych
x=[0,1,2,3,4,5,6];
Fy=[-1,2,4,3.5,2,7,9];

if length(x)==length(Fy)
  n=length(x);
  stopien=3;
  if stopien<n-1
    %A -macierz (wektor) wspolczynnikow wielomianu 
    A=polyfit(x,Fy,stopien);
    Wy=zeros(1,n);
    %obliczanie wartosci funkcji W na podstawie ustalonych wspolczynnikow wielomianu 
    for i=1:n
      for j=1:stopien+1
        Wy(1,i)=Wy(1,i)+A(1,j)*x(1,i)^(stopien+1-j);     
      end 
    end
    plot(x,Fy,'rx');
    grid on;
    hold on;
    plot(x, Wy);
  
    #*******************  
    % obliczenia poszczegolnych miar dopasowania funkcji aproksymujacych
    #*******************      
  
    disp("Sprawdzenie");
    disp("Blad bezwzgledny");
    bw=sum(abs(Fy-Wy))
    disp("Blad kwadratowy");
    bk=sum((Fy-Wy).^2)
    disp("Sredni blad procentowy");
    sbp=1/n*sum(abs((Fy-Wy)./Fy))*100
    disp("Srednie odchylenie od krzywej");
    sook=sqrt(sum((Fy-Wy).^2)/(n-stopien-1))  
    opis=sprintf("Bw=%f, Bk=%f, Sbp=%f, Sook=%f", bw, bk, sbp, sook);
    title(opis);   
  else
    disp("Za duzy stopien wielomianu aproksymujacego");  
  end
else
disp("Liczba wspó³rzêdnych x nie jest równa liczbie wspó³rzêdnych Fy");  
end  




