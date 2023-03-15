// Bradyn Hinman
// 3/15/2023
// Skeeball Score

module skeeballScore(start, in0, in10, in20, in30, in40, in50, in100, balls, score);
	input start, in0, in10, in20, in30, in40, in50, in100;
	output [6:0] score;
	output [8:0] balls;
	
	reg [7:0] score;
	reg [8:0] balls;
	
	wire [6:0] points;
	assign points[6] = in100;
	assign points[5] = in50;
	assign points[4] = in40;
	assign points[3] = in30;
	assign points[2] = in20;
	assign points[1] = in10;
	assign points[0] = in0;
	
	reg [3:0] adderPoints;
	
	parameter balls9 = 9'b111111111;
	parameter balls8 = 9'b011111111;
	parameter balls7 = 9'b001111111;
	parameter balls6 = 9'b000111111;
	parameter balls5 = 9'b000011111;
	parameter balls4 = 9'b000001111;
	parameter balls3 = 9'b000000111;
	parameter balls2 = 9'b000000011;
	parameter balls1 = 9'b000000001;
	parameter balls0 = 9'b000000000;
	
	
	always @ (posedge start or posedge points[6] or posedge points[5] or posedge points[4] or posedge points[3] or posedge points[2] or posedge points[1] or posedge points[0])
		begin
			if (start==1'b1)
				begin
					balls=balls9;
					score=8'b0000000;
				end
			else begin
				case(balls)
					balls9: balls = balls8;
					balls8: balls = balls7;
					balls7: balls = balls6;
					balls6: balls = balls5;
					balls5: balls = balls4;
					balls4: balls = balls3;
					balls3: balls = balls2;
					balls2: balls = balls1;
					balls1: balls = balls0;
					default: balls = balls4;
				endcase
				
				casex(points)
				7'b1XXXXXX: adderPoints = 5'b01010; // 10
				7'b01XXXXX: adderPoints = 5'b00101; // 5
				7'b001XXXX: adderPoints = 5'b00100; // 4
				7'b0001XXX: adderPoints = 5'b00011; // 3
				7'b00001XX: adderPoints = 5'b00010; // 2
				7'b000001X: adderPoints = 5'b00001; // 1
				default: adderPoints = 5'b00000; // 0
				endcase
				score = score+adderPoints;
			end
		end
	
endmodule