pragma custom_templates;

include "custom-gates/multimux4.circom";
//include "multimux4.circom"

template Mux4() {
    signal input c[16];
    signal input s[4];

    signal output out;

    var i;
    component mux = MultiMux4(1);

    for (i = 0; i < 16; i++) {
        mux.c[0][i] <== c[i];
    }

    for (i = 0; i < 4; i++) {
        mux.s[i] <== s[i];
    }

    out <== mux.out[0];
}
