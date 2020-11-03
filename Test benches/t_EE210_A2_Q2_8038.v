module t_booths;                                                        // testbench for module booths. 8038
    reg t_clk, t_start;                                                 // local input is clock and reset. 8038
    reg [7:0] t_num1, t_num2;                                           //  and 8 bit input num1 ,and num2. 8038
    wire [15:0] t_result;                                               //local outputs are 15 bit t_result and t_validity. 8038
    wire t_validity;                                                        
booths multiplier1(t_result, t_validity, t_num1, t_num2, t_clk, t_start);   // unit under test is booths. 8038



// roll no is 190108038. multiplier is 80 and multiplicand is 38. 8038 
initial begin                                                             // start of test block. 8038

    t_clk = 0;                                                            // intially clock is 0. 8038
    t_num1 = 38; t_num2 = 80; t_start = 1; #50 t_start = 0;               //setting appropriate inputs. 8038
    #80 
$finish;                                                                   //finish after more 80 ns. 8038

end                                                                         // end of test block

always #5 t_clk = !t_clk;                                                   // clock alternates per 5 ns. 8038
initial begin                                                               // start of monitor block
    $monitor("time= %t   num1: %d    num2:  %d   final_ans: %b  result: %d ", $time, t_num1, t_num2, ~t_validity, t_result);// monitoring the values of time number1 number2 validity and result. 8038      
end                                                                         // end of test block

endmodule                                                                    // end of module t_booths
