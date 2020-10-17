// Test bench for four_bit_signed_adder
module t_four_bit_signed_adder;                            //test module named t_four_bit_signed_adder

wire [3:0]t_s;                                              // local output are 4 bit t_s, and all zero, negative, overflow and carry Flags. 8083    
wire t_zeroFlag, t_negFlag, t_overflowFlag, t_carryFlag;    
reg t_carryIn;                                               //local inputs include t_carryIn , 5 bit And B. MSB as A[4] and B[4] . 8038
reg [4:0]t_A,t_B;


//Roll no 190108038 , last and second last numbers are 8(01000) and 3(00011).   8038
four_bit_signed_Adder uut(t_s, t_zeroFlag, t_negFlag, t_overflowFlag, t_carryFlag, t_carryIn, t_A, t_B);   // unit under test is four_bit_signed_Adder . 8038

initial begin                             // start of test block
    t_carryIn = 1'b0;                     // at t=0, carry_In is given a value of 0 in binary.  8038  
    t_A = 5'd8;                           // at t=0, A is given a value of 8 in decimal, (5bit) 
    t_B = 5'd3;                           // at t=0, B is given a value of 3 in decimal, (5bit)
    
end                                        // end of test block

initial begin                               // start of test block for monitor

    $monitor("time = %t    5bit input A =  %b     5bit input B =  %b     4bit sum s =  %b     negFlag = %b     carryFlag = %b     overflowFlag = %b     zeroFlag =  %b ", $time, t_A, t_B, t_s, t_negFlag, t_carryFlag, t_overflowFlag, t_zeroFlag); // monitor changes in all outputs. with time . 8038

end                                         // end of test block


endmodule                                   // end of module t_four_bit_signed_adder 8038
