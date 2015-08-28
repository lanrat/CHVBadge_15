/******************************************************************************
 * Copyright 2014-2015 Specialized Solutions LLC
 *
 * Title to the Materials (contents of this file) remain with Specialized
 * Solutions LLC.  The Materials are copyrighted and are protected by United
 * States copyright laws.  Copyright notices cannot be removed from the
 * Materials.
 *
 * Floating point examples
 *
 *****************************************************************************/
new Float:test

    
main()
{
    qcm_console_enable()

    printf "Starting Float Example\n"

    test = 2.0123456789

	test = test * 2.3
	
	printf("%f\n", test)
	
	test -= 1.0;
	
	printf("%f\n", test)
	
	qcm_console_disable()
	
    

}


