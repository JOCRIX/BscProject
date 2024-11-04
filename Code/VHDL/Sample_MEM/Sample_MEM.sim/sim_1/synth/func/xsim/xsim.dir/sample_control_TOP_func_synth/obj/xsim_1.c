/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                         */
/*  \   \        Copyright (c) 2003-2020 Xilinx, Inc.                 */
/*  /   /        All Right Reserved.                                  */
/* /---/   /\                                                         */
/* \   \  /  \                                                        */
/*  \___\/\___\                                                       */
/**********************************************************************/

#if defined(_WIN32)
 #include "stdio.h"
 #define IKI_DLLESPEC __declspec(dllimport)
#else
 #define IKI_DLLESPEC
#endif
#include "iki.h"
#include <string.h>
#include <math.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                         */
/*  \   \        Copyright (c) 2003-2020 Xilinx, Inc.                 */
/*  /   /        All Right Reserved.                                  */
/* /---/   /\                                                         */
/* \   \  /  \                                                        */
/*  \___\/\___\                                                       */
/**********************************************************************/

#if defined(_WIN32)
 #include "stdio.h"
 #define IKI_DLLESPEC __declspec(dllimport)
#else
 #define IKI_DLLESPEC
#endif
#include "iki.h"
#include <string.h>
#include <math.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
typedef void (*funcp)(char *, char *);
extern int main(int, char**);
IKI_DLLESPEC extern void execute_16(char*, char *);
IKI_DLLESPEC extern void execute_48(char*, char *);
IKI_DLLESPEC extern void execute_50(char*, char *);
IKI_DLLESPEC extern void execute_51(char*, char *);
IKI_DLLESPEC extern void execute_53(char*, char *);
IKI_DLLESPEC extern void execute_54(char*, char *);
IKI_DLLESPEC extern void execute_56(char*, char *);
IKI_DLLESPEC extern void execute_63(char*, char *);
IKI_DLLESPEC extern void execute_64(char*, char *);
IKI_DLLESPEC extern void execute_65(char*, char *);
IKI_DLLESPEC extern void execute_66(char*, char *);
IKI_DLLESPEC extern void execute_67(char*, char *);
IKI_DLLESPEC extern void execute_68(char*, char *);
IKI_DLLESPEC extern void execute_69(char*, char *);
IKI_DLLESPEC extern void execute_70(char*, char *);
IKI_DLLESPEC extern void execute_71(char*, char *);
IKI_DLLESPEC extern void execute_303(char*, char *);
IKI_DLLESPEC extern void execute_304(char*, char *);
IKI_DLLESPEC extern void execute_306(char*, char *);
IKI_DLLESPEC extern void execute_307(char*, char *);
IKI_DLLESPEC extern void execute_309(char*, char *);
IKI_DLLESPEC extern void execute_310(char*, char *);
IKI_DLLESPEC extern void execute_311(char*, char *);
IKI_DLLESPEC extern void execute_312(char*, char *);
IKI_DLLESPEC extern void execute_313(char*, char *);
IKI_DLLESPEC extern void execute_314(char*, char *);
IKI_DLLESPEC extern void execute_315(char*, char *);
IKI_DLLESPEC extern void execute_316(char*, char *);
IKI_DLLESPEC extern void execute_317(char*, char *);
IKI_DLLESPEC extern void execute_484(char*, char *);
IKI_DLLESPEC extern void execute_486(char*, char *);
IKI_DLLESPEC extern void execute_489(char*, char *);
IKI_DLLESPEC extern void execute_491(char*, char *);
IKI_DLLESPEC extern void execute_492(char*, char *);
IKI_DLLESPEC extern void execute_493(char*, char *);
IKI_DLLESPEC extern void execute_502(char*, char *);
IKI_DLLESPEC extern void execute_508(char*, char *);
IKI_DLLESPEC extern void execute_509(char*, char *);
IKI_DLLESPEC extern void execute_510(char*, char *);
IKI_DLLESPEC extern void execute_513(char*, char *);
IKI_DLLESPEC extern void execute_567(char*, char *);
IKI_DLLESPEC extern void execute_568(char*, char *);
IKI_DLLESPEC extern void execute_569(char*, char *);
IKI_DLLESPEC extern void execute_570(char*, char *);
IKI_DLLESPEC extern void execute_571(char*, char *);
IKI_DLLESPEC extern void execute_572(char*, char *);
IKI_DLLESPEC extern void execute_573(char*, char *);
IKI_DLLESPEC extern void execute_584(char*, char *);
IKI_DLLESPEC extern void execute_827(char*, char *);
IKI_DLLESPEC extern void execute_830(char*, char *);
IKI_DLLESPEC extern void execute_941(char*, char *);
IKI_DLLESPEC extern void execute_942(char*, char *);
IKI_DLLESPEC extern void execute_943(char*, char *);
IKI_DLLESPEC extern void vhdl_transfunc_eventcallback(char*, char*, unsigned, unsigned, unsigned, char *);
IKI_DLLESPEC extern void transaction_34(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_35(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_69(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_71(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_72(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_507(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_514(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_521(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_528(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_631(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_639(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_647(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_655(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_663(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_671(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_678(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_685(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_692(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_699(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_706(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_713(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_720(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_727(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_734(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_741(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_748(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_755(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_762(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_769(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_776(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_783(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_790(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_797(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_804(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_811(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_818(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_825(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_832(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_839(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_846(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_853(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_860(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_867(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_874(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_881(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_888(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_895(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_903(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_911(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_919(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_927(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_935(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_943(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_951(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_959(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_967(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_975(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_983(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_991(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_999(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_1007(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_1015(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_1023(char*, char*, unsigned, unsigned, unsigned);
funcp funcTab[117] = {(funcp)execute_16, (funcp)execute_48, (funcp)execute_50, (funcp)execute_51, (funcp)execute_53, (funcp)execute_54, (funcp)execute_56, (funcp)execute_63, (funcp)execute_64, (funcp)execute_65, (funcp)execute_66, (funcp)execute_67, (funcp)execute_68, (funcp)execute_69, (funcp)execute_70, (funcp)execute_71, (funcp)execute_303, (funcp)execute_304, (funcp)execute_306, (funcp)execute_307, (funcp)execute_309, (funcp)execute_310, (funcp)execute_311, (funcp)execute_312, (funcp)execute_313, (funcp)execute_314, (funcp)execute_315, (funcp)execute_316, (funcp)execute_317, (funcp)execute_484, (funcp)execute_486, (funcp)execute_489, (funcp)execute_491, (funcp)execute_492, (funcp)execute_493, (funcp)execute_502, (funcp)execute_508, (funcp)execute_509, (funcp)execute_510, (funcp)execute_513, (funcp)execute_567, (funcp)execute_568, (funcp)execute_569, (funcp)execute_570, (funcp)execute_571, (funcp)execute_572, (funcp)execute_573, (funcp)execute_584, (funcp)execute_827, (funcp)execute_830, (funcp)execute_941, (funcp)execute_942, (funcp)execute_943, (funcp)vhdl_transfunc_eventcallback, (funcp)transaction_34, (funcp)transaction_35, (funcp)transaction_69, (funcp)transaction_71, (funcp)transaction_72, (funcp)transaction_507, (funcp)transaction_514, (funcp)transaction_521, (funcp)transaction_528, (funcp)transaction_631, (funcp)transaction_639, (funcp)transaction_647, (funcp)transaction_655, (funcp)transaction_663, (funcp)transaction_671, (funcp)transaction_678, (funcp)transaction_685, (funcp)transaction_692, (funcp)transaction_699, (funcp)transaction_706, (funcp)transaction_713, (funcp)transaction_720, (funcp)transaction_727, (funcp)transaction_734, (funcp)transaction_741, (funcp)transaction_748, (funcp)transaction_755, (funcp)transaction_762, (funcp)transaction_769, (funcp)transaction_776, (funcp)transaction_783, (funcp)transaction_790, (funcp)transaction_797, (funcp)transaction_804, (funcp)transaction_811, (funcp)transaction_818, (funcp)transaction_825, (funcp)transaction_832, (funcp)transaction_839, (funcp)transaction_846, (funcp)transaction_853, (funcp)transaction_860, (funcp)transaction_867, (funcp)transaction_874, (funcp)transaction_881, (funcp)transaction_888, (funcp)transaction_895, (funcp)transaction_903, (funcp)transaction_911, (funcp)transaction_919, (funcp)transaction_927, (funcp)transaction_935, (funcp)transaction_943, (funcp)transaction_951, (funcp)transaction_959, (funcp)transaction_967, (funcp)transaction_975, (funcp)transaction_983, (funcp)transaction_991, (funcp)transaction_999, (funcp)transaction_1007, (funcp)transaction_1015, (funcp)transaction_1023};
const int NumRelocateId= 117;

void relocate(char *dp)
{
	iki_relocate(dp, "xsim.dir/sample_control_TOP_func_synth/xsim.reloc",  (void **)funcTab, 117);
	iki_vhdl_file_variable_register(dp + 235936);
	iki_vhdl_file_variable_register(dp + 235992);


	/*Populate the transaction function pointer field in the whole net structure */
}

void sensitize(char *dp)
{
	iki_sensitize(dp, "xsim.dir/sample_control_TOP_func_synth/xsim.reloc");
}

	// Initialize Verilog nets in mixed simulation, for the cases when the value at time 0 should be propagated from the mixed language Vhdl net

void simulate(char *dp)
{
		iki_schedule_processes_at_time_zero(dp, "xsim.dir/sample_control_TOP_func_synth/xsim.reloc");

	iki_execute_processes();

	// Schedule resolution functions for the multiply driven Verilog nets that have strength
	// Schedule transaction functions for the singly driven Verilog nets that have strength

}
#include "iki_bridge.h"
void relocate(char *);

void sensitize(char *);

void simulate(char *);

extern SYSTEMCLIB_IMP_DLLSPEC void local_register_implicit_channel(int, char*);
extern SYSTEMCLIB_IMP_DLLSPEC int xsim_argc_copy ;
extern SYSTEMCLIB_IMP_DLLSPEC char** xsim_argv_copy ;

int main(int argc, char **argv)
{
    iki_heap_initialize("ms", "isimmm", 0, 2147483648) ;
    iki_set_xsimdir_location_if_remapped(argc, argv)  ;
    iki_set_sv_type_file_path_name("xsim.dir/sample_control_TOP_func_synth/xsim.svtype");
    iki_set_crvs_dump_file_path_name("xsim.dir/sample_control_TOP_func_synth/xsim.crvsdump");
    void* design_handle = iki_create_design("xsim.dir/sample_control_TOP_func_synth/xsim.mem", (void *)relocate, (void *)sensitize, (void *)simulate, (void*)0, 0, isimBridge_getWdbWriter(), 0, argc, argv);
     iki_set_rc_trial_count(100);
    (void) design_handle;
    return iki_simulate_design();
}
