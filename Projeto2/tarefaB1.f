      program andarilho

      parameter(Iseed=0)
      parameter(M=10000,N=1000,p=0.5e0)
      dimension iand(M)
      r = rand(Iseed)
      open(10,file='resultB1.txt')
      open(20,file='histogramaB1.dat')

c     Loop principal
c     Calcula a posição de cada um dos andarilhos
      do i=1,M
            ix = 0
            do j=0,N
            call andar(ix,rand(),p)
            end do
            !write(10,*) i,ix
            iand(i)=ix
      end do

      do i=1,M
            write(10,*) i,iand(i)
      end do

      Rx1 = Rmedia(iand,M,1)
      Rx2 = Rmedia(iand,M,2)

      do i=-N,N
            Ires = Iquant(iand,M,i)
            if(Ires.ne.0) write(20,*) i,Ires
      end do

      write(10,*) "A média para x^1", Rx1
      write(10,*) "A média para x^2", Rx2

      write(*,*) "Fim da Execução"

      end program andarilho

      subroutine andar(ix,a,p)

      if(a.gt.p) then
            ix = ix+1
      else
            ix = ix-1
      end if

      end

      function Iquant(ival,N,j)

            dimension ival(N)
            Iquant = 0

            do i=1,N
                  if(ival(i).eq.j) Iquant = Iquant + 1
            end do
      return
      end 

      function Rmedia(ival,N,m)

            dimension ival(N)
            sum = 0

            do i=1,N
                  sum = sum + ival(i)**m
            end do

            Rmedia = sum/N
            
            return
      end

      !Falta dar uma otimizada no código e no plot
      !Falta Descobrir como encontrar a forma analítica
      !O resto acho que tá funcionando