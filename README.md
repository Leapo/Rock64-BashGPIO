# Rock64-Utilities
Libraries and utilities for the Rock64 single-board computer

# Bash Libraries
rock64-gpiolib
A basic GPIO library for the Rock64

**Supported Functions**
* gpio-setup
  - Set up a new GPIO export for use as an input or output. If set as an input, set the state to pulled-up or pulled-down.
  - Arguments: GPIO #, in/out, up/down, rising/falling/both/none
* gpio-output
  - Set the value of a GPIO output
  - Arguments: GPIO #, high/low
* gpio-input
  - Read the value of a GPIO input or output
  - Arguments: GPIO #
* gpio-pwm
  - Generate a software PWM signal
  - Arguments: GPIO #, Frequency (Hz), Duty Cycle (%), Repeatitions
* gpio-pwm-calc
  - Generate required high/low timings for the gpio-pwm-raw function based on frequency and duty cycle.
  - Arguments: Frequency (Hz), Duty Cycle (%)
* gpio-pwm-raw
  - Generate a software PWM signal using raw timing values (Timings may be pre-computed by gpio-pwm-calc)
  - Arguments: GPIO #, Sleep High Duration (Seconds), Sleep Low Duration (Seconds), Repeatitions
* gpio-cleanup
  - Cleanup one, or all, GPIO exports
  - Arguments: GPIO# (Leave blank to clear all GPIO exports)

# Python Libraries
R64.GPIO
A re-implementation of the RPi.GPIO library for the Rock64. Currently under development.

# Resources
List of resources used while building the scripts and libraries in this repository
* [GPIO/SYSFS Documentation](https://www.kernel.org/doc/Documentation/gpio/sysfs.txt)
