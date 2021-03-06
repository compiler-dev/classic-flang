#
# Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
# See https://llvm.org/LICENSE.txt for license information.
# SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
#


########## Make rule for test ha01  ########
SHELL := /bin/bash

ha01: run

build:  $(SRC)/ha01.f90
	-$(RM) ha01.$(EXESUFFIX) core *.d *.mod FOR*.DAT FTN* ftn* fort.*
	@echo ------------------------------------ building test $@
	-$(FC) -c $(FFLAGS) $(LDFLAGS) $(SRC)/ha01.f90 -o ha01.$(OBJX)
	-$(FC) $(FFLAGS) $(LDFLAGS) ha01.$(OBJX) $(LIBS) -o ha01.$(EXESUFFIX)


run:
	@echo ------------------------------------ executing test ha01
	@ha01.$(EXESUFFIX)  >exitstr 2>&1; \
	stat=`echo $$?`; \
	exitstr=`cat exitstr | tail -n1 | tr -d " \n\r" `; \
	if [[ "$$stat" = "$$exitstr" ]] ; \
		 then echo "$$stat $$exitstr --   1 tests completed. 1 tests PASSED. 0 tests failed."; \
		 else echo "$$stat $$exitstr --   1 tests completed. 0 tests PASSED. 1 tests failed.";  fi;
	@$(RM) exitstr;

verify: ;

ha01.run: run

