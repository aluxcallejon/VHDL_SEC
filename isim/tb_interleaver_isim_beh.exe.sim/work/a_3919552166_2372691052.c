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
static const char *ng0 = "/home/ise/Xilinx/TRANSMISOR_OFDM/tb_interleaver.vhd";
extern char *IEEE_P_1242562249;
extern char *IEEE_P_3620187407;
extern char *STD_TEXTIO;

int ieee_p_1242562249_sub_17802405650254020620_1035706684(char *, char *, char *);
char *ieee_p_3620187407_sub_16272557775307340295_3965413181(char *, char *, char *, char *, unsigned char );


static void work_a_3919552166_2372691052_p_0(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    int64 t7;
    int64 t8;

LAB0:    t1 = (t0 + 3640U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(90, ng0);
    t2 = (t0 + 4536);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(91, ng0);
    t2 = (t0 + 2128U);
    t3 = *((char **)t2);
    t7 = *((int64 *)t3);
    t8 = (t7 / 2);
    t2 = (t0 + 3448);
    xsi_process_wait(t2, t8);

LAB6:    *((char **)t1) = &&LAB7;

LAB1:    return;
LAB4:    xsi_set_current_line(92, ng0);
    t2 = (t0 + 4536);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)3;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(93, ng0);
    t2 = (t0 + 2128U);
    t3 = *((char **)t2);
    t7 = *((int64 *)t3);
    t8 = (t7 / 2);
    t2 = (t0 + 3448);
    xsi_process_wait(t2, t8);

LAB10:    *((char **)t1) = &&LAB11;
    goto LAB1;

LAB5:    goto LAB4;

LAB7:    goto LAB5;

LAB8:    goto LAB2;

LAB9:    goto LAB8;

LAB11:    goto LAB9;

}

