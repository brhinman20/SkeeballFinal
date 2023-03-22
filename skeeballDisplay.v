// Bradyn Hinman
// 3/15/2023
// Skeeball Display

module skeeballDisplay(state, score, HEX5, HEX4, HEX3, HEX2, HEX1, HEX0);
	input [1:0] state;
	input [7:0] score;
	output [6:0] HEX5, HEX4, HEX3, HEX2, HEX1, HEX0;

	reg [7:0] highscore, lastscore;
	
	parameter dispf = 7'b0000000;
	parameter dispi = 7'b0000000;
	parameter dispn = 7'b0000000;
	parameter disps = 7'b0000000;
	parameter disph = 7'b0000000;
	parameter disp_ = 7'b0000000;
	
	
	
endmodule


module skeeballHex(state, highDisp, scoreDisp, finishDisp, lastDisp, HEXout);
	input [1:0] state;
	input [6:0] highDisp, scoreDisp, finishDisp, lastDisp,;
	output [6:0] HEXout;

	reg [6:0] HEXout;
	
	always @ (*)
	begin
		case(state)
			2'b00: HEXout = highDisp; // Start Menu
			2'b01: HEXout = scoreDisp; // Playing
			2'b10: HEXout = finishDisp; // Finish
			default: HEXout = lastDisp; // Last Score
			endcase
	end
	
endmodule
