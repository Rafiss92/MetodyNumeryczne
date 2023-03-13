
clc;

function [Z]=iloczyn(A,B)

Z=zeros(rows(A),columns(B));

if columns(A)==rows(B)
   for i=1:rows(A)
     for j=1:columns(B)
       for k=1:rows(B)
       Z(i,j)=Z(i,j)+A(i,k)*B(k,j);
       endfor
     endfor
   endfor
else
   
   disp("Obliczenia niemo�liwe z powodo nieprawidlowych rozmiarow macierzy.");
   
end;

endfunction

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

function [D]=dop(C)
  w=0;
  k=0;
if columns(C)==rows(C)
  MR=zeros(rows(C)-1, columns(C)-1);  
  for i=1:rows(C)
     for j=1:columns(C)
         w = 1;    
        for p=1:rows(C)
          if p!=i
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
        D(i,j)=wyznacznik(MR)*(-1)^(i+j);          
     end
   end 
else
   disp("Obliczenia niemo�liwe z powodo nieprawidlowych rozmiarow macierzy.");
end   
   
endfunction

function [T]=trans(C)
    for i=1:rows(C)
     for j=1:columns(C)
       T(j,i)=C(i,j);
     end
   end      
endfunction

function [O]=odw(C)
  if wyznacznik(C)!=0
 O=trans(dop(C))*(1/wyznacznik(C));
else
  disp ("Z powodu wyznacznika r�wnego 0 oblicznie macierzy odwrotnej jest niemo�liwe");
end
endfunction




%Poni�ej komenda do rozwi�zania zadania
%odw(iloczyn([4,3,0.5;1,-1,5;-0.5,2,2],[-2,1.5,4;-2,1,2.5;-1,-2,-1]))
C=[1,2,3;2,8,3];
disp("Wyznacznik Cezary: ");
disp(dop(C));
%disp("Wyznacznik wbudowany: ");
%disp(dop(C));

