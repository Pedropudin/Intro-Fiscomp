      program randNumbers

c     Valor aletório para a seed e quantidade de números gerados
      parameter(Iseed = 73,N = 100000,m=4)
      dimension vector(m) !Vector onde serão armazenados os valores

      r = rand(Iseed) !inicia os valores aletaórios
      open(10,file='resultA.txt')

c     Limpa o vetor, colocando todos os valores em 0
      do i=1,m
            vector(i)=0e0
      end do

c     Pega um valor aleatório e soma a potência correta 
c     em todas as posições do vetor
      do i=0,N
            a = rand()
            do j=1,m
                  vector(j) = vector(j) + f(a,j)
            end do
      end do

c     Escreve a média dos valores em cada posição
      do i=1,m
      write(10,*) i,vector(i)/N
      end do

      write(*,*) "Fim da Execução"

      end program randNumbers

c     Calcula a n-ésima potência de x
      function f(x,n)
      f = x**n
      return
      end