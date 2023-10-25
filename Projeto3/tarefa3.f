      program raizes
      implicit real*8 (a-h,o-z)

c     Declaração das Variáveis
      parameter(h=1d-1)
      dimension direta(3,1000),Rnewton(3,11),secante(3,11)

      open(10,file="res-direta.txt")
      open(20,file="res-newton.txt")
      open(30,file="res-secante.txt")
      open(40,file="tab3.txt")

      Idireta=1
      Inewton=1
      Isecante=1

      direta=0
      Rnewton=0
      secante=0

      write(40,300) " ","Busca-Direta","Newton-Raphson",
     &"Secante"
      write(40,400) "Iteracao","r1","r2","r3","r1","r2","r3","r1",
     &"r2","r3"
      write(40,350)

c     Loop Principal
c     Itera por todos os chutes para os métodos
      do k=-100,100,1
            
c     Busca direta Antiga
      !i=0
      !ant=k/10d0
      !x=ant+h
      !passo=h
      !!Caso Geral
      !if(f(ant)*f(x).le.0d0) then
      !      do while(f((x)).ge.1d-6)
      !            i=i+1
      !            passo=passo/2d0
      !            ant=ant+passo
      !            if(f(ant)*f(x).gt.0d0) then
      !                  ant=ant-passo
      !                  x=x-passo
      !            end if
      !            direta(Idireta,i) = (x+ant)/2d0
      !      end do
      !      write(10,100) (x+ant)/2d0
      !      write(10,*) i
      !      direta(Idireta,i) = (x+ant)/2d0
      !      Idireta = Idireta + 1
      !!Caso Particular: raiz (mod passo) = 0
      !else if(abs(f(x)).lt.1d-6) then
      !      write(10,*) "É exatamente", x
      !Idireta = Idireta + 1
      !end if

c     Busca Direta Nova

      x = k/1d1
      prox = x+h
      xmedio = (x+prox)/2d0
      i=1
      !write(*,*) f(x)*f(prox)
      if(f(x)*f(prox).le.0d0) then
      passo=h
      write(*,*) "O primeiro valor é",x
      direta(Idireta,i) = x
      do while(abs(f(xmedio)).gt.1d-6)
            passo = passo/2d0
            i = i+1
            if(f(x)*f(xmedio).le.0d0) then
                  prox = xmedio
                  xmedio = x + passo
            else
                  x = xmedio
                  xmedio = x + passo
            end if
            write(*,*) "Coloca",xmedio,"em",i
            direta(Idireta,i) = xmedio
      end do
      Idireta = Idireta + 1
      end if

c     Newton-Rhapson
      x = k/10d0
      y=x
      i=0
      if((x.eq.-10).or.(x.eq.0).or.(x.eq.10)) then
            do while(abs(f(x)).gt.1d-6)
                  i=i+1
                  Rnewton(Inewton,i) = x
                  x = x- f(x)/df(x)
            end do
            Rnewton(Inewton,i+1) = x
            Inewton = Inewton + 1
      else
            do while(abs(f(x)).gt.1d-6)
            i=i+1
            x = x- f(x)/df(x)
            end do
            write(20,200) y,x,i
      end if

c     Secante
      ant=k/10d0
      x=ant+h
      y=ant
      i=0
      if((ant.eq.-10).or.(ant.eq.0).or.(ant.eq.10)) then
            secante(Isecante,1) = ant
            do while(abs(f(x)).gt.1d-6)
                  i=i+1
                  secante(Isecante,i+1) = x
                  prox=x-f(x)*((x-ant)/(f(x)-f(ant)))
                  ant=x
                  x=prox
            end do
            secante(Isecante,i+2)=x
            Isecante = Isecante + 1
      else

      do while(abs(f(x)).gt.1d-6)
      prox=x-f(x)*((x-ant)/(f(x)-f(ant)))
      ant=x
      x=prox
      i=i+1
      end do
      write(30,200) y,x,i

      end if
      
      end do

c     Escrita nos arquivos
      do i=0,10
      write(40,500) i,direta(1,i+1),direta(2,i+1),direta(3,i+1),
     &Rnewton(1,i+1),Rnewton(2,i+1),Rnewton(3,i+1),
     &secante(1,i+1),secante(2,i+1),secante(3,i+1)
      end do

      do i=1,30
            !write(*,*) direta(2,i)
      end do

      write(40,350)
      write(40,600) "EXATOS",-7d0,2d0,9d0

c     Formatação
100   format(f9.6)
200   format(f5.1,",",f9.6,",",i5)
300   format(A10,3("|",A33),"|")
350   format(113("-"))
400   format(A10,3('|',3("|",A10)),"|")
500   format(I10,3('|',3("|",F10.6)),"|")
600   format(A10,3("||",F32.6),"|")


      close(10)
      close(20)
      close(30)
      close(40)

      write(*,*) "Fim da Execução"

      end program raizes

c     Função f(x) para encontrar as raízes
      real*8 function f(x)
      implicit real*8 (a-h,o-z)
      f=x**3 - 4*x**2 - 59*x + 126
      return
      end

c     Função f'(x) utilizada no método de Newton-Rhapson
      real*8 function df(x)
      implicit real*8 (a-h,o-z)
      df=3*x**2 - 8*x - 59
      return
      end

      !O método da busca direta não tá mais funcionando, não sei
      !Exatamente porque