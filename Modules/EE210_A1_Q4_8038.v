				//Decimal to Gray code convertor in gate level modelling. 8038


module Decimal2Gray (				//This starts a module named Decimal2Gray  8038
	output [3:0] G, 			//with Output as G a 4 bit number (MSB G3) 8038
	input  [3:0] A 				//and Input as A a 4 bit number (MSB A3)   8038
	);
xor 	gate1(G[2],A[3],A[2]),			//gate1 , a xor gate , Input ->A[3] and A[2], Output G[2] 8038 	
	gate2(G[1],A[2],A[1]),			//gate2 , a xor gate , Input ->A[3] and A[2], Output G[2] 8038 
	gate3(G[0],A[1],A[0]);			//gate3 , a xor gate , Input ->A[3] and A[2], Output G[2] 8038 
buf 	gate4(G[3],A[3]);			//gate4 , a buffer   , Input ->A[3] and Output G[3] 8038 

endmodule 					//end of module Decimal2Gray    8038
