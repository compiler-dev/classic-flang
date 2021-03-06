#
# Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
# See https://llvm.org/LICENSE.txt for license information.
# SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
#
#
########## Make rule for test oop753  ########


oop753: run
	

build:  $(SRC)/oop753.f90
	-$(RM) oop753.$(EXESUFFIX) core *.d *.mod FOR*.DAT FTN* ftn* fort.*
	@echo ------------------------------------ building test $@
	-$(CC) -c $(CFLAGS) $(SRC)/check.c -o check.$(OBJX)
	-$(FC) -c $(FFLAGS) $(LDFLAGS) $(SRC)/oop753.f90 -o oop753.$(OBJX)
	-$(FC) $(FFLAGS) $(LDFLAGS) oop753.$(OBJX) check.$(OBJX) $(LIBS) -o oop753.$(EXESUFFIX)


run: 
	@echo ------------------------------------ executing test oop753
	oop753.$(EXESUFFIX)

verify: ;

