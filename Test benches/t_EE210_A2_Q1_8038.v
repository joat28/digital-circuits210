`timescale 1ns/100ps                        // setting time scale to 1ns and precision to 100ps. 8038
module t_overlappingSequenceDetector;       // test module for overlappingSequenceDetector. 8038
wire t_y_out;                               // local output is t_y_out. 8038
reg t_x_in, t_clock, t_reset;               //local input is t_x_in, t_clock, t_reset. 8038

overlappingSequenceDetector uut(t_y_out, t_x_in, t_clock, t_reset); // unit under test is overlappingSequenceDetector module giving output in t_y_out. 8038

initial #150 $finish;                       // end the run after 150 ns. 8038
initial begin t_clock = 1; forever #2.5 t_clock = ~t_clock; end // clock starts from 1 and alternates itself after every 2.5 ns. 8038



// my roll no is 190108038 , last 3 digits binary is 0100110, 20 digits input given is 0001100_0100110_100000. 8038 
initial fork                                        // all statement below this occur simulataneosly. 8038

    t_reset = 1'b0;                                 // giving reset a value of 0 initially. 8038
    #1  t_reset =1'b1;                              // changing it right after 1 ns. 8038
    #5  t_x_in = 1'b0;                              // stream of input begins . 8038             
    #10 t_x_in = 1'b0;  
    #15 t_x_in = 1'b0; 
    #20 t_x_in = 1'b1; 
    #25 t_x_in = 1'b1; 
    #30 t_x_in = 1'b0; 
    #35 t_x_in = 1'b0; 
    #40 t_x_in = 1'b0; 
    #45 t_x_in = 1'b1; 
    #50 t_x_in = 1'b0; 
    #55 t_x_in = 1'b0; 
    #60 t_x_in = 1'b1; 
    #65 t_x_in = 1'b1; 
    #70 t_x_in = 1'b0;
    #75 t_x_in = 1'b1;
    #80 t_x_in = 1'b0;
    #85 t_x_in = 1'b0;
    #90 t_x_in = 1'b0;
    #95 t_x_in = 1'b0;
    #100 t_x_in = 1'b0;                             // stream of input ends. 8038

join                                                // end of fork. 8038


initial begin
    $monitor("time = %t    , y_out = %b ", $time, t_y_out); // we monitor changes in vlaue of time and t_y_out. 8038
end
endmodule                                               // end of test module t_overlappingSequenceDetector. 8038