#!/bin/bash

# Allison Creely, 2018, GPLv3 License
# Rock 64 GPIO Library for Bash

# Internal VARs
GPIO_ROOT=/sys/class/gpio

# GPIO Setup
# Set up a new GPIO export for use
# Arguments: GPIO #, in/out
function gpio-setup {
    if [ ! -d $GPIO_ROOT/gpio$1 ]; then
        echo $1 > $GPIO_ROOT/export
    else
        echo "Warning: Export for GPIO $1 already exists"
    fi
    if [ "$2" == "out" ] || [ "$2" == "in" ]; then
        echo $2 > $GPIO_ROOT/gpio$1/direction
    else
        echo "Error: Invalid option. Valid options include: out, in"
    fi
}

# GPIO Output
# Set the value of a GPIO output
# Arguments: GPIO #, high/low
function gpio-output {
    if [ "$2" == "high" ]; then
        echo 1 > $GPIO_ROOT/gpio$1/value
    elif [ "$2" == "low" ]; then
        echo 0 > $GPIO_ROOT/gpio$1/value
    else
        echo "Error: Invalid option. Valid options include: high, low"
    fi
}

# GPIO Input
# Read the value of a GPIO
# Arguments: GPIO #
function gpio-input {
    cat $GPIO_ROOT/gpio$1/value
}

# GPIO PWM Calculator
# Generate required high/low timings for the gpio-pwm-raw function based on frequency and duty cycle.
# Arguments: Frequency (Hz), Duty Cycle (%)
function gpio-pwm-calc {
    sleep_low=$(bc <<< "scale=8; (1/$1)*((100-$2)/100)")
    sleep_high=$(bc <<< "scale=8; (1/$1)*((100-(100-$2))/100)")
    echo "$sleep_high $sleep_low"
}

# GPIO PWM Raw
# Generate a software PWM signal using raw timing values (Timings may be pre-computed by gpio-pwm-calc)
# Arguments: GPIO #, Sleep High Duration (Seconds), Sleep Low Duration (Seconds), Repeatitions
function gpio-pwm-raw {
    var_count=0
    while [ $var_count -lt $4 ]; do
        echo 1 > $GPIO_ROOT/gpio$1/value
        sleep $2
        echo 0 > $GPIO_ROOT/gpio$1/value
        let var_count=var_count+1
        if [ $var_count -le $4 ]; then sleep $3; fi
    done
}

# GPIO PWM
# Generate a software PWM signal
# Arguments: GPIO #, Frequency (Hz), Duty Cycle (%), Repeatitions
function gpio-pwm {
    sleep_low=$(bc <<< "scale=8; (1/$2)*((100-$3)/100)")
    sleep_high=$(bc <<< "scale=8; (1/$2)*((100-(100-$3))/100)")
    var_count=0
    while [ $var_count -lt $4 ]; do
        echo 1 > $GPIO_ROOT/gpio$1/value
        sleep $sleep_high
        echo 0 > $GPIO_ROOT/gpio$1/value
        let var_count=var_count+1
        if [ $var_count -le $4 ]; then sleep $sleep_low; fi
    done
}

# GPIO Cleanup
# Cleanup GPIO exports
# Arguments: GPIO# (Leave blank to clear  all GPIO exports)
function gpio-cleanup {
    if [ -z ${1+x} ]; then
        var_count=1
        while [ $var_count -le 104 ]; do
            (echo 0 > $GPIO_ROOT/gpio$var_count/value) > /dev/null 2>&1
            (echo $var_count > $GPIO_ROOT/unexport) > /dev/null 2>&1
            let var_count=var_count+1
        done
    else
        echo 0 > $GPIO_ROOT/gpio$1/value
        echo $1 > $GPIO_ROOT/unexport
    fi
}

echo "Rock64 GPIO library loaded"
