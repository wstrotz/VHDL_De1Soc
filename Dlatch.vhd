library ieee;
use ieee.std_logic_1164.all;

entity Dlatch is 
	port( D, en : in std_logic;
			Q		: out std_logic);
end Dlatch;

architecture gate of Dlatch is
begin
	process(D, en)
	begin
		if en = '1' then
			Q <= D;
		end if;
	end process;
end gate;