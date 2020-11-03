module t_AtmMachine;                                                                        //Module named t_AtmMachine . 8038

reg t_x_in, t_clock, t_reset;                                                               //local inputs are x_in clock and reset 8038
reg[15:0] t_inputPin1, t_inputPin2, t_amount;                                               //local 16 bit inputs are t_inputPin1 and t_inputPin2 and t_amount 8038

wire t_green, t_red, t_alarm, t_cardInserted, t_cardValid, t_dispensingAmount, t_takeInCard;//local outputs are t_green, t_red etc. 8038
wire [2:0] t_state, t_next_state;                                                           //local 3 bit outputs state and next state. 8038

AtmMachine M1(t_green, t_red, t_alarm,                                                     // unit under test is AtmMachine module given proper inputs and outputs ( local ) . 8038
                t_cardInserted,t_cardValid, t_dispensingAmount, t_takeInCard, 
                t_state, t_next_state, 
                t_x_in, t_clock, t_reset, 
                t_inputPin1, t_inputPin2, t_amount);  

initial #200 $finish;                                                                  // finish execution after 200 ns . 8038
                                                                       
initial begin  t_clock = 0; forever #5 t_clock = ~t_clock;   end                        //clock is initially 0 and alternates every 5 ns. 8038                                                                                                                     
                                                                                                                               

initial                                                                                     //test block starts 8038
    fork                                                                                 // start of fork statements, they all occur concurrently. 8038
        t_reset = 0;                                                                     // reset is 0 initially . 8038
        t_x_in = 0;                                                                        //input t_x_in is 0 initially . 8038         
        #20 t_x_in = 1;                                                                    //after 20 ns t_x_in is changed to 1. 8038    
        #30 t_x_in = 1;                                                                    //after 30 ns t_x_in is 1  . 8038
        #40 t_x_in = 1;                                                                    //after 40 ns t_x_in is 1  . 8038       
        t_inputPin1 = 1234;                                                                // t_inputPin1 is 1234     . 8038        
        t_amount = 1500;                                                                   // t_amount is given value . 8038       
    join                                                                                  //end of fork with join   . 8038
endmodule                                                                                   //end of the module t_virtualAtmMachine 8038

