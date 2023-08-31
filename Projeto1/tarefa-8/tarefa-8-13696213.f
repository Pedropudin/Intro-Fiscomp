c     Calcula o volume das esferas nas dimensões de [2,d]
c     dado um determinado raio

      program volume

c     Recebe a quantidade de dimensões e o raio da esfera
      write(*,*) "Insira a Quantidade máxima de dimensões"
      read(*,*) Id
      write(*,*) "Insira o raio"
      read(*,*) r

      open(1,file='dimensoes-esferas.dat')

c     Loop principal
c     Escreve no arquivo o volume da esfera de raio r e dimensões [2,Id]
      do i=2,Id
            write(1,*) i,V(r,i)

      end do
      
      close(1)

      end program
      
c     Calcula o gamma de x
      function g(x)
      pi = 4*atan(1.)
      val=x
      g=1.
      do
      if(val.eq.1.) then
            return
      else if (val.eq.0.5) then
            g=g*sqrt(pi)
            return
      else
            val = val-1
            g=g*val
      end if
      end do
      end 

c     Calcula o volume da esfera de acordo com a função dada      
      function V(r,Id)
      pi = 4*atan(1.)

      V = ((pi**(Id/2.))/(g(Id/2. + 1)))*r**Id
      return

      end