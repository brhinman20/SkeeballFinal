// Bradyn Hinman
// 3/15/2023
// Testing Files

module testStart(key, start);
	input key;
	output start;
	
	reg start;
	
	always @ (posedge key)
		begin
			start = 1;
			start = 0;
		end

	endmodule