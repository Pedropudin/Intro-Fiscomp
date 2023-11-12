      program tarefaB1
      implicit real*8(a-h,o-z)
      parameter(passo=1e-2,epsilon=1e-2,t_final=5d2,N=1d3)
      parameter(al=9.8,g=9.8,am=1.0)
      dimension t_centro(int(t_final/passo)) !Acho que é muito, mas 
      !são todas as possibilidades
      open(10,file='iniciais.txt')
      open(20,file='resultB.csv')
      
      read(10,*) theta
      read(10,*) omega
      read(10,*) gamma
      read(10,*) F_0
      read(10,*) F_Omega

      tempo = 0.0
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
      write(*,*) valor_N + 2.*valor_A

c     Simulando movimento
      do while(tempo.lt.t_final)
      omega_prox = omega - (g/al)*sin(theta)*passo -
     &gamma*omega*passo + F_0*sin(F_Omega*tempo)*passo
      theta_prox = theta + omega_prox*passo

      write(20,100) tempo,theta,omega
      call periodo(theta,theta_prox,icentro)
      if(icentro.eq.1) then
            t_centro(ipos)=tempo
            ipos = ipos + 1
      end if
      
      omega=omega_prox
      theta=theta_prox
      tempo = tempo + passo
      end do

      !Período
      write(*,*) t_centro(4)-t_centro(2)

      close(10)
      close(20)

100   format(F7.2,2(",",F15.12))

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

      !Deu muito certo, os valores são muito próximos
      
      !Posso fazer uma média dos períodos depois pra ter uma análise
      !melhor