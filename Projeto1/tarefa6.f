C     Dado um número N, resolver a equação abaixo para z complexo
C     (z-2)^N = 3

      program complex

      !complex z
      pi = 3.14159

      write(*,*) "Escreva um número inteiro N"
      read(*,*) N

      rho = 3**(1./N)
      theta = (2*pi)/N

      do i=1,N
            a = rho*cos(theta*i) + 2
            b = rho*sin(theta*i)
            write(*,*) a,b
      end do

      end program

      !Acho que tá funcionando, falta usar o valor complexo que eu acho que ele quer que use e deixar mais elegante
      !Pra explicar eu posso pensar no gráfico, porque o -2 desloca o gráfico pra direita
      !e o valor de N divide a esfera em N partes
