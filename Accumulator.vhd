Library ieee;
Use ieee.std_logic_1164.All;
Use ieee.std_logic_unsigned.All;

Entity Accumulator is 
port (
       Acc_in : in std_logic_vector(7 downto 0);
		 Data_in : in std_logic_vector(7 downto 0);
		 Acc_out : out std_logic_vector(7 downto 0);
		clk, reset,ACC_OE,ACC_LD, ACC_INC: std_logic
		);
end Entity;

Architecture rtl of Accumulator is
signal val : std_logic_vector(7 downto 0):=(others => '0'); 

 begin 
   process(clk, reset, ACC_OE, ACC_LD, ACC_INC, val ) 
	  begin 
	     if (reset = '0') then
		     val <= (others => '0');
		  elsif (clk'event and clk = '1') then
		  
		       if (ACC_LD = '1') then
						   val <= Acc_in;
				 end if;
		  
		         if (ACC_OE = '1') then
				       val <= Data_in;
				   elsif (ACC_INC = '1') then
						 val <= val + 1;
				 end if;
				      
			end if;
	Acc_out <= val;
	end process;
end Architecture;