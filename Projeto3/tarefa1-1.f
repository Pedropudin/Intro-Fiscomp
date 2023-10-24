      program derivada
      implicit real*8 (a-h,o-z)

c     Declaração de Variáveis
      parameter(x=1./2.)

      parameter(df=9.79678201383810)
      parameter(ddf=64.0983245494729,dddf=671.514613457867)

      open(10,file='graph1.csv')
      open(20,file='valh2.txt')

      write(10,100) "n",'simetrica3','frente2','traz2','simetrica5',
     &'d2simetrica5','d3anti5'

      do i=1,30

      read(20,*) h
      
c     Calcula todos os valores
      df2f = (f(x+h) - f(x))/h
      df2t = (f(x) - f(x-h))/h
      df3s = (f(x+h) - f(x-h))/(2*h)
      df5s = (f(x-2*h)-8*f(x-h)+8*f(x+h)-f(x+2*h))/(12*h)
      ddf5s= (-f(x-2*h)+16*f(x-h)-30*f(x)+16*f(x+h)-f(x+2*h))/(12*h**2)
      dddf5a=(-f(x-2*h)+2*f(x-h)-2*f(x+h)+f(x+2*h))/(2*h**3)

c     Escreve os valores calculados num arquivo
      write(10,200) h,df-df3s,df-df2f,df-df2t,df-df5s,ddf-ddf5s,
     &dddf-dddf5a

      end do

c     Formatação
100   format(A,6(",",A))
200   format(F12.10,6(",",F25.5))

      close(10)
      close(20)

      write(*,*) "Fim da Execução"

      end program derivada

c     Função f(x) que foi derivada
      real*8 function f(x)
      implicit real*8 (a-h,o-z)
      f=exp(x/2)*tan(2*x)
      return
      end