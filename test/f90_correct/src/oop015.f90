! Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
! See https://llvm.org/LICENSE.txt for license information.
! SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
!       

module shape_mod

type shape
        integer :: color
        logical :: filled
        integer :: x
        integer :: y
end type shape

type, EXTENDS ( shape ) :: rectangle
        integer :: the_length
        integer :: the_width
end type rectangle

type, extends (rectangle) :: square
end type square

end module shape_mod

subroutine test_types(s1,s2,z,res)
use shape_mod
class(shape)::s1, s2
class(shape)::z(:)
integer res(:)

!call pgf90_show(res)
res(1) = SAME_TYPE_AS(s1,z(2))
res(2) = SAME_TYPE_AS(z(10),s2)
res(3) = SAME_TYPE_AS(s2,z(1))
res(4) = SAME_TYPE_AS(z(10),s1)

end subroutine


program p
USE CHECK_MOD
use shape_mod

interface
subroutine test_types(s1,s2,z,res)
use shape_mod
class(shape)::s1, s2
class(shape)::z(:)
integer res(:)
integer i
end subroutine
end interface

type(square)::arr(10)
type(rectangle)::arr2(10)
integer results(4)
integer expect(4)
data expect /.true.,.false.,.false.,.true./
data results /.false.,.true.,.true.,.false./
type(square) :: s
type(rectangle) :: r

call test_types(s,r,arr2,results)
call test_types(s,r,arr,results)


call check(expect,results,4)

end


