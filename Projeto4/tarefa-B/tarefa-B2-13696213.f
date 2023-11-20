      program tarefaB2
      implicit real*8(a-h,o-z)
      parameter(passo=1e-3,epsilon=1e-3,t_final=7d1,N=1d3,M=1d3)
      parameter(al=9.8,g=9.8,am=1.0)
      open(10,file='saida-B2-13696213.csv')
      
      theta_0 = 0.2d0
      omega = 0d0
      gamma = 0d0
      F_0 = 0d0
      F_Omega = 0d0

      delta_theta = 1d-5

      theta = theta_0

      do k=1,M,1

      omega = 0d0

      t = 0.0
      periodo=0d0
      ipos = 0

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
c      write(*,*) "Período calculado com a integral",
c     &valor_N + 2.*valor_A

c     Fórmula analítica
c      write(*,*) "Período calculado com a fórmula",
c     &func_periodo(al,g,theta)

c     Simulando movimento
      do while(t.lt.t_final)
      omega_prox = omega - (g/al)*sin(theta)*passo -
     &gamma*omega*passo + F_0*sin(F_Omega*t)*passo
      theta_prox = theta + omega_prox*passo

      if(omega*omega_prox.le.0d0) then
            if(mod(ipos,2).eq.0) then
                  t_aux = t - periodo
                  periodo = periodo + t_aux
                  ipos = ipos + 1
            else
                  ipos = ipos + 1
            end if
      end if
      
      omega=omega_prox
      theta=theta_prox
      t = t + passo
      end do

      !Período
c      write(*,*) "Período calculado com a simulação",
c     &periodo/((ipos-1)/2)

      write(10,100) theta_0 + delta_theta*k,periodo/((ipos-1)/2),
     &valor_N + 2.*valor_A,func_periodo(al,g,theta)

      theta = theta_0 + delta_theta*k
      end do

      close(10)

100   format(F15.10,3(",",F25.15))

      write(*,*) "Fim da Execução da Tarefa B2"

      end program tarefaB2

      function f(x,theta)
      implicit real*8(a-h,o-z)
      f = 1/sqrt(cos(x) - cos(theta))
      return
      end function

      function func_periodo(al,g,theta)
      implicit real*8(a-h,o-z)
      parameter(pi=4d0*atan(1d0))
      func_periodo = 2d0*pi*sqrt(al/g)*(1+(theta**2)/16d0)
      return
      end function

      !Realmente, pra valores pequenos funciona bem
      !Mas pra valores pequenos o método de integral diverge