// Bradyn Hinman
// 3/15/2023
// Skeeball Score

module skeeballScore(playstate, clk, ballclk, in0, in10, in20, in30, in40, in50, in100, score);
	input playstate, in0, in10, in20, in30, in40, in50, in100, clk, ballclk;
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
	
	reg carry;
	reg [3:0] score10s, score1s;
	reg [7:0] adderPoints;
	
	
	always @ (negedge ballclk)
	begin
		score[7:4] = score10s[3:0];
		score[3:0] = score1s[3:0];
	end
	
	always @ (posedge clk)
		begin
				if (playstate == 1'b0)
					begin
						score10s = 4'b0000;
						score1s = 4'b0000;
					end
				else
					begin
						casex(points)
							7'b1XXXXXX: begin // 100
									carry = 1'b1;
								end
							7'b01XXXXX: begin // 50
									case(score[3:0])
										4'b0000: begin // 0
												score1s = 4'b0101;
												carry = 1'b0;
											end
										4'b0001: begin // 1
												score1s = 4'b0110;
												carry = 1'b0;
											end
										4'b0010: begin // 2
												score1s = 4'b0111;
												carry = 1'b0;
											end
										4'b0011: begin // 3
												score1s = 4'b1000;
												carry = 1'b0;
											end
										4'b0100: begin // 4
												score1s = 4'b1001;
												carry = 1'b0;
											end
										4'b0101: begin // 5
												score1s = 4'b0000;
												carry = 1'b1;
											end
										4'b0110: begin // 6
												score1s = 4'b0001;
												carry = 1'b1;
											end
										4'b0111: begin // 7
												score1s = 4'b0010;
												carry = 1'b1;
											end
										4'b1000: begin // 8
												score1s = 4'b0011;
												carry = 1'b1;
											end
										4'b1001: begin // 9
												score1s = 4'b0100;
												carry = 1'b1;
											end
										default: begin // Error, rollover
												score1s = 4'b1111;
											end
									endcase
								end
							7'b001XXXX: begin // 40
									case(score[3:0])
										4'b0000: begin // 0
												score1s = 4'b0100;
												carry = 1'b0;
											end
										4'b0001: begin // 1
												score1s = 4'b0101;
												carry = 1'b0;
											end
										4'b0010: begin // 2
												score1s = 4'b0110;
												carry = 1'b0;
											end
										4'b0011: begin // 3
												score1s = 4'b0111;
												carry = 1'b0;
											end
										4'b0100: begin // 4
												score1s = 4'b1000;
												carry = 1'b0;
											end
										4'b0101: begin // 5
												score1s = 4'b1001;
												carry = 1'b0;
											end
										4'b0110: begin // 6
												score1s = 4'b0000;
												carry = 1'b1;
											end
										4'b0111: begin // 7
												score1s = 4'b0001;
												carry = 1'b1;
											end
										4'b1000: begin // 8
												score1s = 4'b0010;
												carry = 1'b1;
											end
										4'b1001: begin // 9
												score1s = 4'b0011;
												carry = 1'b1;
											end
										default: begin // Error, rollover
												score1s = 4'b1111;
											end
									endcase
								end
							7'b0001XXX: begin // 30
									case(score[3:0])
										4'b0000: begin // 0
												score1s = 4'b0011;
												carry = 1'b0;
											end
										4'b0001: begin // 1
												score1s = 4'b0100;
												carry = 1'b0;
											end
										4'b0010: begin // 2
												score1s = 4'b0101;
												carry = 1'b0;
											end
										4'b0011: begin // 3
												score1s = 4'b0110;
												carry = 1'b0;
											end
										4'b0100: begin // 4
												score1s = 4'b0111;
												carry = 1'b0;
											end
										4'b0101: begin // 5
												score1s = 4'b1000;
												carry = 1'b0;
											end
										4'b0110: begin // 6
												score1s = 4'b1001;
												carry = 1'b0;
											end
										4'b0111: begin // 7
												score1s = 4'b0000;
												carry = 1'b1;
											end
										4'b1000: begin // 8
												score1s = 4'b0001;
												carry = 1'b1;
											end
										4'b1001: begin // 9
												score1s = 4'b0010;
												carry = 1'b1;
											end
										default: begin // Error, rollover
												score1s = 4'b1111;
											end
									endcase
								end
							7'b00001XX: begin // 20
									case(score[3:0])
										4'b0000: begin // 0
												score1s = 4'b0010;
												carry = 1'b0;
											end
										4'b0001: begin // 1
												score1s = 4'b0011;
												carry = 1'b0;
											end
										4'b0010: begin // 2
												score1s = 4'b0100;
												carry = 1'b0;
											end
										4'b0011: begin // 3
												score1s = 4'b0101;
												carry = 1'b0;
											end
										4'b0100: begin // 4
												score1s = 4'b0110;
												carry = 1'b0;
											end
										4'b0101: begin // 5
												score1s = 4'b0111;
												carry = 1'b0;
											end
										4'b0110: begin // 6
												score1s = 4'b1000;
												carry = 1'b0;
											end
										4'b0111: begin // 7
												score1s = 4'b1001;
												carry = 1'b0;
											end
										4'b1000: begin // 8
												score1s = 4'b0000;
												carry = 1'b1;
											end
										4'b1001: begin // 9
												score1s = 4'b0001;
												carry = 1'b1;
											end
										default: begin // Error, rollover
												score1s = 4'b1111;
											end
									endcase
								end
							7'b000001X: begin // 10
									case(score[3:0])
										4'b0000: begin // 0
												score1s = 4'b0001;
												carry = 1'b0;
											end
										4'b0001: begin // 1
												score1s = 4'b0010;
												carry = 1'b0;
											end
										4'b0010: begin // 2
												score1s = 4'b0011;
												carry = 1'b0;
											end
										4'b0011: begin // 3
												score1s = 4'b0100;
												carry = 1'b0;
											end
										4'b0100: begin // 4
												score1s = 4'b0101;
												carry = 1'b0;
											end
										4'b0101: begin // 5
												score1s = 4'b0110;
												carry = 1'b0;
											end
										4'b0110: begin // 6
												score1s = 4'b0111;
												carry = 1'b0;
											end
										4'b0111: begin // 7
												score1s = 4'b1000;
												carry = 1'b0;
											end
										4'b1000: begin // 8
												score1s = 4'b1001;
												carry = 1'b0;
											end
										4'b1001: begin // 9
												score1s = 4'b0000;
												carry = 1'b1;
											end
										default: begin // Error, rollover
												score1s = 4'b1111;
											end
									endcase
								end
							default: begin
									score1s = score[3:0];
								end
						endcase
						if(carry == 1'b1) begin
								case(score[7:4])
										4'b0000: begin // 0
												score10s = 4'b0001;
											end
										4'b0001: begin // 1
												score10s = 4'b0010;
											end
										4'b0010: begin // 2
												score10s = 4'b0011;
											end
										4'b0011: begin // 3
												score10s = 4'b0100;
											end
										4'b0100: begin // 4
												score10s = 4'b0101;
											end
										4'b0101: begin // 5
												score10s = 4'b0110;
											end
										4'b0110: begin // 6
												score10s = 4'b0111;
											end
										4'b0111: begin // 7
												score10s = 4'b1000;
											end
										4'b1000: begin // 8
												score10s = 4'b1001;
											end
										4'b1001: begin // 9, rollover
												score10s = 4'b0000;
											end
										default: begin // Error, rollover
												score10s = 4'b1111;
											end
								endcase
								carry = 1'b0;
							end
						else
							begin
									score10s = score[7:4];
							end
					end
		end
	
endmodule