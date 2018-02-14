-------------------------------------------------------------------------------
-- Title      : 
-- Project    : FPGA
-------------------------------------------------------------------------------
-- File       : top.vhd
-- Author     : Felix Chen  <fchen@pc1073-ubu>
-- Company    : Aviat Networks
-- CVS ID     : $Id$
-------------------------------------------------------------------------------
-- DESCRIPTION:
--
-- 
--
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;

library mr_phy;
use mr_phy.all;
library phy_rst;
use phy_rst.all;

library pll;
use pll.all;

entity top is
  port(
    i_100m_clk    : in  std_logic;
    i_phy_ref_clk : in  std_logic;
    i_ser_rx      : in  std_logic_vector(0 downto 0);
    o_ser_tx      : out std_logic_vector(0 downto 0)
    );
end entity top;

architecture rtl of top is

--   component mult_eth_phy is
--     port (
--       csr_clk            : in  std_logic                     := 'X';  -- clk
--       reset              : in  std_logic                     := 'X';  -- reset
--       csr_readdata       : out std_logic_vector(15 downto 0);  -- readdata
--       csr_writedata      : in  std_logic_vector(15 downto 0) := (others => 'X');  -- writedata
--       csr_address        : in  std_logic_vector(4 downto 0)  := (others => 'X');  -- address
--       csr_waitrequest    : out std_logic;                     -- waitrequest
--       csr_read           : in  std_logic                     := 'X';  -- read
--       csr_write          : in  std_logic                     := 'X';  -- write
--       tx_digitalreset    : in  std_logic                     := 'X';  -- reset
--       rx_digitalreset    : in  std_logic                     := 'X';  -- reset
--       operating_speed    : out std_logic_vector(2 downto 0);  -- export
--       gmii16b_tx_en      : in  std_logic_vector(1 downto 0)  := (others => 'X');  -- export
--       gmii16b_tx_d       : in  std_logic_vector(15 downto 0) := (others => 'X');  -- export
--       gmii16b_tx_err     : in  std_logic_vector(1 downto 0)  := (others => 'X');  -- export
--       gmii16b_rx_dv      : out std_logic_vector(1 downto 0);  -- export
--       gmii16b_rx_d       : out std_logic_vector(15 downto 0);  -- export
--       gmii16b_rx_err     : out std_logic_vector(1 downto 0);  -- export
--       led_link           : out std_logic;                     -- export
--       led_char_err       : out std_logic;                     -- export
--       led_disp_err       : out std_logic;                     -- export
--       led_an             : out std_logic;                     -- export
--       tx_serial_clk      : in  std_logic_vector(0 downto 0)  := (others => 'X');  -- clk
--       rx_cdr_refclk      : in  std_logic                     := 'X';  -- clk
--       tx_clkout          : out std_logic;                     -- clk
--       rx_clkout          : out std_logic;                     -- clk
--       rx_pma_clkout      : out std_logic;                     -- clk
--       xcvr_mode          : in  std_logic_vector(1 downto 0)  := (others => 'X');  -- export
--       tx_serial_data     : out std_logic_vector(0 downto 0);  -- tx_serial_data
--       rx_serial_data     : in  std_logic_vector(0 downto 0)  := (others => 'X');  -- rx_serial_data
--       tx_analogreset     : in  std_logic_vector(0 downto 0)  := (others => 'X');  -- tx_analogreset
--       rx_analogreset     : in  std_logic_vector(0 downto 0)  := (others => 'X');  -- rx_analogreset
--       tx_cal_busy        : out std_logic_vector(0 downto 0);  -- tx_cal_busy
--       rx_cal_busy        : out std_logic_vector(0 downto 0);  -- rx_cal_busy
--       rx_is_lockedtodata : out std_logic_vector(0 downto 0);  -- rx_is_lockedtodata
--       reconfig_to_xcvr   : in  std_logic_vector(69 downto 0) := (others => 'X');  -- reconfig_to_xcvr
--       reconfig_from_xcvr : out std_logic_vector(45 downto 0);  -- reconfig_from_xcvr
--       pll_powerdown      : in  std_logic_vector(0 downto 0)  := (others => 'X')  -- pll_powerdown
--       );
--   end component mult_eth_phy;

--   component pll is
--     port (
--       refclk   : in  std_logic := '0';
--       rst      : in  std_logic := '0';
--       outclk_0 : out std_logic;
--       locked   : out std_logic);
--   end component pll;

