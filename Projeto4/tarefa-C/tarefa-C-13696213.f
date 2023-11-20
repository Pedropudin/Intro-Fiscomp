      program tarefaC
      implicit real*8(a-h,o-z)
      !parameter(pi=4d0*atan(1d0))
      parameter(passo=4e-2,t_final=1d2,N=3)
      parameter(al=9.8,g=9.8)
      dimension F_0(N),theta1(N),theta2(N),omega1(N),omega2(N),
     &theta_prox1(N),theta_prox2(N),omega_prox1(N),omega_prox2(N)
      open(10,file='saida-C-13696213.csv')

      t = 0.0
      gama = 5d-2
      F_Omega=2d0/3d0
      delta_theta = 1d-3
      F_0(1) = 0.2
      F_0(2) = 0.5
      F_0(3) = 1.2

      theta1 = 0.2
      omega1 = 0d0
      theta2 = theta1 + delta_theta
      omega2 = 0d0

c     Simulando movimento
      do while(t.lt.t_final)

      write(10,100) t,log(abs(theta2(1) - theta1(1))),
     &log(abs(theta2(2) - theta1(2))),log(abs(theta2(3) - theta1(3)))

      do i=1,N,1
      omega_prox1(i) = omega1(i) - (g/al)*sin(theta1(i))*passo -
     &gama*omega1(i)*passo + F_0(i)*sin(F_Omega*t)*passo
      theta_prox1(i) = theta1(i) + omega_prox1(i)*passo
      
      omega_prox2(i) = omega2(i) - (g/al)*sin(theta2(i))*passo -
     &gama*omega2(i)*passo + F_0(i)*sin(F_Omega*t)*passo
      theta_prox2(i) = theta2(i) + omega_prox2(i)*passo

c      do while(theta_prox1(i).gt.pi)
c            theta_prox1(i) = theta_prox1(i) - 2d0*pi
c            theta_prox2(i) = theta_prox2(i) - 2d0*pi
c      end do
c      do while(theta_prox1(i).lt.-pi)
c            theta_prox1(i) = theta_prox1(i) + 2d0*pi
c            theta_prox2(i) = theta_prox2(i) + 2d0*pi
c      end do

      omega1(i) = omega_prox1(i)
      theta1(i) = theta_prox1(i)
      omega2(i) = omega_prox2(i)
      theta2(i) = theta_prox2(i)

      end do

      t = t + passo
      end do

      close(10)

100   format(F15.2,3(",",F20.10))

      write(*,*) "Fim da Execução da Tarefa C"

      end program tarefaC

      !Falta fazer aproximação linear pra encontrar o lambda
      !Acho que vou fazer seguindo a apostila antiga
      