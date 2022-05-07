library ieee;
use ieee.std_logic_1164.all;

entity Datch is 
	port( D, en : in std_logic;
			Q		: out std_logic);
end Datch;

architecture gate of Datch is
begin
	process(D, en)
	begin
		if en = '1' then
			Q <= D;
		end if;
	end process;
end gate;