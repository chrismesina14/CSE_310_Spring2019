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
static const char *ng0 = "The sum of %d and %d is %d";
static const char *ng1 = "/home/csusb.edu/005319687/CSE310/lab2/HelloProject/hello.v";
static int ng2[] = {89, 0};
static int ng3[] = {64, 0};
static const char *ng4 = "Hello again!\n";

void Monitor_19_1(char *);
void Monitor_19_1(char *);


static void Monitor_19_1_Func(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;

LAB0:    t1 = (t0 + 1448);
    t2 = (t1 + 56U);
    t3 = *((char **)t2);
    t4 = (t0 + 1608);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    t7 = (t0 + 1048U);
    t8 = *((char **)t7);
    xsi_vlogfile_write(1, 0, 3, ng0, 4, t0, (char)118, t3, 16, (char)118, t6, 16, (char)118, t8, 16);

LAB1:    return;
}

static void Initial_15_0(char *t0)
{
    char *t1;
    char *t2;
    char *t3;

LAB0:    t1 = (t0 + 2520U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(15, ng1);

LAB4:    xsi_set_current_line(16, ng1);
    t2 = ((char*)((ng2)));
    t3 = (t0 + 1448);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 16);
    xsi_set_current_line(17, ng1);
    t2 = ((char*)((ng3)));
    t3 = (t0 + 1608);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 16);
    xsi_set_current_line(18, ng1);
    xsi_vlogfile_write(1, 0, 0, ng4, 1, t0);
    xsi_set_current_line(19, ng1);
    Monitor_19_1(t0);
    xsi_set_current_line(20, ng1);
    t2 = (t0 + 2328);
    xsi_process_wait(t2, 80000LL);
    *((char **)t1) = &&LAB5;

LAB1:    return;
LAB5:    xsi_set_current_line(20, ng1);
    xsi_vlog_finish(1);
    goto LAB1;

}

void Monitor_19_1(char *t0)
{
    char *t1;
    char *t2;

LAB0:    t1 = (t0 + 2576);
    t2 = (t0 + 3088);
    xsi_vlogfile_monitor((void *)Monitor_19_1_Func, t1, t2);

LAB1:    return;
}


extern void work_m_07024781106462210801_3214448697_init()
{
	static char *pe[] = {(void *)Initial_15_0,(void *)Monitor_19_1};
	xsi_register_didat("work_m_07024781106462210801_3214448697", "isim/hello_world_isim_beh.exe.sim/work/m_07024781106462210801_3214448697.didat");
	xsi_register_executes(pe);
}
