
    module t_Datapath_for_Div;                      // Test module named t_Datapath_for_Div for  module Datapath_for_Div . 8038
    reg [15:0] Data_in;                             // local inputs are Data_in( 16 bit). 8038
    reg clock, start;                               // local input clock and start. 8038
    wire done;                                      // local output done. 8038
    Datapath_for_Div DP (less,LoadD1,LoadD2,LoadC,LoadP,LdSAD,clearC, incC, Data_in, clock); // instantiating module Datapath_for_Div as DP, with corresponding inputs and outputs. 8038
    Control CON (LoadD1, LoadD2, LoadC, LoadP, LdSAD, clearC, incC, done, clock, less, start); // instantiating module Control with corresponding inputs and outputs. 8038

    initial                                         // test block begins. 8038
        begin                                                  
            clock = 1'b0;                           // set clock = 0 , initially. 8038
            #3 start = 1'b1;                        // after 3ns set start = 1, to start the operation. 8038
            #500 $finish;                           // finish after 300 ns. 8038
        end                                         // test block ends . 8038
    initial                                         // test block begins . 8038
        begin
            #10 Data_in = 38;                       // after 10 ns set the value of Data_in to 038 ( last 3 digits of roll no.) . 8038
        end                                         // test block ends . 8038
    initial                                         // test block begins . 8038
        begin   
            $monitor ( "time = %t  Quotient= %d  remainder= %d done= %b",$time, DP.Bout,DP.W, done);// monitor changes in time , Quotient remainder and done from DP unit. 8038
        end                                         // test block ends    . 8038
        always #5 clock =~clock;                    // clock with time period 10 ns. 8038
    endmodule
