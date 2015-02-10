subroutine basic_dot(x1,x2,x3,y)
	implicit none
  double precision :: x1, x2, x3
  double precision :: y
!$openad INDEPENDENT(x1)
!$openad INDEPENDENT(x2)
!$openad INDEPENDENT(x3)
  y =x1*x1+x2*x2+x3*x3
!$openad DEPENDENT(y)
end subroutine basic_dot
