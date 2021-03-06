** Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
** See https://llvm.org/LICENSE.txt for license information.
** SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception

* Vectorizer - store is replaced with call; need special ili so optimizer
*              can indicate an array was stored.

	program p
	parameter (N=5)

	integer result(N)
	integer expect(N)

	common /mp1/ mp1
	common /np1/ np1
	common /thky/ thky(5,5)
	common /b/ b(5)
	common /c/ c(5)

	data expect / 1000, 250, 1500, 4000, 5000 /

	mp1 = 3
	np1 = 3
	do i = 1, 5
	    do j = 1, 5
		thky(i,j) = i * j
	    enddo
	    c(i) = i
	    b(i) = i + 5
	enddo
	call sub
c	write(6, 99) 'b', b
c	write(6, 99) 'c', c
c99	format(1x, a1 , 5(1x, f10.3))
	do i = 1, N
	    result(i) = c(i) * 1000
	enddo
	call check(result, expect, N)
	end

	subroutine sub

	common /mp1/ mp1
	common /np1/ np1
	common /thky/ thky(5,5)
	common /b/ b(5)
	common /c/ c(5)

	do 18 i = 2, mp1
	    im1 = i - 1
	    do 12 j = 2, np1
		b(j) = thky(im1, j)	! store replaced with call
12          continue
	    c1 = 1./b(2)		! without special ili, invariant
	    c(2) = c(2) * c1
	    do 17 j = 3, np1
		jm1 = j - 1
		c(j) = c(jm1) * b(j)
17          continue
18	continue
	end
