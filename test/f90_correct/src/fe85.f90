!
! Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
! See https://llvm.org/LICENSE.txt for license information.
! SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
!


! test specifier decimal on open and inqurire

program encoding_in_openinquire
 character*10 charme,formatme
 parameter(N=9)
 integer result(N),expect(N)
 data expect /-1,0,0,0,-1,0,0,0,-1/

! This test assume the TRUE value is -1

! test 1 open file with formated, encoding should be ok
open(28, file='output.file', action='write', form='formatted' , decimal='comma')
inquire(file='output.file', formatted=formatme, decimal=charme)
result(1) = (charme == 'COMMA')
result(2) = (charme == 'POINT')
result(3) = (charme == 'UNDEFINED')

! open file with no encoding specifier
open(30, file='output3.file', action='write', form='formatted' )
inquire(file='output3.file', formatted=formatme, decimal=charme)
close(30)
result(4) = (charme == 'COMMA')
result(5) = (charme == 'POINT')
result(6) = (charme == 'UNDEFINED')

! inquire without opening  should be unknown
inquire(file='output3.file', formatted=formatme, decimal=charme)
result(7) = (charme == 'COMMA')
result(8) = (charme == 'POINT')
result(9) = (charme == 'UNDEFINED')

call check(result, expect, 9)

end
