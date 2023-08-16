C     Escreva um program FORTRAN que dados os os coeficientes a, b e c (dados na tela
C     do terminal) de uma equação do segundo grau ax2 + bx + c = 0 calcule o número de raı́zes
C     reais e seus valores.

c     Pega os índices
      program tf1
      write(*,*) "Escreva os indíces da equação:"
      read(*,*) a,b,c
c     Calcula e verifica o delta
      delta = b**2 - 4*a*c
      if(delta.lt.0) then
            write(*,*) "A equação não possui raízes reais"
      !&mais coisa"
      else if(delta.eq.0) then
            x = -b/(2*a)
            write(*,*) "Resultado = ", x
      else
            x1 = (-b + sqrt(delta))/(2*a)
            x2 = (-b - sqrt(delta))/(2*a)
            write(*,*) "As raízes são:"
            write(*,*) x1,"e",x2
      end if
      end program tf1

      !O primeiro e o último write não tão funcionando, não sei porque
      !ERA PORQUE TINHA MAIS DE 72 CARACTERES NA LINHA, COMO O CARA PODE ELOGIAR UMA LINGUAGEM QUE TEM ESSE TIPO DE LIMITAÇÃO EM PLENO 2023, NÃO SEI NEM SE ESSA LINHA VAI ATRAPALHAR O CÓDIGO PORQUE JÁ VIROU BAGUNÇA JÁ