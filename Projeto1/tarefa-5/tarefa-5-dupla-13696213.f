c     Calcula o valor de ln(x) usando série
c     Usando precisão dupla

      program ln
      implicit real*8(a-h,o-z)

c     Definição de Variáveis
      erro = 1.0d-15
      n = 1

c     Recebe e verifica se o valor x é válido
      write(*,*) "Escreva um número real"
      read(*,*) x
      if(x.le.0.) then
            write(*,*) "Não é possível calcular o logaritmo de ",x
            stop
      end if

      res =-serieD(1d0/x,erro)

      write(*,*) "ln(",x,") =", res

      end program

      function serieD(x,erro)
      implicit real*8(a-h,o-z)
      serieD = 0
      i=1
      do 
            term = ((1-x)**i)/i
            write(*,*) term
            serieD = serieD - term
            if(abs(term).lt.erro) exit
            i = i+1
      end do
      return
      end

