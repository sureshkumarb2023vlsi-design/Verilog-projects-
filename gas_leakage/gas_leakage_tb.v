module gas_leakage_tb();
reg sensor;
wire fan;
wire alarm;

gas_leakage uut(alarm,fan,sensor);

initial begin
    
    $dumpfile("dump.vcd");
    $dumpvars(0,gas_leakage_tb);
    $monitor("sensor = %b alarm = %b fan = %b",sensor,alarm,fan);
    sensor = 0; #10;
    sensor = 1; #10;
    sensor = 0; #10;
    sensor = 1; #10;

    $finish;

end
endmodule