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
static const char *ng0 = "/home/ise/Xilinx/TRANSMISOR_OFDM/fec.vhdl";
extern char *IEEE_P_2592010699;
extern char *IEEE_P_1242562249;

char *ieee_p_1242562249_sub_1006216973935652998_1035706684(char *, char *, char *, char *, int );
unsigned char ieee_p_2592010699_sub_3488768497506413324_503743352(char *, unsigned char , unsigned char );


static void work_a_0995399585_1260007448_p_0(char *t0)
{
    char *t1;
    char *t2;
    unsigned char t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;

LAB0:    xsi_set_current_line(73, ng0);

LAB3:    t1 = (t0 + 3432U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t1 = (t0 + 6256);
    t4 = (t1 + 56U);
    t5 = *((char **)t4);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = t3;
    xsi_driver_first_trans_fast_port(t1);

LAB2:    t8 = (t0 + 6128);
    *((int *)t8) = 1;

LAB1:    return;
LAB4:    goto LAB2;

}

static void work_a_0995399585_1260007448_p_1(char *t0)
{
    char *t1;
    char *t2;
    unsigned char t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;

LAB0:    xsi_set_current_line(74, ng0);

LAB3:    t1 = (t0 + 3592U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t1 = (t0 + 6320);
    t4 = (t1 + 56U);
    t5 = *((char **)t4);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = t3;
    xsi_driver_first_trans_fast_port(t1);

LAB2:    t8 = (t0 + 6144);
    *((int *)t8) = 1;

LAB1:    return;
LAB4:    goto LAB2;

}

static void work_a_0995399585_1260007448_p_2(char *t0)
{
    char *t1;
    char *t2;
    unsigned char t3;
    unsigned char t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    unsigned char t10;
    unsigned char t11;
    char *t12;

LAB0:    xsi_set_current_line(81, ng0);
    t1 = (t0 + 1192U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t4 = (t3 == (unsigned char)3);
    if (t4 != 0)
        goto LAB2;

LAB4:    t1 = (t0 + 992U);
    t4 = xsi_signal_has_event(t1);
    if (t4 == 1)
        goto LAB7;

LAB8:    t3 = (unsigned char)0;

LAB9:    if (t3 != 0)
        goto LAB5;

LAB6:
LAB3:    t1 = (t0 + 6160);
    *((int *)t1) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(82, ng0);
    t1 = (t0 + 6384);
    t5 = (t1 + 56U);
    t6 = *((char **)t5);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    *((unsigned char *)t8) = (unsigned char)0;
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(83, ng0);
    t1 = xsi_get_transient_memory(7U);
    memset(t1, 0, 7U);
    t2 = t1;
    memset(t2, (unsigned char)2, 7U);
    t5 = (t0 + 6448);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t1, 7U);
    xsi_driver_first_trans_fast(t5);
    xsi_set_current_line(85, ng0);
    t1 = (t0 + 6512);
    t2 = (t1 + 56U);
    t5 = *((char **)t2);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)2;
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(86, ng0);
    t1 = (t0 + 6576);
    t2 = (t1 + 56U);
    t5 = *((char **)t2);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)2;
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(87, ng0);
    t1 = (t0 + 6640);
    t2 = (t1 + 56U);
    t5 = *((char **)t2);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)2;
    xsi_driver_first_trans_fast_port(t1);
    xsi_set_current_line(88, ng0);
    t1 = xsi_get_transient_memory(10U);
    memset(t1, 0, 10U);
    t2 = t1;
    memset(t2, (unsigned char)2, 10U);
    t5 = (t0 + 6704);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t1, 10U);
    xsi_driver_first_trans_fast(t5);
    goto LAB3;

