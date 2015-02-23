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
        a) Compile with -O0                        (poor performance)
        b) Compile with: ifort -no-ansi-alias      (poor performance)
        c) Create an specific function             (see third case)

THIRD:
  F(x) = SUM( x(i)+x(i)^2 )
      sum_vec( n, x )    => y = SUM( x(i) )
      dot_vec_good( n, x ) => z = SUM( x(i)*x(i) )
  The new function solves the aliasing problem


OTHER things:
* Be carefull with variables defined as intent(in):

    function region(x) result(reg)
    implicit none
    integer, intent(in) :: x
    integer             :: reg
    reg = ....
    end function region

    ==> error #6780: A dummy argument with the INTENT(IN) attribute shall not be defined nor become undefined.   [X]
        X = theArgIStack(theArgIStackoffset)

* Problems when including just some variables from a module:
    subroutine electronic_conductivity( x, sigma )
    use variables, only : separator, conductivity_solid, porosity_solid, &
                          bruggeman
    implicit none
    ...
    end

    ==> Include all module: use variables

* Problems if we use too many diferent types:
		integer      :: Nx, Nr 
    integer(8)   :: max_iterations  <=== Problem???

* Problems variable name length.... lenght <= 31
    type(solver) :: Solver_Concentration_Electrolyte

* Problems with matrices????
* Important!!!! Do not use "OPTIONAL"
* Problems with array assigments: ¿¿¿???
    myvec(1:n) = s(1) + s(2) + s(3)
* Problems with "type" parameters => myfind ore_opaque_sca . "*.[fF]*"
* 

* Edit OAD_active.f90 ====> need to set a new function: shapeTest_a3_d3
* 
