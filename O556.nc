%
O556 (SHALLOW CENTRE FROM BLANK - SPOKE PATTERN)
(03-12-2024 - A)

N001G21G40G80
G140G18
G170
G501
M41
G50S1400
(WORK OFFSET ABS Z SHOULD BE AT MOST 1574)
(29MM STOCK CUT ALLOWANCE Z-0.5MM)
(18MM TO FRONT JAW FACE)
G10P0Z1574.
G00G28WB0.
(SETUP ZB FOR STATIC HANDOVER)
G10P0ZB1623.
G30U0W0
/M1

N114M6T025300 (12MM SLOT MILL)
T995400
M43
G28H0
G50C0
G00X230.Y0
Z5.
G98G17 (Z-AXIS MILL)
G97
/M1 
M8
G262S5600M13
G66P5530 X151.U28.V15.Z-29.D2.R5.Q3.A0B0C3F1260.
G00C30.
C60.
C120.
C150.
C210.
C240.
C300.
C330.
G67
/M1
M8
G262S5600M13
G66P5530 X116.U54.V37.5Z-29.D2.R5.Q4.A0B0C3F1260.
G00C30.
C60.
C120.
C150.
C210.
C240.
C300.
C330.
G67
M9
/M1
M8
G262S5600M13
G66 P5560 X190. Y0. U34. V37.5 W16. Z-29. D1. R10. Q4. B12. E0.5 F1260.
G00C0
C90.
C180.
C270.
G67
G18(Z-X AXIS)
M999
M40
M15
/M1 

(PASS WORK TO SUBSPINDLE)
G30U0W0
G28WB0
M420C1W30B0C3.
/M1
M175

(NOW PROCESSING ON SUBSPINDLE)
N1001G21G40G80G97
G140G18
G501
G170
M40
G28WB0
G30W0
G10P0Z774.5ZB400. (SET WORK OFFSETS, OUTER RIM WIDTH 9MM)
G50P3S1400
G97
G171 (REAR WORKING)
M140
G28WB0
M176
M1

N1025M6T025400B180.(1/2" DRILL)
T995300
M143
G28HB0
G50CB0
G511Z0 (MIRROR IMAGE ALONG Z)
G00X800.Z60.ZB0CB0
/M1 
G00X108.1(PDC)
Z10.
G98G17 (Z-AXIS MILL)
G262S800M13
M8
G199G83Z-24.Q5.R10.D1.F150.
CB90.
CB180.
CB270.
G80
M9
M15
G28WB0
G00Z50.
X800.
G501

N1030M6T025300B180. (12MM END MILL)
T995200
M143
G28HB0
G50CB0
G511Z0 (MIRROR IMAGE ALONG Z)
G00X800.Z60.ZB0
/M1 
G00X108.1
Z30.
G97
G98G17 (Z-AXIS MILL)
G98F200.
G262S5000M13
M8
(** NO CUTTER COMPENSATION)
(I DIAMETERS 12MM MILL 28MM-12=16MM 19.5MM-12=7.5MM AND 13.2MM-12=1.2MM)
(K DEPTHS)
(PDC X 108 A, Y 0 B. SAFE Z +10 C)
G00CB0
G65P5510A108.1B0C10.I17.K9.5I7.5K20.I2.5K26.1 (MILL 3 CONCENTRIC HOLES)
G00CB90
G65P5510A108.1B0C10.I17.K9.5I7.5K20.I2.5K26.1 (MILL 3 CONCENTRIC HOLES)
G00CB180
G65P5510A108.1B0C10.I17.K9.5I7.5K20.I2.5K26.1 (MILL 3 CONCENTRIC HOLES)
G00CB270
G65P5510A108.1B0C10.I17.K9.5I7.5K20.I2.5K26.1 (MILL 3 CONCENTRIC HOLES)
M9
M15
G28WB0
G00Z60.
X800.
G501

N1040M6T025200B180. (60DEG CHAMFER MILL)
T992500
G511Z0 (MIRROR IMAGE ALONG Z)
M143
G00X108.Z20.
ZB0CB0
G98G17 (Z-AXIS MILL)
/M1 
M8
(CHAMFER 4 INNER CONCENTRIC HOLES)
G97
G98F440.
G262S4000M13
(** NO CUTTER COMPENSATION)
G00CB0.
G65P5510A108.1B0C10.I8.K17.5
G00CB90.
G65P5510A108.1B0C10.I8.K17.5
G00CB180.
G65P5510A108.1B0C10.I8.K17.5
G00CB270.
G65P5510A108.1B0C10.I8.K17.5
M9
M15
G28WB0
G00Z60.
X800.
G501

N1020M6T022500B180. (6MM DRILL)
T995300
M143
G28HB0
G50CB0
G511Z0 (MIRROR IMAGE ALONG Z)
G00X256.
Z30.ZB0CB0
/M1 
M143
M175
G97
G262S1800M13
G98G17 (Z-AXIS DRILL)
G98F200.
M8
G65P5520X258.R10.Z-16.E20. (DRILL 20 HOLES)
M9
M15
G18
G28WB0
G00Z60.
X800.CB0
M176
G501

N1030M6T025300B180. (12MM END MILL)
M143
G28HB0
G50CB0
G511Z0 (MIRROR IMAGE ALONG Z)
G00Z30.X300.ZB0CB0
/M1 
M143
G98G17 (Z-AXIS MILL)
G98F500.
G262S4000M13
M8
G65P5520X258.R10.Z-3.5E20. (MILL 20 HOLES)
M9
M15
G00Z30.
X320.
CB0
/M1 
G97
G511Z0
M143
G262S6200M13
M8
(CALL EDGE PROFILE)
G01Z-20.F600.
M98P135
(RETURN FROM EDGE PROFILE)
M15
M9
M176
G28WB0
G00X800.
Z0Y0
CB0
M143
G18
M140
G501

N5000(RUN FROM HERE TO REVERT BACK TO NORMAL)
M115
M999
M5
G28WB0
G00W0.
G97
G501
G170
G30U0V0W0
M6T025300
M30
%