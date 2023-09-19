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

c     Loop principal
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


      !Não consegui tirar nada a princípio dos resultados
      !Para n=1 ele tende a 0.5 mas para N muito grande fica menor
      !Para os outros valores de n ele tende a ser cada vez menor

      !O joão disse que ele vai tender à 1/(n+1), ou seja,
      !Para <x> tende à 1/2, para <x^2> tende a 1/3, etc

      !Por algum motivo com vetor o programa tá pegando lixo na última posição, fiz um loop a mais
      !pra evitar isso mas não é muito eficiente

      !Uma coisa interessante é que o programa é muito mais rápido com a função 