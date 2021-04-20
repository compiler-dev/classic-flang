!
! Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
! See https://llvm.org/LICENSE.txt for license information.
! SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
!
! This test case is test for power operator (int precision).

program test
  integer :: i1,i2,res(24)
  integer :: eres(24) = [0, 0, 0, 0, 1, 1, 1, 1, 256, 256, 256, &
                         256, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1]
  i2 = -8

  i1 = 2
  res(1) = i1 ** i2
  res(2) = i1 ** (-8)
  i1 = -2
  res(3) = i1 ** i2
  res(4) = i1 ** (-8)
  i1 = -1
  res(5) = i1 ** i2
  res(6) = i1 ** (-8)
  i1 = 1
  res(7) = i1 ** i2
  res(8) = i1 ** (-8)

  i2 = 8

  i1 = 2
  res(9) = i1 ** i2
  res(10) = i1 ** 8
  i1 = -2
  res(11) = i1 ** i2
  res(12) = i1 ** 8
  i1 = -1
  res(13) = i1 ** i2
  res(14) = i1 ** 8
  i1 = 1
  res(15) = i1 ** i2
  res(16) = i1 ** 8

  i2 = 0

  i1 = 2
  res(17) = i1 ** i2
  res(18) = i1 ** 0
  i1 = -2
  res(19) = i1 ** i2
  res(20) = i1 ** 0
  i1 = -1
  res(21) = i1 ** i2
  res(22) = i1 ** 0
  i1 = 1
  res(23) = i1 ** i2
  res(24) = i1 ** 0

  call check(res, eres, 24)
end
