# Rock64-BashGPIO
A collection of Bash libraries, utilities, and scripts for the Rock64 single-board computer

## Bash Libraries and Scripts
**rock64-gpiolib.sh**<br>
A basic GPIO library for the Rock64 for Bash shell scripts

Function        | Arguments                                         
:-------------- | :---------
`gpio-setup`    | GPIO #, in/out, up/down, rising/falling/both/none
`gpio-output`   | GPIO #, high/low
`gpio-input`    | GPIO #
`gpio-pwm`      | GPIO #, Frequency (Hz), Duty Cycle (%), Repeatitions
`gpio-pwm-calc` | Frequency (Hz), Duty Cycle (%)
`gpio-pwm-raw`  | GPIO #, Sleep High Duration (Seconds), Sleep Low Duration (Seconds), Repeatitions
`gpio-cleanup`  | GPIO# (Leave blank to clear all GPIO exports)

**rock64-pwm-test.sh**<br>
A test script utilizing the rock64-gpiolib library to set the brightness on an LED via software PWM.

# Resources
List of resources used while building the scripts and libraries in this repository
* [Kernel.org - GPIO/SYSFS Documentation](https://www.kernel.org/doc/Documentation/gpio/sysfs.txt)
* [Pine64 Forum - GPIO LED blinker using SYSFS on the Rock64](https://forum.pine64.org/showthread.php?tid=4695)
