# Fanuc G-Code Macros
A selection of G-code macros for Fanuc Σ16T/Σ18T family.
Mostly modal macros for a lathe with Y and C. X is diameter.

## M5510 - Mill a set of concentric holes.
        ToDo - add Z depth peck profiles and helical ramp
        G65 P5510 A__ B__ C__ [I__ K__ J__ .....] 
        [!NOTE] Type II parameters
        A,B (Z,Y) Centre
        C: Clerance height
        Each I,J,K are holes
        I: Radius
        K: depth
        J: Twice round set to 1

## M5520 - Drill a set of holes on a diameter, no peck drilling.
        [!NOTE] CB is used for rear working. Change to C for front working.
        G65 P5520 X__ R__ Z__ E__
        X: The hole centre (PDC)
        R: Clearange height
        Z: Hole depth
        E: The number of holes
        [!NOTE]
        Axis should be G17
        C should be locked
        Rotating tool should be started
        Feed rate should be set

## M5530 - (Modal) Mill a triangle pocket.
        ToDo - add helical ramp to start, spiral out
        G65/G66 P5530 X__ U__ V__ Z__ D__ R__ Q__ A__ B__ C__ F__
        Y: Allways 0, X: Centre 
        V: Width v
        U: Height u (negative to change orientation)
        R: Clearange height
        Q: Peck depth
        Z: Total depth
        D: Surface
        F: Feed rate
        A: Start in centre, bool. Otherwise start at apex
        B: Cut direction 0 climb, 1 conventional. Reverse for rear processing
        C: 1,2 Or 3 straight, covex or concave base
        E: Base radius multiplier

## M5550 - (Modal) Mill a hexagonal pocket.
        ToDo - add helical ramp to start
        G65/G66 P5550 X__ Y__ Z__ A__ B__ D__ E__ F__ R__ Q__
        X, Y: Centre
        A: Side length
        B: Tool diameter
        R: Clearange height
        Q: Peck depth
        E: Side cut amount
        Z: Total depth
        D: Surface
        F: Feed rate

## M5560 - (Modal) Mill a trapezoid pocket. (WiP)
        ToDo - add helical ramp to start
        G65/G66 P5560 X__ Y__ Z__ U__ V__ W__ B__ D__ E__ F__ R__ Q__
        X, Y: Centre
        U: Height
        V: Top width
        W: Bottom width
        Z: Total depth
        Q: Peck depth
        R: Clearange height
        B: Tool diameter, default to current tool R
        D: Surface
        E: Radial engagement of cutter, 0.2 = 20pct
        F: Feed rate

## M5570 - (Modal) Mill a circular pocket with helical ramp (WiP)
        ToDo - add helical ramp to start

## M5590 - (Modal) Mill a hole with a helical ramp
        G65/G66 P5590 X__ Y__ Z__ B__ D__ Q__ H__ F__ R__ ;
        X, Y: Centre
        Z: Depth of hole
        B: Tool diameter, default to current tool R
        D: Surface
        F: Feed rate
        H: Helix size factor e.g. 10Mm tool *1.8 = 18mm, 1.8 default, keep between 1.1 and 1.9
        Q: Ramping angle, in degrees, of each Z cut, default 2. 
        R: Clearange height