module Datapath_for_Div (                                       // Datapath Module named Datapath_for_Div .8038
    output less,                                                // Gives output as less . 8038
    input LoadD1,LoadD2, LoadC,LoadP,LdSAD, clearC, incC,       // These are the inputs for the module ( 1 bit inputs). 8038
    input [15:0] Data_in,                                       // 16 bit data_in input . 8038
    input clock                                                 // clock input for the module . 8038
    );

    wire [15:0] W, Y, T, Bout, Bus;                             // W,Y,T,Bout,Bus are the intermediate wires. 8038

    PIPO1 D (W, Bus, T, LoadD1, LoadD2, clock);                 // instantiating PIPO1 Module with respective ports . 8038
    PIPO2 P (Y, LoadP, clock);                                  // instantiating PIPO2 Module with respective ports . 8038
    CNT C (Bout, LoadC, incC, clock);                           // instantiating CNT module with respective ports . This is the counter for our logic. 8038
    SAD Q (Bus, LdSAD, Data_in);                                // instantiating SAD module with respective ports. 8038
    SUB CT (T, W, Y) ;                                          // This Subtracts the outputs from PIPO1 and PIPO2 and returns it in Y. 8038
    LESS COMP (less, W);                                        // comparator checker for Checking the Value of W with 0. 8038

endmodule                                                       // end of module Datapath_for_Div. 8038



module PIPO1 (                                                  // Module named PIPO1 . 8038
    output reg [15:0]dout,                                      // Output is a 16 bit dout . 8038
    input [15:0]din1,din2,                                      // inputs are 16 bit din1 and din2 . 8038
    input ld1,ld2,clock                                         // takes in the load ld1, ld2 and clock . 8038
    );
    always @(posedge clock)                                     // check for transition in positive edge of clock . 8038
    	if(ld1) dout <= din1;                                   // if ld1 is true, then give value of din1 to dout . 8038
    	else if(ld2) dout <= din2;                              // else if ld2 is true then give value of din2 to dout . 8038
endmodule                                                       // end of module named PIPO1 . 8038
 
module PIPO2 (                                                  // Module name for PIPO2 . 8038
    output reg [15:0]dout,                                      // Output is a register of 16 bits ( dout ). 8038
    input ld,clock);                                            // Inputs are a load and a clock. 8038
    always @(posedge clock)                                     // check for transition to postive edge of the clock    . 8038
    	if(ld) dout <= 16'b0000000000001010;                    // if the load exists then give the value of 16'd10 to dout, as we are creating a divide by 10 circuit . 8038
endmodule                                                       // end of module PIP02 . 8038

module SAD (                                                    // module named SAD . 8038 
    output reg [15:0]us,                                        // gives 16bit output to  a register us. 8038
    input ld,                                                   // takes in input as load. 8038
    input [15:0] din                                            // takes in 16 bit input as din. 8038
    );  
    always @ ( * )                                              // check for changes in any inputs , and then execute the block statements below this. 8038
    	if (ld) us <= din;                                      // If the load exists then supply the value of din to us . 8038
endmodule                                                       // end of module named SAD . 8038

module SUB (                                                    // module named SUB, this module subtracts 10 from the remainders of last opertions . 8038
    output reg [15:0]out,                                       // gives output as a register to out. ( 16 bit ). 8038
    input [15:0] in1, in2                                       // takes in input as 16 bit in1, and in2. 8038
    );
    always @(*)                                                 // check for changes in any inputs and then execute the next statements. 8038
    	out = in1 - in2 ;                                       // supply the value of out as in1 - in2. 8038
endmodule                                                       // end of module named SUB. 8038

module LESS (                                                   // Module named LESS , this module checks if the value of Qoutient is 10 or below. 8038
    output less,                                                // give the value of output less 1 bit. 8038
    input [15:0] data                                           // takes in 16 bit input as data . 8038
    );
    assign less = (data <10);                                   // continous assignment to less , if data is less that 10 then less is true, and vice versa. 8038
endmodule

module CNT (                                                    // module named CNT, which acts as counter for our model. 8038
    output reg [15:0]dout,                                      // gives out 16 bit outputs as dout. 8038
    input ld, inc, clock                                        // input is load , increment and clock. 8038
    );                                                          
    always @(posedge clock)                                     // check for transition in positive edge of clock. 8038
    	if(ld) dout <= 16'd0;                                   // If load exits then set dout as 0. 8038
    	else if(inc) dout <= dout+1;                            // else if inc exists then increment the value of dout to dout+1. 8038
endmodule                                                       // end of module named CNT. 8038


module Control (                                                // module named Control, this the controller module for our model. 8038
    output reg LoadD1, LoadD2, LoadC, LoadP, LdSAD, clearC, incC, done, // takes load inputs , clear input , increment and done input. 8038
    input clock, less, start                                    // takes input clock, less ( which tells if values is less than 10), start ( which starts the model). 8038
    );                                                                  
    reg [2:0] state;                                            // state is a 3 bit register. 8038
    parameter S0 = 3'b000,                                      // defining state parameters for easy operations. 8038
              S1 = 3'b001,
              S2 = 3'b010, 
              S3 = 3'b011; 
            
    
    always @(posedge clock)                                     // check for transition to positive edge of the clock. 8038
    	begin                                                   // start of block statements. 8038
    	  case (state)                                          // switch case on value of state. 8038
    		S0: if(start) state <= S1;                          // if state is S0 and if start exists then supplu the value of S1 to state. 8038
    		S1: state <= S2;                                    // if state is S1 then supply the value of state as S2. 8038
    		S2: #2 if (less) state <= S3;                       // if state is S2 and if less is set then set state to S3. 8038    
    		S3: state  <= S3;                                   // is state is S3 then set state to S3.( no change remain here) 8038 
    		default: state <= S0;                               // default case stay in inital state S0. 8038
    	   endcase                                              // end of case statements on state. 8038
    	end
    always @(state)                                             // check for changes in value of state then execute the folowing statements. 8038
    	begin
    	  case (state)                                          // case on state value. 8038
    		S0: begin                                           // if the state is S0 then Set the LdSAD as =1 and rest all as 0.8038
                    #1 LoadD1 = 0;
                    LoadD2 = 0;
                    LoadC = 0;
                    clearC = 0;
                    incC = 0;
                    LoadP = 0;
                    LdSAD = 1;
                end
    		S1: begin                                           // if the value of State is S1, then set LoadD1, LoadC, clearC and LoadP. 8038
                    #1 LoadD1 = 1;
                    LoadC = 1;
                    clearC = 1;
                    LoadP = 1;
                end
    		S2: begin                                           // if the value of state is S2 then unset LoadD1, LoadC, clearC and set LoadD2, incC. 8038
                    #1 LoadD1 = 0;
                    LoadC = 0;
                    clearC = 0;
                    LoadD2 = 1;
                    incC = 1;
                end
    		S3: begin                                           // if the value of state is S3 then set the value of Done to 1, The operation is complete here. 8038
                    #1 done = 1;
                    LoadD1 = 0;
                    LoadC = 0;
                    incC = 0;
                    LoadD2 = 0;
                    LoadP = 0;
                    LdSAD = 0;
                end
    		default: 
                begin 
                    #1 LoadC = 0;                               // For the default case set everything to 0. 8038
                    LoadD1 = 0;
                    LoadD2 = 0;
                    clearC = 0;
                    incC = 0;
                    LoadP = 0;
                end
    	   endcase                                              // end of case statements. 8038
    	end                                                     // end of block statements. 8038 
endmodule                                                       // end of controller module. 8038

