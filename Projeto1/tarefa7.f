
c     Calcule o volume de uma esfera de n-dimensões
c     usando monte-carlo
      program volume
      
c     Cria o vetor e o gerador de números aleatórios
      parameter (maxDim=1000)
      dimension ponto(maxDim)
      Iseed = 73
      numbers = 10000
      v = rand(Iseed)

c     Recebe a quantidade de dimensões e verifica se o valor é válido
      write(*,*) "Quantas dimensões terá a esfera?"
      read(*,*) Idim
      if(Idim.gt.maxDim) then
            write(*,*) "O número máximo de dimensões é", maxDim
            stop
      else if(Idim.lt.0) then
            write(*,*) "O número de dimensões não pode ser negativo"
            stop
      end if

c     Cria os pontos aleatórios e 
c     verifica se estão dentro ou fora da esfera
      Identro=0
      do i=1,numbers
            do j=1,Idim
                  ponto(j) = rand(0)
            end do
            d = distance(ponto,Idim)
            if(d.le.1.) then
                  Identro = Identro + 1
            end if
      end do

c     Calcula o volume da esfera a partir da
c     quantidade de pontos dentro e fora da mesma
      V = (2**Idim)*(real(Identro)/numbers)
      write(*,*) "O volume de uma esfera em",Idim,"Dimensões é",V


      end program

c     Encontra a distância de um ponto até a origem
      function distance(ponto,Idimensions)

      dimension ponto(Idimensions)
      distance = 0.
      do i=1,Idimensions
            distance = distance + (ponto(i))**2
      end do
      distance = sqrt(distance)

      return
      end

      !Acho que tá funcional, mas não testei pra dimensões muito grandes ainda
      !Nesse site da wikipedia ele dá as fórmulas pra testar:
      !https://en.wikipedia.org/wiki/Volume_of_an_n-ball
      !Ele diverge muito da equação que usa, acho que era esperado mas né