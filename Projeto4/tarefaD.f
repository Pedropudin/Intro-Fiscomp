      program tarefaD
      implicit real*8(a-h,o-z)
      parameter(pi=4d0*atan(1d0))
      parameter(passo=7e-2,t_final=1d3)
      parameter(al=9.8,g=9.8)
      open(10,file='resultD-1_1.dat')

      tempo = 0.0
      gama = 5d-1
      F_Omega=2d0/3d0
      delta_theta = 1d-3

      F_0 = 0.5 !1.2 !0.5
      
      theta = 1.1
      omega = 0d0

c     Simulando movimento
      do while(tempo.lt.t_final)
      omega_prox = omega - (g/al)*sin(theta)*passo -
     &gama*omega*passo + F_0*sin(F_Omega*tempo)*passo
      theta_prox = theta + omega_prox*passo

      write(10,100) theta,omega

      omega = omega_prox
      theta = theta_prox

      tempo = tempo + passo
      end do

      close(10)

100   format(F20.12," ",F20.12)

      write(*,*) "Fim da Execução"

      end program tarefaD