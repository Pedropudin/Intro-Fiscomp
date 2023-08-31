C     Programa que calcula as raízes de uma equação do segundo grau dada
C     na forma ax^2 + bx + c = 0

      program tf1
c     Pega os índices a, b e c
      write(*,*) "Escreva os indíces da equação:"
      read(*,*) a,b,c

c     Calcula e verifica o delta
      delta = b**2 - 4*a*c
      if(delta.lt.0) then
            write(*,*) "A equação não possui raízes reais"
            stop

      else if(delta.eq.0) then
            x = -b/(2*a)
            write(*,*) "As duas raízes são iguais a = ", x
            stop

      else
            x1 = (-b + sqrt(delta))/(2*a)
            x2 = (-b - sqrt(delta))/(2*a)
            write(*,*) "As raízes são:"
            write(*,*) x1,"e",x2
            stop
            
      end if
      end program tf1
