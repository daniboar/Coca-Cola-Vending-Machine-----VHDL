library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity D_FLIP is
	 port(
		 D : in STD_LOGIC;
		 CLK : in STD_LOGIC;
		 Q : out STD_LOGIC
	     );
end D_FLIP;


architecture D_FLIP_ARCH of D_FLIP is
begin
	process(CLK,D)
	begin
		if(CLK = '0' and CLK'event) then
			Q <= D;	
			end if;
	end process;
	
	

end D_FLIP_ARCH;
