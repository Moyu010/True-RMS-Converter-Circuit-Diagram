*****************************************************************************
* (C) Copyright 2011 Texas Instruments Incorporated. All rights reserved.
*****************************************************************************
** This model is designed as an aid for customers of Texas Instruments.
** TI and its licensors and suppliers make no warranties, either expressed
** or implied, with respect to this model, including the warranties of
** merchantability or fitness for a particular purpose. The model is
** provided solely on an "as is" basis. The entire risk as to its quality
** and performance is with the customer.
*****************************************************************************
* Released by: Analog eLab Design Center, Texas Instruments Inc.
* Part:           TL974
* OUTPUT RAIL-TO-RAIL VERY-LOW-NOISE OPERATIONAL AMPLIFIERS
* Date:           2011-09-12
* Model Type:     PSpice
* Simulator Version:   PSpice 16.2.0.p001
* EVM Order Number: N/A
* EVM Users Guide: N/A
* Datasheet:      SLOS712 - January 2011
*
*****************************************************************************
* 
* Updates:
*
* Version 1.0 : 
* Release to Web
*
*****************************************************************************
* The TL972 Macro Model represents the following parameters for 
* a 5-V Application:
* AC small-signal response, input-referred voltage noise, the quiescent current
* output swing, input offset voltage, input bias current, PSRR and 
* CMRR, and the slew rate
*****************************************************************************
* 
******************************************************************************$
.subckt TL974 INP INN VCC VEE OUT
R_pd          VCC       PD       1m  
V_Vos         INP2      INP_CMRR 0.25mVdc
C_Cinn        GND_FLOAT INN1     200f  TC=0,0 
X_U10         CL_CLAMP GND_FLOAT PD N118253 GND_FLOAT VCC VEE HPA_PD_SGNL
+  PARAMS: GAIN=1
*
X_U9          VCC VEE PD VIMON GND_FLOAT INP2 INN1 HPA_PD_I PARAMS: VTH=1.4
+  IMAX=2e-3 IMIN=3N IIBP=0.21U IIBN=0.20U
*
C_Cc2         CLAW_CLAMP GND_FLOAT  1.5p  TC=0,0 
G_G3          GND_FLOAT VSENSE OVER_CLAMP GND_FLOAT 1u
X_Ug0         INP_CMRR INN3 GND_FLOAT N90758 VCCS_LIMIT PARAMS: GAIN=100e-6
+  IPOS=0.5 INEG=-0.5
X_U13         VCC VEE VIMON GND_FLOAT tran_iout 
G_G6          GND_FLOAT   CLAW_CLAMP P0ZP1 GND_FLOAT 1m
E_E1          VCC_BUF     GND_FLOAT  VCC   GND_FLOAT 1
C_Cc          OVER_CLAMP  GND_FLOAT  20n   TC=0,0 
R_Rinp        INP         INP1       1     TC=0,0 
R_R2          GND_FLOAT   N107583    1G    TC=0,0 
X_Ugnd        VCC 0 VEE 0 GND_FLOAT  0 EPOLY2 PARAMS: COEFF1=0.5 COEFF2=0.5
E_E2          VEE_BUF     GND_FLOAT  VEE   GND_FLOAT 1
G_Gpsr        GND_FLOAT   N02795 VCC VEE   156.2u
R_Rpsr        N02795      N027510    1     TC=0,0 
L_Lpsr        N027510     GND_FLOAT  2uH  
X_Upsrr       N02795      GND_FLOAT  INN1 INN2 VCVS_LIMIT PARAMS: GAIN=-1 VPOS=20M
+  VNEG=-20M
R_Rcmr        N01819      N013640     1    TC=0,0 
L_Lcmr        N013640     GND_FLOAT   560nH  
E_Ecmrr       INN2        INN3       N01819 GND_FLOAT 1
X_U7          CLAW_CLAMP  GND_FLOAT  RNOISELESS PARAMS: R=1e3
R_Rinn        INN         INN1       1     TC=0,0 
X_Ud2         INN3        N08751     d_ideal 
X_U1          GND_FLOAT   N90758     RNOISELESS PARAMS: R=1e6
G_G4          GND_FLOAT   P0Z VSENSE GND_FLOAT 1u
C_Cc3         GND_FLOAT   GND_FLOAT  4.11f  TC=0,0 
V_Uvcl_Vclo1  VCC_BUF     Uvcl_N498931 0.89Vdc
V_Uvcl_Vclo2  Uvcl_N50894 VEE_BUF      0.89Vdc
X_Uvcl_Uvcl1  OVER_CLAMP  Uvcl_N498931 d_ideal 
X_Uvcl_Uvcl2  Uvcl_N50894 OVER_CLAMP   d_ideal 
V_V4          N08964      VEE          1.94Vdc
X_Ud3         N08964      INP_CMRR     d_ideal 
X_Uthd        N118253 GND_FLOAT VCLP GND_FLOAT EPOLY1 PARAMS: COEFF1=0.0
+  COEFF2=0.0
C_Ucl_Ccl2    GND_FLOAT   Ucl_N01226   1p  TC=0,0 
C_Ucl_Ccl1    Ucl_N01131  GND_FLOAT    1p  TC=0,0 
V_Ucl_Vclp    Ucl_N00774  GND_FLOAT    1.4Vdc
V_Ucl_Vcln    Ucl_N00760  GND_FLOAT   -83Vdc
X_Ucl_Ucl1    Ucl_N50037  Ucl_N01131   d_ideal 
E_Ucl_E1      Ucl_N01131  GND_FLOAT  Ucl_N00774 VIMON 100
R_Ucl_Rcl1    Ucl_N01131  N127440      1   TC=0,0 
X_Ucl_Ucl2    Ucl_N01226  Ucl_N50037   d_ideal 
E_Ucl_E2      Ucl_N01226  GND_FLOAT  Ucl_N00760 VIMON 100
R_Ucl_Rcl3    Ucl_N50037  CL_CLAMP    0.01 TC=0,0 
R_Ucl_Rcl2    N127440     Ucl_N01226   1   TC=0,0 
G_G7          GND_FLOAT   CL_CLAMP   CLAW_CLAMP GND_FLOAT 1m
X_U3          VSENSE      GND_FLOAT  RNOISELESS PARAMS: R=1e6
G_G1          GND_FLOAT   N01819 INP_CMRR GND_FLOAT 56.2u
X_Ud4         N08964      INN3       d_ideal 
X_U5          GND_FLOAT   P0Z        RNOISELESS PARAMS: R=1e6
G_G5          GND_FLOAT   P0ZP1  P0Z GND_FLOAT 1u
R_R3          GND_FLOAT   N127440    1G TC=0,0 
X_U2          OVER_CLAMP  GND_FLOAT  RNOISELESS PARAMS: R=663.1
X_U8          CL_CLAMP   GND_FLOAT   RNOISELESS PARAMS: R=1e3
X_U6          P0ZP1      GND_FLOAT   RNOISELESS PARAMS: R=1e6
R_Uz_Rf1      Uz_N36964  Uz_VZO_1    10e6 TC=0,0 
X_Uz_S2       N107583    GND_FLOAT   Uz_N45507 Uz_VZO_3 Zout_Uz_S2 
R_Uz_Rg1      GND_FLOAT  Uz_N36964   10e6 TC=0,0 
R_Uz_Rg2      Uz_VZO_2   Uz_N37614   1e6  TC=0,0 
X_Uz_S1       N107583    GND_FLOAT   Uz_N45387 Uz_VZO_3 Zout_Uz_S1 
R_Uz_Ra       Uz_N45387  Uz_VZO_4    10 TC=0,0 
E_Uz_E1       Uz_VZO_2   GND_FLOAT   Uz_VZO_1 Uz_VZO_4 -1
R_Uz_Rm       Uz_VZO_3   Uz_VZO_4    10 TC=0,0 
X_Uz_Uamp1    VCLP       Uz_N36964   Uz_VZO_1 GND_FLOAT VCVS_LIMIT PARAMS:
+    GAIN=1e6 VPOS=6e4 VNEG=-6e4
R_Uz_Rf2      Uz_N37614  Uz_VZO_3    1e6 TC=0,0 
X_Uz_H1       Uz_VZO_4   OUT VIMON   GND_FLOAT Zout_Uz_H1 
R_Uz_Rb       Uz_N45507  Uz_VZO_4    10 TC=0,0 
X_Uz_Uamp2    GND_FLOAT  Uz_N37614   Uz_VZO_3 GND_FLOAT VCVS_LIMIT PARAMS:
+  GAIN=1e6 VPOS=6e4 VNEG=-6e4
V_V1          VCC        N08751      1.94Vdc
C_Cinp        GND_FLOAT  INP1  200f  TC=0,0 
X_Ud1         INP_CMRR   N08751      d_ideal 
C_Cc1         P0ZP1      GND_FLOAT   6f  TC=0,0 
X_U12         INP1       INP2        vnse 
X_U4          N90758 GND_FLOAT GND_FLOAT OVER_CLAMP VCCS_LIMIT PARAMS:
+  GAIN=15.1e-3 IPOS=0.1 INEG=-0.1
.ends TL974
*$

