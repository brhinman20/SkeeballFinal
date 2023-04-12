// Bradyn Hinman
// 4/12/2023
// Debouncer

module skeeballDebounce(clk, insig, outsig);
   input clk, insig;
	output outsig;
	
	reg outsig;
	reg tempsig; // Signal delayed by one clock cycle
 
	always @ (posedge clk)
	begin
		tempsig  <= insig;          
		outsig <= insig & ~tempsig;
	end

endmodule