program driver
  use OAD_active
  use OAD_rev
  implicit none 
  external head
  type(active) :: x1, x2, x3, y
  x1%v=1.0D0
  x2%v=2.0D0
  x3%v=3.0D0
  y%d=1.0D0
  our_rev_mode%tape=.TRUE.
  call head(x1,x2,x3,y)
  print *, 'driver running for x = (',x1%v, ',', x2%v, ',', x3%v, ')'
  print *, '    2*x1 - dy/dx1', 2*x1%v - x1%d
  print *, '    2*x2 - dy/dx2', 2*x2%v - x2%d
  print *, '    2*x3 - dy/dx3', 2*x3%v - x3%d
end program driver
