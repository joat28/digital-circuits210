
module t_mintermImplementation;                 // Test bench for module mintermImplementation. 8038 

wire t_Q;                                       // local output is t_Q, 1bit.    
reg  [3:0]t_A;                                  // local input is t_A, a 4bit binary.    

mintermImplementation uut(t_Q,t_A);             // module mintermImplementation is the unit under test 8038

            // -------------EXPLANATION----------
//Roll no. 190108038, function is sum(0,1,3,8,9) . 8038
//produced 9 digit number is 210803820, distinct digits are 0,1,2,3,8 their binary representations are (0000, 0001, 0010, 0011, 1000, 1001) which will acts as our inputs. 8038
            // -----------------------------------    


initial begin               // start of test block 8038

        t_A = 4'd0;         //t = 0ns, value of A is 0 . 8038
    #10 t_A = 4'd1;         //t = 10ns, value of A is 1 . 8038
    #10 t_A = 4'd2;         //t = 20ns, value of A is 2 . 8038
    #10 t_A = 4'd3;         //t = 30 ns, value of A is 3 . 8038
    #10 t_A = 4'd8;         //t = 40ns, value of A is 8 . 8038
    
end                         // end of test block .8038

initial begin               // start of test block for monitor 8038

    $monitor("time = %t  ,  4bit input A  = %b  , output Q = %b ", $time, t_A, t_Q);  // monitor changes in value of time, output t_Q, input t_A . 8038

end                         // end of test block. 8038   

endmodule                   // end of module mintermImplementation. 8038
