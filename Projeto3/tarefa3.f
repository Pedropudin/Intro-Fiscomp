c     x^3 - 4x^2 - 59x + 126
      program raizes
      implicit real*8 (a-h,o-z)

c     Busca direta?
      !x=-10d0
      !do i=1,3
      !do while(abs(f(x)).ge.1d-6)
      !x=x+1d-1
      !end do
      !write(*,*) "Uma das raizes eh ", x
      !x=x+1d-1
      !end do

c     Newton-Rhapson
      !Quais números começo pra cada raiz?
      !do i=-100,100,1
      !x = i/10
      !do j=1,6
      !x = x- f(x)/df(x)
      !write(*,*) x
      !end do
      !write(*,*) "+=========+"
      !end do

c     Secante
      !Também não sei com quais números começo
      x=10
      ant=x-1d-1      
      do i=1,6
      prox=x-f(x)*((x-ant)/(f(x)-f(ant)))
      ant=x
      x=prox
      write(*,*) x
      end do


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