static void work_a_3919552166_2372691052_p_1(char *t0)
{
    char t15[16];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    int t5;
    char *t6;
    char *t7;
    int t8;
    char *t9;
    char *t10;
    unsigned char t11;
    unsigned char t12;
    int t13;
    int64 t14;
    unsigned int t16;
    unsigned int t17;
    char *t18;
    char *t19;

LAB0:    t1 = (t0 + 3888U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(145, ng0);
    t2 = (t0 + 1352U);
    t3 = *((char **)t2);
    t2 = (t0 + 7396);
    t5 = xsi_mem_cmp(t2, t3, 2U);
    if (t5 == 1)
        goto LAB5;

LAB8:    t6 = (t0 + 7398);
    t8 = xsi_mem_cmp(t6, t3, 2U);
    if (t8 == 1)
        goto LAB6;

LAB9:
LAB7:    xsi_set_current_line(149, ng0);
    t2 = (t0 + 2488U);
    t3 = *((char **)t2);
    t2 = (t3 + 0);
    *((int *)t2) = 288;

LAB4:    xsi_set_current_line(153, ng0);
    t2 = xsi_get_transient_memory(9U);
    memset(t2, 0, 9U);
    t3 = t2;
    memset(t3, (unsigned char)2, 9U);
    t4 = (t0 + 4600);
    t6 = (t4 + 56U);
    t7 = *((char **)t6);
    t9 = (t7 + 56U);
    t10 = *((char **)t9);
    memcpy(t10, t2, 9U);
    xsi_driver_first_trans_fast(t4);
    xsi_set_current_line(154, ng0);

LAB13:    t2 = (t0 + 4456);
    *((int *)t2) = 1;
    *((char **)t1) = &&LAB14;

LAB1:    return;
LAB5:    xsi_set_current_line(147, ng0);
    t9 = (t0 + 2488U);
    t10 = *((char **)t9);
    t9 = (t10 + 0);
    *((int *)t9) = 96;
    goto LAB4;

LAB6:    xsi_set_current_line(148, ng0);
    t2 = (t0 + 2488U);
    t3 = *((char **)t2);
    t2 = (t3 + 0);
    *((int *)t2) = 192;
    goto LAB4;

LAB10:;
LAB11:    t3 = (t0 + 4456);
    *((int *)t3) = 0;
    xsi_set_current_line(156, ng0);
    t2 = (t0 + 2488U);
    t3 = *((char **)t2);
    t5 = *((int *)t3);
    t2 = (t0 + 7400);
    *((int *)t2) = 1;
    t4 = (t0 + 7404);
    *((int *)t4) = t5;
    t8 = 1;
    t13 = t5;

LAB15:    if (t8 <= t13)
        goto LAB16;

LAB18:    goto LAB2;

LAB12:    t3 = (t0 + 1672U);
    t4 = *((char **)t3);
    t11 = *((unsigned char *)t4);
    t12 = (t11 == (unsigned char)3);
    if (t12 == 1)
        goto LAB11;
    else
        goto LAB13;

LAB14:    goto LAB12;

LAB16:    xsi_set_current_line(158, ng0);
    t6 = (t0 + 2128U);
    t7 = *((char **)t6);
    t14 = *((int64 *)t7);
    t6 = (t0 + 3696);
    xsi_process_wait(t6, t14);

LAB21:    *((char **)t1) = &&LAB22;
    goto LAB1;

LAB17:    t2 = (t0 + 7400);
    t8 = *((int *)t2);
    t3 = (t0 + 7404);
    t13 = *((int *)t3);
    if (t8 == t13)
        goto LAB18;

LAB25:    t5 = (t8 + 1);
    t8 = t5;
    t4 = (t0 + 7400);
    *((int *)t4) = t8;
    goto LAB15;

LAB19:    xsi_set_current_line(160, ng0);
    t2 = (t0 + 1832U);
    t3 = *((char **)t2);
    t2 = (t0 + 7224U);
    t5 = ieee_p_1242562249_sub_17802405650254020620_1035706684(IEEE_P_1242562249, t3, t2);
    t4 = (t0 + 2248U);
    t6 = *((char **)t4);
    t4 = (t6 + 0);
    *((int *)t4) = t5;
    xsi_set_current_line(161, ng0);
    t2 = (t0 + 1512U);
    t3 = *((char **)t2);
    t2 = (t0 + 7208U);
    t4 = ieee_p_3620187407_sub_16272557775307340295_3965413181(IEEE_P_3620187407, t15, t3, t2, (unsigned char)3);
    t6 = (t15 + 12U);
    t16 = *((unsigned int *)t6);
    t17 = (1U * t16);
    t11 = (9U != t17);
    if (t11 == 1)
        goto LAB23;

LAB24:    t7 = (t0 + 4600);
    t9 = (t7 + 56U);
    t10 = *((char **)t9);
    t18 = (t10 + 56U);
    t19 = *((char **)t18);
    memcpy(t19, t4, 9U);
    xsi_driver_first_trans_fast(t7);
    xsi_set_current_line(162, ng0);
    t2 = (t0 + 3696);
    t3 = (t0 + 2992U);
    t4 = (t0 + 2248U);
    t6 = *((char **)t4);
    t5 = *((int *)t6);
    std_textio_write5(STD_TEXTIO, t2, t3, t5, (unsigned char)0, 0);
    xsi_set_current_line(163, ng0);
    t2 = (t0 + 3696);
    t3 = (t0 + 2816U);
    t4 = (t0 + 2992U);
    std_textio_writeline(STD_TEXTIO, t2, t3, t4);
    goto LAB17;

LAB20:    goto LAB19;

LAB22:    goto LAB20;

LAB23:    xsi_size_not_matching(9U, t17, 0);
    goto LAB24;

}

static void work_a_3919552166_2372691052_p_2(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    int64 t7;
    int64 t8;

LAB0:    t1 = (t0 + 4136U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(172, ng0);
    t2 = (t0 + 4664);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)3;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(173, ng0);
    t7 = (100 * 1000LL);
    t2 = (t0 + 3944);
    xsi_process_wait(t2, t7);

LAB6:    *((char **)t1) = &&LAB7;

LAB1:    return;
LAB4:    xsi_set_current_line(174, ng0);
    t2 = (t0 + 4664);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(176, ng0);
    t2 = (t0 + 2128U);
    t3 = *((char **)t2);
    t7 = *((int64 *)t3);
    t8 = (t7 * 10);
    t2 = (t0 + 3944);
    xsi_process_wait(t2, t8);

LAB10:    *((char **)t1) = &&LAB11;
    goto LAB1;

LAB5:    goto LAB4;

LAB7:    goto LAB5;

LAB8:    xsi_set_current_line(180, ng0);

LAB14:    *((char **)t1) = &&LAB15;
    goto LAB1;

LAB9:    goto LAB8;

LAB11:    goto LAB9;

LAB12:    goto LAB2;

LAB13:    goto LAB12;

LAB15:    goto LAB13;

}


extern void work_a_3919552166_2372691052_init()
{
	static char *pe[] = {(void *)work_a_3919552166_2372691052_p_0,(void *)work_a_3919552166_2372691052_p_1,(void *)work_a_3919552166_2372691052_p_2};
	xsi_register_didat("work_a_3919552166_2372691052", "isim/tb_interleaver_isim_beh.exe.sim/work/a_3919552166_2372691052.didat");
	xsi_register_executes(pe);
}
