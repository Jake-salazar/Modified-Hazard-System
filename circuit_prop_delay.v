//Input
//  IG - gas sensor
//  IS - smoke sensor
//  IH - humidity sensor
//  IT - temperature sensor
//Output 
//  Ored- output for the red LED
//  Oyellow- output for the yellow LED
//  Ogreen- output for the green LED
`timescale 1ns/10ps
module circuit_prop_delay( output Ored, Oyellow, Ogreen, input IG, IS, IH, IT);
    wire xIG, xIS, xIH, xIT, Or1, Or2, Oy1, Oy2, Oy3, Og1, Og2;
    // represents the NOT gates that are shown in the circuit
    not #10(xIG, IG);
    not #10(xIS, IS);
    not #10(xIH, IH);
    not #10(xIT, IT);
    // represents the AND gates that are shown in the circuit that would lead to the RED output
    and #30(Or1, IS, IT);
    and #30(Or2, IG, IT);
    // represents the OR gate that decides the output value of the Ored
    or  #20(Ored, Or1, Or2);
    // represents the AND gates that are shown in the circuit that would lead to the YELLOW output
    and #30(Oy1, xIG, xIS, IT);
    and #30(Oy2, IS, IH, xIT);
    and #30(Oy3, IG, xIT);
    // represents the OR gate that decides the output value of the Oyellow
    or  #20(Oyellow, Oy1, Oy2, Oy3);
    // represents the AND gates that are shown in the circuit that would lead to the GREEN output
    and #30(Og1, xIG, xIS, xIT);
    and #30(Og2, xIG, xIH, xIT);
    // represents the OR gate that decides the output value of the Ogreen
    or  #20(Ogreen, Og1, Og2);
endmodule

