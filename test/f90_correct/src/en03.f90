!
! Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
! See https://llvm.org/LICENSE.txt for license information.
! SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception

! Test entry for cases:
! 1) Function return complex, entry return integer
! 2) All entries return pointer
! 3) All entries return array
function f1()
  complex :: f1
  integer :: e1
  f1 = (1, 1)
  return
entry e1()
  e1 = 2
  return
end function

function f2()
  integer, pointer :: f2, e2
  allocate(f2)
  f2 = 3
  return
entry e2()
  allocate(e2)
  e2 = 4
  return
end function

function f3()
  integer, dimension (2, 2) :: f3, e3
  f3(:, :) = 5
  return
entry e3()
  e3(:, :) = 6
  return
end function

program test
  interface
    function f1()
      complex :: f1
    end function
    function e1()
      integer :: e1
    end function
    function f2()
      integer, pointer :: f2
    end function
    function e2()
      integer, pointer :: e2
    end function
    function f3()
      integer, dimension (2, 2) :: f3
    end function
    function e3()
      integer, dimension (2, 2) :: e3
    end function
  end interface

  integer, parameter :: n = 6
  integer :: rslts(n), expect(n)

  rslts = 0
  expect = 1

  if(f1() .eq. (1, 1)) rslts(1) = 1
  if(e1() .eq. 2) rslts(2) = 1
  if(f2() .eq. 3) rslts(3) = 1
  if(e2() .eq. 4) rslts(4) = 1
  if(all(f3() .eq. 5)) rslts(5) = 1
  if(all(e3() .eq. 6)) rslts(6) = 1

  call check(rslts, expect, n)
end program
