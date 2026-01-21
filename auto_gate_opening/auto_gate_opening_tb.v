module automatic_gate_controller_tb();
    reg clk = 0, reset = 1;
    reg entry_sensor, exit_sensor;
    wire gate_open, gate_close;

    automatic_gate_controller dut (
        .clk(clk), .reset(reset),
        .entry_sensor(entry_sensor),
        .exit_sensor(exit_sensor),
        .gate_open(gate_open),
        .gate_close(gate_close)
    );

    always #5 clk = ~clk;

    initial begin
        $dumpfile("dump.vcd");
        $dumpvars(0,automatic_gate_controller_tb);
        $monitor("clk=%b reset=%b entry_sensor=%b exit_sensor=%b gate_open=%b gate_close=%b",clk,reset,entry_sensor,exit_sensor,gate_open,gate_close);
    reset = 1; 
        entry_sensor = 0; exit_sensor = 0; #10
        
     reset = 0;
         entry_sensor = 1; #10  entry_sensor = 0; #20    
         exit_sensor = 1;  #10  exit_sensor = 0; #20  

         $finish ;
    end
endmodule
