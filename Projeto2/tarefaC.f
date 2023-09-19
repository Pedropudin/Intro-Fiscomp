      program andarilhoBi

      parameter(Iseed=0)
      parameter(M=10,N=10000,p=0.25e0)
      dimension iand(M,2),r(2)
      Rinutil = rand(Iseed)
      open(10,file='resultC.txt')

c     Soma dos x e y
      r(1)=0
      r(2)=0

      do i=1,M
            ix = 0
            iy = 0
            do j=0,N
            call andar(ix,iy,rand(),p,2*p,3*p)
            end do
            iand(i,1)=ix
            iand(i,2)=iy
            r(1) = r(1) + ix
            r(2) = r(2) + iy
      end do

c     Escreve os valores no arquivo
      do i=1,M
            write(10,*) i,iand(i,1),iand(i,2)
      end do

      write(10,*) "<r>=",r(1)/M,r(2)/M

      write(*,*) "Fim da Execução"

      end program andarilhoBi

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

      function Rmod(ix,iy)

      Rmod = sqrt(real(ix)**2 + real(iy)**2)
      return
      end

c      function Rmedia(ival,N,m)
c
c            dimension ival(N)
c            sum = 0
c
c            do i=1,N
c                  sum = sum + ival(i)**m
c            end do
c
c            Rmedia = sum/N
c            
c            return
c      end
