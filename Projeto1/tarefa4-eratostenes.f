c     Muito difícil e custoso computacionalmente

      program primes

      write(*,*) "Até qual número?"
      read(*,*) max


      end program

      subroutine Iprimes(n,Ires)
      integer Ires(n),i
      call range(Ires,2,n)
      i=Ires(1)
      do while(i.le.n)
            
      end do

      end 

      subroutine range(array,min,max)
      
      integer min,max,array(max-min+1),i,j
      j=1
      do i=min,max
            array(j) = i
            j = j+1
      end do
      end