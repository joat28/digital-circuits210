module overlappingSequenceDetector(                     // module named overlapping sequence detector. 8038
    output reg y_out,                                   // gives output ( register ) as y_out. 8038
    input x_in, clock, reset                            // takes input from x_in, clock and reset. Resets the state to initial state S0. 8038
);
reg [2:0] state, next_state;                            // 3bit registers state and next_state. 8038

parameter S0 = 3'b000,S1 = 3'b001,S2 = 3'b010,S3 = 3'b011,S4 = 3'b100,S5 = 3'b101,S6 = 3'b110;  // we define basic parameters so as to make comparision easier. SX stands for state 3'dX.  8038



always @(posedge clock, negedge reset)                  //check changes, for clock (postive edge), or for reset (negative edge). 8038
    if(!reset) state <= S0;                             // if reset is 0 set state value to initial state S0. 8038
    else state <= next_state;                           // otherwise set state value to next_state value. 8038


always @(state, x_in)                                   //check for changes in state or x_in and find next_state based on these 2 values. 8038                                  
    case(state)                                         // case begins on state.

        S0 :  if(x_in) next_state = S0; else next_state = S1;   // when input is 1 next_state is S0 else next_state is S1. 8038
        S1 :  if(x_in) next_state = S2; else next_state = S1;   // when input is 1 next_state is S2 else next_state is S1. 8038
        S2 :  if(x_in) next_state = S0; else next_state = S3;   // when input is 1 next_state is S0 else next_state is S3. 8038
        S3 :  if(x_in) next_state = S3; else next_state = S4;   // when input is 1 next_state is S3 else next_state is S4. 8038
        S4 :  if(x_in) next_state = S5; else next_state = S1;   // when input is 1 next_state is S5 else next_state is S1. 8038
        S5 :  if(x_in) next_state = S6; else next_state = S3;   // when input is 1 next_state is S6 else next_state is S3. 8038
        S6 :  if(x_in) next_state = S0; else next_state = S1;   // when input is 1 next_state is S0 else next_state is S1. 8038

    endcase                                             // end of switch case

always @(state, x_in)                                   // check for changes in state or x_in and find output accordingly. 8038
    if(state == S6 && x_in == 0) y_out = 1;             // for all the cases (other than when input is 1 and present state is S6) the output is 0. 8038
    else y_out = 0;                                     // all other cases. 8038

endmodule                                               // end of module overlappingSequenceDetector 8038