--Libraries
Library IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

--Entity
Entity Progect2 is
	Port (clk, Q, reset : in std_logic;
			Z					 : out std_logic);
End Progect2;

--code			
Architecture Behavior of Progect2 is
type state is (R, A, B, C, D, E, F, G, H, I, J, K); --delclaration of state type
signal NextState : state; --NextState signal vaiable of state type.
signal clock : std_logic;

Begin 
clock <= not clk; --for a button
	process(clock, reset)
		Begin
			if reset = '0' then --asynch reset
			NextState <= R;
			Z <= '0';
			elsif(clock = '1' and clock'event) then --rising edge clock
				case NextState is
				when R => --From R to next state
				if Q = '1' then
					NextState <= A;
					else
					NextState <= H;
				end if;
				Z <= '0';
				when A => --From A to next state
				if Q = '1' then
					NextState <= E;
					else
					NextState <= B;
				end if;
				Z <= '0';
				when B => --From B to next state
				if Q = '1' then
					NextState <= A;
					else
					NextState <= C;
				end if;
				Z <= '0';
				when C => --From C to next state
				if Q = '1' then
					NextState <= D;
					else
					NextState <= I;
				end if;
				Z <= '0';
				when D => --From D to next state
				if Q = '1' then
					NextState <= K;
					else
					NextState <= B;
				end if;
				Z <= '1';
				when E => --From E to next state
				if Q = '1' then
					NextState <= F;
					else
					NextState <= B;
				end if;
				Z <= '0';
				when F => --From F to next state
				if Q = '1' then
					NextState <= G;
					else
					NextState <= B;
				end if;
				Z <= '0';
				when G => --From G to next state
				if Q = '1' then
					NextState <= G;
					else
					NextState <= B;
				end if;
				Z <= '1';
				when H => --From H to next state
				if Q = '1' then
					NextState <= A;
					else
					NextState <= I;
				end if;
				Z <= '0';
				when I => --From I to next state
				if Q = '1' then
					NextState <= J;
					else
					NextState <= I;
				end if;
				Z <= '0';
				when J => --From J to next state
				if Q = '1' then
					NextState <= K;
					else
					NextState <= B;
				end if;
				Z <= '0';
				when K => --From K to next state
				if Q = '1' then
					NextState <= F;
					else
					NextState <= B;
				end if;
				Z <= '1';
				end case; --closing case statement
			end if; --closing if clock statement
		end Process; 
end Behavior;