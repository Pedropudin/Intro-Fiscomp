      program sort

c     Definindo o vetor onde os números serão ordenados
      parameter (maxOrder=10000)
      dimension smaller(maxOrder)

c     Lê arquivo de entrada e quantidade de números que serão ordenados
      write(*,*) "Quantos número você quer ordenar"
      read(*,*) max
      if(max.gt.maxOrder) then
      write(*,*) "Não é possível ordenar mais de",maxOrder,"números"
      end if
      open(10,file='entrada-3-13696213.txt')

c     Preenche o vetor com o maior número permitido pela precisão
      data smaller /maxOrder*3.4E+38/
      n=0

c     Loop principal
c     Realiza a leitura, avaliação dos valores e contagem de zeros
      do
            read(10,*,end=100) val
            n=n+1
            do i=1,max
                  if(val.lt.smaller(i)) then
                        call add(smaller,max,val,i) !adiciona os valores
                        go to 101
                  end if
            end do
101         continue
      end do
100   continue
      close(10)

c     Verifica se a quantidade de números no arquivo é suficiente
      if(n.lt.max) then
            write(*,*) "Não existem números suficientes no arquivo"
            stop
      end if 

c     Escreve o resultado
      open(11,file='saida-3-13696213.txt')
      do i=1,max
            write(11,*) smaller(i)
      end do
      close(11)

      end program

c     Adiciona um número em uma dada posição do array, colocando todos os outros números uma posição à frente      
      subroutine add(vector,itam,val,ipos)
            
      dimension vector(itam)

      i = itam
      do while(i.ge.ipos)
            if(i.eq.ipos) then
                  vector(i) = val
            else 
                  vector(i)=vector(i-1)
            end if
            i = i-1
      end do

      end subroutine