module mux3_beh_always_case_statement (d0,d1,d2,s0,s1,y);

input do,d1,d2,s0,s1;
output reg y;

always @(*)

case({s0,s1})
2'b00:y=d0;
2'b10:y=d1;
default:y=d2;
endcase


endmodule