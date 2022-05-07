ENTITY Setup IS
	port (A, B, C: in BIT;
			Z: out BIT);
END Setup;

ARCHITECTURE logicfunc of Setup IS
BEGIN
		Z<= (not(A) and B) or (A and B and C) or (A and not (C));
	END logicfunc;