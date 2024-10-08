%
O111(TEST M5550)
(26-07-2024 - A)
M6T025300 (12MM SLOT MILL)
M43
G28H0
G50C0
G98G17 (Z-AXIS MILL)
G97
G00X0Y0Z10.
M1 
G262S5600M13
G66 P5550 X184. Y0. Z-0.5 A24. B12. D1. E4. F1260. R10. Q4.
G00C22.5
H45.
G67
M2

O5550(HEXAGON POCKET)
(05-06-2024 - B)
(MILL A HEXAGON POCKET WITH LH CUTTER COMPENSATION)
(AXIS SHOULD BE G17)
(X #24, Y #25, CENTRE OF HEX.)
(A #33 SIDE LENGTH)
(B #2 IS TOOL DIAMETER)
(R #18 IS CLEARANGE HEIGHT)
(Q #17 IS PECK DEPTH)
(E #8 IS SIDE CUT AMOUNT)
(Z #26 IS TOTAL DEPTH)
(D #7 IS SURFACE)
(F #9 FEED RATE)
IF [#26GE#7] GOTO 902
#32 = ABS[#17] (REMOVE SIGN, WILL ALLWAYS BE NEGATIVE)
#33 = ABS[#1] (OUTER SIZE)
$SIDE=[#33-#2/2] (INNER SIZE)
$TOFF=[[#2/2]/[SIN[60]]]
$CL = [#26 - #7](CUT LEFT)
IF [ABS[$CL]LT#32] THEN #32 = ABS[$CL]
$YOFF=SQRT[[$SIDE*$SIDE]-[[$SIDE/2]*[$SIDE/2]]]
IF[[$YOFF]LE[#2/2]] GOTO 901
G00X#24Y#25
G01Z#7F#9 (MOVE TO SURFACE)
G140G40

WHILE [[$CL]NE0] DO1
$CL = [$CL - [-#32]]
#33=[#2/2+#2/4]
G01W[-#32]F[#9/4] (PLUNGE PECK)

WHILE [#33NE[$SIDE]] DO2
#33=#33+#8
IF [[$SIDE]LT#33] THEN #33 = $SIDE
$YOFF=SQRT[[#33*#33]-[[#33/2]*[#33/2]]]
G01X[#24-#33*2]Y#25 F#9
U[#33]V[-$YOFF]
U[#33*2]
U[#33]Y#25
U[-#33]V[$YOFF]
U[-#33*2]
X[#24-#33*2]Y#25
END2

IF [ABS[$CL]LT#32] THEN #32 = ABS[$CL]
END1

G01Z[#18]
GOTO 9999
N901#3000=001(TOOL B TOO LARGE FOR HEXAGON SIZE)
N902#3000=002(Z DEPTH IS GREATER THAN SURFACE D)
N9999
M99
%
