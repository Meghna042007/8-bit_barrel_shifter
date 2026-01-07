`timescale 1ns / 1ps
module barrel_shifter_tsb();
reg [7:0]data_in;
reg [2:0]amt;
reg sel;
wire [7:0]  data_out;
barrel_shifter dut(.data_in(data_in),.amt(amt),.sel(sel),. data_out( data_out));
initial
begin
$monitor($time," data_in=%b, amt=%b, sel=%b,  data_out=%b",data_in,amt,sel, data_out);
//rotating right
sel=1;data_in=10110110;amt=3'd1;#10
data_in=11110000;amt=3'd4;#10
//rotating left
sel=0;data_in=10001110;amt=3'd2;#10;
data_in=00000001;amt=3'd7;#10;
$finish;
end
endmodule
