
`include "Ej_sumador.v"

module top(
  input clk,
  output wire [7:0]f,
  output wire a,b,c,d,
  output wire [3:0] cnt
);
  wire r=1'b0;
  
  clock_divider C(clk, r, cnt, a,b,c,d);
 // decoder_1hot_3_to_8 D( f[0],f[1],f[2],f[3],f[4],f[5],f[6],f[7], c,b,a );
 decoder_1hot_3_to_8_b D( f[0],f[1],f[2],f[3],f[4],f[5],f[6],f[7], c,b,a );

 
endmodule
  