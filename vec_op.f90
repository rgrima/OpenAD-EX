function sum_vec( n, x ) result(y)
  implicit none
  integer          :: n
  double precision :: x(n)
  double precision :: y
  integer          :: i

  y = 0.0d0
  do i= 1, n
    y = y + x(i)
  enddo

end function sum_vec

function dot_vec( n, x, y ) result(z)
  implicit none
  integer          :: n
  double precision :: x(n), y(n)
  double precision :: z
  integer          :: i

  z = 0.0d0
  do i= 1, n
    z = z + x(i)*y(i)
  enddo
end function dot_vec

function dot_vec_good( n, x ) result(z)
  implicit none
  integer          :: n
  double precision :: x(n), y(n)
  double precision :: z
  integer          :: i

  z = 0.0d0
  do i= 1, n
    z = z + x(i)*x(i)
  enddo
end function dot_vec_good
