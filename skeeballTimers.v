// Bradyn Hinman
// 3/22/2023
// Skeeball Timers

module highforfive(clk, reset, sense, state, y);
input clk, reset, sense;
output y;
output [3:0] state;

wire offSignal;

reg isHigh;

always @ (posedge sense or posedge offSignal)
	begin
		if (sense==1'b1)
			isHigh = 1'b1;
		else
			isHigh = 1'b0;
	end
	
myCount5 countforfive(clk&isHigh, reset, state, offSignal);
assign y = offSignal;

endmodule



module myCount5 (clk, Reset, state, Y);
	input clk, Reset;
	output [3:0] state;
	output Y;
	
	parameter s0=4'b0000;
	parameter s1=4'b0001;
	parameter s2=4'b0010;
	parameter s3=4'b0011;
	parameter s4=4'b0100;
	parameter s5=4'b0101;
	
	reg [3:0] pstate, nstate, laststate;
	
	always @ (posedge clk or posedge Reset)
		begin
			if (Reset==1'b1)
				begin
					pstate=s0;
					laststate=s0;
				end
			else
				begin
					laststate=pstate;
					pstate=nstate;
				end
		end
		
	always @ (*)
		case (pstate)
			s0: nstate=s1;
			s1: nstate=s2;
			s2: nstate=s3;
			s3: nstate=s4;
			s4: nstate=s5;
			s5: nstate=s0;
			default: nstate=s0;
			endcase
	
	assign Y = ((pstate==s0)&(laststate==s5)) ? 1'b1 : 1'b0;
	assign state = pstate;
	
	endmodule
	
	
	
module clk50MHzto1Hz(CLOCK_50, Reset, clk1Hz);
	input CLOCK_50, Reset;
	output clk1Hz;
	
	wire clk10MHz, clk1MHz, clk100kHz, clk10kHz, clk1kHz, clk100Hz, clk10Hz;
	
	my_MOD5 div5_1(CLOCK_50, Reset, clk10MHz);
	my_MOD10 div10_1(clk10MHz, Reset, clk1MHz);
	my_MOD10 div10_2(clk1MHz, Reset, clk100kHz);
	my_MOD10 div10_3(clk100kHz, Reset, clk10kHz);
	my_MOD10 div10_4(clk10kHz, Reset, clk1kHz);
	my_MOD10 div10_5(clk1kHz, Reset, clk100Hz);
	my_MOD10 div10_6(clk100Hz, Reset, clk10Hz);
	my_MOD10 div10_7(clk10Hz, Reset, clk1Hz);
	endmodule


module my_MOD10(clk, Reset, Y);
	input clk, Reset;
	output Y;
	
	parameter A=4'b0000;
	parameter B=4'b0001;
	parameter C=4'b0011;
	parameter D=4'b0010;
	parameter E=4'b0110;
	parameter F=4'b0101;
	parameter G=4'b0100;
	parameter H=4'b1100;
	parameter I=4'b1101;
	parameter J=4'b1111;
	
	reg [3:0] pstate, nstate;
	
	always @ (posedge clk or posedge Reset)
		begin
			if (Reset==1'b1) pstate=A;
			else pstate=nstate;
		end
	
	always @ (*)
		case (pstate)
			A: nstate=B;
			B: nstate=C;
			C: nstate=D;
			D: nstate=E;
			E: nstate=F;
			F: nstate=G;
			G: nstate=H;
			H: nstate=I;
			I: nstate=J;
			J: nstate=A;
			default: nstate=A;
			endcase
	
	assign Y = (pstate==J) ? 1'b1 : 1'b0;
	
	endmodule

	
	
	
module my_MOD5(clk, Reset, Y);
	input clk, Reset;
	output Y;
	
	parameter A=4'b0000;
	parameter B=4'b0001;
	parameter C=4'b0011;
	parameter D=4'b0010;
	parameter E=4'b0110;
	
	reg [3:0] pstate, nstate;
	
	always @ (posedge clk or posedge Reset)
		begin
			if (Reset==1'b1) pstate=A;
			else pstate=nstate;
		end
	
	always @ (*)
		case (pstate)
			A: nstate=B;
			B: nstate=C;
			C: nstate=D;
			D: nstate=E;
			E: nstate=A;
			default: nstate=A;
			endcase
	
	assign Y = (pstate==E) ? 1'b1 : 1'b0;
	
	endmodule