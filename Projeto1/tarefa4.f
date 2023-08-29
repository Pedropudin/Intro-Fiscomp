c     Escreva um programa que dado um número N inteiro, calcule os números primos menores
c     ou igual a N , e o número deles, imprimindo os seus resultado em um arquivo de saı́da.

      program primes

c     Recebe o número máximo e abre o arquivo
      write(*,*) "Escreva um número inteiro"
      read(*,*) N
      open(2,file="primes.txt")
      
c     Loop principal
c     Itera por todos os números em [2,N]
      do i=2,N
            call isPrime(i,res)
            write(*,*) i,res
            if(res.ne.0) write(2,*) i
      end do

      end program

c     Verifica se o número n é primo
      subroutine isPrime(n,res)

      res = 1
      do i=2,n-1
            if(mod(n,i).eq.0)then
                  res = 0
                  go to 10
            end if
      end do 
10    continue
      end 

      !Acho que tá funcionando, mas dá pra otimizar um pouco mais      
      !Ele disse que queria de outra maneira, acho que vou acabar tendo que pesquisar as melhores maneiras de fazer essas coisas
