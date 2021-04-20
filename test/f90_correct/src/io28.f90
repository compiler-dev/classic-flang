! Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
! See https://llvm.org/LICENSE.txt for license information.
! SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
!
! test for I/O take derived types

program test
  type my_type
     integer :: i
     integer :: j
     integer :: k
  end type my_type
  character(80) :: str1, str2
  type(my_type), dimension(3) :: t

  t(1)%i = 11
  t(1)%j = 12
  t(1)%k = 13
  t(2)%i = 21
  t(2)%j = 22
  t(2)%k = 23
  t(3)%i = 31
  t(3)%j = 32
  t(3)%k = 33

  write(str1, *), t(1)%i, t(1)%j, t(1)%k
  write(str2, *), t(func())

  if (str1 .ne. str2) STOP 1
  write(*, *) 'PASS'

contains
  integer function func()
    integer, save :: i = 1
    func = i
    i = i + 1
  end function
end
