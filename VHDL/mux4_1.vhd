library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity mux4_1 is
	port(F0 : in std_logic_vector(6 downto 0) := "0000101";	 -- F0 = 5 bani
	F1 : in std_logic_vector(6 downto 0) := "0001010";	  -- F1 = 10 bani,
	F2 : in std_logic_vector(6 downto 0) := "0110010";	   -- F2 = 50 bani
	F3 : in std_logic_vector(6 downto 0) := "0000000";	
	S0, S1: in std_logic;
	AM: out std_logic_vector(6 downto 0) -- acceptare/respingere moneda
	);
end mux4_1;

architecture mux4_1_arch of mux4_1 is
begin
	process(F0, F1, F2,F3, S0, S1) is
	begin
		if(S0 = '0' and S1 = '0') then -- introduc moneda F0
			AM <= F0;
		elsif (S0 = '1' and S1 = '0') then --introduc moneda F1
			AM <= F1;
		elsif (S0 = '0' and S1 = '1') then -- intoduc moneda F2
			AM <= F2;
		else
			AM <= F3;	  -- am intodus corp strain care nu este moneda (F3)
		end if;	
	end process;
end mux4_1_arch;
