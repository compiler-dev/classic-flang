#
# Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
# See https://llvm.org/LICENSE.txt for license information.
# SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
#

########## Make rule for test qn02a  ########


qn02a: run
	

build:  $(SRC)/qn02a.f90
	-$(RM) qn02a.$(EXESUFFIX) core *.d *.mod FOR*.DAT FTN* ftn* fort.*
	@echo ------------------------------------ building test $@
	-$(CC) -c $(CFLAGS) $(SRC)/check.c -o check.$(OBJX)
	-$(FC) -c $(FFLAGS) $(LDFLAGS) $(SRC)/qn02a.f90 -o qn02a.$(OBJX)
	-$(FC) $(FFLAGS) $(LDFLAGS) qn02a.$(OBJX) check.$(OBJX) $(LIBS) -o qn02a.$(EXESUFFIX)


run:
	@echo ------------------------------------ executing test qn02a
	qn02a.$(EXESUFFIX)

verify: ;

qn02a.run: run

