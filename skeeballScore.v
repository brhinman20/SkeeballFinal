// Bradyn Hinman
// 3/15/2023
// Skeeball Score

module skeeballScore(start, clk, in0, in10, in20, in30, in40, in50, in100, score);
	input start, in0, in10, in20, in30, in40, in50, in100, clk;
	output [7:0] score;
	
	reg [7:0] score;
	
	wire [6:0] points;
	assign points[6] = in100;
	assign points[5] = in50;
	assign points[4] = in40;
	assign points[3] = in30;
	assign points[2] = in20;
	assign points[1] = in10;
	assign points[0] = in0;
	
	reg [7:0] adderPoints;
	
	always @ (posedge clk)
		begin		
				casex(points)
				7'b1XXXXXX: adderPoints = 8'b00001010; // 10
				7'b01XXXXX: adderPoints = 8'b00000101; // 5
				7'b001XXXX: adderPoints = 8'b00000100; // 4
				7'b0001XXX: adderPoints = 8'b00000011; // 3
				7'b00001XX: adderPoints = 8'b00000010; // 2
				7'b000001X: adderPoints = 8'b00000001; // 1
				default: adderPoints = 8'b00000000; // 0
				endcase
				score = score+adderPoints;
		end
	
endmodule