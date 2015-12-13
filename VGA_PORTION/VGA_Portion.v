// ============================================================================
// Copyright (c) 2013 by Terasic Technologies Inc.
// ============================================================================
//
// Permission:
//
//   Terasic grants permission to use and modify this code for use
//   in synthesis for all Terasic Development Boards and Altera Development 
//   Kits made by Terasic.  Other use of this code, including the selling 
//   ,duplication, or modification of any portion is strictly prohibited.
//
// Disclaimer:
//
//   This VHDL/Verilog or C/C++ source code is intended as a design reference
//   which illustrates how these types of functions can be implemented.
//   It is the user's responsibility to verify their design for
//   consistency and functionality through the use of formal
//   verification methods.  Terasic provides no warranty regarding the use 
//   or functionality of this code.
//
// ============================================================================
//           
//  Terasic Technologies Inc
//  9F., No.176, Sec.2, Gongdao 5th Rd, East Dist, Hsinchu City, 30070. Taiwan
//  
//  
//                     web: http://www.terasic.com/  
//                     email: support@terasic.com
//
// ============================================================================
// VGA_Portion of Final assignment
// CLASS: CMPEN 417
// SEMESTER: Fall 2015
// EDITED BY: John Grant
// DATE:  SUN DEC 13 03:09:41 2015
// ============================================================================

module VGA_Portion(

      ///////// ADC /////////
      inout              ADC_CS_N,
      output             ADC_DIN,
      input              ADC_DOUT,
      output             ADC_SCLK,

      ///////// AUD /////////
      input              AUD_ADCDAT,
      inout              AUD_ADCLRCK,
      inout              AUD_BCLK,
      output             AUD_DACDAT,
      inout              AUD_DACLRCK,
      output             AUD_XCK,

      ///////// CLOCK2 /////////
      input              CLOCK2_50,

      ///////// CLOCK3 /////////
      input              CLOCK3_50,

      ///////// CLOCK4 /////////
      input              CLOCK4_50,

      ///////// CLOCK /////////
      input              CLOCK_50,

      ///////// DRAM /////////
      output      [12:0] DRAM_ADDR,
      output      [1:0]  DRAM_BA,
      output             DRAM_CAS_N,
      output             DRAM_CKE,
      output             DRAM_CLK,
      output             DRAM_CS_N,
      inout       [15:0] DRAM_DQ,
      output             DRAM_LDQM,
      output             DRAM_RAS_N,
      output             DRAM_UDQM,
      output             DRAM_WE_N,

      ///////// FAN /////////
      output             FAN_CTRL,

      ///////// FPGA /////////
      output             FPGA_I2C_SCLK,
      inout              FPGA_I2C_SDAT,

      ///////// GPIO /////////
      inout     [35:0]         GPIO_0,
      inout     [35:0]         GPIO_1,
 

      ///////// HEX0 /////////
      output      [6:0]  HEX0,

      ///////// HEX1 /////////
      output      [6:0]  HEX1,

      ///////// HEX2 /////////
      output      [6:0]  HEX2,

      ///////// HEX3 /////////
      output      [6:0]  HEX3,

      ///////// HEX4 /////////
      output      [6:0]  HEX4,

      ///////// HEX5 /////////
      output      [6:0]  HEX5,

`ifdef ENABLE_HPS
      ///////// HPS /////////
      inout              HPS_CONV_USB_N,
      output      [14:0] HPS_DDR3_ADDR,
      output      [2:0]  HPS_DDR3_BA,
      output             HPS_DDR3_CAS_N,
      output             HPS_DDR3_CKE,
      output             HPS_DDR3_CK_N,
      output             HPS_DDR3_CK_P,
      output             HPS_DDR3_CS_N,
      output      [3:0]  HPS_DDR3_DM,
      inout       [31:0] HPS_DDR3_DQ,
      inout       [3:0]  HPS_DDR3_DQS_N,
      inout       [3:0]  HPS_DDR3_DQS_P,
      output             HPS_DDR3_ODT,
      output             HPS_DDR3_RAS_N,
      output             HPS_DDR3_RESET_N,
      input              HPS_DDR3_RZQ,
      output             HPS_DDR3_WE_N,
      output             HPS_ENET_GTX_CLK,
      inout              HPS_ENET_INT_N,
      output             HPS_ENET_MDC,
      inout              HPS_ENET_MDIO,
      input              HPS_ENET_RX_CLK,
      input       [3:0]  HPS_ENET_RX_DATA,
      input              HPS_ENET_RX_DV,
      output      [3:0]  HPS_ENET_TX_DATA,
      output             HPS_ENET_TX_EN,
      inout       [3:0]  HPS_FLASH_DATA,
      output             HPS_FLASH_DCLK,
      output             HPS_FLASH_NCSO,
      inout              HPS_GSENSOR_INT,
      inout              HPS_I2C1_SCLK,
      inout              HPS_I2C1_SDAT,
      inout              HPS_I2C2_SCLK,
      inout              HPS_I2C2_SDAT,
      inout              HPS_I2C_CONTROL,
      inout              HPS_KEY,
      inout              HPS_LED,
      inout              HPS_LTC_GPIO,
      output             HPS_SD_CLK,
      inout              HPS_SD_CMD,
      inout       [3:0]  HPS_SD_DATA,
      output             HPS_SPIM_CLK,
      input              HPS_SPIM_MISO,
      output             HPS_SPIM_MOSI,
      inout              HPS_SPIM_SS,
      input              HPS_UART_RX,
      output             HPS_UART_TX,
      input              HPS_USB_CLKOUT,
      inout       [7:0]  HPS_USB_DATA,
      input              HPS_USB_DIR,
      input              HPS_USB_NXT,
      output             HPS_USB_STP,
`endif /*ENABLE_HPS*/

      ///////// IRDA /////////
      input              IRDA_RXD,
      output             IRDA_TXD,

      ///////// KEY /////////
      input       [3:0]  KEY,

      ///////// LEDR /////////
      output      [9:0]  LEDR,

      ///////// PS2 /////////
      inout              PS2_CLK,
      inout              PS2_CLK2,
      inout              PS2_DAT,
      inout              PS2_DAT2,

      ///////// SW /////////
      input       [9:0]  SW,

      ///////// TD /////////
      input              TD_CLK27,
      input      [7:0]  TD_DATA,
      input             TD_HS,
      output             TD_RESET_N,
      input             TD_VS,

      ///////// VGA /////////
      output      [7:0]  VGA_B,
      output             VGA_BLANK_N,
      output             VGA_CLK,
      output      [7:0]  VGA_G,
      output             VGA_HS,
      output      [7:0]  VGA_R,
      output             VGA_SYNC_N,
      output             VGA_VS
);



