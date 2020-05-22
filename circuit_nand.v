//Input
//  IG - gas sensor
//  IS - smoke sensor
//  IH - humidity sensor
//  IT - temperature sensor
//Output 
//  Ored- output for the red LED
//  Oyellow- output for the yellow LED
//  Ogreen- output for the green LED

module circuit_nand( output Ored, Oyellow, Ogreen, input IG, IS, IH, IT);
    wire xIG, xIS, xIH, xIT, Or1, Or2, Oy1, Oy2, Oy3, Og1, Og2;
    // represents the NOT gates that are shown in the circuit
    nand (xIG, IG);
    nand (xIS, IS);
    nand (xIH, IH);
    nand (xIT, IT);
    // represents the AND gates that are shown in the circuit that would lead to the RED output
    nand (Or1, IS, IT);
    nand (Or2, IG, IT);
    // represents the OR gate that decides the output value of the Ored
    nand  (Ored, Or1, Or2);
    // represents the AND gates that are shown in the circuit that would lead to the YELLOW output
    nand (Oy1, xIG, xIS, IT);
    nand (Oy2, IS, IH, xIT);
    nand (Oy3, IG, xIT);
    // represents the OR gate that decides the output value of the Oyellow
    nand  (Oyellow, Oy1, Oy2, Oy3);
    // represents the AND gates that are shown in the circuit that would lead to the GREEN output
    nand (Og1, xIG, xIS, xIT);
    nand (Og2, xIG, xIH, xIT);
    // represents the OR gate that decides the output value of the Ogreen
    nand  (Ogreen, Og1, Og2);
endmodule
