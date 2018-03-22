module newspaper(R,N1,D1,D2,Q,D,N,clk);
import states::*;
output R,N1,D1,D2;
input Q,D,N,clk;
reg [3:0] state,nextstate;
reg R,N1,D1,D2;
initial begin
	state <= 3'b000;
	nextstate <= 3'b000;
	R <= 1'b0;
	N1 <= 1'b0;
	D1 <= 1'b0;
	D2 <= 1'b0;
end

always @(posedge clk) begin
	case(state)
	S0: 	if(Q)  begin nextstate <= S25; R <= 1'b0; {N1,D1,D2} <= 3'b000; end
		else if(D) begin nextstate <= S10; R <= 1'b0; {N1,D1,D2} <= 3'b000; end
		else if(N) begin nextstate <= S5;  R <= 1'b0; {N1,D1,D2} <= 3'b000; end
	S5:	if(Q)      begin nextstate <= S30; R <= 1'b0; {N1,D1,D2} <= 3'b000; end
		else if(D) begin nextstate <= S15; R <= 1'b0; {N1,D1,D2} <= 3'b000; end
		else if(N) begin nextstate <= S10; R <= 1'b0; {N1,D1,D2} <= 3'b000; end
	S10:	if(Q)  begin nextstate <= S0;  R <= 1'b1; {N1,D1,D2} <= 3'b000; end
		else if(D) begin nextstate <= S20; R <= 1'b0; {N1,D1,D2} <= 3'b000; end
		else if(N) begin nextstate <= S15; R <= 1'b0; {N1,D1,D2} <= 3'b000; end
	S15:	if(Q)  begin nextstate <= S0;  R <= 1'b1; {N1,D1,D2} <= 3'b000; end
		else if(D) begin nextstate <= S25; R <= 1'b0; {N1,D1,D2} <= 3'b000; end
		else if(N) begin nextstate <= S20; R <= 1'b0; {N1,D1,D2} <= 3'b000; end
	S20:	if(Q)  begin nextstate <= S0;  R <= 1'b1; {N1,D1,D2} <= 3'b010; end
		else if(D) begin nextstate <= S30; R <= 1'b0; {N1,D1,D2} <= 3'b000; end
		else if(N) begin nextstate <= S25; R <= 1'b0; {N1,D1,D2} <= 3'b000; end
	S25:	if(Q)  begin nextstate <= S0;  R <= 1'b1; {N1,D1,D2} <= 3'b110; end
		else if(D) begin nextstate <= S0;  R <= 1'b1; {N1,D1,D2} <= 3'b000; end
		else if(N) begin nextstate <= S30; R <= 1'b0; {N1,D1,D2} <= 3'b000; end
	S30:	if(Q)  begin nextstate <= S0;  R <= 1'b1; {N1,D1,D2} <= 3'b001; end
		else if(D) begin nextstate <= S0;  R <= 1'b1; {N1,D1,D2} <= 3'b100; end
		else if(N) begin nextstate <= S0;  R <= 1'b1; {N1,D1,D2} <= 3'b000; end
	endcase
	state <= nextstate;
end

endmodule