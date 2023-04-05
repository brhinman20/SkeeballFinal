// Bradyn Hinman
// 3/15/2023
// Skeeball State Machine

module skeeballState(clk, trigger, state);
	input clk, trigger;
	output [1:0] state;
	
	reg [1:0] state;
	
	always @ (posedge clk)
		begin
		case(state)
			2'b00: if(trigger) state = 2'b01; // Start Menu > Playing
			2'b01: if(trigger) state = 2'b10; // Playing > Finish
			2'b10: if(trigger) state = 2'b11; // Finish > Last Score
			default: if(trigger) state = 2'b00; // Last Score > Start Menu
			endcase
		end
endmodule

module skeeballStateDecode(state, menuState, playingState, finishState, scoreState);
	input [1:0] state;
	output menuState, playingState, finishState, scoreState;
	
	assign menuState = ~state[1] & ~state[0];
	assign playingState = ~state[1] & state[0];
	assign finishState = state[1] & ~state[0];
	assign scoreState = state[1] & state[0];
	
endmodule