program driver
  use OAD_active
  use OAD_rev
  use OAD_tape
  implicit none 
  external head
  integer                   :: n=5
  type(active)              :: y
  type(active), allocatable :: x(:)
  integer                   :: i

  allocate(x(n))
  call tape_init()
  do i= 1, n
    x(i)%v = i*1.0d0
  enddo
  y%d=1.0D0
  our_rev_mode%tape=.TRUE.

  call multi_op( n, x, y )

  write(*,'(A,100F5.2)') 'driver running for x(1:n) = ', ( x(i)%v, i=1,n )
  write(*,'(A)') 'F(x) = x(1)+x(1)*x(1) + x(2)*x(2) + ... + x(n) + x(n)*x(n)'
  do i= 1, n
    write(*,'(A,I1,A,I1,A,F5.2,A,F5.2,A,F5.2)') 'F''(x)/dx',i,' = 1+2*x(',i,') = ', 1+2*x(i)%v, &
         '      Derivada=', x(i)%d, '      Error=', 1+2*x(i)%v - x(i)%d
  enddo

end program driver
