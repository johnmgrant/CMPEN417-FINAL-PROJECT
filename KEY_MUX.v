module KEY_MUX
(
	input PS2_CLK,
	input PS2_DAT,
	output [9:0]LEDR,
	output [6:0]HEX0,
	output [6:0]HEX1
);
	reg [3:0]S = 4'b0001;
	reg [3:0]NS;
	reg [7:0]in1;
	reg [7:0]in2;
	reg [7:0]in3;
	reg [7:0]out;
	wire [7:0]scan_code;

	ps keyboard(PS2_CLK, PS2_DAT, scan_code, parity_error, rdy);
	KEY_DISP d0(out, HEX0[6:0]);
	Seg7Disp s0(S[3:0], HEX1[6:0]);
	//assign LEDR[7:0] = scan_code[7:0];
	assign LEDR[3:0] = S;
	assign LEDR[9:6] = NS;
	
	always@(scan_code[0], scan_code[1], scan_code[2], scan_code[3], scan_code[4], scan_code[5],
	        scan_code[6],scan_code[7])
	begin
		case(S)
			4'b0001: 
			begin
				NS <= 4'b0010;
				in1 <= scan_code;
			end
			4'b0010: 
			begin
				NS <= 4'b0100;
				in2 <= scan_code;
			end
			4'b0100: 
			begin
				NS <= 4'b1000;
				in3 <= scan_code;
			end
			4'b1000: 
			begin
				out <= in3;
				NS <= 4'b0001;
			end
			default: NS <= 4'b0001;
		endcase
	end
	
	always@(NS)
	begin
		S <= NS;
	end

endmodule

module KEY_DISP
(
	input [7:0]in,
	output reg [6:0]out
);

	always@(in)
	begin
		case(in)
			8'b10101110: out <= 7'b1000001; // UP
			8'b01001110: out <= 7'b0100000; // DOWN
			8'b11010110: out <= 7'b1000111; // LEFT
			8'b00101110: out <= 7'b1001111; // RIGHT
		endcase
	end

endmodule


module ps(clk,data,scan_code,parity_error,rdy); 
// Port declarations 
 input clk;              // PS_2 clock input 
 input data;             // PS_2 data input 
 output[7:0] scan_code;  // Scan_code output 
 output parity_error;    // Parity output 
 output rdy;             // Data ready output 
  
// Internal Variables  
 reg[9:0] register; 
 reg[3:0] counter; 
 reg parity_error, rdy; 
  
 assign scan_code = register[9:2]; 
 assign parity = register[1]; 
  
// PS/2 logic 
 always @ (negedge clk) 
  begin 
   register <= {register[8:0], data}; // receive data 
   if (counter == 4'b1011) 
     counter <= 4'b0000; 
   else 
     counter <= counter + 4'b1; 
  end 
  
// PS/2 parity logic 
 always @ (posedge clk) 
  begin 
   if (counter == 4'b1011) 
     if (!parity == ^scan_code) // parity check (odd parity) 
      rdy <= 1'b1; 
     else 
      parity_error <= 1'b1; 
   else  // not all 10 bits receiverd yet 
    begin 
     rdy <= 1'b0; 
     parity_error <= 1'b0; 
    end 
  end 
  
endmodule

module Seg7Disp
(
	input [3:0]a,
	output reg [6:0]d
);

	always@(a)
	begin
		case(a)
			4'b0000: d <= 7'b1000000;
			4'b0001: d <= 7'b1111001;
			4'b0010: d <= 7'b0100100;
			4'b0011: d <= 7'b0110000;
			4'b0100: d <= 7'b0011001;
			4'b0101: d <= 7'b0010010;
			4'b0110: d <= 7'b0000010;
			4'b0111: d <= 7'b1111000;
			4'b1000: d <= 7'b0000000;
			4'b1001: d <= 7'b0011000;
			4'b1010: d <= 7'b0001000;
			4'b1011: d <= 7'b0000011;
			4'b1100: d <= 7'b0100111;
			4'b1101: d <= 7'b0100001;
			4'b1110: d <= 7'b0000100;
			4'b1111: d <= 7'b0001110;
		endcase
	end

endmodule
