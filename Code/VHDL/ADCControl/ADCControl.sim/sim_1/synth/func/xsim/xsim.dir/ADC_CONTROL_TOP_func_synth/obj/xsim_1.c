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
IKI_DLLESPEC extern void execute_20(char*, char *);
IKI_DLLESPEC extern void execute_21(char*, char *);
IKI_DLLESPEC extern void execute_35(char*, char *);
IKI_DLLESPEC extern void execute_37(char*, char *);
IKI_DLLESPEC extern void execute_38(char*, char *);
IKI_DLLESPEC extern void execute_51(char*, char *);
IKI_DLLESPEC extern void execute_52(char*, char *);
IKI_DLLESPEC extern void execute_53(char*, char *);
IKI_DLLESPEC extern void execute_55(char*, char *);
IKI_DLLESPEC extern void execute_56(char*, char *);
IKI_DLLESPEC extern void execute_57(char*, char *);
IKI_DLLESPEC extern void execute_62(char*, char *);
IKI_DLLESPEC extern void execute_72(char*, char *);
IKI_DLLESPEC extern void execute_73(char*, char *);
IKI_DLLESPEC extern void execute_74(char*, char *);
IKI_DLLESPEC extern void execute_76(char*, char *);
IKI_DLLESPEC extern void execute_77(char*, char *);
IKI_DLLESPEC extern void execute_80(char*, char *);
IKI_DLLESPEC extern void execute_84(char*, char *);
IKI_DLLESPEC extern void execute_90(char*, char *);
IKI_DLLESPEC extern void execute_92(char*, char *);
IKI_DLLESPEC extern void execute_97(char*, char *);
IKI_DLLESPEC extern void execute_100(char*, char *);
IKI_DLLESPEC extern void execute_103(char*, char *);
IKI_DLLESPEC extern void execute_124(char*, char *);
IKI_DLLESPEC extern void execute_130(char*, char *);
IKI_DLLESPEC extern void execute_131(char*, char *);
IKI_DLLESPEC extern void execute_132(char*, char *);
IKI_DLLESPEC extern void execute_135(char*, char *);
IKI_DLLESPEC extern void execute_139(char*, char *);
IKI_DLLESPEC extern void execute_140(char*, char *);
IKI_DLLESPEC extern void execute_141(char*, char *);
IKI_DLLESPEC extern void execute_144(char*, char *);
IKI_DLLESPEC extern void execute_149(char*, char *);
IKI_DLLESPEC extern void execute_156(char*, char *);
IKI_DLLESPEC extern void execute_159(char*, char *);
IKI_DLLESPEC extern void execute_162(char*, char *);
IKI_DLLESPEC extern void execute_177(char*, char *);
IKI_DLLESPEC extern void execute_193(char*, char *);
IKI_DLLESPEC extern void execute_200(char*, char *);
IKI_DLLESPEC extern void execute_203(char*, char *);
IKI_DLLESPEC extern void execute_206(char*, char *);
IKI_DLLESPEC extern void vhdl_transfunc_eventcallback(char*, char*, unsigned, unsigned, unsigned, char *);
IKI_DLLESPEC extern void transaction_40(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_43(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_45(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_47(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_48(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_49(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_51(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_60(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_72(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_79(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_87(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_94(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_101(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_131(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_138(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_145(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_152(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_159(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_166(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_174(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_181(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_208(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_215(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_222(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_229(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_236(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_244(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_273(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_280(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_287(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_294(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_301(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_309(char*, char*, unsigned, unsigned, unsigned);
funcp funcTab[76] = {(funcp)execute_20, (funcp)execute_21, (funcp)execute_35, (funcp)execute_37, (funcp)execute_38, (funcp)execute_51, (funcp)execute_52, (funcp)execute_53, (funcp)execute_55, (funcp)execute_56, (funcp)execute_57, (funcp)execute_62, (funcp)execute_72, (funcp)execute_73, (funcp)execute_74, (funcp)execute_76, (funcp)execute_77, (funcp)execute_80, (funcp)execute_84, (funcp)execute_90, (funcp)execute_92, (funcp)execute_97, (funcp)execute_100, (funcp)execute_103, (funcp)execute_124, (funcp)execute_130, (funcp)execute_131, (funcp)execute_132, (funcp)execute_135, (funcp)execute_139, (funcp)execute_140, (funcp)execute_141, (funcp)execute_144, (funcp)execute_149, (funcp)execute_156, (funcp)execute_159, (funcp)execute_162, (funcp)execute_177, (funcp)execute_193, (funcp)execute_200, (funcp)execute_203, (funcp)execute_206, (funcp)vhdl_transfunc_eventcallback, (funcp)transaction_40, (funcp)transaction_43, (funcp)transaction_45, (funcp)transaction_47, (funcp)transaction_48, (funcp)transaction_49, (funcp)transaction_51, (funcp)transaction_60, (funcp)transaction_72, (funcp)transaction_79, (funcp)transaction_87, (funcp)transaction_94, (funcp)transaction_101, (funcp)transaction_131, (funcp)transaction_138, (funcp)transaction_145, (funcp)transaction_152, (funcp)transaction_159, (funcp)transaction_166, (funcp)transaction_174, (funcp)transaction_181, (funcp)transaction_208, (funcp)transaction_215, (funcp)transaction_222, (funcp)transaction_229, (funcp)transaction_236, (funcp)transaction_244, (funcp)transaction_273, (funcp)transaction_280, (funcp)transaction_287, (funcp)transaction_294, (funcp)transaction_301, (funcp)transaction_309};
const int NumRelocateId= 76;

void relocate(char *dp)
{
	iki_relocate(dp, "xsim.dir/ADC_CONTROL_TOP_func_synth/xsim.reloc",  (void **)funcTab, 76);
	iki_vhdl_file_variable_register(dp + 67184);
	iki_vhdl_file_variable_register(dp + 67240);


	/*Populate the transaction function pointer field in the whole net structure */
}

void sensitize(char *dp)
{
	iki_sensitize(dp, "xsim.dir/ADC_CONTROL_TOP_func_synth/xsim.reloc");
}

	// Initialize Verilog nets in mixed simulation, for the cases when the value at time 0 should be propagated from the mixed language Vhdl net

void simulate(char *dp)
{
		iki_schedule_processes_at_time_zero(dp, "xsim.dir/ADC_CONTROL_TOP_func_synth/xsim.reloc");

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
    iki_set_sv_type_file_path_name("xsim.dir/ADC_CONTROL_TOP_func_synth/xsim.svtype");
    iki_set_crvs_dump_file_path_name("xsim.dir/ADC_CONTROL_TOP_func_synth/xsim.crvsdump");
    void* design_handle = iki_create_design("xsim.dir/ADC_CONTROL_TOP_func_synth/xsim.mem", (void *)relocate, (void *)sensitize, (void *)simulate, (void*)0, 0, isimBridge_getWdbWriter(), 0, argc, argv);
     iki_set_rc_trial_count(100);
    (void) design_handle;
    return iki_simulate_design();
}
