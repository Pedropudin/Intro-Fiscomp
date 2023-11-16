      program tarefaC
      implicit real*8(a-h,o-z)
      !parameter(pi=4d0*atan(1d0))
      parameter(passo=7e-2,t_final=1d2)
      parameter(al=9.8,g=9.8)
      open(10,file='resultC.csv')

      t = 0.0
      gama = 5d-2
      F_Omega=2d0/3d0
      delta_theta = 1d-3
      F_0 = 0.5
      
      theta1 = 0.2
      omega1 = 0d0
      theta2 = theta1 + delta_theta
      omega2 = 0d0
      do k=1,2,1            
c     Simulando movimento
      do while(t.lt.t_final)
      omega_prox1 = omega1 - (g/al)*sin(theta1)*passo -
     &gama*omega1*passo + F_0*sin(F_Omega*t)*passo
      theta_prox1 = theta1 + omega_prox1*passo
      
      omega_prox2 = omega2 - (g/al)*sin(theta2)*passo -
     &gama*omega2*passo + F_0*sin(F_Omega*t)*passo
      theta_prox2 = theta2 + omega_prox2*passo

      write(10,100) t,log(abs(theta2 - theta1))

      omega1 = omega_prox1
      theta1 = theta_prox1
      omega2 = omega_prox2
      theta2 = theta_prox2

      t = t + passo
      end do
      F_0 = 1.2
      end do

      close(10)

100   format(F7.2,",",F20.12)

      write(*,*) "Fim da Execução"

      end program tarefaC