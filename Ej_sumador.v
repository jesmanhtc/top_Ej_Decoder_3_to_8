
module decoder_1hot_3_to_8(
  output wire F0,F1,F2,F3,F4,F5,F6,F7,
  input wire A, B, C);
  
  assign F0 = ~A & ~B & ~C;
  assign F1 = ~A & ~B &  C;
  assign F2 = ~A &  B & ~C;
  assign F3 = ~A &  B &  C;
  assign F4 =  A & ~B & ~C;
  assign F5 =  A & ~B &  C;
  assign F6 =  A &  B & ~C;
  assign F7 =  A &  B &  C;
endmodule

module decoder_1hot_3_to_8_b(
  output wire F0,F1,F2,F3,F4,F5,F6,F7,
  input wire A, B, C);
  wire [2:0]ABC;
  assign ABC={A,B,C};
  wire [7:0] F;
  
  assign F = 
    (ABC==3'b000)? 8'b0000_0001:
    (ABC==3'b001)? 8'b0000_0010:
    (ABC==3'b010)? 8'b0000_0100:
    (ABC==3'b011)? 8'b0000_1000:
    (ABC==3'b100)? 8'b0001_0000:
    (ABC==3'b101)? 8'b0010_0000:
    (ABC==3'b110)? 8'b0100_0000: 8'b1000_0000;
             
  assign F0=F[0];
  assign F1=F[1];
  assign F2=F[2];
  assign F3=F[3];
  assign F4=F[4];
  assign F5=F[5];
  assign F6=F[6];
  assign F7=F[7];
endmodule



module clock_divider(
  input clk,
  input reset,
  output reg [3:0] counter,
  output cntr_div2,
  output cntr_div4,
  output cntr_div8,
  output cntr_div16
);

  // use bits of (4-bit) counter to divide clocks
  always @(posedge clk or posedge reset)
  begin
    if (reset)
      counter <= 0;
    else
      counter <= counter + 1;
  end

  assign cntr_div2 = counter[0];
  assign cntr_div4 = counter[1];
  assign cntr_div8 = counter[2];
  assign cntr_div16 = counter[3];

endmodule