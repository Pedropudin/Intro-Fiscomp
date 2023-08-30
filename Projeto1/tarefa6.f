C     Dado um número N, resolver a equação abaixo para z complexo
C     (z-2)^N = 3

      program complex

      pi = 4*atan(1.)

c     Recebe o valor N e verifica se ele é válido
      write(*,*) "Escreva um número inteiro N"
      read(*,*) N
      if(N.eq.0) then
            write(*,*) "Valor de N inválido"
            stop
      end if

c     Primeira solução, sempre aparece
      rho = 3**(1./N)
      theta = (2*pi)/N

c     Rotaciona no plano buscando as outras soluções
      do i=1,abs(N)
            a = rho*cos(theta*i) + 2
            b = rho*sin(theta*i)
            write(*,*) "Solução",i,a,b
      end do
      end program
