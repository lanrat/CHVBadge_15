/******************************************************************************
 * Copyright 2014-2015 Specialized Solutions LLC
 *
 * Title to the Materials (contents of this file) remain with Specialized
 * Solutions LLC.  The Materials are copyrighted and are protected by United
 * States copyright laws.  Copyright notices cannot be removed from the
 * Materials.
 *
 * @brief QCM Native Functions for QCM-BDG
 *
 *****************************************************************************/
#pragma library QCM_BDG

/*****************************************************************************
 * Data structure definitions 
 ****************************************************************************/

/* 
 * Used to specify/receive CAN messages.
 * 
 * Members:
 * .id : CAN message ID
 * .is_extended : if true, message ID is 29-bit.  IF false, message id is 11-bit
 * .dlc : length of CAN message (0 through 8, inclusive)
 * .data : payload of CAN message (use .dlc to determine the valid data bytes)
 */ 
#define QCM_CAN_MSG[.id, bool:.is_extended, .dlc, .data[8]]

/*****************************************************************************
 * Tags (types) for use in calling the native routines 
 *****************************************************************************/

/* Input tags */
const GPIO_IN:GPIO_INPUT_SWITCH = 0
const GPIO_IN:GPIO_INPUT_0 = 1
const GPIO_IN:GPIO_INPUT_1 = 2
const GPIO_IN:GPIO_INPUT_2 = 3
const GPIO_IN:GPIO_INPUT_3 = 4
const GPIO_IN:GPIO_INPUT_OBD2 = 5

/* Output tags */
const GPIO_OUT:GPIO_OUTPUT_0 = 0
const GPIO_OUT:GPIO_OUTPUT_1 = 1
const GPIO_OUT:GPIO_OUTPUT_2 = 2
const GPIO_OUT:GPIO_OUTPUT_3 = 3

/* Input event tags */
const GPIO_EVENT:GPIO_EVENT_NONE = 0
const GPIO_EVENT:GPIO_EVENT_LOW = 1
const GPIO_EVENT:GPIO_EVENT_HIGH = 2
const GPIO_EVENT:GPIO_EVENT_ALL = 3

/* timer tags */
const TIMER:TIMER_0 = 0
const TIMER:TIMER_1 = 1
const TIMER:TIMER_2 = 2
const TIMER:TIMER_3 = 3
const TIMER:TIMER_4 = 4

/* CAN receive handler tags */
const CAN_RX_HANDLER:CAN_RX_HANDLER_0 = 0
const CAN_RX_HANDLER:CAN_RX_HANDLER_1 = 1
const CAN_RX_HANDLER:CAN_RX_HANDLER_2 = 2
const CAN_RX_HANDLER:CAN_RX_HANDLER_3 = 3
const CAN_RX_HANDLER:CAN_RX_HANDLER_4 = 4
const CAN_RX_HANDLER:CAN_RX_HANDLER_5 = 5
const CAN_RX_HANDLER:CAN_RX_HANDLER_6 = 6
const CAN_RX_HANDLER:CAN_RX_HANDLER_7 = 7

/********************************************************************************
 * System Native Routines 
 *******************************************************************************/

 /* returns number of milliseconds since system start */ 
native qcm_get_system_time() = -47

/********************************************************************************
 * Timer Routines
 *******************************************************************************/

/* start a timer that will invoke associated event handler at expiration.  
 *
 * Arguments: 
 * timer_number : timer to start, must be of type TIMER (see above, for example TIMER_0)
 * timeout_ms : duration/period of timer, in milliseconds 
 * auto_reload : if true, then restart timer immediately on expiration, if false, do not restart timer on expiration
 *
 * Returns true if timer was started, false otherwise
 */
native bool:qcm_timer_start(TIMER:timer_number, timeout_ms, bool:auto_reload) = -48

/* stop a previously started timer.
 *
 * Arguments: 
 * timer_number : timer to stop, must be of type TIMER (see above, for example TIMER_0)
 *
 * Returns true if timer was stopped, false otherwise
 */
native bool:qcm_timer_stop(TIMER:timer_number) = -49

/* Check to see if a timer is expired.
 *
 * Arguments: 
 * timer_number : timer to check, must be of type TIMER (see above, for example TIMER_0)
 *
 * Returns true if timer is expired, false if timer not expired, not started, or is set to auto_reload
 */
native bool:qcm_timer_expired(TIMER:timer_number) = -50

/********************************************************************************
 * CAN Routines
 *******************************************************************************/

/* 
 * Initialize CAN to the desired baud rate. 
 *
 * Arguments:
 * speed : Bit rate of CAN - can be 33333, 125000, 250000, 500000, or 1000000
 */
native qcm_can_init(speed) = -51

/*
 * Configures RX handler for specified ID
 *
 * Arguments:
 * handler : specifies handler number for id, must be of type CAN_RX_HANDLER (see above, for example CAN_RX_HANDLER_0)
 * can_id : specifies ID of CAN message to invoke specified event handler upon reception. For example 0x7E8
 * is_extended : if true, can_id is a 29-bit identifier, if false it is an 11-bit identifier
 *
 * When specified message is received, then the associated event handler of the form @can_rx<n> will be invoked
 */
