
      program volume
      
      real, dimension(:), allocatable :: ponto
      Iseed = 73
      numbers = 10000
      v = rand(Iseed)

      write(*,*) "Quantas dimensoes senhor?"
      read(*,*) Idim
      allocate(ponto(Idim))

      Identro=0
      do i=1,numbers
            do j=1,Idim
                  ponto(j) = rand(0)
            end do
            call distance(ponto,Idim,d)
            !write(*,*) d
            if(d.le.1.) then
                  Identro = Identro + 1
            end if
      end do

      write(*,*) "----->",Identro

      V = (2**Idim)*(real(Identro)/numbers)
      write(*,*) "O volume de uma esfera em",Idim,"Dimensões é",V

      !Tem que multiplicar pelas áreas que tem, acho que é 2^Idim
      end program

c     Encontra a distância de um ponto até a origem
      subroutine distance(ponto,Idimensions,res)
      dimension ponto(Idimensions)
      res = 0.
      do i=1,Idimensions
            res = res + (ponto(i))**2
      end do

      res = sqrt(res)

      end

      !Acho que tá funcional, mas não testei pra dimensões muito grandes ainda
      !Nesse site da wikipedia ele dá as fórmulas pra testar:
      !https://en.wikipedia.org/wiki/Volume_of_an_n-ball