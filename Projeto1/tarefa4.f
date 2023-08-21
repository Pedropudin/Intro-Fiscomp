c     Escreva um programa que dado um número N inteiro, calcule os números primos
c     menores ou igual a N , e o número deles, imprimindo os seus resultado em um arquivo de
c     saı́da. Teste seus resultados para N = 100, 1000, 10000.

      program primes

      write(*,*) "Escreva um número inteiro"
      read(*,*) N
      

      do i=2,N
            call isPrime(i,res)
            !write(*,*) i,res
            if(res.ne.0) then
                  write(2,*) i
                  go to 1
            end if
1           continue
      end do

      end program

      subroutine isPrime(n,res)

      logical prime = 1
      do i=2,n-1
            if(mod(n,i).eq.0)then
                  prime = 0
                  go to 10
            end if
      end do 
10    continue
      res = prime
      end 

c     Acho que tá funcionando, mas dá pra otimizar um pouco mais      
