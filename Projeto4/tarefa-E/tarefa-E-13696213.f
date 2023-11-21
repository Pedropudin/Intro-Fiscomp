      program tarefaE
      implicit real*8(a-h,o-z)
      parameter(pi=4d0*atan(1d0))
      parameter(passo=4d-2,t_final=1d5,M=3,N=3)
      parameter(al=9.8,g=9.8)
      character(len=60) arq
      dimension omega(M),theta(M),omega_prox(M),theta_prox(M),F_0(M)

c     Declaração de Variáveis
      gama = 5d-2
      F_Omega = 0.66d0
      delta_theta = 1d-3

      F_0(1) = 0.2d0
      F_0(2) = 0.5d0
      F_0(3) = 1.2d0

      do i=0,N,1

      write(arq,99) i
      open(10*i,file=arq)

      t = 0d0
      theta = 1d0
      omega = 0d0

c     Simulando movimento
      do while(t.lt.t_final)

      do k=1,M,1

      omega_prox(k) = omega(k) - (g/al)*sin(theta(k))*passo -
     &gama*omega(k)*passo + F_0(k)*sin(F_Omega*t)*passo
      theta_prox(k) = theta(k) + omega_prox(k)*passo

      do while(theta_prox(k).gt.pi)
            theta_prox(k) = theta_prox(k) - 2d0*pi
            ita = 1
      end do
      do while(theta_prox(k).lt.-1d0*pi)
            theta_prox(k) = theta_prox(k) + 2d0*pi
            ita = 1
      end do

      omega(k) = omega_prox(k)
      theta(k) = theta_prox(k)

      end do

c     Condição de Poincaré
      if(mod(t*F_Omega,pi).lt.passo/2d0) then
      write(10*i,100) t,theta(1),omega(1),
     &theta(2),omega(2),theta(3),omega(3)
      end if

      t = t + passo

      end do

      close(10*i)

      end do

99    format("./tarefa-E/saida-E/saida-E-",I0,"-13696213.csv")
100   format(F12.2,",",F15.10,5(",",F15.10))

      write(*,*) "Fim da Execução da Tarefa E"

      end program tarefaE
