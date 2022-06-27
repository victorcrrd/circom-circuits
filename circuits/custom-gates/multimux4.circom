pragma ultraPlonk;

custom_gate MultiMux4(n) {
    signal input c[n][16];
    signal input s[4];

    signal output out[n];

    var a3210[n];
    var a321[n];
    var a320[n];
    var a310[n];
    var a32[n];
    var a31[n];
    var a30[n];
    var a3[n];

    var a210[n];
    var a21[n];
    var a20[n];
    var a10[n];
    var a2[n];
    var a1[n];
    var a0[n];
    var a[n];

    var s10 = s[1] * s[0];
    var s20 = s[2] * s[0];
    var s21 = s[2] * s[1];
    var s210 = s21 * s[0];

    for (var i = 0; i < n; i++) {
        a3210[i] = (c[i][15] - c[i][14] - c[i][13] + c[i][12] - c[i][11] + c[i][10] + c[i][9] - c[i][8] - c[i][7] + c[i][6] + c[i][5] - c[i][4] + c[i][3] - c[i][2] - c[i][1] + c[i][0]) * s210;
        a321[i] =  (c[i][14] - c[i][12] - c[i][10] + c[i][8] - c[i][6] + c[i][4] + c[i][2] - c[i][0]) * s21;
        a320[i] = (c[i][13] - c[i][12] - c[i][9] + c[i][8] - c[i][5] + c[i][4] + c[i][1] - c[i][0]) * s20;
        a310[i] = (c[i][11] - c[i][10] - c[i][9] + c[i][8] - c[i][3] + c[i][2] + c[i][1] - c[i][0]) * s10;
        a32[i] = (c[i][12] - c[i][8] - c[i][4] + c[i][0]) * s[2];
        a31[i] = (c[i][10] - c[i][8] - c[i][2] + c[i][0]) * s[1];
        a30[i] = (c[i][9] - c[i][8] - c[i][1] + c[i][0]) * s[0];
        a3[i] = (c[i][8] - c[i][0]);

        a210[i] = (c[i][7] - c[i][6] - c[i][5] + c[i][4] - c[i][3] + c[i][2] + c[i][1] - c[i][0]) * s210;
        a21[i] = (c[i][6] - c[i][4] - c[i][2] + c[i][0]) * s21;
        a20[i] = (c[i][5] - c[i][4] - c[i][1] + c[i][0]) * s20;
        a10[i] = (c[i][3] - c[i][2] - c[i][1] + c[i][0]) * s10;
        a2[i] = (c[i][4] - c[i][0]) * s[2];
        a1[i] = (c[i][2] - c[i][0]) * s[1];
        a0[i] = (c[i][1] - c[i][0]) * s[0];
        a[i] = c[i][0];

        out[i] <-- (a3210[i] + a321[i] + a320[i] + a310[i] + a32[i] + a31[i] + a30[i] + a3[i]) * s[3] + (a210[i] +  a21[i] +  a20[i] +  a10[i] +  a2[i] +  a1[i] +  a0[i] +  a[i]);
    }
}
