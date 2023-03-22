// Bradyn Hinman
// 3/15/2023
// Skeeball State Machine

module skeeballState(trigger, state);
	input trigger;
	output [1:0] state;
	
	reg [1:0] state;
	
	always @ (posedge trigger)
		begin
		case(state)
			2'b00: state = 2'b01; // Start Menu > Playing
			2'b01: state = 2'b10; // Playing > Finish
			2'b10: state = 2'b11; // Finish > Last Score
			default: state = 2'b00; // Last Score > Start Menu
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