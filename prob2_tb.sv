module prob2_tb;
reg X,clk;
wire Z1,Z2;
prob2 prb(Z1,Z2,X,clk);
initial begin
	clk = 1'b0;
	forever #5 clk = !clk;
end

initial begin
		X = 1'b0;
	#10 X = 1'b0;
	#10 X = 1'b1;
	#10 X = 1'b0;//Z1
	#10 X = 1'b1;
	#10 X = 1'b0;
	#10 X = 1'b0;//Z2
	#10 X = 1'b1;
	#10 X = 1'b0;
	#10 X = 1'b0;//Z2
	#10 X = 1'b1;
	#10 X = 1'b0;//nothing should happen
	#10 X = 1'b1;
	#10 X = 1'b0;//nothing should happen
	#10 $finish;
end

initial
	monitor($stime,Z1,Z2,X,clk);
endmodule