      program euler
      implicit real*8 (a-h,o-z)

c     Definição de Constantes e abertura de arquivos
      parameter(passo=1e-2,pi=4*atan(1d0))
      parameter(al=9.8,g=9.8,am=1.0)
      open(10,file='euler_incorreto.csv')
      open(20,file='euler_correto.csv')
      
c     Declaração de Variáveis
      t_final = 5d2
      tempo = 0.

      theta_0 = 1.
      omega_0 = 0.

      theta_inc = theta_0
      theta_cor = theta_0
      omega_inc = omega_0
      omega_cor = omega_0

      do while(t.lt.t_final)

c     Método de Euler Incorreto
      omega_inc_prox = omega_inc - (g/al)*theta_inc*passo
      theta_inc_prox = theta_inc + omega_inc*passo
      E_c = (1./2.)*am*omega_inc**2
      E_p = ((am*g)/(2d0*al))*theta_inc**2

      write(10,100) t,theta_inc,omega_inc,E_c+E_p

      omega_inc = mod(omega_inc_prox,2*pi)
      theta_inc = theta_inc_prox

c     Método de Euler Correto
      omega_cor_prox = omega_cor - (g/al)*theta_cor*passo
      theta_cor_prox = theta_cor + omega_cor_prox*passo
      E_c = (1./2.)*am*omega_cor**2
      E_p = ((am*g)/(2d0*al))*theta_cor**2

      write(20,100) t,theta_cor,omega_cor,E_c + E_p

      omega_cor = mod(omega_cor_prox,2*pi)
      theta_cor = theta_cor_prox

      t = t + passo
      end do

      close(10)
      close(20)

c     Formatação dos arquivos
100   format(F8.3,2(",",F8.5),",",F8.1)

      end program euler

      !Energia tá funcionando também
      !No método corrigido a energia tá muito linear, achei que
      !tivesse que ser um pouco mais variável