module fullAdder(                               //module named fullAdder. 8038
    output sum, carryOut,                       //gives output in sum and carryOut . 8038
    input carryIn, bit1, bit2                   //takes input from carryIn bit1 and bit2 . 8038
);

assign {carryOut,sum} = carryIn + bit1 + bit2;  //assigning value of carryIn + bit1 + bit2, to concatenation of carryout and sum . 8038


endmodule 	                                    //end of module fullAdder


module four_bit_signed_Adder(                   // module named four_bit_signed_Adder . 8038
    output [3:0]s,                              // 4 bit output s, with msb s[3]
    output zeroFlag, negFlag, overflowFlag, carryFlag,  //all necessaray flags
    input carryIn,                              //takes input from carryIn and 4Bit A and B, whose msb are A[4] and B[4], resp.  8038
    input [4:0]A,B          
);

wire carry4, carry3, carry2, carry1, carry0, s4; // intermdiate wires, in circuit. 8038

fullAdder fa0( s[0],carry0, carryIn, A[0] , B[0]);      //fa0 is an intance of fullAdder .8038
fullAdder fa1( s[1],carry1, carry0, A[1] , B[1]);       //fa1       ''            ''     '' 
fullAdder fa2( s[2],carry2, carry1, A[2] , B[2]);       //fa2       ''            ''     '' 
fullAdder fa3( s[3],carry3, carry2, A[3] , B[3]);       //fa3       ''            ''     '' 
fullAdder fa4( s4,carry4, carry3, A[4] , B[4]);         //fa4       ''            ''     '' 


assign carryFlag = (carry4 == 1);                       // check if carry4==1 is truth value or not and then supply it to carryFlag . 8038
assign negFlag = (s4 == 1);                             // check if s4==1 is truth value or not and then supply it to negFlag. 8038
assign overflowFlag = (carry4 ^ carry3 == 1);           // check if carry4^carry3==1 is truth value or not and then supply it to overflowFlag. 8038
assign zeroFlag = (s == 0);                             // check if s == 0 is truth value or not and then supply it to zeroFlag. 8038

endmodule                                               //end of module four_bit_signed_Adder

