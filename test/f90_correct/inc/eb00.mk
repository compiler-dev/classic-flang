#
# Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
# See https://llvm.org/LICENSE.txt for license information.
# SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
#

########## Make rule for test eb00  ########


eb00: run
	

build:  $(SRC)/eb00.f
	-$(RM) eb00.$(EXESUFFIX) core *.d *.mod FOR*.DAT FTN* ftn* fort.*
	@echo ------------------------------------ building test $@
	-$(CC) -c $(CFLAGS) $(SRC)/check.c -o check.$(OBJX)
	-$(FC) -c $(FFLAGS) $(LDFLAGS) $(SRC)/eb00.f -o eb00.$(OBJX)
	-$(FC) $(FFLAGS) $(LDFLAGS) eb00.$(OBJX) check.$(OBJX) $(LIBS) -o eb00.$(EXESUFFIX)


run:
	@echo ------------------------------------ executing test eb00
	eb00.$(EXESUFFIX)

verify: ;

eb00.run: run

