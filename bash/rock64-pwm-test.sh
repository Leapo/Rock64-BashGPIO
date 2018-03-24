#!/bin/bash

# Sources
source ./rock64-gpiolib.sh

# Assign GPIOs
var_gpio_led1=101

# Setup GPIOs
gpio-setup $var_gpio_led1 out

# trap ctrl-c interrupt for GPIO cleanup
function script-cleanup {
    echo ""
    echo "Cleaning up, stopping..."
    gpio-cleanup $var_gpio_led1
    exit
}
trap 'script-cleanup' INT

# Console Output
echo "Testing PWM Duty Cycle Scaling..."

# Sustained PWM values
# Options for gpio-pwm: GPIO, Hz, DutyCycle, Duration
gpio-pwm $var_gpio_led1 60 0 100
gpio-pwm $var_gpio_led1 60 50 100
gpio-pwm $var_gpio_led1 60 100 100

# Precalculate PWM values for gpio-pwm-raw
# Options for gpio-pwm-calc: Hz, DutyCycle
var_throb0=$(gpio-pwm-calc 60 0)
var_throb1=$(gpio-pwm-calc 70 10)
var_throb2=$(gpio-pwm-calc 75 20)
var_throb3=$(gpio-pwm-calc 75 30)
var_throb4=$(gpio-pwm-calc 75 40)
var_throb5=$(gpio-pwm-calc 75 50)
var_throb6=$(gpio-pwm-calc 75 60)
var_throb7=$(gpio-pwm-calc 75 70)
var_throb8=$(gpio-pwm-calc 75 80)
var_throb9=$(gpio-pwm-calc 70 90)
var_throb10=$(gpio-pwm-calc 60 100)

# Brighten/dim an atached LED until the script is interupted.
# Options for gpio-pwm-raw: GPIO, $(gpio_pwm_calc Hz DutyCycle), duration
while true; do
    gpio-pwm-raw $var_gpio_led1 $var_throb0 7
    gpio-pwm-raw $var_gpio_led1 $var_throb1 5
    gpio-pwm-raw $var_gpio_led1 $var_throb2 5
    gpio-pwm-raw $var_gpio_led1 $var_throb3 5
    gpio-pwm-raw $var_gpio_led1 $var_throb4 5
    gpio-pwm-raw $var_gpio_led1 $var_throb5 5
    gpio-pwm-raw $var_gpio_led1 $var_throb6 5
    gpio-pwm-raw $var_gpio_led1 $var_throb7 5
    gpio-pwm-raw $var_gpio_led1 $var_throb8 5
    gpio-pwm-raw $var_gpio_led1 $var_throb9 10
    gpio-pwm-raw $var_gpio_led1 $var_throb10 15
    gpio-pwm-raw $var_gpio_led1 $var_throb9 10
    gpio-pwm-raw $var_gpio_led1 $var_throb8 5
    gpio-pwm-raw $var_gpio_led1 $var_throb7 5
    gpio-pwm-raw $var_gpio_led1 $var_throb6 5
    gpio-pwm-raw $var_gpio_led1 $var_throb5 5
    gpio-pwm-raw $var_gpio_led1 $var_throb4 5
    gpio-pwm-raw $var_gpio_led1 $var_throb3 5
    gpio-pwm-raw $var_gpio_led1 $var_throb2 5
    gpio-pwm-raw $var_gpio_led1 $var_throb1 5
done
