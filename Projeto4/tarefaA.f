c     Simulação de Pêndulo com aproximação
      program tarefaA
      implicit real*8 (a-h,o-z)

c     Definição de Constantes e abertura de arquivos
      parameter(passo=1e-2,pi=4*atan(1d0),t_final=5d2)
      parameter(al=9.8,g=9.8,am=1.0)
      open(10,file='resultA.csv')
      
c     Declaração de Variáveis
      t = 0d0

      theta_0 = 1d0
      omega_0 = 0d0

      theta_inc = theta_0
      theta_cor = theta_0
      omega_inc = omega_0
      omega_cor = omega_0

      do while(t.lt.t_final)

c     Método de Euler 
      omega_inc_prox = omega_inc - (g/al)*theta_inc*passo
      theta_inc_prox = theta_inc + omega_inc*passo
      E_c_inc = (1./2.)*am*al**2*omega_inc**2
      E_p_inc = am*g*al*cos(theta_inc)

c     Método de Euler-Cromer
      omega_cor_prox = omega_cor - (g/al)*theta_cor*passo
      theta_cor_prox = theta_cor + omega_cor_prox*passo
      E_c_cor = (1./2.)*am*omega_cor**2*al**2
      E_p_cor = am*g*al*cos(theta_cor)

      write(10,100) t,theta_inc,omega_inc,E_c_inc+E_p_inc,theta_cor,
     &omega_cor,E_c_cor+E_p_cor

c     Atualização dos Valores
      omega_inc = mod(omega_inc_prox,2*pi)
      theta_inc = theta_inc_prox

      omega_cor = mod(omega_cor_prox,2*pi)
      theta_cor = theta_cor_prox

      t = t + passo
      end do

      close(10)

c     Formatação dos arquivos
100   format(F8.3,6(",",F20.7))

      write(*,*) "Fim da Execução"

      end program tarefaA