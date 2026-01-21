module water_tank_lvl_tb();
reg reset;
reg low_level;
reg high_level;
wire motor;

water_tank_lvl uut(motor,reset,low_level,high_level);

initial begin

    $dumpfile("dump.vcd");
    $dumpvars(0,water_tank_lvl_tb);
    $monitor("motor = %b reset = %b low_level = %b high_level = %b",motor,reset,low_level,high_level);

    reset = 1; low_level = 0; high_level = 0; #10;
    reset = 0;
    low_level = 0; high_level = 0; #10;
    low_level = 1; high_level = 0; #10;
    low_level = 0; high_level = 1; #10;
    low_level = 1; high_level = 1; #10;

end
endmodule

