interface reverse_if ();
	logic clk;
	logic rst_n;
	logic Done;
	logic start;
	logic [15:0] reverse;
	logic [15:0] x;

	modport DUT (input clk, input rst_n, output Done, output start, output reverse, input x);
	modport TB (output clk, output rst_n, input Done, output start, input reverse, output x);
endinterface : reverse_if