      program integral
      implicit real*8 (a-h,o-z)

      parameter(pi=4*atan(1d0))
      open(10,file='result2.txt')
      a = 1
      b=0
      res=1/(1+4*pi**2)-1/(exp(1d0)*(1+4*pi**2))

      write(10,100) "N","h","Trap","Simp","Bode"

      do i=0,9

      aN=12*2**i
      h=1./aN

c     Método do Trapézio
      resTrap = 0
      do j=0,int(aN)-1,2      
            ftrap = (h/2)*(f(h*j)+2*f(h*(j+1))+f(h*(j+2)))
            resTrap = resTrap+ftrap
      end do

c     Método do Simpsons
      resSimp = 0
      do j=0,int(aN)-1,2
            simp = (h/3)*(f(h*(j+2))+4*f(h*(j+1))+f(h*j))
            resSimp = resSimp+simp
      end do

c     Método do Bode
      resBode = 0
      do j=0,int(aN)-1,4
            bode=(2*h/45)*(7*f(j*h)+32*f(h*(j+1))+12*f(h*(j+2))+
     &32*f(h*(j+3))+7*f(h*(j+4)))
            resBode = resBode + bode
      end do

      write(10,200) int(aN),h,resTrap,resSimp,resBode

      end do

      write(10,300) "EXATO","-----",res,res,res

100   format("|",5(A15,"|"))
200   format("|",I15,"|",4(f15.14,"|"))
300   format("|",2(A15,"|"),3(f15.14,"|"))

      write(*,*) "Fim da Execução"

      end program integral

      real*8 function f(x)
      implicit real*8 (a-h,o-z)
      parameter(pi = 4*atan(1d0))
      f=exp(-x)*cos(2*pi*x)
      return
      end

      !Acho que tá tudo certo, mas é bom revisar depois e talvez deixar a tabela mais bonita
      !Ele pede pra colocar precisão até 10^-11