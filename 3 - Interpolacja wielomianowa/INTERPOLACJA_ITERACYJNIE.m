% Autor - Rafał Mastalerz
%interpolacja wielomianowa (wielomian stopnia 5; 6 wezlow)
clear;
clc;
disp("Wspolrzedne wezlow");



w=[-5,5;-4,1;1,2;2,-1;-2,4;4,-1];
lw=rows(w);
pot=0;
for i=1:lw
  for j=1:lw
    X(j,i)=w(j,1)^pot;
  endfor
  pot++;
endfor

disp("Macierz X");
disp(X);

    function retval = wyznacznik(WEJ)
    wyzn=0;
    if columns(WEJ)==rows(WEJ)
       if size(WEJ)!=[2,2]
        MR=zeros(rows(WEJ)-1, columns(WEJ)-1);  
         for j=1:columns(WEJ)
            w=1;      
            for p=1:rows(WEJ)
              if p!=1
                k=1;      
                for t=1:columns(WEJ)
                   if  t!=j 
                     MR(w,k)=WEJ(p,t);
                     k=k+1;
                   end 
                  end 
                w=w+1;
              end   
            end 
            retval = wyzn=wyzn+wyznacznik(MR)*(-1)^(1+j)*WEJ(1,j); 
         end 
    else
        retval = wyzn=WEJ(1,1)*WEJ(2,2)-WEJ(1,2)*WEJ(2,1);
    end
    else
       disp("Obliczenia niemożliwe z powodu nieprawidłowych rozmiarów macierzy.");
    end
  endfunction
  
wyzn_X=wyznacznik(X);

  
    function retval = mnozenie(X,Y,z)
      %Program obliczeniowy
      [l_wieX,l_kolX]=size(X);
      [l_wieY,l_kolY]=size(Y);
        if l_kolX == l_wieY % Sprawdzam warunek mnozenia macierzy (w moim skrypcie zawsze spelniony, poniewaz liczba kolumn X jest rowna liczbie wierszy Y
          PROD=zeros(l_wieX,l_kolY); % Wypelniam macierz PROD zerami
            for i=1:l_wieX
              for j=1:l_kolY
                suma=0; % Zmienna pomocnicza do mnozenia macierzy
                for k=1:l_kolX
                  suma=suma+X(i,k)*Y(k,j); 
                endfor
                PROD(i,j)=suma; % Przypisanie wartosci zmiennej suma do odpowiedniego elementu macierzy
              endfor
            endfor
        
        [l_wierszy_PROD,l_kolumn_PROD]=size(PROD); % Okreslenie rozmiaru macierzy PROD po mnozeniu
        
        for i=1:l_wierszy_PROD
          for j=1:l_kolumn_PROD
            PROD(i,j)=PROD(i,j)*z; % Mnozenie macierzy PROD przez stala
          endfor
        endfor
      retval=PROD;
      endif
    endfunction
    
    function [T]=transponuj(C)
        for i=1:rows(C)
         for j=1:columns(C)
           T(j,i)=C(i,j);
         end
       end      
    endfunction
    
   function retval=minor_1(B,w,k,lw)
   
    for i = 1:lw
        minor_w = i;
        if (i>w)
            minor_w--;
            endif
        for j = 1:lw
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
  for i=1:lw
    Y(i,1)=w(i,2);
  endfor
  disp("Macierz Y");
  disp(Y);

  B=X; % B - tymczasowa

  B_minor=zeros(6,6);
  
  if (wyznacznik(B) !=0) % Warunek tworzenia macierzy odwrotnej
    % Obliczanie wyznacznikow minorow
  for i=1:lw
    for j=1:lw
      B_minor(i,j)=minor_1(B,i,j,lw);
    endfor
  endfor
  else
    disp("Nie mozna odwrocic macierzy, wyznacznik = 0"); % Warunek, jesli wyznacznik == 0
  endif

  X_minor=transponuj(B_minor);

  A=mnozenie(X_minor,Y,1/wyzn_X);
  
  printf(' W(x)=%f*x^5 + %f*x^4 + %f*x^3 + %f*x^2 + %f*x + %f \n', A(6,1), A(5,1), A(4,1), A(3,1), A(2,1), A(1,1));  

  % czesc graficzna 
  x=[-6:1:6];
  y=zeros(1,13);
  
  for j=1:columns(x)
    for i=1:6
        y(j)+=A(i,1)*(x(j)^(i-1));
    end
  endfor   

  plot(x,y); 
  grid on;    
  hold on;    

  for i=1:lw
    vector_x(1,i)=w(i,1);
  endfor

  vector_y=zeros(1,6);
  
  vector_y=transponuj(Y);

  plot(vector_x,vector_y,'rx'); 
  
  for i=1:lw
      plot(w(i,1),w(i,2),'--gs');  
  endfor

  title('Interpolacja wielomianowa');
  ylabel('Os y');
  xlabel('Os x');
else
  disp("Macierz ma wyznacznik = 0! Nie mozna utworzyc macierzy odwrotnej!");
endif