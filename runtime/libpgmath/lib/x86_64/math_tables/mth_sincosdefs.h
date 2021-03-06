/*
 * Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
 * See https://llvm.org/LICENSE.txt for license information.
 * SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
 *
 */

MTHINTRIN(sincos, ss   , em64t      , __mth_i_sincos        , __mth_i_sincos        , __mth_i_sincos        ,__math_dispatch_error)
MTHINTRIN(sincos, ds   , em64t      , __mth_i_dsincos       , __mth_i_dsincos       , __mth_i_dsincos       ,__math_dispatch_error)
MTHINTRIN(sincos, sv4  , em64t      , __fvs_sincos          , __fvs_sincos          , __gs_sincos_4         ,__math_dispatch_error)
MTHINTRIN(sincos, dv2  , em64t      , __fvd_sincos          , __fvd_sincos          , __gd_sincos_2         ,__math_dispatch_error)
MTHINTRIN(sincos, sv4m , em64t      , __fs_sincos_4_mn      , __rs_sincos_4_mn      , __ps_sincos_4_mn      ,__math_dispatch_error)
MTHINTRIN(sincos, dv2m , em64t      , __fd_sincos_2_mn      , __rd_sincos_2_mn      , __pd_sincos_2_mn      ,__math_dispatch_error)

MTHINTRIN(sincos, ss   , sse4       , __mth_i_sincos        , __mth_i_sincos        , __mth_i_sincos        ,__math_dispatch_error)
MTHINTRIN(sincos, ds   , sse4       , __mth_i_dsincos       , __mth_i_dsincos       , __mth_i_dsincos       ,__math_dispatch_error)
MTHINTRIN(sincos, sv4  , sse4       , __fvs_sincos          , __fvs_sincos          , __gs_sincos_4         ,__math_dispatch_error)
MTHINTRIN(sincos, dv2  , sse4       , __fvd_sincos          , __fvd_sincos          , __gd_sincos_2         ,__math_dispatch_error)
MTHINTRIN(sincos, sv4m , sse4       , __fs_sincos_4_mn      , __rs_sincos_4_mn      , __ps_sincos_4_mn      ,__math_dispatch_error)
MTHINTRIN(sincos, dv2m , sse4       , __fd_sincos_2_mn      , __rd_sincos_2_mn      , __pd_sincos_2_mn      ,__math_dispatch_error)

MTHINTRIN(sincos, ss   , avx        , __fss_sincos_vex      , __fss_sincos_vex      , __mth_i_sincos        ,__math_dispatch_error)
MTHINTRIN(sincos, ds   , avx        , __fsd_sincos_vex      , __fsd_sincos_vex      , __mth_i_dsincos       ,__math_dispatch_error)
MTHINTRIN(sincos, sv4  , avx        , __fvs_sincos_vex      , __fvs_sincos_vex      , __gs_sincos_4         ,__math_dispatch_error)
MTHINTRIN(sincos, dv2  , avx        , __fvd_sincos_vex      , __fvd_sincos_vex      , __gd_sincos_2         ,__math_dispatch_error)
MTHINTRIN(sincos, sv8  , avx        , __fvs_sincos_vex_256  , __fvs_sincos_vex_256  , __gs_sincos_8         ,__math_dispatch_error)
MTHINTRIN(sincos, dv4  , avx        , __fvd_sincos_vex_256  , __fvd_sincos_vex_256  , __gd_sincos_4         ,__math_dispatch_error)
MTHINTRIN(sincos, sv4m , avx        , __fs_sincos_4_mn      , __rs_sincos_4_mn      , __ps_sincos_4_mn      ,__math_dispatch_error)
MTHINTRIN(sincos, dv2m , avx        , __fd_sincos_2_mn      , __rd_sincos_2_mn      , __pd_sincos_2_mn      ,__math_dispatch_error)
MTHINTRIN(sincos, sv8m , avx        , __fs_sincos_8_mn      , __rs_sincos_8_mn      , __ps_sincos_8_mn      ,__math_dispatch_error)
MTHINTRIN(sincos, dv4m , avx        , __fd_sincos_4_mn      , __rd_sincos_4_mn      , __pd_sincos_4_mn      ,__math_dispatch_error)

