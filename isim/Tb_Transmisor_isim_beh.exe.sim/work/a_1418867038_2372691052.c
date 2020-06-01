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

/* This file is designed for use with ISim build 0xfbc00daa */

#define XSI_HIDE_SYMBOL_SPEC true
#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
static const char *ng0 = "/home/ise/Xilinx/TRANSMISOR_OFDM/tb_Transmisor.vhd";
extern char *IEEE_P_1242562249;
extern char *STD_TEXTIO;

int ieee_p_1242562249_sub_17802405650254020620_1035706684(char *, char *, char *);


static void work_a_1418867038_2372691052_p_0(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    int64 t7;
    int64 t8;

LAB0:    t1 = (t0 + 3800U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(89, ng0);
    t2 = (t0 + 4696);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(90, ng0);
    t2 = (t0 + 2288U);
    t3 = *((char **)t2);
    t7 = *((int64 *)t3);
    t8 = (t7 / 2);
    t2 = (t0 + 3608);
    xsi_process_wait(t2, t8);

LAB6:    *((char **)t1) = &&LAB7;

LAB1:    return;
LAB4:    xsi_set_current_line(91, ng0);
    t2 = (t0 + 4696);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)3;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(92, ng0);
    t2 = (t0 + 2288U);
    t3 = *((char **)t2);
    t7 = *((int64 *)t3);
    t8 = (t7 / 2);
    t2 = (t0 + 3608);
    xsi_process_wait(t2, t8);

LAB10:    *((char **)t1) = &&LAB11;
    goto LAB1;

LAB5:    goto LAB4;

LAB7:    goto LAB5;

LAB8:    goto LAB2;

LAB9:    goto LAB8;

LAB11:    goto LAB9;

}

static void work_a_1418867038_2372691052_p_1(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    int64 t9;

LAB0:    t1 = (t0 + 4048U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(100, ng0);
    t2 = (t0 + 7656);
    t4 = (t0 + 4760);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    memcpy(t8, t2, 2U);
    xsi_driver_first_trans_fast(t4);
    xsi_set_current_line(101, ng0);
    t2 = (t0 + 4824);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)3;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(102, ng0);
    t9 = (100 * 1000LL);
    t2 = (t0 + 3856);
    xsi_process_wait(t2, t9);

LAB6:    *((char **)t1) = &&LAB7;

LAB1:    return;
LAB4:    xsi_set_current_line(103, ng0);
    t2 = (t0 + 4824);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(106, ng0);

LAB10:    *((char **)t1) = &&LAB11;
    goto LAB1;

LAB5:    goto LAB4;

LAB7:    goto LAB5;

LAB8:    goto LAB2;

LAB9:    goto LAB8;

LAB11:    goto LAB9;

}

