%
O112(TEST M5560)
(25-07-2024 - A)
M6T025300 (12MM SLOT MILL)
M43
G28H0
G50C0
G98G17 (Z-AXIS MILL)
G97
G00X0Y0Z10.
M1 
G262S5600M13
G66 P5560 X184. Y0. Z-0.5 U24. V20. W18. B12. D1. E4. F1260. R10. Q4.
G00C0
H90.
G67

M2

O5560(TRAPEZOID POCKET)
(07-08-2024 - A)
(MILL A TRAPEZOID POCKET WITH LH CUTTER COMPENSATION)
(AXIS SHOULD BE G17)
(X #24, Y #25, CENTRE)
(U #21 HEIGHT)
(V #22 TOP WIDTH)
(W #23 BOTTOM WIDTH)
(Z #26 TOTAL DEPTH)
(Q #17 PECK DEPTH)
(R #18 CLEARANGE HEIGHT)
(B #2 TOOL DIAMETER)
(D #7 SURFACE)
(E #8 RADIAL ENGAGEMENT OF CUTTER, 0.2 = 20PCT)
(F #9 FEED RATE)

(PARAMS)
$TOOL = [[FIX[#4120/100]]MOD100]
$MIRZ = [#3007AND4] (0, MIRROR IN Z = 1 )
IF [$MIRZ] THEN $G = 02 
ELSE $G = 03
ENDIF

(DEFAULTS)
IF [#2EQ#0] THEN #2=[[#2300+$TOOL]*2]
#159 = [#2*#8] (STEP OVER)

IF [#26GE#7] GOTO 902
#112 = ABS[#17] (REMOVE SIGN, WILL ALLWAYS BE NEGATIVE)
#121 = ABS[#21] (HEIGHT)
#122 = ABS[#22] (OUTER TOP SIZE)
#123 = ABS[#23] (OUTER BOTTOM SIZE)
#121 = [#121-#2/2] (TOOL PATH HEIGHT)
#122 = [#122-#2/2] (TOOL PATH TOP)
#123 = [#123-#2/2] (TOOL PATH BOTTOM)
$LGSIDE = #121
#150 = 121
IF [[#122]GT[$LGSIDE]] THEN #150 = 122
IF [[#123]GT[$LGSIDE]] THEN #150 = 123

$DCL = [#26 - #7](DEPTH CUT LEFT)
IF [ABS[$DCL]LT#112] THEN #112 = ABS[$DCL]

G00X#24Y#25
G01Z#7F#9 (MOVE TO SURFACE)
G140G40 (CANCEL ALL COMPS)

WHILE [[$DCL]NE0] DO1
    $DCL = [$DCL - [-#112]]
    G65 P5590 X#24 Y#25 Z[-#112] B#2 D3. Q2. H1.4 F#9 R#18. (PECK)
    $PCL = [#2+#159] (RESET POCKET CUT LEFT)
    #141 = [$PCL]
    #142 = [$PCL]
    #143 = [$PCL]
    G01 X#24Y#25 (MOVE BACK TO CENTRE)

    (CUT THE POCKET)
    WHILE [[$PCL]NE#[#150]] DO2
        $PCL = [[$PCL] + #159] (NEXT CUT)
        IF [[$PCL]GT#[#150]] THEN $PCL = #[#150]
        #141 = [#141 + #159]
        IF [#141GT#121] THEN #141 = #121 (HEIGHT X)
        #142 = [#142 + #159]
        IF [#142GT#121] THEN #142 = #122 (TOP Y)
        #143 = [#143 + #159]
        IF [#143GT#121] THEN #143 = #123 (BOTTOM Y)

        (NOW PERFORM CUT)
        G01 X[#24+#141] Y[#142/2] F[#9] (TOP RH CORNER)
        G[$G] U0 Y-[#142/2] R[#24+#141] (TOP LH CORNER)
        G01 U-[#141] Y-[#143/2] (BOTTOM LH CORNER)
        G[$G] U0 Y[#143] R[#24-#141] (BOTTOM RH CORNER)
        G01 U[#141*2] Y[#142/2] (BACK TO START)
    END2

    IF [ABS[$DCL]LT#112] THEN #112 = ABS[$DCL]
END1

G01Z[#18]
GOTO 9999
N901#3000=001(TOOL B TOO LARGE FOR HEXAGON SIZE)
N902#3000=002(Z DEPTH IS GREATER THAN SURFACE D)
N902#3000=003(BOTTOM SIDE C IS GREATER THAN TOP SIDE A)
N9999
M99
%
