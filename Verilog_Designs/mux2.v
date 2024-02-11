module mux2(in1, in0, sel, out);
input in1, in0, sel;
output reg out;


always@(*)
    
    if(sel)  // sel = sel==1
    out=in1;
    else 
    out=in0;

endmodule