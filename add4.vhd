library ieee;
use ieee.std_logic_1164.all;

entity add4 is 
	port( Cin: in std_logic;
			a3, a2, a1, a0 :in std_logic;
			b3, b2, b1, b0 :in std_logic;
			s3, s2, s1, s0 :out std_logic;
			cout				:out std_logic);
end add4;

architecture structure of add4 is 
	signal car1, car2, car3: std_logic;
	component FA is
		port( Cin, in1, in2 : in std_logic;
				s,cout 	 : out std_logic);
	end component;
begin
	stage0: FA port map(Cin, a0, b0, s0, car1 );
	stage1: FA port map(car1, a1, b1, s1, car2 );
	stage2: FA port map(car2, a2, b2, s2, car3 );
	stage3: FA port map(Cin => car3, cout => cout, in1 => a3, in2 => b3, s => s3);
end structure;