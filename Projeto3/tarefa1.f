      program derivada
      implicit real*8 (a-h,o-z)

c     Declaração de Variáveis
      parameter(x=1./2.)

c     Resultado das derivadas
      parameter(df=9.79678201383810)
      parameter(ddf=64.0983245494729,dddf=671.514613457867)
      open(10,file='valh.txt')
      open(20,file='result1.txt')

      write(20,100) "n",'simetrica3','frente2','traz2','simetrica5',
     &'d2simetrica5','d3anti5'
      write(20,150)

c     Loop principal
c     Itera pelas quantidades de h colocadas em "valh.txt"
      do i=1,14

      read(10,*) h
      
c     Calcula todos os valores
      df2f = (f(x+h) - f(x))/h
      df2t = (f(x) - f(x-h))/h
      df3s = (f(x+h) - f(x-h))/(2*h)
      df5s = (f(x-2*h)-8*f(x-h)+8*f(x+h)-f(x+2*h))/(12*h)
      ddf3s= (f(x+h)-2*f(x) + f(x-h))/(h**2)
      ddf5s= (-f(x-2*h)+16*f(x-h)-30*f(x)+16*f(x+h)-f(x+2*h))/(12*h**2)
      dddf4a=(-f(x-h)+3*f(x)-3*f(x+h)+f(x+2*h))/(h**3)
      dddf5a=(-f(x-2*h)+2*f(x-h)-2*f(x+h)+f(x+2*h))/(2*h**3)

c     Escreve os valores calculados num arquivo
      write(20,200) h,df-df3s,df-df2f,df-df2t,df-df5s,ddf-ddf5s,
     &dddf-dddf5a

      end do

      write(20,150)
      write(20,250) 'EXATO',df,df,df,df,ddf,dddf

c     Formatação
100   format('|',A9,6('|',A14),'|')
150   format('----------',6('---------------'),'-')
200   format('|',f9.8,6("|",f14.4),'|')
250   format('|',A9,6('|',f14.9),'|')

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