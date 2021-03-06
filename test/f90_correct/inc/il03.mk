#
# Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
# See https://llvm.org/LICENSE.txt for license information.
# SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
#

########## Make rule for test il03  ########


il03: run
	

build:  $(SRC)/il03.f90
	-$(RM) il03.$(EXESUFFIX) core *.d *.mod FOR*.DAT FTN* ftn* fort.*
	@echo ------------------------------------ building test $@
	-$(CC) -c $(CFLAGS) $(SRC)/check.c -o check.$(OBJX)
	-$(FC) -c $(FFLAGS) $(LDFLAGS) $(SRC)/il03.f90 -o il03.$(OBJX)
	-$(FC) $(FFLAGS) $(LDFLAGS) il03.$(OBJX) check.$(OBJX) $(LIBS) -o il03.$(EXESUFFIX)


run:
	@echo ------------------------------------ executing test il03
	il03.$(EXESUFFIX)

verify: ;

il03.run: run

