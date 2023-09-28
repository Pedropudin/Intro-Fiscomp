      program andarilhoBi

c     Declaração de variáveis
      parameter(Iseed=73)
      parameter(M=1000,N=10,p=0.25e0)
      dimension iand(M,2),r(2),r2(2)
      rAleatorio = rand(Iseed)
      open(10,file='saida-10-C-13696213.dat')

      r=0
      r2=0
      iand = 0

c     Calcula a posição final dos andarilhos
      do i=1,M
            do j=0,N
            call andar(iand(i,1),iand(i,2),rand(),p,2*p,3*p)
            end do
            r(1) = r(1)+iand(i,1)
            r(2) = r(2)+iand(i,2)
            r2(1) = r2(1)+iand(i,1)**2
            r2(2) = r2(2)+iand(i,2)**2
      end do

c     Escreve os valores no arquivo
      do i=1,M
            write(10,*) iand(i,1),iand(i,2)
      end do

c     Calcula <r> e a variância
      r = r/M
      r2 = r2/M
      var = r2(1)+r2(2) - r(1)**2 - r(2)**2

c     Imprime os resultados
      write(*,*) "<r>",r
      write(*,*) "var^2",var

      write(*,*) "Fim da Execução"
      
      end program andarilhoBi

c     Realiza o movimento do andarilho de acordo com o
c     número aleatório recebido
      subroutine andar(ix,iy,a,p1,p2,p3)

            if(a.le.p1) then
                  ix = ix+1
            else if(a.le.p2) then
                  ix = ix-1
            else if(a.le.p3) then
                  iy = iy+1
            else
                  iy = iy-1
            end if
      
      end