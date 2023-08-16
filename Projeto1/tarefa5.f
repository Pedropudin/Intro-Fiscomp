c     Calcular o valor de ln(x) usando séries
c     A série é -\sum_{n=1}^\infin \frac{(1-x)^n}{n}

      program ln

      write(*,*) "Escreva um número real"
      read(*,*) x

      res = 0e0
      i=1
      term=100
      do while (abs(term).gt.1e-5)
            call serie(x,i,term)
            i= i+1
            res = res + term
            write(*,*) term
      end do 
      write(*,*) "------>",res
      end program

      subroutine serie(x,n,res)

      res = -((1-x)**n)/n

      end 

      !Funciona só no intervalo (0,2] acho que isso faz sentido com a série mas não sei o que fazer com isso