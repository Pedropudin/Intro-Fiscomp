c     x^3 - 4x^2 - 59x + 126
      program raizes
      implicit real*8 (a-h,o-z)
      parameter(h=1d-1)

      open(10,file="res-direta.txt")
      open(20,file="res-newton.txt")
      open(30,file="res-secante.txt")

      do k=-100,99,1
c     Busca direta?
      ant=k/10d0
      x=ant+h
      passo=h
      if(f(ant)*f(x).le.0d0) then
            do i=1,6
                  passo=passo/2d0
                  ant=ant+passo
                  if(f(ant)*f(x).gt.0d0) then
                        ant=ant-passo
                        x=x-passo
                  end if
            end do
            write(10,*) (x+ant)/2d0
      end if

c     Newton-Rhapson
      !Quais números começo pra cada raiz? Acho que todos os números da
      !busca direta
      x = k/10d0
      do j=1,6
      x = x- f(x)/df(x)
      end do
      if(f(x).le.1d-6) write(20,*) x

c     Secante
      !Também não sei com quais números começo
      ant=k/10d0
      x=ant+h
      do i=1,6
      prox=x-f(x)*((x-ant)/(f(x)-f(ant)))
      ant=x
      x=prox
      end do
      if(f(x).le.1d-6) write(30,*) x
      
      end do

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