MTHINTRIN(sincos, ss   , avxfma4    , __fss_sincos_fma4     , __fss_sincos_fma4     , __mth_i_sincos        ,__math_dispatch_error)
MTHINTRIN(sincos, ds   , avxfma4    , __fsd_sincos_fma4     , __fsd_sincos_fma4     , __mth_i_dsincos       ,__math_dispatch_error)
MTHINTRIN(sincos, sv4  , avxfma4    , __fvs_sincos_fma4     , __fvs_sincos_fma4     , __gs_sincos_4         ,__math_dispatch_error)
MTHINTRIN(sincos, dv2  , avxfma4    , __fvd_sincos_fma4     , __fvd_sincos_fma4     , __gd_sincos_2         ,__math_dispatch_error)
MTHINTRIN(sincos, sv8  , avxfma4    , __fvs_sincos_fma4_256 , __fvs_sincos_fma4_256 , __gs_sincos_8         ,__math_dispatch_error)
MTHINTRIN(sincos, dv4  , avxfma4    , __fvd_sincos_fma4_256 , __fvd_sincos_fma4_256 , __gd_sincos_4         ,__math_dispatch_error)
MTHINTRIN(sincos, sv4m , avxfma4    , __fs_sincos_4_mn      , __rs_sincos_4_mn      , __ps_sincos_4_mn      ,__math_dispatch_error)
MTHINTRIN(sincos, dv2m , avxfma4    , __fd_sincos_2_mn      , __rd_sincos_2_mn      , __pd_sincos_2_mn      ,__math_dispatch_error)
MTHINTRIN(sincos, sv8m , avxfma4    , __fs_sincos_8_mn      , __rs_sincos_8_mn      , __ps_sincos_8_mn      ,__math_dispatch_error)
MTHINTRIN(sincos, dv4m , avxfma4    , __fd_sincos_4_mn      , __rd_sincos_4_mn      , __pd_sincos_4_mn      ,__math_dispatch_error)

MTHINTRIN(sincos, ss   , avx2       , __fs_sincos_1_avx2    , __fss_sincos_vex      , __mth_i_sincos_avx2   ,__math_dispatch_error)
MTHINTRIN(sincos, ds   , avx2       , __fsd_sincos_avx2     , __fsd_sincos_avx2     , __mth_i_dsincos_avx2  ,__math_dispatch_error)
MTHINTRIN(sincos, sv4  , avx2       , __fs_sincos_4_avx2    , __fvs_sincos_vex      , __gs_sincos_4         ,__math_dispatch_error)
MTHINTRIN(sincos, dv2  , avx2       , __fvd_sincos_avx2     , __fvd_sincos_avx2     , __gd_sincos_2         ,__math_dispatch_error)
MTHINTRIN(sincos, sv8  , avx2       , __fs_sincos_8_avx2    , __fvs_sincos_vex_256  , __gs_sincos_8         ,__math_dispatch_error)
MTHINTRIN(sincos, dv4  , avx2       , __fvd_sincos_avx2_256 , __fvd_sincos_avx2_256 , __gd_sincos_4         ,__math_dispatch_error)
MTHINTRIN(sincos, sv4m , avx2       , __fs_sincos_4_mn      , __rs_sincos_4_mn      , __ps_sincos_4_mn      ,__math_dispatch_error)
MTHINTRIN(sincos, dv2m , avx2       , __fd_sincos_2_mn      , __rd_sincos_2_mn      , __pd_sincos_2_mn      ,__math_dispatch_error)
MTHINTRIN(sincos, sv8m , avx2       , __fs_sincos_8_mn      , __rs_sincos_8_mn      , __ps_sincos_8_mn      ,__math_dispatch_error)
MTHINTRIN(sincos, dv4m , avx2       , __fd_sincos_4_mn      , __rd_sincos_4_mn      , __pd_sincos_4_mn      ,__math_dispatch_error)

