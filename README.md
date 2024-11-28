Vivado-Embedded-Design
Overview
This repository contains embedded system designs developed using Vivado for various components in an FPGA-based system. The projects include:

Clock Divider: A module that generates a divided clock signal to meet the timing requirements of different parts of the system.
SPI Transmitter/Receiver: A system for communication using the Serial Peripheral Interface (SPI) protocol, enabling data exchange between devices.
These designs aim to demonstrate basic FPGA functionality, including clock generation and serial communication.

Components
1. Clock Divider
The Clock Divider module takes a high-frequency input clock and divides it down to a lower frequency to suit the needs of other system components. This is commonly used in systems where multiple clocks with different frequencies are required.

2. SPI Transmitter and Receiver
The SPI Transmitter and Receiver modules are used to send and receive data over the SPI protocol. SPI is widely used for communication between an FPGA and other peripheral devices such as sensors, ADCs, or external microcontrollers.

Project Structure
Clock_Divider: Vivado project files for clock division functionality.
SPI: Vivado project files for implementing SPI communication (Transmitter and Receiver).
PS_PL_Communication: Includes the design to handle communication between the Processing System (PS) and the Programmable Logic (PL).
How to Use
Open Vivado and import the project files.
Compile and generate the bitstream for the FPGA.
Implement the Clock Divider and SPI communication using the corresponding modules.
Use the SPI interface to communicate with external peripherals.
Dependencies
Vivado: Ensure you are using the correct version of Vivado that supports these designs.
