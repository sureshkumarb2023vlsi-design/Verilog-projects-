module gas_leakage(alarm,fan,sensor);
input sensor;
output alarm;
output fan;
assign alarm = sensor;
assign fan = sensor;
endmodule
