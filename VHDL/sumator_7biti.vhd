library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_UNSIGNED.all;

entity sumator_7biti is
	port(A,B : in std_logic_vector(6 downto 0);
	Cin : in  std_logic := '0';
	Sum: out std_logic_vector(6 downto 0) := "0000000"; 
	Cout : out std_logic);
end sumator_7biti;

architecture sumator_arch of sumator_7biti is
signal carry: std_logic_vector(5 downto 0);
component sumator is 
port(A,B : in std_logic;
	Cin : in std_logic := '0' ;
	S : out std_logic := '0' ; 
	Cout : out std_logic
	);
end component;
begin 
	U0 : sumator port map(A(0),B(0),Cin,Sum(0),carry(0));
	U1 : sumator port map(A(1),B(1),carry(0),Sum(1),carry(1));
	U2 : sumator port map(A(2),B(2),carry(1),Sum(2),carry(2));
	U3 : sumator port map(A(3),B(3),carry(2),Sum(3),carry(3));
	U4 : sumator port map(A(4),B(4),carry(3),Sum(4),carry(4));
	U5 : sumator port map(A(5),B(5),carry(4),Sum(5),carry(5));
	U6 : sumator port map(A(6),B(6),carry(5),Sum(6),Cout);
end sumator_arch;
