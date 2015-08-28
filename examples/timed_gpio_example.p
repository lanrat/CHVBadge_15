/******************************************************************************
 * Copyright 2014-2015 Specialized Solutions LLC
 *
 * Title to the Materials (contents of this file) remain with Specialized
 * Solutions LLC.  The Materials are copyrighted and are protected by United
 * States copyright laws.  Copyright notices cannot be removed from the
 * Materials.
 *
 * QCM Timed GPIO example
 *
 *****************************************************************************/

@timer0()
{
    qcm_gpio_set(GPIO_OUTPUT_0, !qcm_gpio_get_output(GPIO_OUTPUT_0))
	qcm_gpio_set(GPIO_OUTPUT_1, !qcm_gpio_get_output(GPIO_OUTPUT_1))

}

@timer1()
{
    qcm_gpio_set(GPIO_OUTPUT_2, !qcm_gpio_get_output(GPIO_OUTPUT_2))
    qcm_gpio_set(GPIO_OUTPUT_3, !qcm_gpio_get_output(GPIO_OUTPUT_3))
}

@timer2()
{
    printf("All done.\n")
    qcm_gpio_set(GPIO_OUTPUT_0, false)
    qcm_gpio_set(GPIO_OUTPUT_1, false)
    qcm_gpio_set(GPIO_OUTPUT_2, false)
    qcm_gpio_set(GPIO_OUTPUT_3, false)
    qcm_console_disable()
}

main()
{
    qcm_console_enable()

    printf "Starting Timed GPIO Example\n"

    qcm_gpio_set(GPIO_OUTPUT_0, true)
   	qcm_gpio_set(GPIO_OUTPUT_1, false)
    qcm_gpio_set(GPIO_OUTPUT_2, false)
    qcm_gpio_set(GPIO_OUTPUT_3, true)

    qcm_timer_start(TIMER_0,100,true)
    qcm_timer_start(TIMER_1,50,true)
    qcm_timer_start(TIMER_2,5000,false)

}

