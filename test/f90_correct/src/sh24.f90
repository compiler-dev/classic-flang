! Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
! See https://llvm.org/LICENSE.txt for license information.
! SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
!
! test EOSHIFT and CSHIFT
! one dimension out of two
	program p
	 implicit none
	 integer, parameter :: N=5, M=6
	 integer, dimension(N,M) :: src
	 integer, dimension(N,M) :: eopc,eopv,cpc,cpv
	 integer, dimension(N,M) :: eomc,eomv,cmc,cmv
	 integer, dimension(N,M) :: eopcres,eopvres,cpcres,cpvres
	 integer, dimension(N,M) :: eomcres,eomvres,cmcres,cmvres
	 integer :: i,j,k
        data eopcres/&
        &  11,  12,  13,  14,  15,&
        &  16,  17,  18,  19,  20,&
        &  21,  22,  23,  24,  25,&
        &  26,  27,  28,  29,  30,&
        &   0,   0,   0,   0,   0,&
        &   0,   0,   0,   0,   0/
        data eopvres/&
        &  11,  12,  13,  14,  15,&
        &  16,  17,  18,  19,  20,&
        &  21,  22,  23,  24,  25,&
        &  26,  27,  28,  29,  30,&
        &   0,   0,   0,   0,   0,&
        &   0,   0,   0,   0,   0/
        data eomcres/&
        &   0,   0,   0,   0,   0,&
        &   0,   0,   0,   0,   0,&
        &   1,   2,   3,   4,   5,&
        &   6,   7,   8,   9,  10,&
        &  11,  12,  13,  14,  15,&
        &  16,  17,  18,  19,  20/
        data eomvres/&
        &   0,   0,   0,   0,   0,&
        &   0,   0,   0,   0,   0,&
        &   1,   2,   3,   4,   5,&
        &   6,   7,   8,   9,  10,&
        &  11,  12,  13,  14,  15,&
        &  16,  17,  18,  19,  20/
        data  cpcres/&
        &  11,  12,  13,  14,  15,&
        &  16,  17,  18,  19,  20,&
        &  21,  22,  23,  24,  25,&
        &  26,  27,  28,  29,  30,&
        &   1,   2,   3,   4,   5,&
        &   6,   7,   8,   9,  10/
        data  cpvres/&
        &  11,  12,  13,  14,  15,&
        &  16,  17,  18,  19,  20,&
        &  21,  22,  23,  24,  25,&
        &  26,  27,  28,  29,  30,&
        &   1,   2,   3,   4,   5,&
        &   6,   7,   8,   9,  10/
        data  cmcres/&
        &  21,  22,  23,  24,  25,&
        &  26,  27,  28,  29,  30,&
        &   1,   2,   3,   4,   5,&
        &   6,   7,   8,   9,  10,&
        &  11,  12,  13,  14,  15,&
        &  16,  17,  18,  19,  20/
        data  cmvres/&
        &  21,  22,  23,  24,  25,&
        &  26,  27,  28,  29,  30,&
        &   1,   2,   3,   4,   5,&
        &   6,   7,   8,   9,  10,&
        &  11,  12,  13,  14,  15,&
        &  16,  17,  18,  19,  20/
	 logical,parameter :: doprint = .false.
	 eopc = -10	! fill in with garbage
	 eopv = -10
	 eomc = -10
	 eomv = -10
	 cpc = -10
	 cpv = -10
	 cmc = -10
	 cmv = -10
	 call sub(j,k)	! j is positive, k is negative
	 src=reshape((/(i,i=1,N*M)/),(/N,M/))	! initialize
	 eopc=eoshift(src, 2, dim=2)	! eoshift, positive, constant
	 eopv=eoshift(src, j, dim=2)	! eoshift, positive, variable
	 eomc=eoshift(src,-2, dim=2)	! eoshift, negative, constant
	 eomv=eoshift(src, k, dim=2)	! eoshift, negative, variable
	  cpc= cshift(src, 2, dim=2)	!  cshift, positive, constant
	  cpv= cshift(src, j, dim=2)	!  cshift, positive, variable
	  cmc= cshift(src,-2, dim=2)	!  cshift, negative, constant
	  cmv= cshift(src, k, dim=2)	!  cshift, negative, variable
	 if( doprint )then
	  print 10, ' src',src
	  print 10, 'eopc',eopc
	  print 10, 'eopv',eopv
	  print 10, 'eomc',eomc
	  print 10, 'eomv',eomv
	  print 10, ' cpc', cpc
	  print 10, ' cpv', cpv
	  print 10, ' cmc', cmc
	  print 10, ' cmv', cmv
10	  format('        data ',a,'res/&'/'        &',5(5(i4,','),'&'/'        &'),&
		& 4(i4,','),i4,'/')
	 else
	  call check(eopc,eopcres,N*M)
	  call check(eopv,eopvres,N*M)
	  call check(eomc,eomcres,N*M)
	  call check(eomv,eomvres,N*M)
	  call check(cpc,cpcres,N*M)
	  call check(cpv,cpvres,N*M)
	  call check(cmc,cmcres,N*M)
	  call check(cmv,cmvres,N*M)
	 endif
	end
	subroutine sub(j,k)
	 j = 2
	 k = -2
	end
