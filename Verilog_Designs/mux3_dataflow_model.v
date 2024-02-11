module mux3_dataflow_model (d0,d1,d2,s0,s1,y);

input do,d1,d2,s0,s1;
output y;

assign y=(s0==0 && s1=0)? d0 :(s0==1&& s1=0)?d1 : d2;

endmodule