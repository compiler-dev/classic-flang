! Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
! See https://llvm.org/LICENSE.txt for license information.
! SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
!

program p
type :: objects(l1)
integer, len :: l1 = 10
integer  p(l1)
end type

logical rslt(2), expect(2)

type(objects(5)) :: x

expect = .true.
rslt(1) = size(x%p) .eq. 5

do i=1,x%l1
  x%p(i) = i
enddo

rslt(2) = .true.
do i=1,x%l1
  if (x%p(i) .ne. i) rslt(2) = .false.
enddo

call check(rslt,expect,2)

end



