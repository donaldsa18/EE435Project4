/*
* Problem 2 testbench
*
* Authors: Matthew Erhardt, Anthony Donaldson
* Date: 3/23/2018
*
*/
module prob2_tb;
	reg X,clk;
	wire Z1,Z2;
	prob2 prb(Z1,Z2,X,clk);
	initial begin
		clk = 1'b1;
		forever #5 clk = !clk;
	end

	initial begin
			X = 1'b0;
		#10 X = 1'b0;
		#10 X = 1'b1;
		#10 X = 1'b0;//Z1 at 30
		#10 X = 1'b1;
		#10 X = 1'b0;
		#10 X = 1'b0;//Z2 at 60
		#10 X = 1'b1;
		#10 X = 1'b0;
		#10 X = 1'b0;//Z2 at 90
		#10 X = 1'b1;
		#10 X = 1'b0;//nothing should happen
		#10 X = 1'b1;
		#10 X = 1'b0;//nothing should happen
		#10 $finish;
	end

	initial
		$monitor($stime,Z1,Z2,X,clk);
endmodule