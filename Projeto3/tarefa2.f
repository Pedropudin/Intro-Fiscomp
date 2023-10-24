      program integral
      implicit real*8 (a-h,o-z)

c     Declaração das Variáveis
      parameter(pi=4d0*atan(1d0))
      parameter(res=1/(1+4*pi**2)-1/(exp(1d0)*(1+4*pi**2)))
      open(10,file='result2.txt')

      write(10,100) "N","h","Trap","Simp","Boole"

c     Loop Principal
c     Itera pelos diferentes valores de N e h
      do i=0,9

      N=12*2**i
      h=1d0/N

c     Método do Trapézio
      resTrap = 0
      do j=0,N-1,2      
            ftrap = (h/2)*(f(h*j)+2*f(h*(j+1))+f(h*(j+2)))
            resTrap = resTrap+ftrap
      end do
      resTrap=abs(res-resTrap)

c     Método de Simpsons
      resSimp = 0
      do j=0,N-1,2
            simp = (h/3)*(f(h*(j+2))+4*f(h*(j+1))+f(h*j))
            resSimp = resSimp+simp
      end do
      resSimp=abs(resSimp-res)

c     Método do Boole
      resBoole = 0
      do j=0,N-1,4
            boole=(2*h/45)*(7*f(j*h)+32*f(h*(j+1))+12*f(h*(j+2))+
     &32*f(h*(j+3))+7*f(h*(j+4)))
            resBoole = resBoole + boole
      end do
      resBoole=abs(resBoole-res)

      write(10,200) N,h,resTrap,resSimp,resBoole

      end do

      write(10,250) 
      write(10,300) "EXATO","-------------",res,res,res

c     Formatação
100   format("|",A6,"|",4(A13,"|"))
200   format("|",I6,"|",4(f13.11,"|"))
250   format("-","-------",4("--------------"))
300   format("|",A6,"|",A13,"|",3(f13.11,"|"))

      close(10)

      write(*,*) "Fim da Execução"

      end program integral

c     Função f(x) para ser integrada
      real*8 function f(x)
      implicit real*8 (a-h,o-z)
      parameter(pi = 4*atan(1d0))
      f=exp(-x)*cos(2*pi*x)
      return
      end