MTHINTRIN(sincos, ss   , avx512knl  , __fs_sincos_1_avx2    , __fss_sincos_vex      , __mth_i_sincos_avx2   ,__math_dispatch_error)
MTHINTRIN(sincos, ds   , avx512knl  , __fsd_sincos_avx2     , __fsd_sincos_avx2     , __mth_i_dsincos_avx2  ,__math_dispatch_error)
MTHINTRIN(sincos, sv4  , avx512knl  , __fs_sincos_4_avx2    , __fvs_sincos_vex      , __gs_sincos_4         ,__math_dispatch_error)
MTHINTRIN(sincos, dv2  , avx512knl  , __fvd_sincos_avx2     , __fvd_sincos_avx2     , __gd_sincos_2         ,__math_dispatch_error)
MTHINTRIN(sincos, sv8  , avx512knl  , __fs_sincos_8_avx2    , __fvs_sincos_vex_256  , __gs_sincos_8         ,__math_dispatch_error)
MTHINTRIN(sincos, dv4  , avx512knl  , __fvd_sincos_avx2_256 , __fvd_sincos_avx2_256 , __gd_sincos_4         ,__math_dispatch_error)
MTHINTRIN(sincos, sv16 , avx512knl  , __fs_sincos_16_z2yy   , __rs_sincos_16_z2yy   , __gs_sincos_16        ,__math_dispatch_error)
MTHINTRIN(sincos, dv8  , avx512knl  , __fd_sincos_8_z2yy    , __rd_sincos_8_z2yy    , __gd_sincos_8         ,__math_dispatch_error)
MTHINTRIN(sincos, sv4m , avx512knl  , __fs_sincos_4_mn      , __rs_sincos_4_mn      , __ps_sincos_4_mn      ,__math_dispatch_error)
MTHINTRIN(sincos, dv2m , avx512knl  , __fd_sincos_2_mn      , __rd_sincos_2_mn      , __pd_sincos_2_mn      ,__math_dispatch_error)
MTHINTRIN(sincos, sv8m , avx512knl  , __fs_sincos_8_mn      , __rs_sincos_8_mn      , __ps_sincos_8_mn      ,__math_dispatch_error)
MTHINTRIN(sincos, dv4m , avx512knl  , __fd_sincos_4_mn      , __rd_sincos_4_mn      , __pd_sincos_4_mn      ,__math_dispatch_error)
MTHINTRIN(sincos, sv16m, avx512knl  , __fs_sincos_16_mn     , __rs_sincos_16_mn     , __ps_sincos_16_mn     ,__math_dispatch_error)
MTHINTRIN(sincos, dv8m , avx512knl  , __fd_sincos_8_mn      , __rd_sincos_8_mn      , __pd_sincos_8_mn      ,__math_dispatch_error)

MTHINTRIN(sincos, ss   , avx512     , __fs_sincos_1_avx2    , __fss_sincos_vex      , __mth_i_sincos_avx2   ,__math_dispatch_error)
MTHINTRIN(sincos, ds   , avx512     , __fsd_sincos_avx2     , __fsd_sincos_avx2     , __mth_i_dsincos_avx2  ,__math_dispatch_error)
MTHINTRIN(sincos, sv4  , avx512     , __fs_sincos_4_avx2    , __fvs_sincos_vex      , __gs_sincos_4         ,__math_dispatch_error)
MTHINTRIN(sincos, dv2  , avx512     , __fvd_sincos_avx2     , __fvd_sincos_avx2     , __gd_sincos_2         ,__math_dispatch_error)
MTHINTRIN(sincos, sv8  , avx512     , __fs_sincos_8_avx2    , __fvs_sincos_vex_256  , __gs_sincos_8         ,__math_dispatch_error)
MTHINTRIN(sincos, dv4  , avx512     , __fvd_sincos_avx2_256 , __fvd_sincos_avx2_256 , __gd_sincos_4         ,__math_dispatch_error)
MTHINTRIN(sincos, sv16 , avx512     , __fs_sincos_16_avx512 , __rs_sincos_16_z2yy   , __gs_sincos_16        ,__math_dispatch_error)
MTHINTRIN(sincos, dv8  , avx512     , __fd_sincos_8_z2yy    , __rd_sincos_8_z2yy    , __gd_sincos_8         ,__math_dispatch_error)
MTHINTRIN(sincos, sv4m , avx512     , __fs_sincos_4_mn      , __rs_sincos_4_mn      , __ps_sincos_4_mn      ,__math_dispatch_error)
MTHINTRIN(sincos, dv2m , avx512     , __fd_sincos_2_mn      , __rd_sincos_2_mn      , __pd_sincos_2_mn      ,__math_dispatch_error)
MTHINTRIN(sincos, sv8m , avx512     , __fs_sincos_8_mn      , __rs_sincos_8_mn      , __ps_sincos_8_mn      ,__math_dispatch_error)
MTHINTRIN(sincos, dv4m , avx512     , __fd_sincos_4_mn      , __rd_sincos_4_mn      , __pd_sincos_4_mn      ,__math_dispatch_error)
MTHINTRIN(sincos, sv16m, avx512     , __fs_sincos_16_mn     , __rs_sincos_16_mn     , __ps_sincos_16_mn     ,__math_dispatch_error)
MTHINTRIN(sincos, dv8m , avx512     , __fd_sincos_8_mn      , __rd_sincos_8_mn      , __pd_sincos_8_mn      ,__math_dispatch_error)


