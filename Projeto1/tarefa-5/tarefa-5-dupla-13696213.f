c     Calcula o valor de ln(x) usando série
c     Usando precisão dupla

      program ln
      implicit real*8(a-h,o-z)

c     Definição de Variáveis
      erro = 1.0d-6
      n = 1
      vmax = 2

c     Recebe e verifica se o valor x é válido
      write(*,*) "Escreva um número real"
      read(*,*) x
      if(x.le.0.) then
            write(*,*) "Não é possível calcular o logaritmo de ",x
            stop
      end if

c     Fatora o valor x em n2 termos de 2, com um resto de r
      call fatorar(x,n2,r)

      if(n2.ne.0) then
            aln2=serie(vmax,erro)
      end if
      
      ares=serie(r,erro)

      res = n2*aln2 + ares

      write(*,*) "ln(",x,") =", res

      end program

      function serie(x,erro)
      implicit real*8(a-h,o-z)
      serie = 0
      i=1
      do 
            term = ((1-x)**i)/i
            serie = serie - term
            if(abs(term).lt.erro) exit
            i = i+1
      end do
      end


      subroutine fatorar(val,n2,r)
      implicit real*8(a-h,o-z)
      r = val
      n2 = 0

      do while(r.gt.2)
            r = r/2
            n2 = n2 + 1
      end do

      end