.subckt Zout_Uz_S2 1 2 3 4  
S_Uz_S2         3 4 1 2 _Uz_S2
RS_Uz_S2         1 2 1G
.MODEL         _Uz_S2 VSWITCH Roff=10e6 Ron=1.0 Voff=0.1V Von=-0.1V
.ends Zout_Uz_S2
*$
.subckt Zout_Uz_S1 1 2 3 4  
S_Uz_S1         3 4 1 2 _Uz_S1
RS_Uz_S1         1 2 1G
.MODEL         _Uz_S1 VSWITCH Roff=10e6 Ron=1.0 Voff=-0.1V Von=0.1V
.ends Zout_Uz_S1
*$
.subckt Zout_Uz_H1 1 2 3 4  
H_Uz_H1         3 4 VH_Uz_H1 1e3
VH_Uz_H1         1 2 0V
.ends Zout_Uz_H1
*$

.subckt tran_iout vcc vee vimon agnd 
sw4 net11 agnd vimon net19 sm1 
sw1 net11 agnd vimon net10 sm2 
r61 vimon net11 10 
r59 net19 agnd  10e3 
r58 net10 agnd  10e3 
g8  vcc   agnd net19 agnd 1e-3
g7  vee   agnd net10 agnd 1e-3
c15 net11 agnd 10e-12
.model sm1 vswitch
+ ron=0.001
+ roff=1e+006
+ von=0.1
+ voff=-0.1
.model sm2 vswitch
+ ron=0.001
+ roff=1e+006
+ von=-0.1
+ voff=0.1
.ends tran_iout
*$

