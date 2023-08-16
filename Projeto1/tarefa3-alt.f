      program sort

      real, dimension(:), allocatable :: bigger
      read(*,*) max
      allocate(bigger(max))

      open(10,file='fort.1')

      do 
            read(10,*,end=100) val
            do i=1,max
                  if(val.gt.bigger(i)) then
                        call add(bigger,max,val,i)
                        go to 101
                  end if
            end do
101         continue
      end do
100   continue
      
      do i=1,max
            write(*,*) bigger(i)
      end do
      

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

c     Acho que tá funcionando
c     Falta colocar a saída num arquivo e testar mais