LAB5:    xsi_set_current_line(91, ng0);
    t2 = (t0 + 2472U);
    t6 = *((char **)t2);
    t2 = (t0 + 6448);
    t7 = (t2 + 56U);
    t8 = *((char **)t7);
    t9 = (t8 + 56U);
    t12 = *((char **)t9);
    memcpy(t12, t6, 7U);
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(92, ng0);
    t1 = (t0 + 2792U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t1 = (t0 + 6384);
    t5 = (t1 + 56U);
    t6 = *((char **)t5);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    *((unsigned char *)t8) = t3;
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(94, ng0);
    t1 = (t0 + 3112U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t1 = (t0 + 6512);
    t5 = (t1 + 56U);
    t6 = *((char **)t5);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    *((unsigned char *)t8) = t3;
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(95, ng0);
    t1 = (t0 + 3272U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t1 = (t0 + 6576);
    t5 = (t1 + 56U);
    t6 = *((char **)t5);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    *((unsigned char *)t8) = t3;
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(97, ng0);
    t1 = (t0 + 2952U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t1 = (t0 + 6640);
    t5 = (t1 + 56U);
    t6 = *((char **)t5);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    *((unsigned char *)t8) = t3;
    xsi_driver_first_trans_fast_port(t1);
    xsi_set_current_line(98, ng0);
    t1 = (t0 + 3912U);
    t2 = *((char **)t1);
    t1 = (t0 + 6704);
    t5 = (t1 + 56U);
    t6 = *((char **)t5);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    memcpy(t8, t2, 10U);
    xsi_driver_first_trans_fast(t1);
    goto LAB3;

LAB7:    t2 = (t0 + 1032U);
    t5 = *((char **)t2);
    t10 = *((unsigned char *)t5);
    t11 = (t10 == (unsigned char)3);
    t3 = t11;
    goto LAB9;

}

static void work_a_0995399585_1260007448_p_3(char *t0)
{
    char t19[16];
    char t20[16];
    char *t1;
    char *t2;
    unsigned char t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    unsigned char t8;
    unsigned char t9;
    unsigned char t10;
    unsigned char t11;
    unsigned char t12;
    char *t13;
    char *t14;
    char *t15;
    unsigned int t16;
    unsigned int t17;
    unsigned int t18;
    int t21;
    unsigned int t22;
    char *t23;
    char *t24;
    int t25;
    unsigned int t26;
    unsigned int t27;
    int t28;
    unsigned int t29;
    unsigned int t30;
    unsigned int t31;
    int t32;
    unsigned int t33;
    unsigned int t34;
    unsigned int t35;
    unsigned char t36;
    int t37;
    unsigned int t38;
    unsigned int t39;
    unsigned int t40;
    unsigned char t41;
    unsigned char t42;
    char *t43;
    char *t44;
    char *t45;
    char *t46;
    static char *nl0[] = {&&LAB3, &&LAB4, &&LAB5};

LAB0:    xsi_set_current_line(112, ng0);
    t1 = (t0 + 2632U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t1 = (t0 + 6768);
    t4 = (t1 + 56U);
    t5 = *((char **)t4);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = t3;
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(113, ng0);
    t1 = (t0 + 3432U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t1 = (t0 + 6832);
    t4 = (t1 + 56U);
    t5 = *((char **)t4);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = t3;
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(114, ng0);
    t1 = (t0 + 3592U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t1 = (t0 + 6896);
    t4 = (t1 + 56U);
    t5 = *((char **)t4);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = t3;
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(115, ng0);
    t1 = (t0 + 2312U);
    t2 = *((char **)t1);
    t1 = (t0 + 6960);
    t4 = (t1 + 56U);
    t5 = *((char **)t4);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    memcpy(t7, t2, 7U);
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(117, ng0);
    t1 = (t0 + 7024);
    t2 = (t1 + 56U);
    t4 = *((char **)t2);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)2;
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(118, ng0);
    t1 = (t0 + 3752U);
    t2 = *((char **)t1);
    t1 = (t0 + 7088);
    t4 = (t1 + 56U);
    t5 = *((char **)t4);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    memcpy(t7, t2, 10U);
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(122, ng0);
    t1 = (t0 + 2632U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t1 = (char *)((nl0) + t3);
    goto **((char **)t1);

LAB2:    t1 = (t0 + 6176);
    *((int *)t1) = 1;

LAB1:    return;
LAB3:    xsi_set_current_line(126, ng0);
    t4 = (t0 + 1352U);
    t5 = *((char **)t4);
    t9 = *((unsigned char *)t5);
    t10 = (t9 == (unsigned char)3);
    if (t10 == 1)
        goto LAB9;

LAB10:    t8 = (unsigned char)0;

LAB11:    if (t8 != 0)
        goto LAB6;

LAB8:
LAB7:    goto LAB2;

LAB4:    xsi_set_current_line(133, ng0);
    t1 = (t0 + 1672U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t1 = (t0 + 2312U);
    t4 = *((char **)t1);
    t16 = (6 - 6);
    t17 = (t16 * 1U);
    t18 = (0 + t17);
    t1 = (t4 + t18);
    t6 = ((IEEE_P_2592010699) + 4000);
    t7 = (t20 + 0U);
    t13 = (t7 + 0U);
    *((int *)t13) = 6;
    t13 = (t7 + 4U);
    *((int *)t13) = 1;
    t13 = (t7 + 8U);
    *((int *)t13) = -1;
    t21 = (1 - 6);
    t22 = (t21 * -1);
    t22 = (t22 + 1);
    t13 = (t7 + 12U);
    *((unsigned int *)t13) = t22;
    t5 = xsi_base_array_concat(t5, t19, t6, (char)99, t3, (char)97, t1, t20, (char)101);
    t22 = (1U + 6U);
    t8 = (7U != t22);
    if (t8 == 1)
        goto LAB12;

LAB13:    t13 = (t0 + 6960);
    t14 = (t13 + 56U);
    t15 = *((char **)t14);
    t23 = (t15 + 56U);
    t24 = *((char **)t23);
    memcpy(t24, t5, 7U);
    xsi_driver_first_trans_fast(t13);
    xsi_set_current_line(134, ng0);
    t1 = (t0 + 6768);
    t2 = (t1 + 56U);
    t4 = *((char **)t2);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)2;
    xsi_driver_first_trans_fast(t1);
    goto LAB2;

LAB5:    xsi_set_current_line(137, ng0);
    t1 = (t0 + 3752U);
    t2 = *((char **)t1);
    t1 = (t0 + 9816U);
    t4 = ieee_p_1242562249_sub_1006216973935652998_1035706684(IEEE_P_1242562249, t19, t2, t1, 1);
    t5 = (t19 + 12U);
    t16 = *((unsigned int *)t5);
    t17 = (1U * t16);
    t3 = (10U != t17);
    if (t3 == 1)
        goto LAB14;

LAB15:    t6 = (t0 + 7088);
    t7 = (t6 + 56U);
    t13 = *((char **)t7);
    t14 = (t13 + 56U);
    t15 = *((char **)t14);
    memcpy(t15, t4, 10U);
    xsi_driver_first_trans_fast(t6);
    xsi_set_current_line(138, ng0);
    t1 = (t0 + 2312U);
    t2 = *((char **)t1);
    t21 = (0 - 6);
    t16 = (t21 * -1);
    t17 = (1U * t16);
    t18 = (0 + t17);
    t1 = (t2 + t18);
    t3 = *((unsigned char *)t1);
    t4 = (t0 + 2312U);
    t5 = *((char **)t4);
    t25 = (1 - 6);
    t22 = (t25 * -1);
    t26 = (1U * t22);
    t27 = (0 + t26);
    t4 = (t5 + t27);
    t8 = *((unsigned char *)t4);
    t9 = ieee_p_2592010699_sub_3488768497506413324_503743352(IEEE_P_2592010699, t3, t8);
    t6 = (t0 + 2312U);
    t7 = *((char **)t6);
    t28 = (3 - 6);
    t29 = (t28 * -1);
    t30 = (1U * t29);
    t31 = (0 + t30);
    t6 = (t7 + t31);
    t10 = *((unsigned char *)t6);
    t11 = ieee_p_2592010699_sub_3488768497506413324_503743352(IEEE_P_2592010699, t9, t10);
    t13 = (t0 + 2312U);
    t14 = *((char **)t13);
    t32 = (5 - 6);
    t33 = (t32 * -1);
    t34 = (1U * t33);
    t35 = (0 + t34);
    t13 = (t14 + t35);
    t12 = *((unsigned char *)t13);
    t36 = ieee_p_2592010699_sub_3488768497506413324_503743352(IEEE_P_2592010699, t11, t12);
    t15 = (t0 + 2312U);
    t23 = *((char **)t15);
    t37 = (6 - 6);
    t38 = (t37 * -1);
    t39 = (1U * t38);
    t40 = (0 + t39);
    t15 = (t23 + t40);
    t41 = *((unsigned char *)t15);
    t42 = ieee_p_2592010699_sub_3488768497506413324_503743352(IEEE_P_2592010699, t36, t41);
    t24 = (t0 + 6832);
    t43 = (t24 + 56U);
    t44 = *((char **)t43);
    t45 = (t44 + 56U);
    t46 = *((char **)t45);
    *((unsigned char *)t46) = t42;
    xsi_driver_first_trans_fast(t24);
    xsi_set_current_line(139, ng0);
    t1 = (t0 + 2312U);
    t2 = *((char **)t1);
    t21 = (0 - 6);
    t16 = (t21 * -1);
    t17 = (1U * t16);
    t18 = (0 + t17);
    t1 = (t2 + t18);
    t3 = *((unsigned char *)t1);
    t4 = (t0 + 2312U);
    t5 = *((char **)t4);
    t25 = (3 - 6);
    t22 = (t25 * -1);
    t26 = (1U * t22);
    t27 = (0 + t26);
    t4 = (t5 + t27);
    t8 = *((unsigned char *)t4);
    t9 = ieee_p_2592010699_sub_3488768497506413324_503743352(IEEE_P_2592010699, t3, t8);
    t6 = (t0 + 2312U);
    t7 = *((char **)t6);
    t28 = (2 - 6);
    t29 = (t28 * -1);
    t30 = (1U * t29);
    t31 = (0 + t30);
    t6 = (t7 + t31);
    t10 = *((unsigned char *)t6);
    t11 = ieee_p_2592010699_sub_3488768497506413324_503743352(IEEE_P_2592010699, t9, t10);
    t13 = (t0 + 2312U);
    t14 = *((char **)t13);
    t32 = (6 - 6);
    t33 = (t32 * -1);
    t34 = (1U * t33);
    t35 = (0 + t34);
    t13 = (t14 + t35);
    t12 = *((unsigned char *)t13);
    t36 = ieee_p_2592010699_sub_3488768497506413324_503743352(IEEE_P_2592010699, t11, t12);
    t15 = (t0 + 6896);
    t23 = (t15 + 56U);
    t24 = *((char **)t23);
    t43 = (t24 + 56U);
    t44 = *((char **)t43);
    *((unsigned char *)t44) = t36;
    xsi_driver_first_trans_fast(t15);
    xsi_set_current_line(140, ng0);
    t1 = (t0 + 7024);
    t2 = (t1 + 56U);
    t4 = *((char **)t2);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)3;
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(141, ng0);
    t1 = (t0 + 6768);
    t2 = (t1 + 56U);
    t4 = *((char **)t2);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)0;
    xsi_driver_first_trans_fast(t1);
    goto LAB2;

LAB6:    xsi_set_current_line(127, ng0);
    t4 = (t0 + 6768);
    t7 = (t4 + 56U);
    t13 = *((char **)t7);
    t14 = (t13 + 56U);
    t15 = *((char **)t14);
    *((unsigned char *)t15) = (unsigned char)1;
    xsi_driver_first_trans_fast(t4);
    goto LAB7;

LAB9:    t4 = (t0 + 1512U);
    t6 = *((char **)t4);
    t11 = *((unsigned char *)t6);
    t12 = (t11 == (unsigned char)2);
    t8 = t12;
    goto LAB11;

LAB12:    xsi_size_not_matching(7U, t22, 0);
    goto LAB13;

LAB14:    xsi_size_not_matching(10U, t17, 0);
    goto LAB15;

}


extern void work_a_0995399585_1260007448_init()
{
	static char *pe[] = {(void *)work_a_0995399585_1260007448_p_0,(void *)work_a_0995399585_1260007448_p_1,(void *)work_a_0995399585_1260007448_p_2,(void *)work_a_0995399585_1260007448_p_3};
	xsi_register_didat("work_a_0995399585_1260007448", "isim/Tb_Transmisor_isim_beh.exe.sim/work/a_0995399585_1260007448.didat");
	xsi_register_executes(pe);
}
