#
# Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
# See https://llvm.org/LICENSE.txt for license information.
# SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
#

########## Make rule for test ba02  ########


ba02: run
	

build:  $(SRC)/ba02.f90
	-$(RM) ba02.$(EXESUFFIX) core *.d *.mod FOR*.DAT FTN* ftn* fort.*
	@echo ------------------------------------ building test $@
	-$(CC) -c $(CFLAGS) $(SRC)/check.c -o check.$(OBJX)
	-$(FC) -c $(FFLAGS) $(LDFLAGS) $(SRC)/ba02.f90 -o ba02.$(OBJX)
	-$(FC) $(FFLAGS) $(LDFLAGS) ba02.$(OBJX) check.$(OBJX) $(LIBS) -o ba02.$(EXESUFFIX)


run:
	@echo ------------------------------------ executing test ba02
	ba02.$(EXESUFFIX)

verify: ;

ba02.run: run

