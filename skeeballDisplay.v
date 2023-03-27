// Bradyn Hinman
// 3/15/2023
// Skeeball Display

module skeeballDisplay(state, score, HEX5, HEX4, HEX3, HEX2, HEX1, HEX0);
	input [1:0] state;
	input [7:0] score;
	output [6:0] HEX5, HEX4, HEX3, HEX2, HEX1, HEX0;

	reg [7:0] highscore, lastscore;
	
	wire[6:0] high10s, high1s, score10s, score1s, last10s, last1s;
	
	parameter dispf = 7'b0001110;
	parameter dispi = 7'b1001111;
	parameter dispn = 7'b0101011;
	parameter disps = 7'b0010010;
	parameter disph = 7'b0001001;
	parameter disp_ = 7'b1111111;
	parameter dispc = 7'b0100111;
	
	parameter disp0 = 7'b1000000;
	
	always @ (posedge state[1])
		begin
			lastscore = score;
			if (score > highscore) highscore = score;
		end
	
	hexDisplay highDisplays(highscore, high10s, high1s);
	hexDisplay scoreDisplays(score, score10s, score1s);
	hexDisplay lastDisplays(lastscore, last10s, last1s);
	
	skeeballHex dispHex5(state, disph, disps, dispf, disps, HEX5);
	skeeballHex dispHex4(state, dispi, dispc, dispi, dispc, HEX4);
	skeeballHex dispHex3(state, disp_, disp_, dispn, disp_, HEX3);
	skeeballHex dispHex2(state, high10s, score10s, dispi, last10s, HEX2);
	skeeballHex dispHex1(state, high1s, score1s, disps, last1s, HEX1);
	skeeballHex dispHex0(state, disp0, disp0, disph, disp0, HEX0);
	
endmodule


module skeeballHex(state, highDisp, scoreDisp, finishDisp, lastDisp, HEXout);
	input [1:0] state;
	input [6:0] highDisp, scoreDisp, finishDisp, lastDisp;
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


module hexDisplay(score, hex10s, hex1s);
	input [7:0] score;
	output [6:0] hex10s, hex1s;
	
	reg [6:0] hex10s, hex1s;
	
	parameter disp0 = 7'b1000000;
	parameter disp1 = 7'b1111001;
	parameter disp2 = 7'b0100100;
	parameter disp3 = 7'b0110000;
	parameter disp4 = 7'b0011001;
	parameter disp5 = 7'b0010010;
	parameter disp6 = 7'b0000010;
	parameter disp7 = 7'b1111000;
	parameter disp8 = 7'b0000000;
	parameter disp9 = 7'b0010000;
	
	parameter dispError = 7'b0000110;
	
	always @ (*)
		begin
			case(score[7:4])
				4'b0000: hex10s = disp0;
				4'b0001: hex10s = disp1;
				4'b0010: hex10s = disp2;
				4'b0011: hex10s = disp3;
				4'b0100: hex10s = disp4;
				4'b0101: hex10s = disp5;
				4'b0110: hex10s = disp6;
				4'b0111: hex10s = disp7;
				4'b1000: hex10s = disp8;
				4'b1001: hex10s = disp9;
				default: hex10s = dispError;
			endcase
			
			case(score[3:0])
				4'b0000: hex1s = disp0;
				4'b0001: hex1s = disp1;
				4'b0010: hex1s = disp2;
				4'b0011: hex1s = disp3;
				4'b0100: hex1s = disp4;
				4'b0101: hex1s = disp5;
				4'b0110: hex1s = disp6;
				4'b0111: hex1s = disp7;
				4'b1000: hex1s = disp8;
				4'b1001: hex1s = disp9;
				default: hex1s = dispError;
			endcase
		end
endmodule