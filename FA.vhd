library ieee;
use ieee.std_logic_1164.all;

entity FA is
	port( Cin, in1, in2 : in std_logic;
			s, cout: out std_logic);
end FA;

architecture Logicfunc of FA is
begin
	s <= in1 xor in2 xor Cin;
	cout <= (in1 and in2) or (Cin and in1) or (Cin and in2);
end LogicFunc;