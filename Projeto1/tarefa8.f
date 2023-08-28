      program volume

      pi = 3.14159

      write(*,*) "Insira a Quantidade máxima de dimensões"
      read(*,*) Id
      write(*,*) "Insira o raio"
      read(*,*) r

      open(1,file='dimensoes-esferas.txt')

      do i=2,Id
            write(1,*) i,V(r,i)

      end do
      

      end program

      !No drive ele usou o gamma que já tem, então não sei se vou implementar
c      function RnewGamma(x)
c            real :: x,RnewGamma
c            if(x.eq.1) then
c                  RnewGamma = 1.
c                  return
c            else
c                  RnewGamma = RnewGamma*RnewGamma(x-1)
c                  return
c            end if
c      end

      function V(r,Id)
      pi = 3.14159

      V = ((pi**(Id/2.))/(gamma(Id/2. + 1)))*r**Id
      return

      end

      !Acho que tá funcionando, mas falta testar