module mux_2x1 ( 				//module named mux_2x1  8038
	output	mux_2x1_op,			//gives output as mux_2x1_op 8038
	input 	select, data1, data0		//takes select, data0, and data1 as input 8038
);
wire	w1 ,w2, w3;				//w1,w2,w3 are intermediate wires 8038
not 	not_gate(w1, select);			//not gate has ip->select and op->w1 8038
and 	and_gate1(w2, w1, data0),		//and_gate1 is AND gate with ip->(w1,data0) and op->w2 8038
	and_gate2(w3, select, data1);		//and gate2 is AND gate with ip->(select,data1) and op->w3 8038 
or 	or_gate(mux_2x1_op, w2, w3);		//or_gate is OR gate with input->(w2,w3) and op->mux_2x1_op 8038

endmodule 					//this ends module mux_2x1 8038


module mux_8x1 (				//module named mux_8x1 , it uses previous module to implement 8x1 mutlipexer 8038
	output mux_8x1_op,			//gives output as mux_8x1_op 8038
	input [7:0]D, [2:0]sel			//takes 8bit D, and 3 bit sel as input 8038
);

wire W1,W2,W3,W4,W5,W6;				//W1, W2, W3, W4, W5, W6 are intermediary wires 8038
mux_2x1	udp1(W1, sel[0], D[7], D[6]),		//udp1 is 2x1 mux with inputs (sel[0],D7,D6) and output as W1 wire 8038
	udp2(W2, sel[0], D[5], D[4]),		//udp2 is 2x1 mux with inputs (sel[0],D5,D4) and output as W2 wire 8038
	udp3(W3, sel[0], D[3], D[2]),		//udp3 is 2x1 mux with inputs (sel[0],D3,D2) and output as W3 wire 8038
	udp4(W4, sel[0], D[1], D[0]),		//udp4 is 2x1 mux with inputs (sel[0],D1,D0) and output as W4 wire 8038
	udp5(W5, sel[1], W1, W2),		//udp5 is 2x1 mux with inputs (sel[1],W1,W2) and output as W5 wire 8038
	udp6(W6, sel[1], W3, W4),		//udp6 is 2x1 mux with inputs (sel[1],W3,W4) and output as W6 wire 8038
	udp7(mux_8x1_op ,sel[2], W5, W6);	//udp7 is 2x1 mux with inputs (sel[2],W5,W6) and output as mux_8x1_op wire 8038


endmodule 					//this ends module mux_8x1 8038