/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                       */
/*  \   \        Copyright (c) 2003-2009 Xilinx, Inc.                */
/*  /   /          All Right Reserved.                                 */
/* /---/   /\                                                         */
/* \   \  /  \                                                      */
/*  \___\/\___\                                                    */
/***********************************************************************/

#include "xsi.h"

struct XSI_INFO xsi_info;

char *STD_STANDARD;
char *IEEE_P_1242562249;
char *IEEE_P_2592010699;
char *IEEE_P_3499444699;
char *STD_TEXTIO;
char *IEEE_P_3620187407;
char *IEEE_P_3564397177;


int main(int argc, char **argv)
{
    xsi_init_design(argc, argv);
    xsi_register_info(&xsi_info);

    xsi_register_min_prec_unit(-12);
    ieee_p_2592010699_init();
    std_textio_init();
    ieee_p_1242562249_init();
    ieee_p_3499444699_init();
    ieee_p_3620187407_init();
    ieee_p_3564397177_init();
    xilinxcorelib_a_1588739465_2959432447_init();
    xilinxcorelib_a_1824416492_1709443946_init();
    xilinxcorelib_a_4194654584_0543512595_init();
    xilinxcorelib_a_1129688977_3212880686_init();
    work_a_3778041230_1621237607_init();
    work_a_3705532202_1490277956_init();
    work_a_1332642525_3522862272_init();
    work_a_0995399585_1260007448_init();
    work_a_1529695510_3219215338_init();
    work_a_3297750330_1446275585_init();
    work_a_2756466323_1613941486_init();
    xilinxcorelib_a_2236428430_2959432447_init();
    xilinxcorelib_a_2649219818_2959432447_init();
    xilinxcorelib_a_3109896962_1709443946_init();
    xilinxcorelib_a_0901064552_0543512595_init();
    xilinxcorelib_a_0622086367_3212880686_init();
    work_a_0298634329_0544704210_init();
    work_a_1287278244_1446275585_init();
    work_a_0681096826_3212880686_init();
    work_a_3919552166_2372691052_init();


    xsi_register_tops("work_a_3919552166_2372691052");

    STD_STANDARD = xsi_get_engine_memory("std_standard");
    IEEE_P_1242562249 = xsi_get_engine_memory("ieee_p_1242562249");
    IEEE_P_2592010699 = xsi_get_engine_memory("ieee_p_2592010699");
    xsi_register_ieee_std_logic_1164(IEEE_P_2592010699);
    IEEE_P_3499444699 = xsi_get_engine_memory("ieee_p_3499444699");
    STD_TEXTIO = xsi_get_engine_memory("std_textio");
    IEEE_P_3620187407 = xsi_get_engine_memory("ieee_p_3620187407");
    IEEE_P_3564397177 = xsi_get_engine_memory("ieee_p_3564397177");

    return xsi_run_simulation(argc, argv);

}