.subckt d_ideal a c
d1 a c dnom
.model dnom d
+ tt=1e-011
+ cjo=1e-018
+ is=1e-016
+ rs=0.001
.ends d_ideal
*$

.SUBCKT VNSE 1 2
* SET UP VNSE 1/F v [NV/RHZ]
* FREQ FOR 1/F VAL
* VNSE FB  -NV/RHZ FLATBAND
.PARAM NLF=41
.PARAM FLW=20
.PARAM NVR=3.5
* START CALC VALS
.PARAM GLF={PWR(FLW,0.25)*NLF/1164}
.PARAM RNV={1.184*PWR(NVR,2)}
.MODEL DVN D KF={PWR(FLW,0.5)/1E11} IS=1.0E-16
* END CALC VALS
I1 0 7 10E-3
I2 0 8 10E-3
D1 7 0 DVN
D2 8 0 DVN
E1 3 6 7 8 {GLF}
R1 3 0 1E9
R2 3 0 1E9
R3 3 6 1E9
E2 6 4 5 0 10
R4 5 0 {RNV}
R5 5 0 {RNV}
R6 3 4 1E9
R7 4 0 1E9
E3 1 2 3 4 1
C1 1 0 1E-15
C2 2 0 1E-15
C3 1 2 1E-15
.ENDS VNSE
*$
*$
.SUBCKT HPA_PD_I VCC VEE PD Vimon AGND Ninp Ninn PARAMS: Vth = 1.4 Imax = 2e-3  Imin = 3n 
+       IIBP= 200n  IIBN= 210n
GBIAS     VCC  VEE    VALUE = {IF(V(PD,VEE) >= 1.4,Imax,Imin)}
Ebuf      VDD  0      VCC  0   1
Ginp      VDD  Ninp   VALUE = {IF(V(PD,VEE) >= 1.4,IIBP,0)}
Ginn      VDD  Ninn   VALUE = {IF(V(PD,VEE) >= 1.4,IIBN,0)}
.ENDS
*$
.SUBCKT HPA_PD_Sgnl  CP  CN  DIS  VP  VN  VCC VEE PARAMS:  GAIN = 1
EVCVS  VP  VN  VALUE = {IF(V(DIS,VEE) >= 1.4,V(CP,CN)*GAIN,0)}
.ENDS HPA_PD_Sgnl
*$
*
.subckt rnoiseless a b PARAMS: R=1k
*H_H1 c b VH_H1 {R}
*VH_H1 a c 0
ERES a 3 VALUE = { I(VSENSE) * R }
Rdummy 30 3 1
VSENSE 30 b DC 0V
.ends
*$
*
.SUBCKT EPOLY2 1 2 3 4 7 8 PARAMS: Coeff1=0.5  Coeff2=0.5
*EINT 7 8 POLY(2) (1,2) (3,4) (0 Coeff1 Coeff2)
EINT 7 8 POLY(2) (1,2) (3,4) (0 0.5 0.5)
.ENDS EPOLY2 
*$
*
.SUBCKT EPOLY1 1 2 3 4  PARAMS: Coeff1=0.0  Coeff2=0.0
*For distortion purpose
*EINT 3 4 POLY(1) (1,2) (0 1 Coeff1 Coeff2)
EINT 3 4 POLY(1) (1,2) (0 1 0 0)
.ENDS EPOLY1 
*$
*
.SUBCKT HPA_COMP INP INN VDD VSS OUT 
E1 4 0 VALUE = { IF( (V(INP) > V(INN)), V(VDD), V(VSS) ) }
R1 4 OUT 1
.ENDS HPA_COMP
*$
*
.SUBCKT HPA_MUX2 A B S Y PARAMS: VDD=1 VSS=0 VTHRESH=0.5 
E_ABMGATE  YINT 0 VALUE {IF( V(S) > {VTHRESH},  
+ V(B), V(A) ) }
RINT YINT Y 1
CINT Y 0 1n
.ENDS HPA_MUX2
*$
*
.SUBCKT ASW IN OUT NCTRL
E1  1  0  VALUE = { IF(V(NCTRL) > 0.5,V(IN),-V(IN) ) }
R1  1  OUT 1e-3
.ENDS ASW
*$
*
.SUBCKT HPA_SW IN OUT NCTRL
E1  1  0  VALUE = { IF(V(NCTRL) > 0.5,V(IN),0) }
R1  1  OUT 1e-3
.ENDS HPA_SW
*
*$

*Voltage Controlled Source with Limits
.subckt VCCS_Limit VCP VCN IOUTP IOUTN PARAMS: Gain = 1.7e-3
+ Ipos = 0.100 Ineg = -0.165
G1 IOUTP IOUTN VALUE={LIMIT(Gain*V(VCP,VCN),Ipos,Ineg)}
.ends VCCS_Limit
*
*$
.subckt VCVS_Limit VCP VCN VOUTP VOUTN PARAMS: Gain = -1
+ Vpos = 20m Vneg = -20m
E1 VOUTP VOUTN VALUE={LIMIT(Gain*V(VCP,VCN),Vpos,Vneg)}
.ends VCVS_Limit
*$


