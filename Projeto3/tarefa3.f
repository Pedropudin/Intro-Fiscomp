      program raizes
      implicit real*8 (a-h,o-z)

c     Declaração das Variáveis
      parameter(h=1d-1)
      parameter(iter=22)
      dimension direta(3,iter+1),Rnewton(3,iter+1),secante(3,iter+1)

      open(10,file="tab3.txt")

      Idireta=1
      Inewton=1
      Isecante=1

      direta=0
      Rnewton=0
      secante=0

c     Escrita dos métodos no arquivo
      write(10,100) " ","Busca-Direta","Newton-Raphson",
     &"Secante"
      write(10,200) "Iteracao","r1","r2","r3","r1","r2","r3","r1",
     &"r2","r3"
      write(10,150)

c     Loop Principal
c     Itera por todos os chutes para os métodos
      do k=-100,100,1
            
c     Busca Direta
      x = k/1d1 + 5d-3
      prox = x+h
      xmedio = (x+prox)/2d0
      i=1
      !Caso Geral
      if(f(x)*f(prox).lt.0d0) then
      passo=h
      direta(Idireta,i) = x
      do while(abs(f(xmedio)).gt.1d-6)
            passo = passo/2d0
            i = i+1
            if(f(x)*f(xmedio).le.0d0) then
                  prox = xmedio
                  xmedio = x + passo
            else
                  x = xmedio
                  xmedio = x + passo
            end if
            direta(Idireta,i) = xmedio
      end do
      Idireta = Idireta + 1
      !Caso Particular
      else if(abs(f(x)).lt.1d-6) then
            direta(Idireta,i) = x
            Idireta = Idireta + 1      
      end if

c     Newton-Rhapson
      x = k/10d0
      y=x
      i=0
      !Casos -10,0 e 10
      if((x.eq.-10).or.(x.eq.0).or.(x.eq.10)) then
            do while(abs(f(x)).gt.1d-6)
                  i=i+1
                  Rnewton(Inewton,i) = x
                  x = x- f(x)/df(x)
            end do
            Rnewton(Inewton,i+1) = x
            Inewton = Inewton + 1
      !Caso Geral
      else
            do while(abs(f(x)).gt.1d-6)
            i=i+1
            x = x- f(x)/df(x)
            end do
            write(20,200) y,x,i
      end if

c     Secante
      ant=k/10d0
      x=ant+h
      y=ant
      i=0
      !Casos -10,0 e 10
      if((ant.eq.-10).or.(ant.eq.0).or.(ant.eq.10)) then
            secante(Isecante,1) = ant
            do while(abs(f(x)).gt.1d-6)
                  i=i+1
                  secante(Isecante,i+1) = x
                  prox=x-f(x)*((x-ant)/(f(x)-f(ant)))
                  ant=x
                  x=prox
            end do
            secante(Isecante,i+2)=x
            Isecante = Isecante + 1
      !Caso Geral
      else
      do while(abs(f(x)).gt.1d-6)
      prox=x-f(x)*((x-ant)/(f(x)-f(ant)))
      ant=x
      x=prox
      i=i+1
      end do
      write(30,200) y,x,i
      end if
      
      end do

c     Escrita nos arquivos
      do i=0,iter
      write(10,300) i,direta(1,i+1),direta(2,i+1),direta(3,i+1),
     &Rnewton(1,i+1),Rnewton(2,i+1),Rnewton(3,i+1),
     &secante(1,i+1),secante(2,i+1),secante(3,i+1)
      end do

      write(10,150)
      write(10,400) "EXATOS",-7d0,2d0,9d0

c     Formatação
100   format(A10,3("|",A33),"|")
150   format(113("-"))
200   format(A10,3('|',3("|",A10)),"|")
300   format(I10,3('|',3("|",F10.6)),"|")
400   format(A10,3("||",F32.6),"|")

c     Finalização
      close(10)

      write(*,*) "Fim da Execução"

      end program raizes

c     Função f(x) para encontrar as raízes
      real*8 function f(x)
      implicit real*8 (a-h,o-z)
      f=x**3 - 4*x**2 - 59*x + 126
      return
      end

c     Função f'(x) utilizada no método de Newton-Rhapson
      real*8 function df(x)
      implicit real*8 (a-h,o-z)
      df=3*x**2 - 8*x - 59
      return
      end