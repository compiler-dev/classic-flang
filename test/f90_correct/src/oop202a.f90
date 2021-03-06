! Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
! See https://llvm.org/LICENSE.txt for license information.
! SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
!       
! Same as oop202 except it uses multiple sourced allocations

program unlimited_poly
!USE CHECK_MOD
  type my_type
  class(*),allocatable :: a
  class(*),allocatable :: b
  class(*),pointer :: p
  end type

  integer z 
  logical,target :: l 
  logical results(5)
  logical expect(5)
  type(my_type) :: obj,obj2

  class(*),allocatable :: a
  class(*),pointer :: p
  logical, pointer :: lp

  results = .false.
  expect = .true.
  

  l = .false.

  allocate(integer*8::a)

  p => l

  select type(p)
  type is (logical)
  results(1) = .true.
  p = .true.
  end select 

  select type(a)
  type is (integer*8)
  results(2) = .true.
  type is (integer)
  results(2) = .false.
  end select

  results(3) = l

  z = 777
  allocate(obj%a,source=z)

  allocate(obj2%a,obj2%b,source=obj%a)
  select type(a=>obj2%a)
  type is(integer)
  results(4) = a .eq. z
  end select

  select type(a=>obj2%b)
  type is(integer)
  results(5) = a .eq. z
  end select
 
  call check(results,expect,5)
  
end program unlimited_poly


