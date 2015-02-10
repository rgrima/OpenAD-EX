subroutine multi_op( n, x, y )
  implicit none
  integer          :: n
  double precision :: x(n)
  double precision :: y
  double precision, external :: sum_vec
  double precision, external :: dot_vec
!$openad INDEPENDENT(x)
  y = sum_vec( n, x ) + dot_vec( n, x, x )
!$openad DEPENDENT(y)
end subroutine multi_op
