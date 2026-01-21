module water_tank_lvl(motor,reset,low_level,high_level);
input wire reset;
input wire low_level;
input wire high_level;
output reg motor;

always @(*) begin
    if(reset)
     motor = 0;
    else if(high_level)
     motor = 0;
    else if(low_level)
     motor = 1;
    
    else
      motor = motor;
end
endmodule
