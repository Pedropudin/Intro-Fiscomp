      program sort

      real, dimension(:), allocatable :: smaller
      write(*,*) "Quantos número você quer ordenar"
      read(*,*) max
      allocate(smaller(max))
      Izeros = 0
      open(10,file='fort.1')

      do 
            read(10,*,end=100) val
            if(val.ne.0.) then
            do i=1,max
                  if(val.lt.smaller(i).or.smaller(i).eq.0.) then
                        call add(smaller,max,val,i)
                        go to 101
                  end if
            end do
101         continue
            else
                  Izeros = Izeros + 1
            end if
      end do
100   continue
      
      do i=1,max
            write(*,*) smaller(i)
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

      !Acho que tá funcionando mas tá muito mal otimizado
      !Falta colocar a saída num arquivo e testar mais