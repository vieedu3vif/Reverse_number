class Test;
	randc bit [15:0] num;
	constraint c {
		num inside {[1:9999]};
	}  
	task run();
		reverse_tb.intf.x = num;
	endtask : run
endclass : Test

module reverse_tb ();
	reverse_if intf();
	reverse dut (intf.DUT);

	always #5 intf.clk = ~intf.clk;
	Test test_reverse = new();
	function automatic logic reverse_number( logic [15:0] n);
		logic [15:0] result = 0;
		while (!n) begin
			result = result * 10 + n % 10;
			n = n /10; 
		end
		return result;
	endfunction : reverse_number
	property check_result;
		@(posedge intf.Done) disable iff (!intf.rst_n)
		##1 (intf.reverse == reverse_number(intf.x));
	endproperty

		assert property (check_result)
			else $error("reverse and result not match!");
	initial begin
	
		intf.clk = 0;
		intf.start = 0;
		intf.x = 0;
		for(int i = 0; i< 10; i++) begin
			if (test_reverse.randomize()) begin
				#25 intf.rst_n = 0;
				#10 intf.rst_n =1;
				#10 intf.start = 1;
				test_reverse.run();
				@(posedge intf.Done);
				#5
				$display("reverse num of %d = %d", intf.x, intf.reverse);
				intf.start = 0;
			end
			else $display("Failed",);
		end

		#20
		$finish;
	end
endmodule : reverse_tb