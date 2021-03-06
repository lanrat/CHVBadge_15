/******************************************************************************
 * Copyright 2014-2015 Specialized Solutions LLC
 *
 * Title to the Materials (contents of this file) remain with Specialized
 * Solutions LLC.  The Materials are copyrighted and are protected by United
 * States copyright laws.  Copyright notices cannot be removed from the
 * Materials.
 *
 * QCM Timer Example
 *
 *****************************************************************************/
timer_notice(timer)
{
    printf("T%d expired at %d\n", timer, qcm_get_system_time())
}


@timer0()
{
    timer_notice(0);
}

@timer1()
{
    timer_notice(1);
}

@timer2()
{
    timer_notice(2);
}

@timer3()
{
    timer_notice(3);
}

@timer4()
{
    timer_notice(4)
    printf("Tests completed\n");
    qcm_console_disable()
}

main()
{
    qcm_console_enable()

    printf "Starting Timed GPIO Example\n"

    qcm_timer_start(TIMER_0,250,false)
    qcm_timer_start(TIMER_1,500,false)
    qcm_timer_start(TIMER_2,750,false)
    qcm_timer_start(TIMER_3,1000,true)
    qcm_timer_start(TIMER_4,6000,false)
    
}


