library ieee;
use ieee.std_logic_1164.all;

entity MUX is 
	port( A, B, x : in std_logic;
			Z 		  : out std_logic);
end MUX;

architecture gate of mux is -- B when x high A when x low
begin
	Z <= (A and not(x)) or (B and x);
end gate;