// Bradyn Hinman
// 3/15/2023
// Skeeball Score

module skeeballScore(playstate, clk, in0, in10, in20, in30, in40, in50, in100, score);
	input playstate, in0, in10, in20, in30, in40, in50, in100, clk;
	output [7:0] score;
	
	wire [6:0] points;
	assign points[6] = in100;
	assign points[5] = in50;
	assign points[4] = in40;
	assign points[3] = in30;
	assign points[2] = in20;
	assign points[1] = in10;
	assign points[0] = in0;
	
	reg [6:0] score10s, score1s;
	reg [6:0] tempSum;
	reg [7:0] adderPoints;
	
	assign score[7:4] = score10s[3:0];
	assign score[3:0] = score1s[3:0];
	
	always @ (posedge clk)
		begin
				if (playstate == 1'b0)
					begin
						score10s = 6'b000000;
						score1s = 6'b000000;
					end
				else
					begin
						casex(points)
							7'b1XXXXXX: score10s = score10s + 6'b000001; // 10
							7'b01XXXXX: begin
								tempSum = score1s + 6'b000101; // 5
								if (tempSum > 6'b001001)
									begin
										tempSum = tempSum + 6'b000110;
										score10s = score10s + 6'b000001;
										score1s = tempSum[4:0];
									end
								else score1s = tempSum[4:0];
								end
							7'b001XXXX: begin
								tempSum = score1s + 6'b00100; // 4
								if (tempSum > 6'b001001)
									begin
										tempSum = tempSum + 6'b000110;
										score10s = score10s + 6'b000001;
										score1s = tempSum[4:0];
									end
								else score1s = tempSum[4:0];
								end
							7'b0001XXX: begin
								tempSum = score1s + 6'b000011; // 3
								if (tempSum > 6'b001001)
									begin
										tempSum = tempSum + 6'b000110;
										score10s = score10s + 6'b000001;
										score1s = tempSum[4:0];
									end
								else score1s = tempSum[4:0];
								end
							7'b00001XX: begin
								tempSum = score1s + 6'b000010; // 2
								if (tempSum > 6'b001001)
									begin
										tempSum = tempSum + 6'b000110;
										score10s = score10s + 6'b000001;
										score1s = tempSum[4:0];
									end
								else score1s = tempSum[4:0];
								end
							7'b000001X: begin
								tempSum = score1s + 6'b000001; // 1
								if (tempSum > 6'b001001)
									begin
										tempSum = tempSum + 6'b000110;
										score10s = score10s + 6'b000001;
										score1s = tempSum[4:0];
									end
								else score1s = tempSum[4:0];
								end
							default: score1s = score1s;
						endcase
					end
		end
	
endmodule