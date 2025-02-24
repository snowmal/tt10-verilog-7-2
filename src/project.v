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
// Boolean logic function (shift MUX )
module rotate_left (
    input  [7:0] A,
    input  [7:0] B, // only lower 3 bits of B will determine the rotation amount
    output [7:0] C
);
    wire [2:0] shift;
    assign shift = B[2:0];
    assign C = (A << shift) | (A >> (8 - shift)); // rotate left: shift left by 'shift' and OR with the bits shifted out (wrapped-around)
endmodule


  // All output pins must be assigned. If not used, assign to 0.
  assign uo_out  = ui_in + uio_in;  // Example: ou_out is the sum of ui_in and uio_in
  assign uio_out = 0;
  assign uio_oe  = 0;

  // List all unused inputs to prevent warnings
  wire _unused = &{ena, clk, rst_n, 1'b0};

endmodule
