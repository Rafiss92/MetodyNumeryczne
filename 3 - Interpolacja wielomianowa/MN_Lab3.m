% Autor - Rafał Mastalerz
%interpolacja wielomianowa (wielomian stopnia 5; 6 wezlow)
clear;
clc;
disp("Wspolrzedne wezlow");

w1=[-5,5]
w2=[-4,1]
w5=[-2,4]
w3=[1,2]
w4=[2,-1]
w6=[4,-1]

X=[w1(1,1)^0, w1(1,1)^1, w1(1,1)^2, w1(1,1)^3, w1(1,1)^4, w1(1,1)^5;
   w2(1,1)^0, w2(1,1)^1, w2(1,1)^2, w2(1,1)^3, w2(1,1)^4, w2(1,1)^5;
   w3(1,1)^0, w3(1,1)^1, w3(1,1)^2, w3(1,1)^3, w3(1,1)^4, w3(1,1)^5;
   w4(1,1)^0, w4(1,1)^1, w4(1,1)^2, w4(1,1)^3, w4(1,1)^4, w4(1,1)^5;
   w5(1,1)^0, w5(1,1)^1, w5(1,1)^2, w5(1,1)^3, w5(1,1)^4, w5(1,1)^5;
   w6(1,1)^0, w6(1,1)^1, w6(1,1)^2, w6(1,1)^3, w6(1,1)^4, w6(1,1)^5];
   
disp("Macierz X");
disp(X);

    function [wyz]=wyznacznik(C)
    wyz=0;
    if columns(C)==rows(C)
       if size(C)!=[2,2]
        MR=zeros(rows(C)-1, columns(C)-1);  
         for j=1:columns(C)
            w=1;      
            for p=1:rows(C)
              if p!=1
                k=1;      
                for t=1:columns(C)
                   if  t!=j 
                     MR(w,k)=C(p,t);
                     k=k+1;
                   end 
                  end 
                w=w+1;
              end   
            end 
            wyz=wyz+wyznacznik(MR)*(-1)^(1+j)*C(1,j); 
         end 
    else
         wyz=C(1,1)*C(2,2)-C(1,2)*C(2,1);
    end
    else

       disp("Obliczenia niemo�liwe z powodo nieprawidlowych rozmiarow macierzy.");
       
    end

  endfunction
  
disp("Wyznacznik X:")
wyzn_X=wyznacznik(X);
disp(wyzn_X);
  
    function retval = mnozenie(X,Y,z)
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
      retval=PROD;
      endif
    endfunction
    
    function [T]=trans(C)
        for i=1:rows(C)
         for j=1:columns(C)
           T(j,i)=C(i,j);
         end
       end      
    endfunction
    
   function retval=minor_1(B,w,k)
   
    for i = 1:6
        minor_w = i;
        if (i>w)
            minor_w--;
            endif
        for j = 1:6
            minor_k = j;
            if (j>k)
                minor_k--;
                endif
            if (i != w && j != k)
                minor(minor_w,minor_k) = B(i,j);
                endif
        endfor
    endfor
    if(mod(w+k,2) == 0)
    retval = wyznacznik(minor);
  else
    retval = wyznacznik(minor)*(-1);
  endif
  endfunction
  
if (wyzn_X != 0)

  Y=[w1(1,2); w2(1,2); w3(1,2); w4(1,2); w5(1,2); w6(1,2)];
  disp("Macierz Y");
  disp(Y);

  B=X; % B - tymczasowa

  B_minor=zeros(6,6);
  
  if (wyznacznik(B) !=0) % Warunek tworzenia macierzy odwrotnej
    % Obliczanie wyznaczników minorów
  for i=1:6
    for j=1:6
      B_minor(i,j)=minor_1(B,i,j);
    endfor
  endfor
  else
    disp("Nie można odwrocic macierzy, wyznacznik = 0"); % Warunek, jeśli wyznacznik == 0
  endif

  X_minor=trans(B_minor);

  A=mnozenie(X_minor,Y,1/wyzn_X);
  

  fprintf(' W(x)=%f*x^5 + %f*x^4 + %f*x^3 + %f*x^2 + %f*x + %f \n', A(6,1), A(5,1), A(4,1), A(3,1), A(2,1), A(1,1));  

  % czesc graficzna 
  x=[-6:1:6];
  y=zeros(1,13);
  
   y=A(1,1)+A(2,1)*x.+A(3,1)*x.^2+A(4,1)*x.^3+A(5,1)*x.^4+A(6,1)*x.^5;
  plot(x,y); 
  grid on;    
  hold on;    

  vector_x=[w1(1,1), w2(1,1), w3(1,1), w4(1,1), w5(1,1), w6(1,1)]; 
  vector_y=zeros(1,6);
  for i=1:6
    vector_y(1,1)=vector_y(1,1)+A(i,1)*w1(1,1)^(i-1);   
    vector_y(1,2)=vector_y(1,2)+A(i,1)*w2(1,1)^(i-1);  
    vector_y(1,3)=vector_y(1,3)+A(i,1)*w3(1,1)^(i-1);   
    vector_y(1,4)=vector_y(1,4)+A(i,1)*w4(1,1)^(i-1);   
    vector_y(1,5)=vector_y(1,5)+A(i,1)*w5(1,1)^(i-1);   
    vector_y(1,6)=vector_y(1,6)+A(i,1)*w6(1,1)^(i-1);   
  end
  plot(vector_x,vector_y,'rx'); 
  plot(w1(1,1),w1(1,2),'--gs');  
  plot(w2(1,1),w2(1,2),'--gs'); 
  plot(w3(1,1),w3(1,2),'--gs'); 
  plot(w4(1,1),w4(1,2),'--gs');  
  plot(w5(1,1),w5(1,2),'--gs');  
  plot(w6(1,1),w6(1,2),'--gs');  

  title('Interpolacja wielomianowa');
  ylabel('Os y');
  xlabel('Os x');
else
  disp("Macierz ma wyznacznik = 0! Nie mo�na utworzy� macierzy odwrotnej!");
endif