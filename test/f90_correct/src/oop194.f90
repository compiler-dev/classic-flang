! Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
! See https://llvm.org/LICENSE.txt for license information.
! SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
!       

logical function check_ptr(p1,p2) result (RSLT)
  class(*), pointer :: p1
  class(*), pointer :: p2
  RSLT = same_type_as(p1,p2)
end function check_ptr

logical function check_allocs(a1,a2) result (RSLT)
  class(*), allocatable :: a1
  class(*), pointer :: a2
  RSLT = same_type_as(a1,a2)
end function check_allocs

logical function check_logical(p) result (RSLT)
  class(*),pointer :: p
  select type(p)
  type is (logical)
     RSLT = .true.
     class default
     RSLT = .false.
  end select
end function check_logical

logical function check_alloc(a) result (RSLT)
  class(*),allocatable :: a
  select type(a)
  type is (integer*8)
     RSLT = .true.
     class default
     RSLT = .false.
   end select
end function check_alloc

program unlimited_poly
USE CHECK_MOD
  
  logical,target :: l 
  logical results(15)
  logical expect(15)
  integer*8,target:: z
  class(*),pointer :: lp
  
  interface
     logical function check_ptr(p1,p2) result (RSLT)
       class(*), pointer :: p1
       class(*), pointer :: p2
     end function check_ptr
     
     logical function check_logical(p) result (RSLT)
       class(*),pointer :: p
     end function check_logical
     
     logical function check_alloc(a) result (RSLT)
       class(*),allocatable :: a
     end function check_alloc

     logical function check_allocs(a1,a2) result (RSLT)
     class(*), allocatable :: a1
     class(*), pointer :: a2
     end function check_allocs

  end interface
  
  type my_type
     class(*),allocatable :: a
     class(*),pointer :: p
  end type my_type
  
  type(my_type) :: obj

  results = .false.
  expect = .true.
  
  l = .false.

  allocate(integer*8::obj%a)

  obj%p => l

  select type(p=>obj%p)
  type is (logical)
     results(1) = .true.
     p = .true.
  end select 

  select type(a=>obj%a)
  type is (integer*8)
     results(2) = .true.
     a = 999
  type is (integer)
     results(2) = .false.
     a = 111
  end select

  results(3) = l

  lp => z
  results(8) = same_type_as(obj%a,lp)
  results(9) = extends_type_of(obj%a,lp)

  lp => l
  results(10) = check_ptr(obj%p,lp)
  results(6) = same_type_as(obj%p,lp)
  results(7) = extends_type_of(obj%p,lp)
  results(4) = check_logical(obj%p)
  nullify(obj%p)
  results(13) = check_ptr(lp,obj%p) .eq. .false.
  results(15) = l

  results(5) = check_alloc(obj%a)
  lp => z
  results(11) = check_allocs(obj%a, lp)
  select type(o=>obj%a)
  type is (integer*8)
  results(14) = o .eq. 999
  class default
  results(14) = .false.
  end select
  deallocate(obj%a)
  results(12) = check_allocs(obj%a, lp) .eq. .false.

  call check(results,expect,14)
  
end program unlimited_poly


