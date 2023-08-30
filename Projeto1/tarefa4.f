c     Escreva um programa que dado um número N inteiro, calcule os números primos menores
c     ou igual a N , e o número deles, imprimindo os seus resultado em um arquivo de saı́da.

      program primes

c     Recebe o número máximo e abre o arquivo
      write(*,*) "Escreva um número inteiro"
      read(*,*) N
      open(2,file="primes.txt")
      
c     Verifica se o intervalo é válido
      if(N.ge.2) then
            write(2,*) 2
      else
            write(*,*) "Não existem números primos menores que",N
      end if 

c     Loop principal
c     Itera por todos os números em [3,N] com passo de 2
      do i=3,N,2
            call isPrime(i,res)
            if(res.ne.0) write(2,*) i
      end do

      close(2)

      end program

c     Verifica se o número n é primo
      subroutine isPrime(n,res)

      res = 1
      do i=3,n-1,2
            if(mod(n,i).eq.0)then
                  res = 0
                  go to 10
            end if
      end do 
10    continue
      end 

