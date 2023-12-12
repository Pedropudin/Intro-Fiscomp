      program tarefaA
      implicit real*8(a-h,o-z)
      !Unidades de Conversão
      !parameter(UA=1.5d11,seg_ano=3.2d7)

      !Constantes Físicas
      parameter(pi=4d0*atan(1d0))

      !Valores constantes no código
      parameter(GMs=4d0*pi**2)
      parameter(t_final=1d0,dt=1./(365.*24.))

      dimension v_0(2),x(2),y(2)

      open(10,file='resultA.csv')

      t=0d0
      x=1d0
      y=0d0
      
      v_0(1)=0.
      v_0(2)=2*pi/sqrt(x(1))

      Ifirst = 1
      Ivolta = 0

      do while(Ivolta.eq.0)

      r = sqrt(x(1)**2 + y(1)**2)

      write(10,*) x(1),y(1)
            
      if(Ifirst.eq.1) then
      x(1) = x(1) + v_0(1)*dt
      y(1) = y(1) + v_0(2)*dt
      Ifirst = 0
      else

      x_aux = x(1)
      y_aux = y(1)

      x(1) = 2*x(1) - x(2) - ((GMs*x(1))/(r**3))*dt**2
      y(1) = 2*y(1) - y(2) - ((GMs*y(1))/(r**3))*dt**2

      x(2) = x_aux
      y(2) = y_aux

      call periodo(Ivolta,x,y)

      end if

      t = t+dt

      end do

      write(*,*) t

      close(10)

100   format(F10.1,",",F10.1)

      end program tarefaA

      subroutine periodo(Istatus,x,y)
      implicit real*8(a-h,o-z)
      dimension x(2),y(2)
      
      if(y(1).gt.y(2) .and. y(2)*y(1).le.0d0) then
            Istatus = 1
      end if

      end subroutine

      !Programa funcional

      !Printa os dados do período no terminal e das 
      !posições num arquivo

      !Precisa colocar manualmente os dados dos planetas ainda

      !Tem muito a melhorar mas tá funcionando 