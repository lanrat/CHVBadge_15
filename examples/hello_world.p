/******************************************************************************
 * Copyright 2014-2015 Specialized Solutions LLC
 *
 * Title to the Materials (contents of this file) remain with Specialized
 * Solutions LLC.  The Materials are copyrighted and are protected by United
 * States copyright laws.  Copyright notices cannot be removed from the
 * Materials.
 *
 * Hello World Example 
 *
 * Shows how to use timers, printf, and the 7-segment display
 *
 *****************************************************************************/

@timer0() <blank>
{
	qcm_seg_set(false, 0)
	state hi
}

@timer0() <hi>
{
	qcm_seg_set_raw(true, 0b11111111,0b01010110,0b10011111)
	state def
}

@timer0() <def>
{
	qcm_seg_set_raw(true, 0b00011010, 0b01110000, 0b01110100)
	state con
}

@timer0() <con>
{
	qcm_seg_set_raw(true, 0b11110000, 0b10010000, 0b01011110)
	state number23
}

@timer0() <number23>
{
	qcm_seg_set(true, 23)
	state blank
}

main()
{
	qcm_console_enable()
    
	printf "Hello world\n"
	
	state blank
	
	qcm_timer_start(TIMER_0, 500, true)
	
	qcm_console_disable()
}
