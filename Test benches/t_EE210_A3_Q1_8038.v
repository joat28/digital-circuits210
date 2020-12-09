module t_Generic_Matrix_Multiplier;     // Test module for module named Generic_Matrix_Multiplier . 8038
	


    // My roll no is 190108038 last 3 digits are 038 and values of (a,b,c) are (3,3,8) . 8038
	parameter A_param = 3;              //A_param is the value of a(which is 3) to be supplied to uut. 8038
	parameter B_param = 3;              //B_param is the value of b(which is 3) to be supplied to uut. 8038
	parameter C_param = 8;              //C_param if the value of c(which is 8) to be supplied to uut. 8038
    
    reg [A_param*B_param*8-1:0] A1d;    // Creating A1d as the register to store the first array. 8038
    reg [B_param*C_param*8-1:0] B1d;    // Creating B1d as the register to store the second array. 8038
    
    wire [A_param*C_param*8-1:0] Result; // Creating Result as local output to store the final array after multiplication. 8038

    integer i;                           // i is an iterator of type integer to travel through Result and print the answer in transcript using display . 8038
    
    Generic_Matrix_Multiplier #(.A_param(A_param),.B_param(B_param),.C_param(C_param)) uut (  // Unit under test is Generic_Matrix_Multiplier . 8038 
        .A1d(A1d),                      
        .B1d(B1d), 
        .Result(Result)
    ); // Plugging in the correspoding values of inputs with proper parameters of a, b and c. 8038

    initial begin                           // Start of intial block statements. 8038
        
        A1d = 0;  B1d = 0;  #1000;      // Set A1d and B1d to 0 and then supply the input after 1000 ns. 8038
	
        // ====== A1d ========= . 8038
        /* 
            1  0  2             . 8038
            3  2  1             . 8038
            2  3  2             . 8038
        */
        // ====== B1d ========= . 8038
        /*
            0 1 4 3 5 3 2 1     . 8038
            4 3 9 0 0 1 2 2     . 8038
            1 2 3 3 3 0 0 0     . 8038
        
        */
        // ====== EXPECTED RESULT ========  . 8038
        /*
            2   5   10  9   11  3  2   1        . 8038
            9   11  33  12  18  11 10  7        . 8038
            14  15  41  12  16  9  10  8        . 8038
        */


        A1d = {8'd1,8'd0,8'd2,8'd3,8'd2,8'd1,8'd2,8'd3,8'd2};           // Supplying corresponding Value of A1d. 8038
        B1d = {8'd0,8'd1,8'd4,8'd3,8'd5,8'd3,8'd2,8'd1,8'd4,8'd3,8'd9,8'd0,8'd0,8'd1,8'd2,8'd2,8'd1,8'd2,8'd3,8'd3,8'd3,8'd0,8'd0,8'd0}; // Supplying corresponding Value Of B1d . 8038
	for(i = A_param*C_param*8-8; i>=0;i=i-8)begin                        // Loop to display the values of result elements. . 8038
		#10 $display("%d",{Result[i+7],Result[i+6],Result[i+5],Result[i+4],Result[i+3],Result[i+2],Result[i+1],Result[i]}); // Concantenate 8 bits in order they form each decimal value of result. 8038
	end                                                                  // end of loop for display. 8038
	
	
    end                                                                  // end of test block. 8038

endmodule                                                                // end of test module named t_Generic_Matrix_Multiplier. 8038                                                                
