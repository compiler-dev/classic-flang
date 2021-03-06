#
# Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
# See https://llvm.org/LICENSE.txt for license information.
# SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
#

########## Make rule for test fe30  ########


fe30: run
	

build:  $(SRC)/fe30.f90
	-$(RM) fe30.$(EXESUFFIX) core *.d *.mod FOR*.DAT FTN* ftn* fort.*
	@echo ------------------------------------ building test $@
	-$(CC) -c $(CFLAGS) $(SRC)/check.c -o check.$(OBJX)
	-$(FC) -c $(FFLAGS) $(LDFLAGS) $(SRC)/fe30.f90 -o fe30.$(OBJX)
	-$(FC) $(FFLAGS) $(LDFLAGS) fe30.$(OBJX) check.$(OBJX) $(LIBS) -o fe30.$(EXESUFFIX)


run:
	@echo ------------------------------------ executing test fe30
	fe30.$(EXESUFFIX)

verify: ;

fe30.run: run

