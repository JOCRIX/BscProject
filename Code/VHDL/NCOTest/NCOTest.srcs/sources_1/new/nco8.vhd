library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- Entity declaration
entity nco_square_wave is
  port (
    clk          : in std_logic;                      -- Clock input
    reset        : in std_logic;                      -- Active-high reset
    tuning_word  : in std_logic_vector(31 downto 0);  -- Frequency control word
    square_wave  : out std_logic                      -- Square wave output
  );
end nco_square_wave;

architecture Behavioral of nco_square_wave is
  signal phase_acc : std_logic_vector(31 downto 0) := (others => '0'); -- Phase accumulator
begin
  -- Phase accumulator process
  process(clk)
  begin
    if rising_edge(clk) then
      if reset = '1' then
        phase_acc <= (others => '0'); -- Reset the phase accumulator
      else
        -- Increment phase accumulator
        phase_acc <= std_logic_vector(unsigned(phase_acc) + unsigned(tuning_word));
      end if;
    end if;
  end process;

  -- Generate square wave output using MSB of phase accumulator
  square_wave <= phase_acc(31);
end Behavioral;