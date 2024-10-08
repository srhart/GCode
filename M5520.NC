%
O5520 (MACRO)
(11-04-2024 - A)
(** WARNING NO PECK DRILLING! **)
(DRILL/MILL MULTIPLE HOLES ON ONE DIAMETER)
(TYPE I PASSED VARABLES)
(AXIS SHOULD BE G17)
(C SHOULD BE LOCKED)
(ROTATING TOOL SHOULD BE STARTED)
(FEED RATE SHOULD BE SET)
(X #24 IS THE HOLE CENTRE)
(R #18 IS CLEARANGE HEIGHT)
(Z #26 IS HOLE DEPTH)
(E #8 IS THE NUMBER OF HOLES)
N010$HC = 1 (HOLE COUNT)
N020$DIA = ABS[#24]
N030$DPT = [-ABS[#26]]
N040$ANG = [360/#8]
N050G00X[$DIA]Y0Z#18 (RAPID TO CENTRE)

N060WHILE [[[$HC]LE#8]] DO1
N070G01Z[$DPT] (DRILL/MILL HOLE)
N080G00Z#18 (RAPID CLEAR)
N110HB[$ANG] (MOVE TO NEXT)
N140$HC=$HC+1
N200END1
N220$HC = 0
M99
%