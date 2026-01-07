`timescale 1ns / 1ps
module barrel_shifter(
input [7:0]data_in,
input [2:0] amt,
input sel,
output reg [7:0]data_out);
always @(*)
begin
if(sel)
   begin
   $display("rotating right");
   case(amt)
        3'b000:data_out=data_in;
        3'b001:data_out={data_in[0],data_in[7:1]};
        3'b010: data_out={data_in[1:0],data_in[7:2]};
        3'b011: data_out={data_in[2:0],data_in[7:3]};
        3'b100: data_out={data_in[3:0],data_in[7:4]};
        3'b101: data_out={data_in[4:0],data_in[7:5]};
        3'b110: data_out={data_in[5:0],data_in[7:6]};
        3'b111: data_out={data_in[6:0],data_in[7]};
    endcase
    end 
else
    begin
    $display("rotating left");
   case(amt)
        3'b000: data_out=data_in;
        3'b001: data_out={data_in[6:0],data_in[7]};
        3'b010: data_out={data_in[5:0],data_in[7:6]};
        3'b011: data_out={data_in[4:0],data_in[7:5]};
        3'b100: data_out={data_in[3:0],data_in[7:4]};
        3'b101: data_out={data_in[2:0],data_in[7:3]};
        3'b110: data_out={data_in[1:0],data_in[7:2]};
        3'b111: data_out={data_in[0],data_in[7:1]};
    endcase
    end 
end
endmodule
