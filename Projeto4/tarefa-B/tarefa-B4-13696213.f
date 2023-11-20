      program tarefaB4
      implicit real*8(a-h,o-z)
      parameter(pi=4d0*atan(1d0))
      parameter(passo=4e-2,epsilon=1e-2,t_final=1d3,N=1d3)
      parameter(al=9.8,g=9.8,am=1.0)
      dimension theta(3),omega(3),F_0(3)
      dimension theta_prox(3),omega_prox(3)
      open(10,file='saida-B4-13696213.csv')
      
      theta = 1.0
      omega = 0d0
      gamma = 5d-2
      F_0(1) = 0d0
      F_0(2) = 5d-1
      F_0(3) = 1.2
      F_Omega = 2d0/3d0

      t = 0.0

c     Simulando movimento
      do while(t.lt.t_final)
      omega_prox(1) = omega(1) - (g/al)*sin(theta(1))*passo -
     &gamma*omega(1)*passo + F_0(1)*sin(F_Omega*t)*passo
      theta_prox(1) = theta(1) + omega_prox(1)*passo

      omega_prox(2) = omega(2) - (g/al)*sin((theta(2)))*passo -
     &gamma*omega(2)*passo + F_0(2)*sin(F_Omega*t)*passo
      theta_prox(2) = (theta(2)) + omega_prox(2)*passo

      omega_prox(3) = omega(3) - (g/al)*sin(theta(3))*passo -
     &gamma*omega(3)*passo + F_0(3)*sin(F_Omega*t)*passo
      theta_prox(3) = theta(3) + omega_prox(3)*passo

      write(10,100) t,theta(1),theta(2),theta(3),
     &omega(1),omega(2),omega(3)
      
      omega(1)=omega_prox(1)
      theta(1)=theta_prox(1)
      omega(2)=omega_prox(2)
      theta(2)=theta_prox(2)
      omega(3)=omega_prox(3)
      theta(3)=theta_prox(3)
      t = t + passo
      end do

      close(10)

100   format(F9.2,6(",",F23.12))

      write(*,*) "Fim da Execução da Tarefa B4"

      end program tarefaB4
      
      function f(x,theta)
      implicit real*8(a-h,o-z)
      f = 1/sqrt(cos(x) - cos(theta))
      return
      end function

      !Não pensei muito nos resultados mas acho que ta