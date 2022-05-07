library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity CP1 is
	Port ( CLOCK : in STD_LOGIC; 
	DIRECTION : in STD_LOGIC;
	COUNT_OUT : out STD_LOGIC_VECTOR (31 downto 0));
end CP1;

architecture Behavioral of CP1 is
	signal count_int : std_logic_vector(31 downto 0) := "00000000000000000000000000000000";
	begin
		process (CLOCK)
			begin
			if CLOCK='1' and CLOCK'event then
				if DIRECTION='1' then
				count_int <= count_int + 1;
				else
				count_int <= count_int - 1;
				end if;
			end if;
end process;
COUNT_OUT <= count_int;
end Behavioral;
