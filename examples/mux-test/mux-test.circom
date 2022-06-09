pragma circom 2.0.3;
pragma ultraPlonk;

include "bitify.circom";
include "mux.circom";

template Constants() {
    signal output out[2];

    out[0] <== 37;
    out[1] <== 47;
}

template Main() {
    signal input selector;
    signal output out;

    custom_component mux = Mux(1);
    component n2b = Num2Bits(1);
    component cst = Constants();
    custom_component useless = Mux(1);
    custom_component another_useless = Mux(2);

    selector ==> n2b.in;
    n2b.out[0] ==> mux.s;
    n2b.out[0] ==> useless.s; 
    n2b.out[0] ==> another_useless.s; 
    for (var i = 0; i < 2; i++) {
        cst.out[i] ==> mux.c[0][i];
        cst.out[i] ==> useless.c[0][i];
        cst.out[i] ==> another_useless.c[0][i];
        cst.out[i] ==> another_useless.c[1][i];
    }

    mux.out[0] ==> out;
    signal suseless;
    useless.out[0] ==> suseless;
    signal sanother_useless[2];
    another_useless.out[0] ==> sanother_useless[0];
    another_useless.out[1] ==> sanother_useless[1];
}

component main = Main();
