!
! Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
! See https://llvm.org/LICENSE.txt for license information.
! SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
!
! Under the optimized conditions of "-O1", "-O2", "-O3", and "-Os",
! check that the result of the "common" statement is correct

module mod1
  integer :: mi1
  common /com1/ mi1
contains
  subroutine newmi1()
    mi1 = 30
  end subroutine newmi1
end module mod1

program test
  use mod1
  integer, parameter :: n = 12
  integer :: res(n), rres(n)
  integer :: pi1
  common /com1/ pi1

  res = 0
  rres= 1
  pi1 = 10
  mi1 = 20
  if (pi1 == mi1) res(1) = 1
  if (pi1 == 20) res(2) = 1
  if (mi1 == 20) res(3) = 1
  call newmi1()
  if (pi1 == 30) res(4) = 1
  if (mi1 == 30) res(5) = 1

  mi1 = 20
  pi1 = 10

  if (pi1 == mi1) res(6) = 1
  if (pi1 == 10) res(7) = 1
  if (mi1 == 10) res(8) = 1
  call sub1(res(9), res(10))
  if (pi1 == 30) res(11) = 1
  if (mi1 == 30) res(12) = 1
  call check(res, rres, n)
end

subroutine sub1(x, y)
  use mod1
  integer :: subi1, x, y
  common /com1/ subi1
  subi1 = 40
  mi1 = 50
  if (subi1 == mi1) x = 1
  call newmi1()
  if (subi1 == mi1) y = 1
end subroutine sub1
