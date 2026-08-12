`timescale 1ns/1ps

module pwm_generator (

    input  wire       clk,
    input  wire       reset,

    input  wire [7:0] duty_cycle,

    output reg        pwm_out

);

    reg [7:0] counter;


    // -----------------------------------------
    // PWM Counter
    // -----------------------------------------

    always @(posedge clk or posedge reset) begin

        if (reset)

            counter <= 8'd0;

        else

            counter <= counter + 1'b1;

    end


    // -----------------------------------------
    // PWM Comparator
    // -----------------------------------------

    always @(*) begin

        if (counter < duty_cycle)

            pwm_out = 1'b1;

        else

            pwm_out = 1'b0;

    end

endmodule