# Rock64-Utilities
Libraries and utilities for the Rock64 single-board computer

## Bash - rock64-gpiolib
A basic GPIO library for the Rock64 for Bash shell scripts

**gpio-setup**<br>
Set up a new GPIO export for use as an input or output. If set as an input, set the state to pulled-up or pulled-down.<br>
Arguments: *GPIO #, in/out, up/down, rising/falling/both/none*

**gpio-output**<br>
Set the value of a GPIO output<br>
Arguments: *GPIO #, high/low*

**gpio-input**<br>
Read the value of a GPIO input or output<br>
Arguments: *GPIO #*

**gpio-pwm**<br>
Generate a software PWM signal<br>
Arguments: *GPIO #, Frequency (Hz), Duty Cycle (%), Repeatitions*

**gpio-pwm-calc**<br>
Generate required high/low timings for the gpio-pwm-raw function based on frequency and duty cycle.<br>
Arguments: *Frequency (Hz), Duty Cycle (%)*

**gpio-pwm-raw**<br>
Generate a software PWM signal using raw timing values (Timings may be pre-computed by gpio-pwm-calc)<br>
Arguments: *GPIO #, Sleep High Duration (Seconds), Sleep Low Duration (Seconds), Repeatitions*

**gpio-cleanup**<br>
Cleanup one, or all, GPIO exports<br>
Arguments: *GPIO# (Leave blank to clear all GPIO exports)*

## Python - R64.GPIO
A re-implementation of the RPi.GPIO library for the Rock64. Currently under development.

# Resources
List of resources used while building the scripts and libraries in this repository
* [GPIO/SYSFS Documentation](https://www.kernel.org/doc/Documentation/gpio/sysfs.txt)
