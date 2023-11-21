      program tarefaB4
      implicit real*8(a-h,o-z)
      parameter(pi=4d0*atan(1d0))
      parameter(passo=4e-2,epsilon=1e-2,t_final=2d2,N=4)
      parameter(al=9.8,g=9.8,am=1.0)
      dimension theta(N),omega(N),F_0(N)
      dimension theta_prox(N),omega_prox(N)
      open(10,file='saida-B4-13696213.csv')
      
c     Declaração de Variáveis
      theta = 1.0
      omega = 0d0
      gamma = 5d-2

      F_0(1) = 0d0
      F_0(2) = 2d-1
      F_0(3) = 5d-1
      F_0(4) = 1.2

      F_Omega = 2d0/3d0

      t = 0.0

c     Simulando movimento
      do while(t.lt.t_final)

      write(10,100) t,theta(1),theta(2),theta(3),theta(4),
     &omega(1),omega(2),omega(3),omega(4)

      do i=1,N,1
      omega_prox(i) = omega(i) - (g/al)*sin(theta(i))*passo -
     &gamma*omega(i)*passo + F_0(i)*sin(F_Omega*t)*passo
      theta_prox(i) = theta(i) + omega_prox(i)*passo
      
      do while(theta_prox(i).gt.pi)
            theta_prox(i) = theta_prox(i) - 2d0*pi
      end do
      do while(theta_prox(i).lt.-pi)
            theta_prox(i) = theta_prox(i) + 2d0*pi
      end do

      omega(i)=omega_prox(i)
      theta(i)=theta_prox(i)
      end do

      t = t + passo
      end do

      close(10)

100   format(F9.2,8(",",F23.12))

      write(*,*) "Fim da Execução da Tarefa B4"

      end program tarefaB4