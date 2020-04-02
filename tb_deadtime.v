`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/04/01 01:52:47
// Design Name: 
// Module Name: tb_deadtime
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module tb_deadtime(

    );
    reg[2:0] GH_IN;
    reg[2:0] GL_IN;
    reg CLK;
    wire [2:0]GH_OUT;
    wire [2:0]GL_OUT;
    
    deadtime UUT (.CLK(CLK),.GH_IN(GH_IN),.GL_IN(GL_IN),.GH_OUT(GH_OUT),.GL_OUT(GL_OUT));
        initial
        begin
            CLK =0;
            GH_IN = 3'b101;
            GL_IN = 3'b010;
         end
         always #5 CLK = ~CLK;

         always #15000 GH_IN= ~GH_IN;
         always #15000 GL_IN= ~GL_IN;   
endmodule
