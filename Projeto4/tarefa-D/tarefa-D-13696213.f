      program tarefaD
      implicit real*8(a-h,o-z)
      parameter(pi=4d0*atan(1d0))
      parameter(passo=4e-2,t_final=1d2,N=3,M=5)
      parameter(al=9.8,g=9.8)
      dimension F_0(N),theta(N),omega(N),theta_prox(N),omega_prox(N)
      character(len=16)  pasta
      character(len=45) arq
      pasta="tarefa-D/saida-D"

      t = 0.0
      gama = 5d-2
      F_Omega=0.66
      delta_theta = 1d-3

      F_0(1) = 0.2
      F_0(2) = 0.5
      F_0(3) = 1.2

      theta_0 = 1d0
      omega_0 = 0d0

      do k=0,M,1

      write(arq,99) pasta,k
      open(10*k,file=arq)

      theta = theta_0 + delta_theta*k
      omega = omega_0
c     Simulando movimento
      do while(t.lt.t_final)

      write(10*k,100) theta(1),omega(1),theta(2),omega(2),
     &theta(3),omega(3)
      
      do i=1,N,1

      omega_prox(i) = omega(i) - (g/al)*sin(theta(i))*passo -
     &gama*omega(i)*passo + F_0(i)*sin(F_Omega*t)*passo
      theta_prox(i) = theta(i) + omega_prox(i)*passo

      do while(theta_prox(i).gt.pi)
            theta_prox(i) = theta_prox(i) - 2d0*pi
            ita = 1
      end do
      do while(theta_prox(i).lt.-1d0*pi)
            theta_prox(i) = theta_prox(i) + 2d0*pi
            ita = 1
      end do

      omega(i) = omega_prox(i)
      theta(i) = theta_prox(i)

      end do

      t = t + passo
      end do

      close(10*k)

      end do

99    format("./",A16,"/","saida-D-13696213-",I0,".csv")
100   format(F20.12,",",F20.12)

      write(*,*) "Fim da Execução da Tarefa D"

      end program tarefaD