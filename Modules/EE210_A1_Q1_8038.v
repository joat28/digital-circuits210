module mintermImplementation (          // module named mintermImplementation , here function is sum(0,1,3,8,9)  8038
    output Q,                           // gives output as port Q 8038 
    input [3:0]A                        // takes input from port A, which is 4bit number with msb A[3] and lsb A[0] 8038
    );
wire w1,w2,w3,w4,w5,w6;                 //w1,w2,w3,w3,w5,w6 are intermediate wires 8038


                                       //----NOT GATES---- 8038

not not_gate1(w1,A[3]),                 //not_gate1 takes input as A[3] and gives output in w1. 8038
    not_gate2(w2,A[2]),                 //not_gate2 takes input as A[2] and gives output in w2. 8038
    not_gate3(w3,A[1]);                 //not_gate3 takes input as A[1] and gives output in w3. 8038


                                        //----AND GATES---- 8038 

and and_gate1(w4,w1,w2,A[0]),           //and_gate1 takes input A[0],w2,w1 and gives output in w4. 8038
    and_gate2(w5,w2,w3);                //and_gate2 takes input w3,w2 and gives output in w5. 8038


                                        //-----OR GATE---- 8038
or or_gate(Q,w4,w5);                    //or_gate takes input w4 and w5 and gives output in Q.  8038

endmodule                               //end of module mintermImplementation 8038