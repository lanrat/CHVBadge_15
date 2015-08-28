/******************************************************************************
 * Copyright 2015 Specialized Solutions LLC
 *
 * Title to the Materials (contents of this file) remain with Specialized
 * Solutions LLC.  The Materials are copyrighted and are protected by United
 * States copyright laws.  Copyright notices cannot be removed from the
 * Materials.
 *
 * Pawn built-in state machine example
 *
 *****************************************************************************/

print_state() <initial>
{
	printf("In the initial state\n")
}

print_state() <state1>
{
	printf("In the state1 state\n")
}

print_state() <state2>
{
	printf("In the state2 state\n")
}

print_state() <state3>
{
	printf("In the state3 state\n")
}

print_state() <state4>
{
	printf("In the state4 state\n")
}

print_state() <>
{
	printf("In an unknown state\n")
}

@gpio_input_switch() <initial>
{
	print_state()
	state state1
}

@gpio_input_switch() <state1>
{
	print_state()
	state state2

}

@gpio_input_switch() <state2>
{
	print_state()
	state state3

}

@gpio_input_switch() <state3>
{
	print_state()
	state state4

}

@gpio_input_switch() <state4>
{
	print_state()
	state state1
}

@gpio_input_switch() <>
{
	print_state()
	state initial
}

main()
{
	qcm_console_enable()
    printf "Starting state machine example\n"
    state initial
    qcm_gpio_configure_handler(GPIO_INPUT_SWITCH, GPIO_EVENT_HIGH)
}

