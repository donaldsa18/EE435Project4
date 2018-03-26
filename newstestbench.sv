/*
* News testbench
*
* Authors: Matthew Erhardt, Anthony Donaldson
* Date: 3/23/2018
*
*/
`timescale 1ns / 1ns

module news_tb;
reg N,D,Q,clk;
wire R,N1,D1,D2;
newspaper news(R,N1,D1,D2,Q,D,N,clk);
initial
begin
	clk = 1;
	forever #5 clk = !clk;
end

initial
begin
	    {N,D,Q} = 3'b000;
	#10 {N,D,Q} = 3'b010; //10 cents
	#10	{N,D,Q} = 3'b000;
	#10 {N,D,Q} = 3'b001; //35 cents, return at 30
	#10	{N,D,Q} = 3'b000;
	#10 {N,D,Q} = 3'b100; //5 cents at 50
	#10	{N,D,Q} = 3'b000;
	#10 {N,D,Q} = 3'b010; //15 cents at 70
	#10	{N,D,Q} = 3'b000;
	#10 {N,D,Q} = 3'b100; //20 cents at 90
	#10	{N,D,Q} = 3'b000;
	#10 {N,D,Q} = 3'b100; //25 cents at 110
	#10 {N,D,Q} = 3'b001; //50 cents, return dime and nickel at 120
	#10	{N,D,Q} = 3'b001; //Quarter at 130
	#10	{N,D,Q} = 3'b000;
	#10	{N,D,Q} = 3'b100; //Nickel at 150
	#10	{N,D,Q} = 3'b000;
	#10	{N,D,Q} = 3'b001; //Quarter, return 2 dimes at 170
	#10	{N,D,Q} = 3'b000;
	#10 $finish;
end

initial
	$monitor($stime,R,N1,D1,D2,N,D,Q,clk);
	
endmodule