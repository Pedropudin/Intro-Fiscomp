C     Escreva um programa que dadas as coordenadas cartesianas de doiss vetores (dados
C     na tela do terminal) v~1 = (x1 , y1 , z1 ) e v~2 = (x2 , y2 , z2 ) calcule a área do triângulo formado
C     pelos vetores.

      program area

      !dimension vec1(3), vec2(3)

      write(*,*) "Escreva as coordenadas do primeiro vetor"
      read(*,*) x1,y1,z1
      write(*,*) "Escreva as coordenadas do segundo vetor"
      read(*,*) x2,y2,z2
      
      prod = sqrt((y1*z2-z1y2)**2+(z1*x2-x1*z2)**2+(x1*y2-y1*x2)**2)
      A = prod/2

      write(*,*) "A área do triângulo em questão seria", A

      end program area
      !Falta testar