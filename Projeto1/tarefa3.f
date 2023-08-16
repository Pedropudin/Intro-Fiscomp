c     Escreva um program que lê N números reais (em um arquivo) e ordena apenas os
c     M (valor dado na tela do terminal) primeiros menores números, imprimindo-os em um
c     arquivo de saida, juntamente com o número M

      program sort
      
C     Declaração de Variáveis
      integer M
      parameter(M=2)
      !real arq(N)
      dimension bigger(M)


C     Leitura dos dados no arquivo e organização dos maiores
      i=1
      do
            read(1,*,end=10) data
            do j=1,M
                  if(data.gt.bigger(j)) then
                        bigger(j) = data
                        call addNumber(bigger, M, data, j)
                        go to 1
                  end if
            end do
            i =i+ 1
1           continue
      end do
      !write(*,*) arq()
10    continue
      do i=1,M
            write(*,*) bigger(i)

      end do

      !A princípio tá funcionando, preciso encontrar uma maneira de ver onde o final do arquivo
      !porque o N não vai ser dado pelo usuário e configurar pra pegar o M do usuário direito
      
      !Testei na lista e ele tá errando o segundo maior, mas acho que é porque quando troca o maior ele não substitui o menor

      end program sort

c      subroutine addNumber(vector, M, anumber, j)
      
      dimension vector(M)

c      do j,M
c            vector(j) = vector(j) 
c      end do 

      end