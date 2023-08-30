c     Calcular o valor de ln(x) usando séries
c     A série é -\sum_{n=1}^\infin \frac{(1-x)^n}{n}

      program ln

      erro = 1.0e-5
      n = 1
      vmax = 2

      write(*,*) "Escreva um número real"
      read(*,*) x

      call fatorar(x,n2,r)

      aln2=serie(vmax,erro)

      ares=serie(r,erro)

      res = n2*aln2 + ares

      write(*,*) "ln(",x,") =", res

      end program

      function serie(x,erro)
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
      r = val
      n2 = 0

      do while(r.gt.2)
            r = r/2
            n2 = n2 + 1
      end do

      end

      !Posso usar o ln(2) já pré definido pra diminuir as contas, talvez assim ele seja minimamente mais rápido

C     Teste com ln(2) e erro de 1e-5
      !real	0m0,456s
      !user	0m0,354s
      !sys	0m0,094s

C     Testei com ln(2)=0.693137527 com erro de 1e-9
      !real	7m37,591s
      !user	7m35,442s
      !sys	0m0,652s

