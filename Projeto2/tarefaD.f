      program entropia
      
c     Declaração de variáveis
      parameter(Iseed=73,p=0.25e0)
      parameter(M=10000,N=1000,l=10)
      dimension ipos(M,2), imaxmin(4)
      r = rand(Iseed)
      open(10,file="resultD.dat")

      ipos = 0

c     Loop principal
      do i=1,N
            s=0e0
            imaxmin=0

c           Dá 1 passo em todos os andarilhos
            do j=1,M
            call andar(ipos(j,1),ipos(j,2),rand(),p,2*p,3*p)
            call otimizar(imaxmin,ipos(j,1),ipos(j,2))
            end do

c           Calcula a entropia do sistema
            do ix=imaxmin(2),imaxmin(1),l
            do iy=imaxmin(4),imaxmin(3),l
            iquant = ifind(ix,iy,ipos,M,l)
            pi = real(iquant)/M
            if(pi.ne.0) s = s-(pi*log(pi))
            end do
            end do

c           Escreve os valores num arquivo
            !write(10,*) i,s
      end do

      write(*,*) "Fim da Execução"

      end program entropia

c     Realiza o movimento do andarilho de acordo com o
c     número aleatório recebido
      subroutine andar(ix,iy,a,p1,p2,p3)

      if(a.le.p1) then
            ix = ix+1
      else if(a.le.p2) then
            ix = ix-1
      else if(a.le.p3) then
            iy = iy+1
      else
            iy = iy-1
      end if

      end 

c     Manipula o vetor com os valores máximos e mínimos de x e y
      subroutine otimizar(ivector,ix,iy)
      
      dimension ivector(4)

      if(ix.gt.ivector(1)) then
            ivector(1)=ix
      else if(ix.lt.ivector(2)) then
            ivector(2)=ix
      end if
      if(iy.gt.ivector(3)) then
            ivector(3)=iy
      else if(iy.lt.ivector(4)) then
            ivector(4)=iy
      end if

      end

c     Verifica a quantidade de pontos em um quadrante do plano
      function ifind(i,j,ipontos,M,l)

      dimension ipontos(M,2)
      ifind = 0
      
      do k=1,M
      if(ipontos(k,1).ge.i .and. ipontos(k,1).le.i+l .and.
     &ipontos(k,2).ge.j .and. ipontos(k,2).le.j+l) then
            ifind=ifind+1
      end if
      end do

      return
      end
