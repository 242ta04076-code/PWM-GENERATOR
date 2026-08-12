# PWM Generator using Verilog HDL

## 📌 Project Overview

This project implements a Pulse Width Modulation (PWM) Generator
using Verilog HDL.

PWM is a digital technique used to control the average power delivered
to a load by changing the duty cycle of a periodic digital signal.

The design generates a PWM signal with programmable duty cycle.

---

## 🎯 Objective

To design and simulate a configurable PWM generator using Verilog HDL.

The project demonstrates:

- Counter-based PWM generation
- Duty-cycle control
- Frequency control
- Comparator logic
- Synchronous digital design
- RTL simulation

---

## ⚡ What is PWM?

PWM stands for Pulse Width Modulation.

A PWM signal consists of:

- HIGH period
- LOW period
- Fixed switching frequency
- Variable duty cycle

Example:

```text
25% Duty Cycle

PWM  ────┐    ┌    ┌
         │    │    │
─────────┘────┘────┘

      HIGH = 25%
      LOW  = 75%
```

---

## 📊 Duty Cycle

Duty cycle is defined as:

```text
Duty Cycle (%) =
(HIGH Time / Total Period) × 100
```

For example:

| Duty Cycle | HIGH Time |
|---:|---:|
| 0% | 0% |
| 25% | 25% |
| 50% | 50% |
| 75% | 75% |
| 100% | 100% |

---

## 🏗️ Block Diagram

```text
          Clock
            │
            ▼
     ┌──────────────┐
     │    Counter   │
     └──────┬───────┘
            │
            ▼
     ┌──────────────┐
     │  Comparator  │◄──── Duty Cycle
     └──────┬───────┘
            │
            ▼
        PWM Output
```

---

## 📌 Inputs

| Signal | Width | Description |
|---|---:|---|
| clk | 1 | System clock |
| reset | 1 | Reset |
| duty_cycle | 8 | Duty-cycle control |

---

## 📌 Outputs

| Signal | Width | Description |
|---|---:|---|
| pwm_out | 1 | PWM output |

---

## 🧠 Working Principle

An 8-bit counter continuously counts:

```text
0 → 1 → 2 → ... → 255 → 0
```

The counter is compared with the duty-cycle value.

```text
if counter < duty_cycle
        PWM = 1
else
        PWM = 0
```

For example:

```text
duty_cycle = 128

counter = 0 to 127
PWM = 1

counter = 128 to 255
PWM = 0
```

This produces approximately 50% duty cycle.

---

## 🧪 Verification

The testbench verifies:

- Reset
- 0% duty cycle
- 25% duty cycle
- 50% duty cycle
- 75% duty cycle
- 100% duty cycle

The generated PWM waveform is viewed using GTKWave.

---

## 🛠️ Tools

- Verilog HDL
- Icarus Verilog
- GTKWave
- ModelSim
- Xilinx Vivado

---

## 📈 Applications

PWM generators are commonly used in:

- Motor speed control
- LED brightness control
- DC-DC converters
- Servo control
- Fan control
- Power electronics
- FPGA systems
- Embedded systems

---

## 🚀 Future Enhancements

- Programmable PWM frequency
- 16-bit resolution
- Multiple PWM channels
- Servo motor control
- Dead-time insertion
- Complementary PWM
- FPGA hardware implementation
- AXI-controlled PWM
- Motor-control application

---

## 👩‍💻 Author

Harshitha Gangireddy