c      program complex
c
c      complex z
c
c      z = (1,2)
c
c      write(*,*) z
c
c      end program




!Programa o github
      program Complexo

      complex*8  z
      print*, 'Informe N'
      read*, N
      
      !Como não há parte complexa, o ângulo theta é zero
      
      pi=3.14159
      
      do k=1, N
            pr = 3e0**(1e0/N)*cos((2*pi*k)/N)+2
            pii = 3e0**(1e0/N)*sin((2*pi*k)/N)
            z=  pr*(1,0) + pii*(0,1)
            print*, k,': z =', z
      end do
      stop
      end program Complexo