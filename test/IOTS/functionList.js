"use strict";
exports.__esModule = true;
var t = require("io-ts");
// Schema.IOTSSpec.User
var User = t.type({
    userId: t.Int,
    name: t.string
});
var someFunctionArgA = t.array(User);
var someFunctionReturn = t.string;