static void work_a_1418867038_2372691052_p_2(char *t0)
{
    char t13[16];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    unsigned char t5;
    unsigned char t6;
    int t7;
    int t8;
    char *t9;
    int t10;
    char *t11;
    char *t12;
    unsigned int t14;
    int64 t15;

LAB0:    t1 = (t0 + 4296U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(121, ng0);

LAB6:    t2 = (t0 + 4616);
    *((int *)t2) = 1;
    *((char **)t1) = &&LAB7;

LAB1:    return;
LAB4:    t3 = (t0 + 4616);
    *((int *)t3) = 0;
    xsi_set_current_line(123, ng0);
    t2 = (t0 + 7658);
    *((int *)t2) = 0;
    t3 = (t0 + 7662);
    *((int *)t3) = 127;
    t7 = 0;
    t8 = 127;

LAB8:    if (t7 <= t8)
        goto LAB9;

LAB11:    goto LAB2;

LAB5:    t3 = (t0 + 1992U);
    t4 = *((char **)t3);
    t5 = *((unsigned char *)t4);
    t6 = (t5 == (unsigned char)3);
    if (t6 == 1)
        goto LAB4;
    else
        goto LAB6;

LAB7:    goto LAB5;

LAB9:    xsi_set_current_line(124, ng0);
    t4 = (t0 + 1672U);
    t9 = *((char **)t4);
    t4 = (t0 + 7432U);
    t10 = ieee_p_1242562249_sub_17802405650254020620_1035706684(IEEE_P_1242562249, t9, t4);
    t11 = (t0 + 2408U);
    t12 = *((char **)t11);
    t11 = (t12 + 0);
    *((int *)t11) = t10;
    xsi_set_current_line(125, ng0);
    t2 = (t0 + 4104);
    t3 = (t0 + 3152U);
    t4 = (t0 + 2408U);
    t9 = *((char **)t4);
    t10 = *((int *)t9);
    std_textio_write5(STD_TEXTIO, t2, t3, t10, (unsigned char)0, 0);
    xsi_set_current_line(126, ng0);
    t2 = (t0 + 4104);
    t3 = (t0 + 3152U);
    t4 = (t0 + 7666);
    t11 = (t13 + 0U);
    t12 = (t11 + 0U);
    *((int *)t12) = 1;
    t12 = (t11 + 4U);
    *((int *)t12) = 1;
    t12 = (t11 + 8U);
    *((int *)t12) = 1;
    t10 = (1 - 1);
    t14 = (t10 * 1);
    t14 = (t14 + 1);
    t12 = (t11 + 12U);
    *((unsigned int *)t12) = t14;
    std_textio_write7(STD_TEXTIO, t2, t3, t4, t13, (unsigned char)0, 0);
    xsi_set_current_line(127, ng0);
    t2 = (t0 + 1512U);
    t3 = *((char **)t2);
    t2 = (t0 + 7416U);
    t10 = ieee_p_1242562249_sub_17802405650254020620_1035706684(IEEE_P_1242562249, t3, t2);
    t4 = (t0 + 2408U);
    t9 = *((char **)t4);
    t4 = (t9 + 0);
    *((int *)t4) = t10;
    xsi_set_current_line(128, ng0);
    t2 = (t0 + 4104);
    t3 = (t0 + 3152U);
    t4 = (t0 + 2408U);
    t9 = *((char **)t4);
    t10 = *((int *)t9);
    std_textio_write5(STD_TEXTIO, t2, t3, t10, (unsigned char)0, 0);
    xsi_set_current_line(129, ng0);
    t2 = (t0 + 4104);
    t3 = (t0 + 2976U);
    t4 = (t0 + 3152U);
    std_textio_writeline(STD_TEXTIO, t2, t3, t4);
    xsi_set_current_line(130, ng0);
    t2 = (t0 + 2288U);
    t3 = *((char **)t2);
    t15 = *((int64 *)t3);
    t2 = (t0 + 4104);
    xsi_process_wait(t2, t15);

LAB14:    *((char **)t1) = &&LAB15;
    goto LAB1;

LAB10:    t2 = (t0 + 7658);
    t7 = *((int *)t2);
    t3 = (t0 + 7662);
    t8 = *((int *)t3);
    if (t7 == t8)
        goto LAB11;

LAB16:    t10 = (t7 + 1);
    t7 = t10;
    t4 = (t0 + 7658);
    *((int *)t4) = t7;
    goto LAB8;

LAB12:    goto LAB10;

LAB13:    goto LAB12;

LAB15:    goto LAB13;

}


extern void work_a_1418867038_2372691052_init()
{
	static char *pe[] = {(void *)work_a_1418867038_2372691052_p_0,(void *)work_a_1418867038_2372691052_p_1,(void *)work_a_1418867038_2372691052_p_2};
	xsi_register_didat("work_a_1418867038_2372691052", "isim/Tb_Transmisor_isim_beh.exe.sim/work/a_1418867038_2372691052.didat");
	xsi_register_executes(pe);
}
