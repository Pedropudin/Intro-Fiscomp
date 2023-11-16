      program tarefaE
      implicit real*8(a-h,o-z)
      parameter(pi=4d0*atan(1d0))
      parameter(passo=4e-2,t_final=1d6,M=3)
      parameter(al=9.8,g=9.8)
      open(10,file='resultE.csv')

      t = 0.0
      gama = 5d-2
      F_Omega=2d0/3d0
      delta_theta = 1d-3

      F_0 = 1.2 !1.2 !0.5
      
      theta = 1.0
      omega = 0d0

c     Simulando movimento
      do while(t.lt.t_final)

      omega_prox = omega - (g/al)*sin(theta)*passo -
     &gama*omega*passo + F_0*sin(F_Omega*t)*passo
      theta_prox = theta + omega_prox*passo

      n=int(t/(pi/F_Omega))+1

      if(abs(t - n*(pi/F_Omega)).lt.passo/2d0) then
      write(10,100) mod(theta,2d0*pi),omega
      end if

      omega = omega_prox
      theta = theta_prox

      t = t + passo
      end do

      close(10)

100   format(F20.5,",",F20.5)

      write(*,*) "Fim da Execução"

      end program tarefaE