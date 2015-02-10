program driver
  use OAD_active
  use OAD_rev
  use OAD_tape
  implicit none 
  external head
  type(active) :: x1, x2, x3, y

  x1%v=1.0D0
  x2%v=2.0D0
  x3%v=3.0D0
  y%d=1.0D0
  our_rev_mode%tape=.TRUE.
  call basic_dot( x1, x2, x3, y )

  write(*,'(A,F5.2,A,F5.2,A,F5.2,A,F5.2,A)') 'driver running for x = (',x1%v, ',', x2%v, ',', x3%v, ' )'
  write(*,'(A)') 'F(x) = x1*x1 + x2*x2 + x3*x3'
  write(*,'(A,F5.2,A,F5.2,A,F5.2)') 'F''(x)/dx1 = 2*x1 = ', 2*x1%v, '      Derivada=', x1%d, '      Error=', 2*x1%v - x1%d
  write(*,'(A,F5.2,A,F5.2,A,F5.2)') 'F''(x)/dx2 = 2*x2 = ', 2*x2%v, '      Derivada=', x2%d, '      Error=', 2*x2%v - x2%d
  write(*,'(A,F5.2,A,F5.2,A,F5.2)') 'F''(x)/dx3 = 2*x3 = ', 2*x3%v, '      Derivada=', x3%d, '      Error=', 2*x3%v - x3%d
end program driver
