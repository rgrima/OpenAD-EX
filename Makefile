ifndef F90C
F90C=gfortran -O3
#F90C=ifort
#F90C=gfortran -Og -Wall -Wextra -pedantic -fbounds-check -fbacktrace
#F90C=ifort -C -g -O0 -ftrapuv -check all -check uninit -traceback -debug
endif
ifndef CC
CC=gcc -O3
#CC=icc
#CC=gcc -Og -Wall -Wextra -pedantic -fbounds-check -fbacktrace
#CC=icc -C -g -O0 -ftrapuv -check all -check uninit -traceback -debug
endif

BINARY=first second third
RTSUPP=w2f__types OAD_active OAD_cp OAD_tape OAD_rev 

all: $(BINARY)

first: $(addsuffix .A.o, $(RTSUPP) iaddr) first.o basic_dot.pre.xb.x2w.w2f.post.o
	${F90C} -o $@ $^

basic_dot.pre.xb.x2w.w2f.post.f90: basic_dot.f90 
	openad -c -m rj $<

$(addsuffix .A.o, $(RTSUPP)): basic_dot.pre.xb.x2w.w2f.post.f90
	${F90C} -o $@ -c $(basename $(basename $@)).f90

$(addsuffix .A.o, iaddr): basic_dot.pre.xb.x2w.w2f.post.f90
	${CC} -o $@ -c $(basename $(basename $@)).c


second: $(addsuffix .B.o, $(RTSUPP) iaddr) second.o bad_dot.pre.xb.x2w.w2f.post.o
	${F90C} -o $@ $^

bad_dot.pre.xb.x2w.w2f.post.f90: bad_dot.f90 
	openad -c -m rj $<

bad_dot.f90: vec_op.f90 multi_op.f90
	cat $^ > $@

$(addsuffix .B.o, $(RTSUPP)): bad_dot.pre.xb.x2w.w2f.post.f90
	${F90C} -o $@ -c $(basename $(basename $@)).f90

$(addsuffix .B.o, iaddr): bad_dot.pre.xb.x2w.w2f.post.f90
	${CC} -o $@ -c $(basename $(basename $@)).c


third: $(addsuffix .C.o, $(RTSUPP) iaddr) third.o good_dot.pre.xb.x2w.w2f.post.o
	${F90C} -o $@ $^

good_dot.pre.xb.x2w.w2f.post.f90: good_dot.f90 
	openad -c -m rj $<

good_dot.f90: vec_op.f90 multi_op_good.f90
	cat $^ > $@

$(addsuffix .C.o, $(RTSUPP)): good_dot.pre.xb.x2w.w2f.post.f90
	${F90C} -o $@ -c $(basename $(basename $@)).f90

$(addsuffix .C.o, iaddr): good_dot.pre.xb.x2w.w2f.post.f90
	${CC} -o $@ -c $(basename $(basename $@)).c






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
	rm -f basic_dot.pre.*
	rm -f bad_dot.* good_dot.*
	rm -f $(BINARY)
	rm -f ad_template* ad_inline.f OAD_* w2f__*  iaddr* 
	rm -f head.prepped.pre.* *.B *.xaif *.o *.mod driver *~ 
	rm -f head_vec.pre.* *.B *.xaif *.o *.mod driver_vec *~
	rm -f derCode*

.PHONY: clean toolChain
