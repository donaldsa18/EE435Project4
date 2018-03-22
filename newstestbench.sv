<<<<<<< HEAD
`timescale 1ns / 1ns

module news_tb;
reg N,D,Q,clk;
wire R,N1,D1,D2;
newspaper news(R,N1,D1,D2,N,D,Q,clk);
initial
begin
	clk = 0;
	forever #5 clk = !clk;
end

initial
begin
	    {N,D,Q} = 3'b000;
	#10 {N,D,Q} = 3'b010; //10 cents
	#10	{N,D,Q} = 3'b000;
	#10 {N,D,Q} = 3'b001; //35 cents, done
	#10	{N,D,Q} = 3'b000;
	#10 {N,D,Q} = 3'b100; //5 cents
	#10	{N,D,Q} = 3'b000;
	#10 {N,D,Q} = 3'b010; //15 cents
	#10	{N,D,Q} = 3'b000;
	#10 {N,D,Q} = 3'b100; //20 cents
	#10	{N,D,Q} = 3'b000;
	#10 {N,D,Q} = 3'b100; //25 cents
	#10 {N,D,Q} = 3'b001; //50cents, so return 15 (dime and nickel)
	
	#10	{N,D,Q} = 3'b001; //Quarter
	#10	{N,D,Q} = 3'b000;
	#10	{N,D,Q} = 3'b100; //Nickel
	#10	{N,D,Q} = 3'b000;
	#10	{N,D,Q} = 3'b001; //Quarter, so return 20 (2 dimes)
	#30 $finish;
end

initial
	$monitor($stime,R,N1,D1,D2,N,D,Q,clk);
	
endmodule