module adder_subtrator(             // module named adder_subtrator. 8038
    output [7:0] out,               // gives output in 7 bit out. 8038
    input [7:0] a,                  // takes input in 7 bit a and b. 8038
    input [7:0] b,
    input cin);                     // takes input in carryIn , cin here. 8038

    assign out = a + b + cin;       // assigning the output out a value of sum of a, b, and  cin. 8038
endmodule





module booths(                      // module named booths . 8038
    output [15:0] result,           //gives output to 16 bit result. 8038
    output validity,                //validity tells when the result is valid. i.e when validity is 0 means the answer is the final answer. 8038
    input [7:0] num1, num2,         //takes input in 8 bit numbers num1 and num2, num1 is mutilplicand and num2 is multiplier. 8038
    input clock, start);            //start determines intial condition to intialize variables. 8038


    reg [7:0] A, Q, M;              // 7 bit registers A,Q,M. M is multiplicand and Q is multiplier. 8038
    reg q;                          // q is initialized to 0 in start. 8038
    reg [3:0] count;                // count is the number of bits. 8 in our case. this also sets basis for validity. 8038
    wire [7:0] sum, diff;           // intermediate wires ( 8 bit ) sum and diff.
always @(posedge clock)             // check for changes in postive clock edge
begin           
        if (start) begin            // if start is 1 then apply the initial conditions of : 
            A <= 8'b0;              // A = 0 initially. 8038
            M <= num1;              // M = num1. 8038
            Q <= num2;              // Q is num2. 8038
            q <= 1'b0;              // q is 0 . 8038
            count <= 4'b0;          // count is given a value of 0 and goes upto 7. 8038
    end
    else begin                      // if start is not 1. 8038
            case ({Q[0], q})        // case on concatenation of Q[0] and q. 8038
            2'b0_1 : {A, Q, q} <= {sum[7], sum, Q};     // this is the logic to perform arithmetic right shift, on {A, Q,q}. 8038
            2'b1_0 : {A, Q, q} <= {diff[7], diff, Q};   // same operation for concatenation being 10 . 8038
            default: {A, Q, q} <= {A[7], A, Q};         // default case  8038
            endcase                         // end of case. 8038
    count <= count + 1'b1;                  // interating count to keep check of validity. 8038
    end                     
end                                   

adder_subtrator add (sum, A, M, 1'b0);   // instantiating adder_subtractor with add which gives op in sum. 8038
adder_subtrator subtract (diff, A, ~M, 1'b1); // instantiating adder_subtractor with subtract which gives op in diff, ( this is the same circuit, but with 1's complement of M, so as to denote subtraction). 8038


assign result = {A, Q};               // constinous assignment to result with concatenation of A and Q. 8038
assign validity = (count < 8);       // updating validity until count reaches its max value. 8038


endmodule                            // end of module booths



