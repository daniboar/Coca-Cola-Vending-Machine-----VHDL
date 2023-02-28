library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_UNSIGNED.all;
use IEEE.std_logic_arith.all;

entity proiect is
	 port(
		 F0 : in std_logic_vector(6 downto 0) := "0000101";	 -- F0 = 5 bani
		 F1 : in std_logic_vector(6 downto 0) := "0001010";	  -- F1 = 10 bani,
		 F2 : in std_logic_vector(6 downto 0) := "0110010";	   -- F2 = 50 bani
		 F3 : in std_logic_vector(6 downto 0) := "0000000";
		 S1 : in STD_LOGIC;
		 S0 : in STD_LOGIC;
		 AM : inout STD_LOGIC_VECTOR(6 downto 0) := "0000000";	-- acceptare moneda
		 AT : inout STD_LOGIC_VECTOR(6 downto 0) := "0000000";	
		 RM : out STD_LOGIC_vector(6 downto 0):= "0000000"	  -- rest monede
	     );
end proiect;


architecture proiect of proiect is 

component mux4_1 is
	port(F0 : in std_logic_vector(6 downto 0) := "0000101";	 -- F0 = 5 bani
	F1 : in std_logic_vector(6 downto 0) := "0001010";	  -- F1 = 10 bani,
	F2 : in std_logic_vector(6 downto 0) := "0110010";	   -- F2 = 50 bani
	F3 : in std_logic_vector(6 downto 0) := "0000000";	
	S0, S1: in std_logic;
	AM: out std_logic_vector(6 downto 0) -- acceptare/respingere moneda
	);
end component mux4_1;

component sumator is
	port(A,B : in std_logic;
	Cin : in std_logic := '0' ;
	S : out std_logic := '0';
	Cout : out std_logic
	);
end component;

component sumator_7biti is
	port(A,B : in std_logic_vector(6 downto 0);
	Cin : in std_logic := '0';
	Sum: out std_logic_vector(6 downto 0):= "0000000";
	Cout : out std_logic);
end component;

signal Cin : std_logic := '0';	
signal S : std_Logic_vector(6 downto 0):= "0000000"; 
signal semnal_cola: std_logic := '0';
signal AMout: std_logic_vector(6 downto 0);
signal COUT : std_logic;
signal coca_cola : std_logic_vector(6 downto 0) := "0000111";
signal buton_rest : std_logic := '0';  
signal continue : std_logic := '1';
begin							     
	C1 : mux4_1 port map(F0, F1, F2,F3, S0, S1, AMout); 
	C2 : sumator_7biti port map(AMout, AT, Cin, S, COUT); 
	AT <= S after 100 ns;
	process(buton_rest,AT) 
	begin 
		if(continue = '1') then
		if(AT = "1100100") then		   --daca s-a atins suma de 1 leu, se va elibera cola
			if(coca_cola > "0000000") then
				semnal_cola <=  '1';	  --semnal care arata ca s-a eliberat suc
				coca_cola <=  coca_cola  - '1';	   --scadem numarul de sucuri
			end if;
		elsif( AT < "1100100" and buton_rest = '1') then	  --daca nu s-au introdus destule monede si butonul de rest e activat, se va elibera restul
			RM <= AT;						
		elsif(coca_cola > "0000000" and AT < "1100100" and buton_rest = '0') then 
			continue <= '1';
		elsif (AT > "1100100" and coca_cola > "0000000") then	  --daca s-a trecut de suma de 1 leu, se va elibera restul
			RM <= AT - "1100100";
			semnal_cola <= '1';
			coca_cola <= coca_cola - '1';
		end if;	
		end if;
	end process;	
end proiect;
