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
IKI_DLLESPEC extern void execute_22(char*, char *);
IKI_DLLESPEC extern void execute_23(char*, char *);
IKI_DLLESPEC extern void execute_25(char*, char *);
IKI_DLLESPEC extern void execute_26(char*, char *);
IKI_DLLESPEC extern void execute_27(char*, char *);
IKI_DLLESPEC extern void execute_29(char*, char *);
IKI_DLLESPEC extern void execute_31(char*, char *);
IKI_DLLESPEC extern void execute_32(char*, char *);
IKI_DLLESPEC extern void execute_38(char*, char *);
IKI_DLLESPEC extern void execute_47(char*, char *);
IKI_DLLESPEC extern void execute_49(char*, char *);
IKI_DLLESPEC extern void execute_54(char*, char *);
IKI_DLLESPEC extern void execute_56(char*, char *);
IKI_DLLESPEC extern void execute_59(char*, char *);
IKI_DLLESPEC extern void execute_64(char*, char *);
IKI_DLLESPEC extern void execute_65(char*, char *);
IKI_DLLESPEC extern void execute_66(char*, char *);
IKI_DLLESPEC extern void execute_68(char*, char *);
IKI_DLLESPEC extern void execute_69(char*, char *);
IKI_DLLESPEC extern void execute_70(char*, char *);
IKI_DLLESPEC extern void execute_71(char*, char *);
IKI_DLLESPEC extern void execute_72(char*, char *);
IKI_DLLESPEC extern void execute_73(char*, char *);
IKI_DLLESPEC extern void execute_74(char*, char *);
IKI_DLLESPEC extern void execute_153(char*, char *);
IKI_DLLESPEC extern void execute_157(char*, char *);
IKI_DLLESPEC extern void execute_170(char*, char *);
IKI_DLLESPEC extern void execute_173(char*, char *);
IKI_DLLESPEC extern void execute_181(char*, char *);
IKI_DLLESPEC extern void execute_185(char*, char *);
IKI_DLLESPEC extern void execute_188(char*, char *);
IKI_DLLESPEC extern void execute_191(char*, char *);
IKI_DLLESPEC extern void execute_194(char*, char *);
IKI_DLLESPEC extern void execute_196(char*, char *);
IKI_DLLESPEC extern void execute_197(char*, char *);
IKI_DLLESPEC extern void execute_198(char*, char *);
IKI_DLLESPEC extern void execute_211(char*, char *);
IKI_DLLESPEC extern void execute_218(char*, char *);
IKI_DLLESPEC extern void execute_219(char*, char *);
IKI_DLLESPEC extern void execute_220(char*, char *);
IKI_DLLESPEC extern void execute_228(char*, char *);
IKI_DLLESPEC extern void execute_232(char*, char *);
IKI_DLLESPEC extern void execute_246(char*, char *);
IKI_DLLESPEC extern void execute_340(char*, char *);
IKI_DLLESPEC extern void vhdl_transfunc_eventcallback(char*, char*, unsigned, unsigned, unsigned, char *);
IKI_DLLESPEC extern void transaction_35(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_38(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_41(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_44(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_45(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_46(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_47(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_48(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_49(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_50(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_51(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_52(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_53(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_54(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_55(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_56(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_57(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_58(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_59(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_60(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_61(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_62(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_63(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_64(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_65(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_66(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_67(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_68(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_69(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_70(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_71(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_72(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_86(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_98(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_99(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_100(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_101(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_102(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_103(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_104(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_105(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_106(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_107(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_108(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_109(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_110(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_111(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_112(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_113(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_114(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_115(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_116(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_117(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_118(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_119(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_120(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_121(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_122(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_123(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_124(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_125(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_126(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_130(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_131(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_132(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_133(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_138(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_140(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_141(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_143(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_145(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_160(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_162(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_163(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_165(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_167(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_172(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_178(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_191(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_198(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_205(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_218(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_225(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_232(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_239(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_246(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_259(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_266(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_273(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_280(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_293(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_301(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_308(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_314(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_322(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_329(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_335(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_342(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_349(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_362(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_369(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_376(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_389(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_396(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_403(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_410(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_417(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_430(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_437(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_444(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_451(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_464(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_471(char*, char*, unsigned, unsigned, unsigned);
funcp funcTab[158] = {(funcp)execute_22, (funcp)execute_23, (funcp)execute_25, (funcp)execute_26, (funcp)execute_27, (funcp)execute_29, (funcp)execute_31, (funcp)execute_32, (funcp)execute_38, (funcp)execute_47, (funcp)execute_49, (funcp)execute_54, (funcp)execute_56, (funcp)execute_59, (funcp)execute_64, (funcp)execute_65, (funcp)execute_66, (funcp)execute_68, (funcp)execute_69, (funcp)execute_70, (funcp)execute_71, (funcp)execute_72, (funcp)execute_73, (funcp)execute_74, (funcp)execute_153, (funcp)execute_157, (funcp)execute_170, (funcp)execute_173, (funcp)execute_181, (funcp)execute_185, (funcp)execute_188, (funcp)execute_191, (funcp)execute_194, (funcp)execute_196, (funcp)execute_197, (funcp)execute_198, (funcp)execute_211, (funcp)execute_218, (funcp)execute_219, (funcp)execute_220, (funcp)execute_228, (funcp)execute_232, (funcp)execute_246, (funcp)execute_340, (funcp)vhdl_transfunc_eventcallback, (funcp)transaction_35, (funcp)transaction_38, (funcp)transaction_41, (funcp)transaction_44, (funcp)transaction_45, (funcp)transaction_46, (funcp)transaction_47, (funcp)transaction_48, (funcp)transaction_49, (funcp)transaction_50, (funcp)transaction_51, (funcp)transaction_52, (funcp)transaction_53, (funcp)transaction_54, (funcp)transaction_55, (funcp)transaction_56, (funcp)transaction_57, (funcp)transaction_58, (funcp)transaction_59, (funcp)transaction_60, (funcp)transaction_61, (funcp)transaction_62, (funcp)transaction_63, (funcp)transaction_64, (funcp)transaction_65, (funcp)transaction_66, (funcp)transaction_67, (funcp)transaction_68, (funcp)transaction_69, (funcp)transaction_70, (funcp)transaction_71, (funcp)transaction_72, (funcp)transaction_86, (funcp)transaction_98, (funcp)transaction_99, (funcp)transaction_100, (funcp)transaction_101, (funcp)transaction_102, (funcp)transaction_103, (funcp)transaction_104, (funcp)transaction_105, (funcp)transaction_106, (funcp)transaction_107, (funcp)transaction_108, (funcp)transaction_109, (funcp)transaction_110, (funcp)transaction_111, (funcp)transaction_112, (funcp)transaction_113, (funcp)transaction_114, (funcp)transaction_115, (funcp)transaction_116, (funcp)transaction_117, (funcp)transaction_118, (funcp)transaction_119, (funcp)transaction_120, (funcp)transaction_121, (funcp)transaction_122, (funcp)transaction_123, (funcp)transaction_124, (funcp)transaction_125, (funcp)transaction_126, (funcp)transaction_130, (funcp)transaction_131, (funcp)transaction_132, (funcp)transaction_133, (funcp)transaction_138, (funcp)transaction_140, (funcp)transaction_141, (funcp)transaction_143, (funcp)transaction_145, (funcp)transaction_160, (funcp)transaction_162, (funcp)transaction_163, (funcp)transaction_165, (funcp)transaction_167, (funcp)transaction_172, (funcp)transaction_178, (funcp)transaction_191, (funcp)transaction_198, (funcp)transaction_205, (funcp)transaction_218, (funcp)transaction_225, (funcp)transaction_232, (funcp)transaction_239, (funcp)transaction_246, (funcp)transaction_259, (funcp)transaction_266, (funcp)transaction_273, (funcp)transaction_280, (funcp)transaction_293, (funcp)transaction_301, (funcp)transaction_308, (funcp)transaction_314, (funcp)transaction_322, (funcp)transaction_329, (funcp)transaction_335, (funcp)transaction_342, (funcp)transaction_349, (funcp)transaction_362, (funcp)transaction_369, (funcp)transaction_376, (funcp)transaction_389, (funcp)transaction_396, (funcp)transaction_403, (funcp)transaction_410, (funcp)transaction_417, (funcp)transaction_430, (funcp)transaction_437, (funcp)transaction_444, (funcp)transaction_451, (funcp)transaction_464, (funcp)transaction_471};
const int NumRelocateId= 158;

void relocate(char *dp)
{
	iki_relocate(dp, "xsim.dir/pulse_gen_invert_func_synth/xsim.reloc",  (void **)funcTab, 158);
	iki_vhdl_file_variable_register(dp + 109688);
	iki_vhdl_file_variable_register(dp + 109744);


	/*Populate the transaction function pointer field in the whole net structure */
}

void sensitize(char *dp)
{
	iki_sensitize(dp, "xsim.dir/pulse_gen_invert_func_synth/xsim.reloc");
}

	// Initialize Verilog nets in mixed simulation, for the cases when the value at time 0 should be propagated from the mixed language Vhdl net

void simulate(char *dp)
{
		iki_schedule_processes_at_time_zero(dp, "xsim.dir/pulse_gen_invert_func_synth/xsim.reloc");

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
    iki_set_sv_type_file_path_name("xsim.dir/pulse_gen_invert_func_synth/xsim.svtype");
    iki_set_crvs_dump_file_path_name("xsim.dir/pulse_gen_invert_func_synth/xsim.crvsdump");
    void* design_handle = iki_create_design("xsim.dir/pulse_gen_invert_func_synth/xsim.mem", (void *)relocate, (void *)sensitize, (void *)simulate, (void*)0, 0, isimBridge_getWdbWriter(), 0, argc, argv);
     iki_set_rc_trial_count(100);
    (void) design_handle;
    return iki_simulate_design();
}
