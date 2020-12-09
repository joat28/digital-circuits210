module Generic_Matrix_Multiplier    // module named "Generic_Matrix_Multiplier" It multiplies 2 matrices of sizes axb and bxc . 8038.

            //=======  PARAMETERS =======. 8038
         #(
            parameter A_param = 3, // parameter declaration, A_param is a in problem. 8038
		    parameter B_param = 3, // parameter declaration, B_param is b in problem. 8038
		    parameter C_param = 8  // parameter declaration, C_param is c in problem. 8038
          )

            //========  PORTS =============. 8038
		  (
            input [A_param*B_param*8-1:0]A1d,           // A1d input is a 1d array of 1 bit numbers, Its size is axbx8 in the problem. 8038
		    input [B_param*C_param*8-1:0]B1d,           // B1d input is a 1d array of 1 bit numbers, Its size is bxcx8 in the problem. 8038
 		    output reg[A_param*C_param*8-1:0] Result    // Result output a 1d array of 1 bit numbers, Its size is axcx8 in the problem. 8038
          ); 



    //======== REGISTERS =========. 8038
    reg [7:0] A3d [0:A_param-1][0:B_param-1];           // A3d is a 3D register, Of dimensions axbx8 ( each no of 8 bits), A1d is transformed into A3d to perfrom multiplication. 8038
    reg [7:0] B3d [0:B_param-1][0:C_param-1];           // B3d is a 3D register, Of dimensions bxcx8 ( each no of 8 bits), B1d is transformed into B3d to perfrom multiplication. 8038
    reg [7:0] Res3d [0:A_param-1][0:C_param-1];         // Res3d is a 3D register, Of dimensions axcx8 ( each no of 8 bits). The mulitplication result of A3d and B3d is stored in this. 8038
    
    //========== ITERATORS ============. 8038
    integer r,c,d;                                      // r, c, d are iterators to traverse through the 3d arrays. 8038
    integer R,C,D;                                      // R,C,D are iterators to traverse through the 3d array. 8038
    integer i,j,k;                                      // i, j, k are iterators to aid in performing addition. 8038



    // ========= START OF BLOCK STATEMENT ============. 8038

    always@ (A1d or B1d)                                // Check for changes in A1d or B1d and perform the following in order . 8038
    begin  
    //======= SET Res3d TO 0 ========
	for(r = 0; r < A_param; r = r+1) begin              // Traverse through rows of Res3d. 8038
		for(c = 0; c < C_param; c = c+1) begin          // Traverse through columns of Res3d. 8038
			for(d = 0; d < 8; d = d+1) begin            // Traverse through the 8 bits of Res3d. 8038
				Res3d[r][c][d] = 1'd0;                  // Place 0 in each bit of Res3d.8038
			end
		end
	end

    // ======= TRANSFORM A1D TO A3D ==========. 8038
	for(r = 0; r < A_param; r = r+1) begin              // Traverse through rows of A3d. 8038
		for(c = 0; c < B_param; c = c+1) begin          // Traverse through columns of A3d. 8038
			for(d = 0; d < 8; d = d+1) begin            // Traverse through 8 bits of A3d. 8038
				A3d[r][c][d] = A1d[r*B_param*8+c*8+d];  // Place the corresponding value of A1d to A3d. 8038
			end
		end
	end

    //======= TRANSFORM B1D TO B3D ============. 8038
	for(r = 0; r < B_param; r = r+1) begin              // Traverse through rows of B3d. 8038
		for(c = 0; c < C_param; c = c+1) begin          // Traverse through the columns of B3d. 8038
			for(d = 0; d < 8;d = d+1) begin             // Traverse through 8 bits of B3d. 8038
				B3d[r][c][d] = B1d[r*C_param*8+c*8+d];  // Place corresponding value of B1d to B3d. 8038
			end
		end
	end

    //========= MULTIPLICATOIN PROCESS ============. 8038
    for(i = 0; i < A_param; i = i+1) begin              // Traverse through rows of Res3d. 8038
        for(j = 0; j < C_param; j = j+1) begin          // Traverse through cols of Res3d. 8038
            for(k = 0; k < B_param; k = k+1) begin      // Traverse through 8 bits of Res3d. 8038
                Res3d[i][j] = Res3d[i][j] + (A3d[i][k] * B3d[k][j]); // Set Res3d[i][j] to sum( Res3d[i][j] , product( A3d[i][k], B3d[k][j] ) ) . 8038 
	        end
	    end
	end
    
    // ========= TRANSFORM RES3D TO RESULT ( 1D ) ==========. 8038
	for(R = 0; R < A_param; R = R+1) begin              // Traverse through rows of Res3d . 8038
		for(C = 0; C < C_param; C = C+1) begin          // Traverse through cols of Res3d. 8038
			for(D = 0; D < 8; D = D+1) begin            // Traverse through 8 bits of Res3d. 8038 
				Result[R*C_param*8+C*8+D] = Res3d[R][C][D];     // Place corresponding value of Res3d element in to Result's element. 8038

			end
		end
	end		           
    end // end of BLock statements. 8038
endmodule   // end of module Generic_Matrix_Multiplier. 8038
