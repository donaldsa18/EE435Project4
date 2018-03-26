/*
* Problem 2 FSM
*
* Authors: Matthew Erhardt, Anthony Donaldson
* Date: 3/23/2018
*
*/
module prob2(Z1,Z2,X,clk);
	import prob2states::*;
	output Z1,Z2;
	input X,clk;

	reg [3:0] state,nextstate;
	reg Z1,Z2;

	initial begin
		state = 3'b000;
		nextstate = 3'b000;
		{Z1,Z2} = 2'b00;
	end
	always @(posedge clk) begin
		case(state)
		S0: begin nextstate = X ? S3 : S1; {Z1,Z2} = 2'b00; end
		S1: begin nextstate = X ? S2 : S1; {Z1,Z2} = 2'b00; end
		S2: begin nextstate = X ? S3 : S4; {Z1,Z2} = X ? 2'b00 : 2'b10; end
		S3: begin nextstate = X ? S3 : S4; {Z1,Z2} = 2'b00; end
		S4: begin nextstate = X ? S2 : S5; {Z1,Z2} = X ? 2'b00 : 2'b01; end
		S5: begin nextstate = X ? S6 : S5; {Z1,Z2} = 2'b00; end
		S6: begin nextstate = X ? S6 : S7; {Z1,Z2} = 2'b00; end
		S7: begin nextstate = X ? S6 : S5; {Z1,Z2} = X ? 2'b00 : 2'b01; end
		endcase
		state = nextstate;
	end
endmodule