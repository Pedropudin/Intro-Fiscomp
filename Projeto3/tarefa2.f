      program integral
      implicit real*8 (a-h,o-z)

      open(10,file='result2.txt')
      a = 1
      b=0

      do i=0,9

      aN=12*2**i
      h=1/N

      trap = (h/2)*(f(aN-h)+2*f(aN)+f(aN+h))
      simp = (h/3)*(f(aN+h)+4*f(aN)+f(aN-h))
      simp8 = (3*h/8)*(f(aN)+3*f(aN+h)+3*f(aN+2*h)+f(aN+3*h))
      bode=(2*h/45)*(7*f(aN)+32*f(aN+h)+12*f(aN+2*h)+
     &32*f(aN+3*h)+7*f(aN+4*h))

      write(10,*) trap,simp,simp8,bo

      end do

      write(*,*) 1./.2*(f(a)+f(b))

      write(*,*) "Fim da Execução"

      end program integral

      real*8 function f(x)
      implicit real*8 (a-h,o-z)
      pi = 4*atan(1.)
      f=exp(-x)*cos(2*pi*x)
      return
      end

      !Escrevi o pi na forma 4*atan(1.) mas quando eu imprimi parece que ele perde a precisão dupla com isso