//=======================================================
//  REG/WIRE declarations
//=======================================================


//	For Audio CODEC
wire		   AUD_CTRL_CLK;	//	For Audio Controller

//	For VGA Controller
wire		   VGA_CTRL_CLK;
wire  [9:0]	mVGA_R;
wire  [9:0]	mVGA_G;
wire  [9:0]	mVGA_B;
wire [19:0]	mVGA_ADDR;
wire [5:0]  Coord_X, Coord_Y;	//display coordinates

wire			mVGA_CLK;
wire	[9:0]	mRed;
wire	[9:0]	mGreen;
wire	[9:0]	mBlue;
wire			VGA_Read;	//	VGA data request

wire  [9:0] recon_VGA_R;
wire  [9:0] recon_VGA_G;
wire  [9:0] recon_VGA_B;

wire		   DLY_RST;
reg  [31:0]	Cont;
wire [23:0]	mSEG7_DIG;

wire			mDVAL;

//audio count
reg [31:0] audio_count;
reg        key1_reg;

//=======================================================
//  Structural coding
//=======================================================

// initial //  
	         
assign DRAM_DQ 			= 16'hzzzz;

assign AUD_ADCLRCK    	= 1'bz;     					
assign AUD_DACLRCK 		= 1'bz;     					
assign AUD_DACDAT 		= 1'bz;     					
assign AUD_BCLK 		   = 1'bz;     						
assign AUD_XCK 		   = 1'bz;     						
   						
