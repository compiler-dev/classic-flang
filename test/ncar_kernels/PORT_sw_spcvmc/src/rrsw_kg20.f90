
! KGEN-generated Fortran source file
!
! Filename    : rrsw_kg20.f90
! Generated at: 2015-07-31 20:35:44
! KGEN version: 0.4.13



    MODULE rrsw_kg20
        USE kgen_utils_mod, ONLY : kgen_dp, check_t, kgen_init_check, kgen_print_check
        USE shr_kind_mod, ONLY: r8 => shr_kind_r8
        !      use parkind ,only : jpim, jprb
        USE parrrsw, ONLY: ng20
        IMPLICIT NONE
        !-----------------------------------------------------------------
        ! rrtmg_sw ORIGINAL abs. coefficients for interval 20
        ! band 20:  5150-6150 cm-1 (low - h2o; high - h2o)
        !
        ! Initial version:  JJMorcrette, ECMWF, oct1999
        ! Revised: MJIacono, AER, jul2006
        !-----------------------------------------------------------------
        !
        !  name     type     purpose
        !  ----   : ----   : ---------------------------------------------
        ! kao     : real
        ! kbo     : real
        ! selfrefo: real
        ! forrefo : real
        !sfluxrefo: real
        ! absch4o : real
        !-----------------------------------------------------------------
        INTEGER :: layreffr
        REAL(KIND=r8) :: rayl
        !-----------------------------------------------------------------
        ! rrtmg_sw COMBINED abs. coefficients for interval 20
        ! band 20:  5150-6150 cm-1 (low - h2o; high - h2o)
        !
        ! Initial version:  JJMorcrette, ECMWF, oct1999
        ! Revised: MJIacono, AER, jul2006
        !-----------------------------------------------------------------
        !
        !  name     type     purpose
        !  ----   : ----   : ---------------------------------------------
        ! ka      : real
        ! kb      : real
        ! absa    : real
        ! absb    : real
        ! selfref : real
        ! forref  : real
        ! sfluxref: real
        ! absch4  : real
        !-----------------------------------------------------------------
        REAL(KIND=r8) :: absa(65,ng20)
        REAL(KIND=r8) :: absb(235,ng20)
        REAL(KIND=r8) :: forref(4,ng20)
        REAL(KIND=r8) :: selfref(10,ng20)
        REAL(KIND=r8) :: sfluxref(ng20)
        REAL(KIND=r8) :: absch4(ng20)
        PUBLIC kgen_read_externs_rrsw_kg20
    CONTAINS

    ! write subroutines

    ! module extern variables

    SUBROUTINE kgen_read_externs_rrsw_kg20(kgen_unit)
        INTEGER, INTENT(IN) :: kgen_unit
        READ(UNIT=kgen_unit) layreffr
        READ(UNIT=kgen_unit) rayl
        READ(UNIT=kgen_unit) absa
        READ(UNIT=kgen_unit) absb
        READ(UNIT=kgen_unit) forref
        READ(UNIT=kgen_unit) selfref
        READ(UNIT=kgen_unit) sfluxref
        READ(UNIT=kgen_unit) absch4
    END SUBROUTINE kgen_read_externs_rrsw_kg20

    END MODULE rrsw_kg20
