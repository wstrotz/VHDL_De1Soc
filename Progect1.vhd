library ieee;
use ieee.std_logic_1164.all;

entity Progect1 is 
	port( A, B 		: in std_logic_vector(4 downto 1);
			s0, s1	: in std_logic;
			ci			: in std_logic;
			clk		: in std_logic;
			C			: out std_logic_vector(4 downto 1);
			co 		: out std_logic);
end Progect1;

architecture gate of Progect1 is
--component init.
	--D latch
	component Datch is 
		port( D, en : in std_logic;
				Q		: out std_logic);
	end component;
	--Full Adder
	component add4 is 
		port( Cin: in std_logic;
				a3, a2, a1, a0 :in std_logic;
				b3, b2, b1, b0 :in std_logic;
				s3, s2, s1, s0 :out std_logic;
				cout				:out std_logic);
	end component;
	--2-1 mux
	component MUX is 
		port( A, B, x : in std_logic;
				Z 		  : out std_logic);
	end component;
--signals
signal i1,i2,i3,i4,i5,i6,i7,i8 						: std_logic; --post in latch inputs
signal o1,o2,o3,o4,o5 				 					: std_logic; --pre out latch outputs 
signal inv1,inv2,inv3,inv4								: std_logic; --inverted B and cin for mux
signal cout,notcin,cin,cmd1,cmd2,cmd3				: std_logic; --command and carrys post latch
signal y1,y2,y3,y4,y5,x1,x2,x3,x4,x5				: std_logic; --b post mux for add
signal ad1,ad2,ad3,ad4,xr1,xr2,xr3,xr4				: std_logic; --post add and xor func vars respectively
--function
begin

	--Datch for in and outs.
		--ins
	in1 : Datch port map (D => A(1), en => clk, Q => i1);
	in2 : Datch port map (D => A(2), en => clk, Q => i2);
	in3 : Datch port map (D => A(3), en => clk, Q => i3);
	in4 : Datch port map (D => A(4), en => clk, Q => i4);
	in5 : Datch port map (D => B(1), en => clk, Q => i5);
	in6 : Datch port map (D => B(2), en => clk, Q => i6);
	in7 : Datch port map (D => B(3), en => clk, Q => i7);
	in8 : Datch port map (D => B(4), en => clk, Q => i8);
	carryin : Datch port map (D => ci, en => clk, Q => notcin);
	cmdin1 : Datch port map (D => s1, en => clk, Q => cmd1);
	cmdin2 : Datch port map (D => s0, en => clk, Q => cmd2);
		--inv clock outs
	out1 : Datch port map (D => o1, en => not(clk), Q => C(1));
	out2 : Datch port map (D => o2, en => not(clk), Q => C(2));
	out3 : Datch port map (D => o3, en => not(clk), Q => C(3));
	out4 : Datch port map (D => o4, en => not(clk), Q => C(4));
	carryout: Datch port map (D => o5, en => not(clk), Q => co);
	
	--active low to active high button carry
	cin <= not notcin;
	
	--establishing b inverted vars
	inv1 <= not i5;
	inv2 <= not i6;
	inv3 <= not i7;
	inv4 <= not i8;
	
	--mapping to add subtract controller muxes (A outputs when cmd1 low)
		--control to feed normal or inv to Bin5-8
	Bin1 : MUX port map (A => i5, B => inv1, x => cmd1, Z => y1);
	Bin2 : MUX port map (A => i6, B => inv2, x => cmd1, Z => y2);
	Bin3 : MUX port map (A => i7, B => inv3, x => cmd1, Z => y3);
	Bin4 : MUX port map (A => i8, B => inv4, x => cmd1, Z => y4);
		--feed 0 or y to adder (transfer or add)
	Bin6 : MUX port map (A => y1, B => '0', x => (not(cmd1) and not(cmd2)), Z => x1);
	Bin7 : MUX port map (A => y2, B => '0', x => (not(cmd1) and not(cmd2)), Z => x2);
	Bin8 : MUX port map (A => y3, B => '0', x => (not(cmd1) and not(cmd2)), Z => x3);
	Bin9 : MUX port map (A => y4, B => '0', x => (not(cmd1) and not(cmd2)), Z => x4);
	Bin10: MUX port map (A => cin, B => '0', x => (not(cmd1) and not(cmd2)), Z => x5);
	
	--establishing add
	ADDER : add4 port map (Cin => cin,
								  a3 => i4, a2 => i3, a1 => i2, a0 => i1,
								  b3 => x4, b2 => x3, b1 => x2, b0 => x1,
								  s3 => ad4, s2 => ad3, s1 => ad2, s0 => ad1,
								  cout => cout);
	
	--establishing bitwise 
		--bitwise output control
	cmd3 <= cmd1 and cmd2;
		--bitwise xor
	xr1 <= i1 xor i5;
	xr2 <= i2 xor i6;
	xr3 <= i3 xor i7;
	xr4 <= i4 xor i8;
	
	--output control
	addxr1 : MUX port map (A => ad1, B => xr1, x => cmd3, Z => o1);
	addxr2 : MUX port map (A => ad2, B => xr2, x => cmd3, Z => o2);
	addxr3 : MUX port map (A => ad3, B => xr3, x => cmd3, Z => o3);
	addxr4 : MUX port map (A => ad4, B => xr4, x => cmd3, Z => o4);
	addxr5 : MUX port map (A => cout,B => '0', x => cmd3, Z => o5);
end gate;
