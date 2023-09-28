      program andarilho

c     Declaração de variáveis 
      parameter(Iseed=73)
      parameter(M=10000,N=1000,p=0.5e0)
      dimension iand(M)
      r = rand(Iseed)
      open(10,file='saida-B1-13696213.dat')

c     Calcula a posição de cada um dos andarilhos
      do i=1,M
            ix = 0
            do j=0,N
            call andar(ix,rand(),p)
            end do
            iand(i)=ix
      end do

c     Calcula a posição média e a posição quadrada média
      Rx1 = Rmedia(iand,M,1)
      Rx2 = Rmedia(iand,M,2)

c     Encontra a quantdidade de andarihos em cada posição 
      do i=-N,N
            Ires = Iquant(iand,M,i)
            if(Ires.ne.0) write(10,*) i,",",Ires
      end do

c     Imprime os resultados
      write(*,*)"<x>",Rx1,"esperado:",N*(-2*p+1.)
      write(*,*)"<x^2>",Rx2,"esperado:",N**2+4*N*p*(1-p)-4*N**2*p*(1-p)

      write(*,*) "Fim da Execução"

      end program andarilho

c     Realiza o movimento do andarilho de acordo com o
c     número aleatório recebido
      subroutine andar(ix,a,p)

      if(a.gt.p) then
            ix = ix+1
      else
            ix = ix-1
      end if

      end

c     Calcula quantas vezes determinado elemento 
c     está presente em um vetor      
      function Iquant(ival,N,j)

            dimension ival(N)
            Iquant = 0

            do i=1,N
                  if(ival(i).eq.j) Iquant = Iquant + 1
            end do
      return
      end 

c     Calcula a média de uma potência de um dado vetor
      function Rmedia(ival,N,m)

            dimension ival(N)
            sum = 0

            do i=1,N
                  sum = sum + ival(i)**m
            end do

            Rmedia = sum/N
            
            return
      end