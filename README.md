## 8-Bit Barrel Shifter (Rotate Left & Rotate Right)

This project implements an 8-bit circular barrel shifter capable of performing both left and right rotations using purely combinational logic. The design highlights the bit-level operations used in hardware datapaths, where rotation is needed for alignment, encoding, encryption, and high-speed signal processing.

Unlike standard logical shifts that discard bits, this barrel shifter wraps bits around, preserving all 8 bits regardless of shift amount. The module is written manually using clear bit-slicing and concatenation to show exactly how hardware wires are rearranged during rotation.

## Overview

The barrel shifter accepts:

data_in : 8-bit input word

amt : 3-bit rotation amount (0–7)

sel : rotation direction (0 = left, 1 = right)

It outputs:

data_out : rotated 8-bit word

The design uses two structured case blocks — one for left rotation and one for right rotation — allowing easy visualization of how bits wrap around for each shift amount.

## Features

8-bit wide circular rotation

Supports rotate left and rotate right

Controlled by a single direction select (sel)

Fully combinational, no clock required

Manual case-based bit mapping for clarity

Clean and deterministic simulation results

Testbench included for verification

## Design Explanation

## Rotation Direction

The module chooses direction based on sel:

When sel = 1 → Rotate Right
The LSB moves to the MSB position, remaining bits shift right.

When sel = 0 → Rotate Left
The MSB wraps around to the LSB side, remaining bits shift left.

## Rotation Amount

The 3-bit amt selects one of eight rotation configurations.
For example:

amt = 3'b001 rotates by 1 bit

amt = 3'b100 rotates by 4 bits

amt = 3'b111 rotates by 7 bits

Each case explicitly constructs the rotated output using:

{bits_to_wrap, bits_to_shift}

This mirrors exactly how real hardware multiplexers route signals.

## Testbench Summary

The testbench verifies:

multiple rotation amounts

correct direction switching

edge cases (0 and 7-bit rotations)

output stability

logic correctness for both left and right paths

It uses $monitor to track changes and prints the rotation direction using $display, making debugging intuitive.

Waveforms confirm that all outputs rotate exactly as expected.

## Possible Extensions

Future enhancements may include:

parameterized data width

combined rotate/shift unit

arithmetic shift mode

pipelined version for high-frequency operation

synthesizable version optimized with generate statements
