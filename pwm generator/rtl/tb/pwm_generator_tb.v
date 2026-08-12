`timescale 1ns/1ps

module pwm_generator_tb;

    reg clk;
    reg reset;

    reg [7:0] duty_cycle;

    wire pwm_out;


    // -----------------------------------------
    // DUT
    // -----------------------------------------

    pwm_generator DUT (

        .clk(clk),
        .reset(reset),

        .duty_cycle(duty_cycle),

        .pwm_out(pwm_out)

    );


    // -----------------------------------------
    // Clock
    // -----------------------------------------

    always #5 clk = ~clk;


    // -----------------------------------------
    // Waveform
    // -----------------------------------------

    initial begin

        $dumpfile("waveform.vcd");

        $dumpvars(0, pwm_generator_tb);

    end


    // -----------------------------------------
    // Test
    // -----------------------------------------

    initial begin

        clk = 0;

        reset = 1;

        duty_cycle = 8'd0;


        // Reset

        #20;

        reset = 0;


        // -------------------------------------
        // 25% Duty Cycle
        // -------------------------------------

        duty_cycle = 8'd64;

        #2560;


        // -------------------------------------
        // 50% Duty Cycle
        // -------------------------------------

        duty_cycle = 8'd128;

        #2560;


        // -------------------------------------
        // 75% Duty Cycle
        // -------------------------------------

        duty_cycle = 8'd192;

        #2560;


        // -------------------------------------
        // 100% Duty Cycle
        // -------------------------------------

        duty_cycle = 8'd255;

        #2560;


        $display("");
        $display("==============================");
        $display(" PWM GENERATOR TEST");
        $display("==============================");

        $display(
            "Duty Cycle Input = %d",
            duty_cycle
        );

        $display(
            "PWM Output       = %b",
            pwm_out
        );

        $display("==============================");


        #100;

        $finish;

    end


    // -----------------------------------------
    // Monitor
    // -----------------------------------------

    initial begin

        $monitor(
            "Time=%0t Counter=%d Duty=%d PWM=%b",
            $time,
            DUT.counter,
            duty_cycle,
            pwm_out
        );

    end

endmodule