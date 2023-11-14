      program tarefaB1
      implicit real*8(a-h,o-z)
      parameter(passo=1e-2,epsilon=1e-2,t_final=5d2,N=1d3)
      parameter(al=9.8,g=9.8,am=1.0)
      dimension t_centro(int(t_final/passo))
      open(10,file='resultB1.csv')
      
      theta = 1d0
      omega = 0d0
      gamma = 0d0
      F_0 = 0d0
      F_Omega = 0d0

      t = 0.0
      icentro = 0
      ipos = 1

c     Resolvendo a Integral
      valor_A = 2*sqrt((2*al)/g)*(sqrt(epsilon)/sqrt(sin(theta)))
      valor_N = 0.
      a=-theta+epsilon
      b=theta-epsilon
      h=(b-a)/N
      do i=1,N,2
      x = a+h*i
      valor_N=valor_N+(h/3.)*(f(x-h,theta)+4.*f(x,theta)+f(x+h,theta))
      end do
      valor_N = sqrt((2.*al)/g)*valor_N
      write(*,*) "Período calculado com a integral",
     &valor_N + 2.*valor_A

c     Simulando movimento
      do while(t.lt.t_final)
      omega_prox = omega - (g/al)*sin(theta)*passo -
     &gamma*omega*passo + F_0*sin(F_Omega*t)*passo
      theta_prox = theta + omega_prox*passo

      call periodo(theta,theta_prox,icentro)
      if(icentro.eq.1) then
            t_centro(ipos)=t
            ipos = ipos + 1
      end if
      
      omega=omega_prox
      theta=theta_prox
      t = t + passo
      end do

      !Período
      write(*,*) "Período calculado com a simulação",
     &t_centro(4)-t_centro(2)

      close(10)

      write(*,*) "Fim da Execução"

      end program tarefaB1

      subroutine periodo(theta,theta_prox,icentro)
      implicit real*8(a-h,o-z)
      if(theta*theta_prox.le.0.0) then
            icentro = 1
      else
            icentro = 0
      end if
      return
      end
      
      function f(x,theta)
      implicit real*8(a-h,o-z)
      f = 1/sqrt(cos(x) - cos(theta))
      return
      end function
      
      !Posso fazer uma média dos períodos depois pra ter uma análise
      !melhor