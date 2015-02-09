function sum_vec( n, x ) result(y)
  integer          :: n
  double precision :: x(n)
  double precision :: y
  integer          :: i

  y = 0.0d0
  do i= 1, n
    y = y + x(i)
  enddo

end function sum_vec
