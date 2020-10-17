	//Test bench for mux_8x1
module t_2_to_8_mux;		//module named t_2_to_8_mux 8038
wire mux_op;			//local output is mux_op 8038
reg [7:0] I;			//local input is 8 bit I 8038
reg [2:0] sel;			//local input is 3bit sel 8038 

mux_8x1 uut(mux_op, I, sel);	//unit under test is mux_8x1 8038
initial begin			//start of test block
	I = 8'bxxxxxxx1;	//I is given a 8bit value , with I[0] as 1, rest as dont cares 8038
        sel = 3'b000;		// sel is given a 3bit value of 000
end				//end of test block


initial begin 			//start of test block (to monitor)
	$monitor("Select Inputs(S2 S1 S0) : %b , dataInputs : %b,   8X1 MUX OUTPUT: %b", sel, I, mux_op);  //to monitor changes in values of sel, I and final output of test mux_op 8038

end				//end of test block

endmodule			//end of module t_2_to_8_mux

