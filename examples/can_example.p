/******************************************************************************
 * Copyright 2014-2015 Specialized Solutions LLC
 *
 * Title to the Materials (contents of this file) remain with Specialized
 * Solutions LLC.  The Materials are copyrighted and are protected by United
 * States copyright laws.  Copyright notices cannot be removed from the
 * Materials.
 *
 * QCM CAN Example
 *
 *****************************************************************************/

@can_rx0(rx_msg[QCM_CAN_MSG])
{
	new i;

	printf("Msg Received: %x, %d, %d : ", rx_msg.id, rx_msg.is_extended, rx_msg.dlc)

	for (i = 0; i < rx_msg.dlc; i++)
	{
		printf("%02x ", rx_msg.data[i])
	}

	printf("\r\n");

	rx_msg.id -= 1

	qcm_can_tx(rx_msg);


}


@can_rx2(rx_msg[QCM_CAN_MSG])
{
	new i;

	printf("Msg Received: %x, %d, %d : ", rx_msg.id, rx_msg.is_extended, rx_msg.dlc)

	for (i = 0; i < rx_msg.dlc; i++)
	{
		printf("%02x ", rx_msg.data[i])
	}


	printf("\r\n");

	rx_msg.id -= 1

	qcm_can_tx(rx_msg);

}

@timer0()
{
	printf("Example done\n")
	qcm_console_disable()
}

main()
{
	qcm_console_enable()
    printf "Starting CAN Example\n"
	qcm_can_init(500000);
	qcm_can_configure_rx_handler(CAN_RX_HANDLER_0, 0x05, false);
	qcm_can_configure_rx_handler(CAN_RX_HANDLER_2, 0x04, true);
	qcm_timer_start(TIMER_0, 15000, false)

}

