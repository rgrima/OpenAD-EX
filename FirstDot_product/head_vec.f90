subroutine head_vec( n, x, y )
  integer                    :: n
  double precision           :: x(n)
  double precision           :: y
  integer                    :: i
  double precision, external :: sum_vec
!$openad INDEPENDENT(x)
  y = sum_vec( n, x )
  do i= 1, n
    y = y + x(i)*x(i)
  enddo
!$openad DEPENDENT(y)
end subroutine
