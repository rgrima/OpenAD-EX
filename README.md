# OpenAD-EX
Examples of OpenAD

Learning to use OpenAD

FIRST:
  Simple example with 3 input variables and an output variable:
  F(x) = x1*x1 + x2*x2 + x3*x3

SECOND:
  F(x) = SUM( x(i)+x(i)^2 )
      sum_vec( n, x )    => y = SUM( x(i) )
      dot_vec( n, x, y ) => z = SUM( x(i)*y(i) )
  Problems:
    1) We need to call tape_init( )
    2) "N" cannot be defined as a parameter. OpenAD can try to modify it.
    3) DOT_VEC can produce "aliasing problems" if we use the same vector twice:
      For example: call dot_vec( n, x, x )
      Posible solutions:
        ) Compile with -O0                        (poor performance)
        b) Compile with: ifort -no-ansi-alias      (poor performance)
        c) Create an specific function             (see third case)

THIRD:
  F(x) = SUM( x(i)+x(i)^2 )
      sum_vec( n, x )    => y = SUM( x(i) )
      dot_vec_good( n, x ) => z = SUM( x(i)*x(i) )
  The new function solves the aliasing problem
