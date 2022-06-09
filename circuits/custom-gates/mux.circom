custom_gate Mux(n) {
    signal input c[n][2]; // constants
    signal input s; // selector
    signal output out[n];
    
    for (var i = 0; i < n; i++) {
        out[i] <-- (c[i][1] - c[i][0])*s + c[i][0];
    }
}

