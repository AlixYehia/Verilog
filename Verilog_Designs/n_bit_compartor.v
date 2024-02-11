module n_bit_comparator (a, b, a_greater_b, a_equal_b, a_smaller_b);
parameter w=1;
input [w-1:0]a, b;
output  reg a_greater_b, a_equal_b, a_smaller_b;

always @ (*)
if (a>b) begin
 a_greater_b=1;
 a_equal_b=0;
 a_smaller_b=0;
 end
 else if (a==b) begin
 	a_equal_b=1;
 	a_greater_b=0;
 	a_smaller_b=0;
 end

 else if (a<b) begin
 	a_smaller_b=1;
 	a_equal_b=0;
 	a_greater_b=0;
 end

 endmodule