assign FPGA_I2C_SDAT		= 1'bz;     						
assign FPGA_I2C_SCLK		= 1'bz; 


assign GPIO_A  		=	36'hzzzzzzzz;
assign GPIO_B  		=	36'hzzzzzzzz;

assign AUD_XCK	       =	AUD_CTRL_CLK;
assign AUD_ADCLRCK	 =	AUD_DACLRCK;

//	Enable TV Decoder
assign	TD_RESET_N	=	KEY[0];

//////////////////////////////
//
//	START:
//

assign	LEDR =	18'h0;

//7 segment LUT
SEG7_LUT_6 			u0	(.oSEG0(HEX0), .oSEG1(HEX1), .oSEG2(HEX2), .oSEG3(HEX3), .oSEG4(HEX4), .oSEG5(HEX5), .iDIG(mSEG7_DIG) );

//	Reset Delay Timer
Reset_Delay r0 ( .iCLK(CLOCK_50), .oRESET(DLY_RST));

//	 Audio VGA PLL clock							 
VGA_Audio_PLL u1(
		                .refclk(CLOCK_50),   //  refclk.clk
		                .rst(~DLY_RST),      //   reset.reset
		                .outclk_0(VGA_CTRL_CLK), // outclk0.clk
		                .outclk_1(AUD_CTRL_CLK), // outclk1.clk
		                .outclk_2(mVGA_CLK), // outclk2.clk
		                .locked()    //  locked.export);


	
assign VGA_CLK = VGA_CTRL_CLK;
VGA_Controller vga_ins(
			// not yet implemented in vga_controller
			.iCursor_RGB_EN(4'b0111),
			.oAddress(mVGA_ADDR),
			.oCoord_X(Coord_X),
			.oCoord_Y(Coord_Y),
			.iRed(mVGA_R),
			.iGreen(mVGA_G),
			.iBlue(mVGA_B),

			// Already Defined
			.iRST_n(DLY_RST),
                      .iVGA_CLK(VGA_CTRL_CLK),
                      .oBLANK_n(VGA_BLANK_N),
                      .oHS(VGA_HS),
                      .oVS(VGA_VS),
                      .b_data(VGA_B),
                      .g_data(VGA_G),
                      .r_data(VGA_R));
	
// After this part, a text generator is needed to store write locations in bits
// SRAM does not exist on this board.
//Down sample to 512x512 and use coordinates to get memory address
assign DRAM_ADDR = {1’b0, Coord_X[5:0],Coord_Y[5:0]} ;		// [12:0]

//assign SRAM_UB_N = 0;					// hi byte select enabled
//assign SRAM_LB_N = 0;					// lo byte select enabled
//assign SRAM_CE_N = 0;					// chip is enabled
//assign SRAM_OE_N = 0;					//output enable is overidden by WE
////assign SRAM_WE_N = 1;					// write when ZERO

// If KEY1 is not pressed, then float bus, so that SRAM can drive it (READ)
//assign SRAM_WE_N = (KEY[1]? 1'b1 : 1'b0);
//assign SRAM_DQ = (KEY[1]? 16'hzzzz : SW[15:0]);

// If KEY1 is pressed, drive it with data from SWITCHES[15:0] to be stored in SRAM (WRITE)
//assign SRAM_DQ = (KEY[1]? 16'hzzzz : 
			(KEY[2]?					//if key2 is up
			{Coord_X[8:5], 					//red
			Coord_Y[8:5] & ~{4{Coord_X[9]}},  		//green
			Coord_Y[8:5] & {4{Coord_X[9]}}, 		//blue
			 4'b0}						//not used 
			: SW[15:0])); 					//else write the switches

// Show memory on the LEDs and 7-seg display
//assign  mVGA_R = {SRAM_DQ[15:12], 6'b0} ;
//assign  mVGA_G = {SRAM_DQ[11:8], 6'b0} ;
//assign  mVGA_B = {SRAM_DQ[7:4], 6'b0} ;	

endmodule
