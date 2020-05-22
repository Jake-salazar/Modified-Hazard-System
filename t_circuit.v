`timescale 1ns/10ps
module t_circuit;
    //outputs
    wire Ored, Oyellow, Ogreen;
    //inputs
    reg IG, IS, IH, IT;
circuit uut(Ored,Oyellow,Ogreen,IG,IS,IH,IT);
initial
begin
//prints in cmd
$monitor ("gas=%d,smoke=%d,humidity=%d,temperature=%d,red=%d,yellow=%d,green=%d\n", IG,IS,IH,IT,Ored,Oyellow,Ogreen);
//creates a vcd file
$dumpfile ("circuit.vcd");
$dumpvars(0, t_circuit);
//initial output of 0s
IG = 1'b0; IS= 1'b0; IH= 1'b0; IT= 1'b0;
//after 100 ns the output of IT turns to 1
#100 IG = 1'b0; IS= 1'b0; IH= 1'b0; IT= 1'b1;

end
initial #200 $finish;
endmodule
