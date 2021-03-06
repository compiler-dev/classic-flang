! Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
! See https://llvm.org/LICENSE.txt for license information.
! SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
!       

module shape_mod

type,abstract :: shape
        integer :: color
        logical :: filled
        integer :: x
        integer :: y
contains
	procedure (write_shape),deferred  :: write 
	procedure (draw_shape),deferred :: draw

end type shape

type, EXTENDS ( shape ) :: rectangle
        integer :: the_length
        integer :: the_width
contains
	procedure :: write
	procedure :: draw => draw_rectangle
end type rectangle

type, extends (rectangle) :: square
contains
        procedure :: draw
	procedure :: write => write_sq
	procedure,pass(this) :: write2 => write_sq2

end type square
contains

  subroutine write(this,results,i)
  class (rectangle) :: this
  integer results(:)
  integer i
  call write_rec(this,results,i)
  end subroutine write

  subroutine draw(this,results,i)
  class (square) :: this
  integer results(:)
  integer i
  call write_sq(this,results,i)
  end subroutine draw

  subroutine write_shape(this,results,i)
   class (shape) :: this
   integer results(:)
   integer i
   class(shape),allocatable :: sh
   results(i) = same_type_as(sh,this)
   print *, 'write_shape!'
   end subroutine write_shape

   subroutine write_rec(this,results,i)
   class (shape) :: this
   integer results(:)
   integer i
   class(rectangle),allocatable :: sh
   results(i) = same_type_as(sh,this)
   end subroutine write_rec

   subroutine draw_shape(this,results,i)
   class (shape) :: this
   integer results(:)
   integer i
   print *, 'draw shape!'
   end subroutine draw_shape

   subroutine draw_rectangle(this,results,i)
   class (rectangle) :: this
   integer results(:)
   integer i
   type(rectangle) :: rec
   results(i) = extends_type_of(this,rec)
   end subroutine draw_rectangle

   subroutine write_sq(this,results,i)
   class (square) :: this
   integer results(:)
   integer i
   type(rectangle) :: rec
   results(i) = extends_type_of(this,rec)
   end subroutine write_sq

   subroutine draw_sq(this,results,i)
   class (square) :: this
   integer results(:)
   integer i
   type(rectangle) :: rec
   results(i) = extends_type_of(this,rec)
   end subroutine draw_sq

   subroutine write_sq2(i,this,results)
   class (square) :: this
   integer i 
   integer results(:)
   type(rectangle) :: rec

   results(i) = extends_type_of(this,rec)
   end subroutine write_sq2


end module shape_mod

program p
USE CHECK_MOD
use shape_mod
logical l 
integer results(4)
integer expect(4)
data expect /.true.,.true.,.true.,.true./
data results /.false.,.false.,.false.,.false./
class(square),allocatable :: s
class(shape),allocatable :: sh
type(rectangle) :: r

allocate(s)
s%the_length = 1000
call s%write2(1,results)
call s%write(results,2)
call s%draw(results,3)

allocate(rectangle::sh)
call sh%write(results,4)

call check(results,expect,4)

end


