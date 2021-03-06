#
# Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
# See https://llvm.org/LICENSE.txt for license information.
# SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
#

########## Make rule for test qn05d  ########


qn05d: run
	

build:  $(SRC)/qn05d.f90
	-$(RM) qn05d.$(EXESUFFIX) core *.d *.mod FOR*.DAT FTN* ftn* fort.*
	@echo ------------------------------------ building test $@
	-$(CC) -c $(CFLAGS) $(SRC)/check.c -o check.$(OBJX)
	-$(FC) -c $(FFLAGS) $(LDFLAGS) $(SRC)/qn05d.f90 -o qn05d.$(OBJX)
	-$(FC) $(FFLAGS) $(LDFLAGS) qn05d.$(OBJX) check.$(OBJX) $(LIBS) -o qn05d.$(EXESUFFIX)


run:
	@echo ------------------------------------ executing test qn05d
	qn05d.$(EXESUFFIX)

verify: ;

qn05d.run: run

