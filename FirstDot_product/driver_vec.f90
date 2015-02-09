program driver
  use OAD_active
  use OAD_tape
  use OAD_rev
  implicit none 
  external head
  integer            :: n = 5
  type(active), allocatable :: x(:)
  type(active)              :: y
  integer            :: i

  allocate(x(5))

  call tape_init()

  do i= 1, n
    x(i)%v = i*1.0d0
  enddo
  y%d=1.0D0
  our_rev_mode%tape=.TRUE.

  call head_vec( n, x, y )
  do i= 1, n
    print *, '    2*x(',i,')+1 - dy/dx(',i,')', x(i)%v, x(i)%d, 2*x(i)%v+1.0d0 - x(i)%d
  enddo

end program driver
