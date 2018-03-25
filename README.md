# Rock64-Utilities
A collection of libraries, utilities, and code examples for the Rock64 single-board computer

## Bash Libraries and Scripts
**rock64-gpiolib**<br>
A basic GPIO library for the Rock64 for Bash shell scripts

Function      | Arguments                                         
------------- | ---------
gpio-setup    | *GPIO #, in/out, up/down, rising/falling/both/none*
gpio-output   | *GPIO #, high/low*
gpio-input    | *GPIO #*
gpio-pwm      | *GPIO #, Frequency (Hz), Duty Cycle (%), Repeatitions*
gpio-pwm-calc | *Frequency (Hz), Duty Cycle (%)*
gpio-pwm-raw  | *GPIO #, Sleep High Duration (Seconds), Sleep Low Duration (Seconds), Repeatitions*
gpio-cleanup  | *GPIO# (Leave blank to clear all GPIO exports)*

**rock64-pwm-test**<br>
A test script utilizing the rock64-gpiolib library to set the brightness on an LED via software PWM.

## Python Libraries and Scripts
### R64.GPIO
A re-implementation of the RPi.GPIO library for the Rock64. Currently under development.

# Resources
List of resources used while building the scripts and libraries in this repository
* [GPIO/SYSFS Documentation](https://www.kernel.org/doc/Documentation/gpio/sysfs.txt)
