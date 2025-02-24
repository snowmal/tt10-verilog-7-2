/*
 * Copyright (c) 2024 Your Name
 * SPDX-License-Identifier: Apache-2.0
 */

`default_nettype none

module eight_bit_adder (
    input  wire [7:0] ui_in,    // Dedicated inputs
    output wire [7:0] uo_out,   // Dedicated outputs
    input  wire [7:0] uio_in,   // IOs: Input path
    output wire [7:0] uio_out,  // IOs: Output path
    output wire [7:0] uio_oe,   // IOs: Enable path (active high: 0=input, 1=output)
    input  wire       ena,      // always 1 when the design is powered, so you can ignore it
    input  wire       clk,      // clock
    input  wire       rst_n     // reset_n - low to reset
);

  // Our Verilog code:
  // Priority encoder implementations
module priority_encoder (
    input  [15:0] In,     // In[15:0] = {A[7:0], B[7:0]}
    output reg [7:0] C    // output the address (index) of the first high bit
);
    always @* begin
        if (In == 16'b0)
            C = 8'b11110000;  // special case (all bits are zero)
        else if (In[15])
            C = 8'b00001111;
        else if (In[14])
            C = 8'b00001110;
        else if (In[13])
            C = 8'b00001101;
        else if (In[12])
            C = 8'b00001100;
        else if (In[11])
            C = 8'b00001011;
        else if (In[10])
            C = 8'b00001010;
        else if (In[9])
            C = 8'b00001001;
        else if (In[8])
            C = 8'b00001000;
        else if (In[7])
            C = 8'b00000111;
        else if (In[6])
            C = 8'b00000110;
        else if (In[5])
            C = 8'b00000101;
        else if (In[4])
            C = 8'b00000100;
        else if (In[3])
            C = 8'b00000011;
        else if (In[2])
            C = 8'b00000010;
        else if (In[1])
            C = 8'b00000001;
        else if (In[0])
            C = 8'b0;
        else
            C = 8'b11110000;
    end
endmodule

  // All output pins must be assigned. If not used, assign to 0.
  assign uo_out  = ui_in + uio_in;  // Example: ou_out is the sum of ui_in and uio_in
  assign uio_out = 0;
  assign uio_oe  = 0;

  // List all unused inputs to prevent warnings
  wire _unused = &{ena, clk, rst_n, 1'b0};

endmodule
