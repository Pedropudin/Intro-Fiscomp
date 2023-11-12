      program tarefaB4
      implicit real*8(a-h,o-z)
      parameter(pi=4d0*atan(1d0))
      parameter(passo=4e-2,epsilon=1e-2,t_final=1d6,N=1d3)
      parameter(al=9.8,g=9.8,am=1.0)
      open(10,file='resultB4.csv')
      
      theta = 1.0
      omega = 0d0
      gamma = 5d-2
      F_0 = 0.48
      F_Omega = 2d0/3d0

      tempo = 0.0

c     Simulando movimento
      do while(tempo.lt.t_final)
      omega_prox = omega - (g/al)*sin(theta)*passo -
     &gamma*omega*passo + F_0*sin(F_Omega*tempo)*passo
      theta_prox = theta + omega_prox*passo

      write(10,100) tempo,theta,omega
      
      omega=omega_prox
      theta=theta_prox
      tempo = tempo + passo
      end do

      close(10)

100   format(F9.2,2(",",F23.12))

      write(*,*) "Fim da Execução"

      end program tarefaB4
      
      function f(x,theta)
      implicit real*8(a-h,o-z)
      f = 1/sqrt(cos(x) - cos(theta))
      return
      end function

      !Não pensei muito nos resultados mas acho que ta