--   component phy_rst is
--     port (
--       clock              : in  std_logic                    := '0';
--       reset              : in  std_logic                    := '0';
--       pll_powerdown      : out std_logic_vector(0 downto 0);
--       tx_analogreset     : out std_logic_vector(0 downto 0);
--       tx_digitalreset    : out std_logic_vector(0 downto 0);
--       tx_ready           : out std_logic_vector(0 downto 0);
--       pll_locked         : in  std_logic_vector(0 downto 0) := (others => '0');
--       pll_select         : in  std_logic_vector(0 downto 0) := (others => '0');
--       tx_cal_busy        : in  std_logic_vector(0 downto 0) := (others => '0');
--       rx_analogreset     : out std_logic_vector(0 downto 0);
--       rx_digitalreset    : out std_logic_vector(0 downto 0);
--       rx_ready           : out std_logic_vector(0 downto 0);
--       rx_is_lockedtodata : in  std_logic_vector(0 downto 0) := (others => '0');
--       rx_cal_busy        : in  std_logic_vector(0 downto 0) := (others => '0'));
--   end component phy_rst;


  signal tx_digitalreset : std_logic_vector(0 downto 0);
  signal rx_digitalreset : std_logic_vector(0 downto 0);
  signal operating_speed : std_logic_vector(2 downto 0);
  signal gmii16b_tx_en   : std_logic_vector(1 downto 0)  := (others => 'X');
  signal gmii16b_tx_d    : std_logic_vector(15 downto 0) := (others => 'X');
  signal gmii16b_tx_err  : std_logic_vector(1 downto 0)  := (others => 'X');
  signal gmii16b_rx_dv   : std_logic_vector(1 downto 0);
  signal gmii16b_rx_d    : std_logic_vector(15 downto 0);
  signal gmii16b_rx_err  : std_logic_vector(1 downto 0);

  signal tx_serial_clk      : std_logic_vector(0 downto 0)  := (others => 'X');
  signal rx_cdr_refclk      : std_logic                     := 'X';
  signal tx_clkout          : std_logic;
  signal rx_clkout          : std_logic;
  signal rx_pma_clkout      : std_logic;
  signal xcvr_mode          : std_logic_vector(1 downto 0)  := (others => 'X');
  signal tx_serial_data     : std_logic_vector(0 downto 0);
  signal rx_serial_data     : std_logic_vector(0 downto 0)  := (others => 'X');
  signal tx_analogreset     : std_logic_vector(0 downto 0)  := (others => 'X');
  signal rx_analogreset     : std_logic_vector(0 downto 0)  := (others => 'X');
  signal tx_cal_busy        : std_logic_vector(0 downto 0);
  signal rx_cal_busy        : std_logic_vector(0 downto 0);
  signal rx_is_lockedtodata : std_logic_vector(0 downto 0);
  signal reconfig_to_xcvr   : std_logic_vector(69 downto 0) := (others => 'X');
  signal reconfig_from_xcvr : std_logic_vector(45 downto 0);
  signal pll_powerdown      : std_logic_vector(0 downto 0)  := (others => 'X');
  signal pll_locked         : std_logic_vector(0 downto 0);
  signal pll_select         : std_logic_vector(0 downto 0)  := (others => '0');
  signal rx_ready           : std_logic_vector(0 downto 0);
  signal tx_ready           : std_logic_vector(0 downto 0);
begin

  mr_phy_1: entity mr_phy.mr_phy
    port map (
      csr_clk            => i_100m_clk,
      csr_readdata       => open,
      csr_writedata      => (others => '0'),
      csr_address        => (others => '0'),
      csr_waitrequest    => open,
      csr_read           => '0',
      csr_write          => '0',
      gmii16b_rx_d         => gmii16b_rx_d,
      gmii16b_rx_dv        => gmii16b_rx_dv,
      gmii16b_rx_err       => gmii16b_rx_err,
      gmii16b_tx_d         => gmii16b_tx_d,
      gmii16b_tx_en        => gmii16b_tx_en,
      gmii16b_tx_err       => gmii16b_tx_err,
      led_an               => open,--led_an,
      led_char_err         => open,--led_char_err,
      led_disp_err         => open,--led_disp_err,
      led_link             => open,--led_link,
      operating_speed      => open,
      reconfig_write       => "0",
      reconfig_read        => "0",
      reconfig_address     => (others => '0'),
      reconfig_writedata   => (others => '0'),
      reconfig_readdata    => open,--reconfig_readdata,
      reconfig_waitrequest => open,--reconfig_waitrequest,
      reconfig_clk(0)         => i_100m_clk,
      reconfig_reset       => "0",
      reset                => '0',
      rx_analogreset       => rx_analogreset,
      rx_cal_busy          => rx_cal_busy,
      rx_cdr_refclk        => rx_cdr_refclk,
      rx_clkout            => rx_clkout,
      rx_digitalreset      => rx_digitalreset(0),
      rx_is_lockedtodata   => rx_is_lockedtodata,
      rx_pma_clkout        => rx_pma_clkout,
      rx_serial_data       => i_ser_rx,
      tx_analogreset       => tx_analogreset,
      tx_cal_busy          => tx_cal_busy,
      tx_clkout            => tx_clkout,
      tx_digitalreset      => tx_digitalreset(0),
      tx_serial_clk        => tx_serial_clk,
      tx_serial_data       => o_ser_tx,
      xcvr_mode            => "10");
  
