library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity sumator is
	port(A,B,Cin : std_logic;
	S, Cout: out std_logic
	);
end sumator;

architecture sumator_arch of sumator is
begin
	S <= A xor B xor Cin;
	Cout <= (A and B) or (Cin and A) or (Cin and B);
end sumator_arch;
