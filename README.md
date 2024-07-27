# fanuc-macros
A selection of g-code macros for Fanuc sigma 16T family.
Mostly modal macros for a lathe with Y and C. X is diameter.

M5510 - (Modal) Mill a set of concentric holes.
        ToDo - add Z depth peck profiles and helical ramp

M5520 - Drill a set of holes on a diameter, no peck drilling.
        Note: CB is used for rear working. Change to C for front working.

M5530 - (Modal) Mill a triangle pocket.
        ToDo - add helical ramp to start

M5550 - (Modal) Mill a hexagonal pocket.

M5560 - (Modal) Mill a trapezoid pocket. (WiP)

M5570 - (Modal) Mill a circular pocket with helical ramp (WiP)