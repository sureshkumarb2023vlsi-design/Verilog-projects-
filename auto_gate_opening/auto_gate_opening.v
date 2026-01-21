module automatic_gate_controller (clk,reset,entry_sensor,exit_sensor,gate_open,gate_close);
    input  wire clk;
    input  wire reset;
    input  wire entry_sensor;
    input  wire exit_sensor;
    output reg  gate_open;
    output reg  gate_close;
  
  
    parameter IDLE    = 2'b00;
    parameter OPENING = 2'b01;
    parameter OPEN    = 2'b10;
    parameter CLOSING = 2'b11;
  
     reg [1:0] state,next_state;


     always @(posedge clk or posedge reset) begin
        if (reset)
            state <= IDLE;
        else
            state <= next_state;
    end

     always @(*) begin
        case (state)
            IDLE:     if (entry_sensor)
                          next_state = OPENING; 
                     else
                          next_state = IDLE;
                          
            OPENING:  next_state = OPEN;

            OPEN:     if (exit_sensor) 
                          next_state = CLOSING;
                      else
                          next_state = OPEN;
            CLOSING:  next_state = IDLE;
            default:  next_state = IDLE;
        endcase
    end

     always @(*) begin
        gate_open  = 0;
        gate_close = 0;

        case (state)
            OPENING:  gate_open  = 1;
            CLOSING:  gate_close = 1;
        endcase
    end

endmodule
