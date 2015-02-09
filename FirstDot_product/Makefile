ifndef F90C
F90C=gfortran -Og -Wall -Wextra -pedantic -fbounds-check -fbacktrace
#F90C=ifort -C -g -O0 -ftrapuv -check all -check uninit -traceback -debug
endif
ifndef CC
CC=gcc -Og -Wall -Wextra -pedantic -fbounds-check -fbacktrace
#CC=icc -C -g -O0 -ftrapuv -check all -check uninit -traceback -debug
endif
RTSUPP=w2f__types OAD_active OAD_cp OAD_tape OAD_rev 
all: driver driver_vec

driver_vec: $(addsuffix .E.o, $(RTSUPP) iaddr) \
            driver_vec.o derCode.pre.xb.x2w.w2f.post.o
	${F90C} -o $@ $^

derCode.pre.xb.x2w.w2f.post.f90: derCode.f90 
	openad -c -m rj $<

derCode.f90: vec_op.f90 head_vec.f90
	cat $^ > $@

driver: $(addsuffix .o, $(RTSUPP) iaddr) driver.o head.prepped.pre.xb.x2w.w2f.post.o
	${F90C} -o $@ $^

#head.prepped.pre.xb.x2w.w2f.post.f90 $(addsuffix .f90, $(RTSUPP)) iaddr.c : toolChain 

$(addsuffix .E.o, $(RTSUPP)): derCode.pre.xb.x2w.w2f.post.f90
	${F90C} -o $@ -c $(basename $(basename $@)).f90

$(addsuffix .E.o, iaddr): derCode.pre.xb.x2w.w2f.post.f90
	${CC} -o $@ -c $(basename $(basename $@)).c

toolChain : head.prepped.f90
	openad -c -m rj $<

%.o : %.f90
	${F90C} -o $@ -c $< 

%.o : %.c
	${CC} -o $@ -c $< 

clean: 
	rm -f ad_template* ad_inline.f OAD_* w2f__*  iaddr* 
	rm -f head.prepped.pre.* *.B *.xaif *.o *.mod driver *~ 
	rm -f head_vec.pre.* *.B *.xaif *.o *.mod driver_vec *~
	rm -f derCode*

.PHONY: clean toolChain
