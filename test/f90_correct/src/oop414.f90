! Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
! See https://llvm.org/LICENSE.txt for license information.
! SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
!

module mod
logical expect(12), rslt(12)
type :: objects(k1,k2,l1)
integer, kind :: k2 = selected_char_kind("ASCII")
integer, kind :: k1 = selected_int_kind(4)
integer,len :: l1 = 1000
integer(k1) :: p(l1,k1)
end type
contains
subroutine foo(n)
integer n
type(objects) :: x

rslt(5) = x%k1 .eq. selected_int_kind(4) 
rslt(6) = x%k2 .eq. selected_char_kind("ASCII") 
rslt(7) = x%l1 .eq. n 
rslt(8) = size(x%p,dim=1) .eq. x%l1
rslt(9) = size(x%p,dim=2) .eq. x%k1

k=0
do i=1,size(x%p,dim=1)
do j=1, size(x%p,dim=2)
  x%p(i,j) = k
  k = k + 1
enddo
enddo

k=0
rslt(10) = .true.
do i=1,size(x%p,dim=1)
do j=1, size(x%p,dim=2)
  if (x%p(i,j) .ne. k) rslt(10) = .false.
  k = k + 1
enddo
enddo
rslt(11) = i .ne. size(x%p,dim=1)
rslt(12) = j .ne. size(x%p,dim=2)

end subroutine

end module

program p
use mod
integer y 
type(objects(1,20,30)) :: x

rslt = .false.
rslt(1) = x%k1 .eq. 1
rslt(2) = x%k2 .eq. 20
rslt(3) = x%l1 .eq. 30
rslt(4) = size(x%p, dim=1) .eq. x%l1

call foo(1000)

expect = .true.
call check(rslt,expect,12)



end
