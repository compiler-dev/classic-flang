#
# Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
# See https://llvm.org/LICENSE.txt for license information.
# SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
#
do07: do07.$(OBJX)
	@echo ------------ executing test $@
	-$(RUN4) ./a.$(EXESUFFIX) $(LOG)
do07.$(OBJX): $(SRC)/do07.f check.$(OBJX)
	@echo ------------ building test $@
	-$(FC) $(FFLAGS) $(SRC)/do07.f
	@$(RM) ./a.$(EXESUFFIX)
	-$(FC) $(LDFLAGS) do07.$(OBJX) check.$(OBJX) $(LIBS) -o a.$(EXESUFFIX)
build: do07
run: ;