--   mult_eth_phy_1 : mr_phy.mr_phy
--     port map (
--       csr_clk            => i_100m_clk,
--       reset              => '0',
--       csr_readdata       => open,
--       csr_writedata      => (others => '0'),
--       csr_address        => (others => '0'),
--       csr_waitrequest    => open,
--       csr_read           => '0',
--       csr_write          => '0',
--       tx_digitalreset    => tx_digitalreset(0),
--       rx_digitalreset    => rx_digitalreset(0),
--       operating_speed    => operating_speed,
--       gmii16b_tx_en      => gmii16b_tx_en,
--       gmii16b_tx_d       => gmii16b_tx_d,
--       gmii16b_tx_err     => gmii16b_tx_err,
--       gmii16b_rx_dv      => gmii16b_rx_dv,
--       gmii16b_rx_d       => gmii16b_rx_d,
--       gmii16b_rx_err     => gmii16b_rx_err,
--       led_link           => open,
--       led_char_err       => open,
--       led_disp_err       => open,
--       led_an             => open,
--       tx_serial_clk      => tx_serial_clk,
--       rx_cdr_refclk      => i_phy_ref_clk,
--       tx_clkout          => tx_clkout,
--       rx_clkout          => rx_clkout,
--       rx_pma_clkout      => rx_pma_clkout,
--       xcvr_mode          => xcvr_mode,
--       tx_serial_data     => o_ser_tx,
--       rx_serial_data     => i_ser_rx,
--       tx_analogreset     => tx_analogreset,
--       rx_analogreset     => rx_analogreset,
--       tx_cal_busy        => tx_cal_busy,
--       rx_cal_busy        => rx_cal_busy,
--       rx_is_lockedtodata => rx_is_lockedtodata,
--       reconfig_to_xcvr   => reconfig_to_xcvr,
--       reconfig_from_xcvr => reconfig_from_xcvr,
--       pll_powerdown      => pll_powerdown);

  pll_1: entity pll.pll
    port map (
      pll_cal_busy  => open,
      pll_locked    => pll_locked(0),
      pll_powerdown => pll_powerdown(0),
      pll_refclk0   => i_phy_ref_clk,
      tx_serial_clk => tx_serial_clk(0));
  
--   pll_1 : entity pll.pll
--     port map (
--       refclk   => i_phy_ref_clk,
--       rst      => '0',
--       outclk_0 => tx_serial_clk(0),
--       locked   => pll_locked(0));

  phy_rst_1: entity phy_rst.phy_rst
    port map (
      clock              => i_100m_clk,
      pll_locked         => pll_locked,
      pll_powerdown      => pll_powerdown,
      pll_select         => pll_select,
      reset              => '0',
      rx_analogreset     => rx_analogreset,
      rx_cal_busy        => rx_cal_busy,
      rx_digitalreset    => rx_digitalreset,
      rx_is_lockedtodata => rx_is_lockedtodata,
      rx_ready           => rx_ready,
      tx_analogreset     => tx_analogreset,
      tx_cal_busy        => tx_cal_busy,
      tx_digitalreset    => tx_digitalreset,
      tx_ready           => tx_ready);
  
--   phy_rst_1 : entity phy_rst.phy_rst
--     port map (
--       clock              => i_100m_clk,
--       reset              => '0',
--       pll_powerdown      => pll_powerdown,
--       tx_analogreset     => tx_analogreset,
--       tx_digitalreset    => tx_digitalreset,
--       tx_ready           => open,
--       pll_locked         => pll_locked,
--       pll_select         => pll_select,
--       tx_cal_busy        => tx_cal_busy,
--       rx_analogreset     => rx_analogreset,
--       rx_digitalreset    => rx_digitalreset,
--       rx_ready           => rx_ready,
--       rx_is_lockedtodata => rx_is_lockedtodata,
--       rx_cal_busy        => rx_cal_busy);

end rtl;
