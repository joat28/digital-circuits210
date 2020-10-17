		//Test bench for Decimal2Gray module 8038
module t_DecimaltoGray;			//creates module named t_Decimal2Gray	8038
wire  [3:0]gray;			//local output is [3:0] gray, 4 bit no. with gray[3] as MSB 8038
reg   [3:0]bin;				//local input is [3:0] bin, 4 bit no. with bin[3] as MSB 8038
	
Decimal2Gray uut(gray,bin);     	//Decimal2Gray is the unit under test , output as gray , and input as bin, both 4 bit 8038
	
initial begin				//begin of test block
 bin = 4'd1;                		//bin takes value 1 in decimal. (Last digit of roll no. = 8,  9's complement = 1.) 8038
end					//end of block
initial begin				//begin of test block
  $monitor("Decimal: %d  Graycode: %b",bin,gray);  //we monitor change in bin and Gray in decimal and binary respectively from wire and reg. 8038 
 end					//end of test block  8038

endmodule 				//end of module t_Decimal2Gray 8038

