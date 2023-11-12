      program tarefaB3

      implicit real*8(a-h,o-z)
      parameter(pi=4d0*atan(1d0))
      parameter(passo=1e-2,epsilon=1e-2,t_final=1d2,N=1d3)
      parameter(al=9.8,g=9.8,am=1.0)
      dimension t_centro(int(t_final/passo)) 
      open(10,file='iniciais.txt')
      open(20,file='resultB3.csv')
      
      theta = 1d0
      omega = 0d0
      gamma = 1d0/2d0
      F_0 = 0d0
      F_Omega = 0d0

      tempo = 0.0
      icentro = 0
      ipos = 1

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

      close(10)
      close(20)

100   format(F7.2,2(",",F16.12))

      write(*,*) "Fim da Execução"

      end program tarefaB3

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

      !plot funciona, só preciso ver qual tipo que é