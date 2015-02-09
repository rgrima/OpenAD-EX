# OpenAD-EX
Examples of OpenAD

Learning to use OpenAD

* FirstDot_product/
  We found several problems:
  - We need to call tape_init:
        use OAD_tape
        ...
        call tape_init()
    This initialize tape pointers. This may seem evident, but OpenAD examples
    sometimes ommit it.
  - Problems with subroutine variables that are defined as parameters from the
    calling functions. OpenAD may try to modify these variables (it restores its
    original value at the end of the subroutine). If the variable is defined as
    a parameter, it will produce a "Segmentation fault"
