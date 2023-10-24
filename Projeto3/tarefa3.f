c     x^3 - 4x^2 - 59x + 126
      program raizes
      implicit real*8 (a-h,o-z)
      parameter(h=1d-1)

      open(10,file="res-direta.txt")
      open(20,file="res-newton.txt")
      open(30,file="res-secante.txt")

      do k=-100,99,1
            
c     Busca direta
      i=0
      ant=k/10d0
      x=ant+h
      passo=h
c     Caso Geral
      if(f(ant)*f(x).lt.0d0) then
            do while(f((x)).ge.1d-6)
                  i=i+1
                  passo=passo/2d0
                  ant=ant+passo
                  if(f(ant)*f(x).gt.0d0) then
                        ant=ant-passo
                        x=x-passo
                  end if
            end do
            write(10,100) (x+ant)/2d0
            write(10,*) i
c     Caso Particular: raiz (mod passo) = 0
      else if(abs(f(x)).lt.1d-6) then
            write(10,*) "É exatamente", x
      end if

c     Newton-Rhapson
      x = k/10d0
      y=x
      i=0
      do while(abs(f(x)).gt.1d-6)
      i=i+1
      x = x- f(x)/df(x)
      end do
      if(f(x).le.1d-6) write(20,200) y,x,i

c     Secante
      ant=k/10d0
      x=ant+h
      y=ant
      i=0
      do while(abs(f(x)).gt.1d-6)
      prox=x-f(x)*((x-ant)/(f(x)-f(ant)))
      ant=x
      x=prox
      i=i+1
      end do
      write(30,200) y,x,i
      
      end do

100   format(f9.6)
200   format(f5.1,",",f9.6,",",i5)

      close(10)
      close(20)
      close(30)

      write(*,*) "Fim da Execução"

      end program raizes

      real*8 function f(x)
      implicit real*8 (a-h,o-z)
      f=x**3 - 4*x**2 - 59*x + 126
      return
      end

      real*8 function df(x)
      implicit real*8 (a-h,o-z)
      df=3*x**2 - 8*x - 59
      return
      end


      !As raízes são -7, 2, 9

      !Não entendi o método de newton
      !A busca direta também não sei se tá muito legal não