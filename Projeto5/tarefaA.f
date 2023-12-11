      program tarefaA
      implicit real*8(a-h,o-z)
      parameter(pi=4d0*atan(1d0))      
      parameter(GM=4d0*pi**2)
      parameter(t_final=1d-1,dt=1d-2)
      dimension v_0(2)
      
      iter=t_final/dt

      t=0
      x=0
      y=0
      
      v_0=0d0

      do i=1,iter,1
      
      x_ant = x
      y_ant = y

      if(i.eq.1) then
            x=x + v_0(1)*dt
            y=y + v_0(2)*dt
      else 
            r = sqrt(x**2 + y**2) !Acho que não é assim que define esse r
            x = 2*x - x_ant - ((GM*x)/(r**3))*dt**2
            y = 2*y - y_ant - ((GM*y)/(r**3))*dt**2
      end if
      write(*,*) x,y
      end do

      end program tarefaA

      !Melhor fazer contando as iteações pra ter um controle
      !dos primeiros valores
