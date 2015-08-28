/******************************************************************************
 * Copyright 2014-2015 Specialized Solutions LLC
 *
 * Title to the Materials (contents of this file) remain with Specialized
 * Solutions LLC.  The Materials are copyrighted and are protected by United
 * States copyright laws.  Copyright notices cannot be removed from the
 * Materials.
 *
 * QCM GPIO Example
 *
 *****************************************************************************/
new counter = 0

print_gpio_notice(gpio, bool:io_state)
{
    printf("GPIO %d event - state %d\n", gpio, io_state)
}

@gpio_input0()
{
    print_gpio_notice(0, qcm_gpio_get_input(GPIO_INPUT_0))
    
    new bool:io_state = qcm_gpio_get_output(GPIO_OUTPUT_0)
    
    if (io_state == true)
    {
        io_state = false
    }
    else
    {
        io_state = true
    }
    
    qcm_gpio_set(GPIO_OUTPUT_0, io_state)
}

@gpio_input1()
{
    print_gpio_notice(1, qcm_gpio_get_input(GPIO_INPUT_1))
    
    new bool:io_state = qcm_gpio_get_output(GPIO_OUTPUT_1)
    
    if (io_state == true)
    {
        io_state = false
    }
    else
    {
        io_state = true
    }
    
    qcm_gpio_set(GPIO_OUTPUT_1, io_state)
}

@gpio_input2()
{
    print_gpio_notice(2, qcm_gpio_get_input(GPIO_INPUT_2))
    
    new bool:io_state = qcm_gpio_get_output(GPIO_OUTPUT_2)
    
    if (io_state == true)
    {
        io_state = false
    }
    else
    {
        io_state = true
    }
    
    qcm_gpio_set(GPIO_OUTPUT_2, io_state)

    
}

@gpio_input3()
{
    print_gpio_notice(3, qcm_gpio_get_input(GPIO_INPUT_3))
    
    new bool:io_state = qcm_gpio_get_output(GPIO_OUTPUT_3)
    
    if (io_state == true)
    {
        io_state = false
    }
    else
    {
        io_state = true
    }
    
    qcm_gpio_set(GPIO_OUTPUT_3, io_state)
    
}

@gpio_input_switch()
{
    print_gpio_notice(100, qcm_gpio_get_input(GPIO_INPUT_SWITCH))
    
    counter++

    if (counter > 3)
    {
        printf("All done.\n")
        qcm_console_disable()
    }
}

@gpio_input_obd2()
{
    print_gpio_notice(120, qcm_gpio_get_input(GPIO_INPUT_OBD2))
}


main()
{
    qcm_console_enable();

    printf "Starting GPIO Example\n"
    
    qcm_gpio_set(GPIO_OUTPUT_0, false);
    qcm_gpio_set(GPIO_OUTPUT_1, false);
    qcm_gpio_set(GPIO_OUTPUT_2, true);
	qcm_gpio_set(GPIO_OUTPUT_3, true);
    
    qcm_gpio_configure_handler(GPIO_INPUT_0, GPIO_EVENT_LOW)
    qcm_gpio_configure_handler(GPIO_INPUT_1, GPIO_EVENT_HIGH)
    qcm_gpio_configure_handler(GPIO_INPUT_2, GPIO_EVENT_ALL)
	qcm_gpio_configure_handler(GPIO_INPUT_3, GPIO_EVENT_ALL)
    qcm_gpio_configure_handler(GPIO_INPUT_SWITCH, GPIO_EVENT_HIGH)
	qcm_gpio_configure_handler(GPIO_INPUT_OBD2, GPIO_EVENT_ALL)
    
}