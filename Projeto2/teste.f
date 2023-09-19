	program teste

	dimension il(2)
	p=0.5e0
	r = rand(73)

	il(1)=-1
	il(2)=1
	
	
	do i=1,1000
	x = 0
	!write(*,*) a,int(a/p)
	do j=1,1000000
	a=rand()
	x = x+il(int(a/p)+1) !Assim é mais eficiente
	end do
	!write(*,*) x
	end do

	end program teste