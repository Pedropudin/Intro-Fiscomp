      program andarilho

      parameter(Iseed=0)
      parameter(M=1000,N=10000,p=0.7)
      dimension iand(M)
      r = rand(Iseed)
      open(10,file='resultB2.txt')
      open(20,file='histogramaB2.dat')

      do i=1,M
            ix = 0
            do j=0,N
            call andar(ix,rand(),p)
            end do
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

      write(10,*) "<x^1>=",Rx1
      write(10,*) "<x^2>=",Rx2

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

      !Como era de se esperar, nesse caso os valores estão orientados 
      !Todos giram mais ou menos em torno de 300

      !Novamente, falta otimizar algumas coisas e o plot
      !Mas o resultado tá igual ao do drive pra alguns testes