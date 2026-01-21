module lift_floor_indicator_tb();
reg[2:0] floor;
wire[6:0] seg;

lift_floor_indicator uut(floor,seg);

initial begin

    $dumpfile("dump.vcd");
    $dumpvars(0,lift_floor_indicator_tb);
    $monitor("floor=%b seg=%b",floor,seg);

    floor = 3'b000; #10;
    floor = 3'b001; #10;
    floor = 3'b010; #10;
    floor = 3'b011; #10;
    floor = 3'b100; #10;
    floor = 3'b101; #10;
    floor = 3'b110; #10;
    floor = 3'b111; #10;

    $finish;
end
endmodule
