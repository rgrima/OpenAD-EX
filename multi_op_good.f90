subroutine multi_op_good( n, x, y )
  implicit none
  integer          :: n
  double precision :: x(n)
  double precision :: y
  double precision, external :: sum_vec
  double precision, external :: dot_vec_good
!$openad INDEPENDENT(x)
  y = sum_vec( n, x )
  y = y + dot_vec_good( n, x )
!$openad DEPENDENT(y)
end subroutine multi_op_good
