c     Calcular o valor de ln(x) usando séries
c     A série é -\sum_{n=1}^\infin \frac{(1-x)^n}{n}

      program ln

      erro = 1e-10
      n = 1
      vmax = 2

      write(*,*) "Escreva um número real"
      read(*,*) x

      call fatorar(x,n2,r)

      call serie(vmax,n,erro,aln2)

      call serie(r,n,erro,ares)

      res = n2*aln2 + ares

      write(*,*) "ln(",x,") =", res

      end program


      subroutine serie(x,n,erro,res)
      res = 0d0
      n=1
      term = 100 !Começa em um valor qualquer que seja maior do que o erro
      do while(abs(term).gt.erro)
            term = -(((1-x)**n)/n)
            n = n+1
            res = res + term
            write(*,*) term
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

      !Consegui fazer funcionar para x>2 mas ele tá demorando muito, não sei se é o esperado
      !Posso usar o ln(2) já pré definido pra diminuir as contas, talvez assim ele seja minimamente mais rápido