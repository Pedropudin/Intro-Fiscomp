C     Programa que calcula a área de um triângulo formado por dois vetores

      program area

C     Recebe as coordenadas dos vetores
      write(*,*) "Escreva as coordenadas do primeiro vetor"
      read(*,*) x1,y1,z1
      write(*,*) "Escreva as coordenadas do segundo vetor"
      read(*,*) x2,y2,z2
      
C     Calcula o produto vetorial entre eles e divide por 2
      prod = sqrt((y1*z2-z1*y2)**2+(z1*x2-x1*z2)**2+(x1*y2-y1*x2)**2)

C     Imprime o resultado
      write(*,*) "A área do triângulo em questão seria", prod/2.

      end program area
