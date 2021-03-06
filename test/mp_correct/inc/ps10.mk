#
# Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
# See https://llvm.org/LICENSE.txt for license information.
# SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
#
ps10: ps10.$(OBJX)
	@echo ------------ executing test $@
	-$(RUN2) ./a.$(EXESUFFIX) $(LOG)
ps10.$(OBJX): $(SRC)/ps10.f check.$(OBJX)
	@echo ------------ building test $@
	-$(FC) $(FFLAGS) $(SRC)/ps10.f
	@$(RM) ./a.$(EXESUFFIX)
	-$(FC) $(LDFLAGS) ps10.$(OBJX) check.$(OBJX) $(LIBS) -o a.$(EXESUFFIX)
build: ps10
run: ;