native qcm_can_configure_rx_handler(CAN_RX_HANDLER:handler, can_id, bool:is_extended) = -52

/* 
 * Transmit a CAN message
 *
 * Arguments:
 * tx_msg : structure containing message to send.  See QCM_CAN_MSG above.
 */
native qcm_can_tx(tx_msg[QCM_CAN_MSG]) = -53

/********************************************************************************
 * GPIO Routines
 *******************************************************************************/

/*
 * Set an output to the specified state.
 *
 * Arguments:
 * channel : channel to set, must be of type GPIO_OUT.  For example, GPIO_OUTPUT_0
 * asserted : If true, specified channel is set to a logic 1 (3.3v).  
 *            If false, specified channel is set to a logic zero (0v)
 */
native qcm_gpio_set(GPIO_OUT:channel, bool:asserted) = -54

/*
 * Get the state of an input.
 *
 * Arguments:
 * channel : channel to get, must be of type GPIO_IN.  For example, GPIO_INPUT_0
 *
 * Returns true if input level is logic high, false otherwise
 */
native bool:qcm_gpio_get_input(GPIO_IN:channel) = -55

/*
 * Get the state of an output.
 *
 * Arguments:
 * channel : channel to get, must be of type GPIO_OUT.  For example, GPIO_OUTPUT_0
 *
 * Returns true if output level is logic high, false otherwise
 */
native bool:qcm_gpio_get_output(GPIO_OUT:channel) = -56

/* 
 * Registers event handler on an input
 *
 * Arguments:
 * channel : channel to monitor, must be of type GPIO_IN.  For example, GPIO_INPUT_0
 * event : input change condition to monitor.  Must be of type GPIO_EVENT.
 *
 * When specified event on specified channel occurs, event handler of the form @gpio_input<n> will be invoked.
 */
native qcm_gpio_configure_handler(GPIO_IN:channel, GPIO_EVENT:event) = -57

/********************************************************************************
 * Console / Host UART Routines
 *******************************************************************************/

/*
 * Enables script output via host UART port.  Must be called if printf is to be used.
 * 
 * Note that once called, script uploading will not be possible until either qcm_console_disable() is called
 * or the CLR/SW jumper is set on power-up.
 *
 * All communication over host UART takes place at 230400 bps, 8N1
 */
native qcm_console_enable() = -58

/* 
 * Disables script output via host UART port.
 */
native qcm_console_disable() = -59

/********************************************************************************
 * 7-segment Display Routines
 *******************************************************************************/

/* 
 * Set the 7-segment display to show a 3-digit integer.
 *
 * Arguments:
 * enabled : if true, enable the 7-segment display.  If false, disable it.
 * value : up to a 3-digit integer to display on the 7-segment display
 */ 
native qcm_seg_set(bool:enabled, value) = -60

/*
 * Individually control the 7-segment display's segments.
 * 
 * Arguments:
 * enabled : if true, enable the 7-segment display.  If false, disable it.
 * seg1 : leftmost digit
 * seg2 : middle digit
 * seg3 : rightmost segment
 *
 * Segments are laid out as folows
 * 
 *    --a--
 *   |     |
 *   f     b
 *   |     |
 *    --g--
 *   |     |
 *   e     c
 *   |     |
 *    --d--
 *            h (dot)
 *
 * The raw values passed have the binary format of:
 * gbchfdae
 * where a 0 in the bit position indicates "on" and 1 indicates "off"
 *
 * For example, a one is represented by:
 * 0b1001111
 * A two is represented by:
 * 0b00111000
 * A dot is represented by:
 * 0b11101111
 * And an eight is:
 * 0b00010000
 */
native qcm_seg_set_raw(bool:enabled, seg1, seg2, seg3) = -61

/******************************************************************************
 * Forward declarations for event handlers 
 *****************************************************************************/

/* timer event handlers */
forward @timer0()
forward @timer1()
forward @timer2()
forward @timer3()
forward @timer4()

/* if present in the script, then all messages not matched by any handlers registered with 
 * qcm_can_configure_rx_handler() are passed to this event handler.  Registered event handlers
 * will continue to get the ID's that they are registered for.  THis can be thought of as a handler
 * to watch "whatever is left over".
 */
forward @can_rx_all(rx_msg[QCM_CAN_MSG])

/* CAN message ID event handlers */
forward @can_rx0(rx_msg[QCM_CAN_MSG])
forward @can_rx1(rx_msg[QCM_CAN_MSG])
forward @can_rx2(rx_msg[QCM_CAN_MSG])
forward @can_rx3(rx_msg[QCM_CAN_MSG])
forward @can_rx4(rx_msg[QCM_CAN_MSG])
forward @can_rx5(rx_msg[QCM_CAN_MSG])
forward @can_rx6(rx_msg[QCM_CAN_MSG])
forward @can_rx7(rx_msg[QCM_CAN_MSG])

/* GPIO input event handlers */
forward @gpio_input_switch()
forward @gpio_input0()
forward @gpio_input1()
forward @gpio_input2()
forward @gpio_input3()
forward @gpio_input_obd2()

/* when qcm_console_enable() has been called, this event handler is invoked with 
 * the data received on the host UART channel 
 */
forward @host_rx(data[], data_size);

