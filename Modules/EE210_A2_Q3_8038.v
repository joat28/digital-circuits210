module AtmMachine(                                                                  // module named AtmMachine . 8038
output reg green, red, alarm, cardInserted, cardValid, dispensingAmount, takeInCard, // gives outputs in some messages, like red light, green light, valid card inserted, etc . 8038 
output reg[2:0] state, next_state,                                                  //3 bit outputs state and next_state. 8038
input x_in, clock, reset,                                                           // takes input in x_in, clock and reset . 8038
input[15:0] inputPin1, inputPin2, amount                                            // 16 bit inputs inputPin1, inputPin2 and amount . 8038
);



                                        // DEFINING STATE PARAMETERS FOR EASY COMPARISION . 8038
parameter S0 = 3'd0,                                                                 
          S1 = 3'd1,
          S2 = 3'd2,
          S3 = 3'd3,
          S4 = 3'd4,
          S5 = 3'd5,
          S6 = 3'd6,
          pinValid = 16'd1234,                      //THIS DEFINES PARAMETER PINVALID with 1234 . 8038
          amountAvailable = 16'd10000;              // THIS DEFINES PARAMETER amountAvailable WITH 100000 . 8038

always @(posedge clock, negedge reset)          // CHECKING FOR POSTIVE EDGE CLOCK MOVEMENT AND NEGATIVE EDGE RESET . 8038
    if(reset == 0) state <= S0;                   // SET STATE TO INITIAL STATE IF RESET IS 0 . 8038
    else state <= next_state;                   // ELSE SET STATE TO NEXT_STATE . 8038

always @(state, x_in)                           // check for changes in state or x_in and STATE . 8038
case(state)                                     // case statement on state value . 8038

                // if state is S0 . 8038

S0: if(x_in)                     // if input is 1 then set next state to S1, flash green light and set all other outputs to 0. 8038               
     begin
        next_state = S1;
        green = 1;
        red = 0;
        alarm = 0;
        cardInserted = 0;
        cardValid = 0;
        dispensingAmount = 0;
        takeInCard = 0;
     end
    else                       // if inputs is 0 then set next state to S0, and flash red light , do not proceed (going to rest state). 8038 
     begin
        next_state = S0;
        green = 0;
        red = 1;
        alarm = 0;
        cardInserted = 0;
        cardValid = 0;
        dispensingAmount = 0;
        takeInCard = 0;
     end

                 // if state is S1
S1: if(x_in)                  // if input is 1 then set next state to s2 and flash greenLight , and is inserted. 8038
     begin
        next_state = S2;
        green = 1; 
        red = 0;
        alarm = 0; 
        cardInserted = 1; 
        cardValid = 0; 
        dispensingAmount = 0; 
        takeInCard = 0;
     end
    else                    // if input is 0 then set next state to S1, and set green flash, card is not inserted. 8038
     begin  
        next_state = S1;
        green = 1; 
        red = 0; 
        alarm = 0; 
        cardInserted = 0; 
        cardValid = 0; 
        dispensingAmount = 0; 
        takeInCard = 0;
     end

                // if state is s2 . 8038

S2: if(x_in)                // if input is 1 then set next state to S3, flash green light, card is inserted and is valid. 8038
     begin
        next_state = S3;
        green = 1; 
        red = 0; 
        alarm = 0; 
        cardInserted = 1; 
        cardValid = 1; 
        dispensingAmount = 0; 
        takeInCard = 0;
     end
    else                    // if input is 0 then set next state to S1, flash green light, card is not inserted . 8038
     begin
        next_state = S1;
        green = 1; 
        red = 0; 
        alarm = 0; 
        cardInserted = 1; 
        cardValid = 0; 
        dispensingAmount = 0; 
        takeInCard = 0;
     end

            // if state is S3 . 8038

S3: if(inputPin1==pinValid)    
     begin                  // if first pin is valid then set next state to S4, and flash green light. ( as card is inserted and pin is right) . 8038 
        next_state = S4;
        green = 1;
        red = 0; 
        alarm = 0; 
        cardInserted = 1; 
        cardValid = 1; 
        dispensingAmount = 0; 
        takeInCard = 0;
     end
    else                    // if pin is invalid then set next state to S5 . 8038
     begin
       next_state = S5;
       green = 1; 
       red = 0;
       alarm = 0; 
       cardInserted = 1; 
       cardValid = 1; 
       dispensingAmount = 0; 
       takeInCard = 0;
     end
           // if state is S4 . 8038
S4: if(amount<=amountAvailable)    
     begin              //if amount asked is less than the amount in the bank then set next state to S1. AMOUNT IS DISPENSED HERE. 8038
       next_state = S1;
       green = 1; 
       red = 0; 
       alarm = 0; 
       cardInserted = 1; 
       cardValid = 1; 
       dispensingAmount = 1; 
       takeInCard = 0;
     end
    else 
     begin              // if amount asked is more than the amount in the bank then set next state to S1. AMOUNT IS NOT DISPENSED HERE. 8038
       next_state = S1;
       green = 1; 
       red = 0; 
       alarm = 0; 
       cardInserted = 1; 
       cardValid = 1; 
       dispensingAmount = 0; 
       takeInCard = 0;
     end
          
            // if state is S5 . 8038

S5: if(inputPin2 == pinValid)
     begin                // if pin is valid the second time then next state is S4. Amount is asked to the user. 8038
       next_state = S4;
       green = 1; 
       red = 0; 
       alarm = 0; 
       cardInserted = 1; 
       cardValid = 1; 
       dispensingAmount = 0; 
       takeInCard = 0;
     end
    else                 // if the pin is invalid the second time then next state is set to S1, card is taken In and alarm is raised. 8038 
     begin
       next_state = S1;
       green = 1; 
       red = 0; 
       alarm = 1; 
       cardInserted = 0; 
       cardValid = 1; 
       dispensingAmount = 0; 
       takeInCard = 1;
     end
    endcase             // end of case statement . 8038
endmodule               // end of module named Atm_Machine . 8038
