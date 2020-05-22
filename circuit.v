//Input
//  IG - gas sensor
//  IS - smoke sensor
//  IH - humidity sensor
//  IT - temperature sensor
//Output 
//  Ored- output for the red LED
//  Oyellow- output for the yellow LED
//  Ogreen- output for the green LED

module circuit( output Ored, Oyellow, Ogreen, input IG, IS, IH, IT);
    wire xIG, xIS, xIH, xIT, Or1, Or2, Oy1, Oy2, Oy3, Og1, Og2;
    // represents the NOT gates that are shown in the circuit
    not (xIG, IG);
    not (xIS, IS);
    not (xIH, IH);
    not (xIT, IT);
    // represents the AND gates that are shown in the circuit that would lead to the RED output
    and (Or1, IS, IT);
    and (Or2, IG, IT);
    // represents the OR gate that decides the output value of the Ored
    or  (Ored, Or1, Or2);
    // represents the AND gates that are shown in the circuit that would lead to the YELLOW output
    and (Oy1, xIG, xIS, IT);
    and (Oy2, IS, IH, xIT);
    and (Oy3, IG, xIT);
    // represents the OR gate that decides the output value of the Oyellow
    or  (Oyellow, Oy1, Oy2, Oy3);
    // represents the AND gates that are shown in the circuit that would lead to the GREEN output
    and (Og1, xIG, xIS, xIT);
    and (Og2, xIG, xIH, xIT);
    // represents the OR gate that decides the output value of the Ogreen
    or  (Ogreen, Og1, Og2);
endmodule

