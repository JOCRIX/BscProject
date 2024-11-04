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
IKI_DLLESPEC extern void execute_23(char*, char *);
IKI_DLLESPEC extern void execute_25(char*, char *);
IKI_DLLESPEC extern void execute_26(char*, char *);
IKI_DLLESPEC extern void execute_27(char*, char *);
IKI_DLLESPEC extern void execute_89(char*, char *);
IKI_DLLESPEC extern void execute_90(char*, char *);
IKI_DLLESPEC extern void execute_137(char*, char *);
IKI_DLLESPEC extern void execute_139(char*, char *);
IKI_DLLESPEC extern void execute_140(char*, char *);
IKI_DLLESPEC extern void execute_196(char*, char *);
IKI_DLLESPEC extern void execute_197(char*, char *);
IKI_DLLESPEC extern void execute_198(char*, char *);
IKI_DLLESPEC extern void execute_199(char*, char *);
IKI_DLLESPEC extern void execute_200(char*, char *);
IKI_DLLESPEC extern void execute_201(char*, char *);
IKI_DLLESPEC extern void execute_202(char*, char *);
IKI_DLLESPEC extern void execute_213(char*, char *);
IKI_DLLESPEC extern void execute_456(char*, char *);
IKI_DLLESPEC extern void execute_464(char*, char *);
IKI_DLLESPEC extern void execute_496(char*, char *);
IKI_DLLESPEC extern void execute_504(char*, char *);
IKI_DLLESPEC extern void execute_641(char*, char *);
IKI_DLLESPEC extern void execute_642(char*, char *);
IKI_DLLESPEC extern void execute_643(char*, char *);
IKI_DLLESPEC extern void execute_644(char*, char *);
IKI_DLLESPEC extern void execute_645(char*, char *);
IKI_DLLESPEC extern void execute_646(char*, char *);
IKI_DLLESPEC extern void execute_647(char*, char *);
IKI_DLLESPEC extern void execute_742(char*, char *);
IKI_DLLESPEC extern void execute_750(char*, char *);
IKI_DLLESPEC extern void execute_751(char*, char *);
IKI_DLLESPEC extern void execute_752(char*, char *);
IKI_DLLESPEC extern void execute_754(char*, char *);
IKI_DLLESPEC extern void execute_755(char*, char *);
IKI_DLLESPEC extern void execute_756(char*, char *);
IKI_DLLESPEC extern void vhdl_transfunc_eventcallback(char*, char*, unsigned, unsigned, unsigned, char *);
IKI_DLLESPEC extern void transaction_38(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_40(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_85(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_86(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_87(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_88(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_89(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_90(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_92(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_93(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_94(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_95(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_96(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_97(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_108(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_109(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_110(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_111(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_112(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_113(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_117(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_120(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_121(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_122(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_179(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_180(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_198(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_205(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_212(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_219(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_226(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_233(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_240(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_247(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_254(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_261(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_268(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_275(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_282(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_289(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_296(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_303(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_310(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_316(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_322(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_328(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_334(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_340(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_346(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_352(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_358(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_364(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_370(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_376(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_382(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_388(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_394(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_400(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_406(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_412(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_418(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_424(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_430(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_436(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_442(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_448(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_454(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_460(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_466(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_472(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_478(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_484(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_490(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_496(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_502(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_509(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_516(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_523(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_530(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_537(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_544(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_563(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_570(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_577(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_584(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_591(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_598(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_605(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_612(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_619(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_626(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_633(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_641(char*, char*, unsigned, unsigned, unsigned);
funcp funcTab[129] = {(funcp)execute_23, (funcp)execute_25, (funcp)execute_26, (funcp)execute_27, (funcp)execute_89, (funcp)execute_90, (funcp)execute_137, (funcp)execute_139, (funcp)execute_140, (funcp)execute_196, (funcp)execute_197, (funcp)execute_198, (funcp)execute_199, (funcp)execute_200, (funcp)execute_201, (funcp)execute_202, (funcp)execute_213, (funcp)execute_456, (funcp)execute_464, (funcp)execute_496, (funcp)execute_504, (funcp)execute_641, (funcp)execute_642, (funcp)execute_643, (funcp)execute_644, (funcp)execute_645, (funcp)execute_646, (funcp)execute_647, (funcp)execute_742, (funcp)execute_750, (funcp)execute_751, (funcp)execute_752, (funcp)execute_754, (funcp)execute_755, (funcp)execute_756, (funcp)vhdl_transfunc_eventcallback, (funcp)transaction_38, (funcp)transaction_40, (funcp)transaction_85, (funcp)transaction_86, (funcp)transaction_87, (funcp)transaction_88, (funcp)transaction_89, (funcp)transaction_90, (funcp)transaction_92, (funcp)transaction_93, (funcp)transaction_94, (funcp)transaction_95, (funcp)transaction_96, (funcp)transaction_97, (funcp)transaction_108, (funcp)transaction_109, (funcp)transaction_110, (funcp)transaction_111, (funcp)transaction_112, (funcp)transaction_113, (funcp)transaction_117, (funcp)transaction_120, (funcp)transaction_121, (funcp)transaction_122, (funcp)transaction_179, (funcp)transaction_180, (funcp)transaction_198, (funcp)transaction_205, (funcp)transaction_212, (funcp)transaction_219, (funcp)transaction_226, (funcp)transaction_233, (funcp)transaction_240, (funcp)transaction_247, (funcp)transaction_254, (funcp)transaction_261, (funcp)transaction_268, (funcp)transaction_275, (funcp)transaction_282, (funcp)transaction_289, (funcp)transaction_296, (funcp)transaction_303, (funcp)transaction_310, (funcp)transaction_316, (funcp)transaction_322, (funcp)transaction_328, (funcp)transaction_334, (funcp)transaction_340, (funcp)transaction_346, (funcp)transaction_352, (funcp)transaction_358, (funcp)transaction_364, (funcp)transaction_370, (funcp)transaction_376, (funcp)transaction_382, (funcp)transaction_388, (funcp)transaction_394, (funcp)transaction_400, (funcp)transaction_406, (funcp)transaction_412, (funcp)transaction_418, (funcp)transaction_424, (funcp)transaction_430, (funcp)transaction_436, (funcp)transaction_442, (funcp)transaction_448, (funcp)transaction_454, (funcp)transaction_460, (funcp)transaction_466, (funcp)transaction_472, (funcp)transaction_478, (funcp)transaction_484, (funcp)transaction_490, (funcp)transaction_496, (funcp)transaction_502, (funcp)transaction_509, (funcp)transaction_516, (funcp)transaction_523, (funcp)transaction_530, (funcp)transaction_537, (funcp)transaction_544, (funcp)transaction_563, (funcp)transaction_570, (funcp)transaction_577, (funcp)transaction_584, (funcp)transaction_591, (funcp)transaction_598, (funcp)transaction_605, (funcp)transaction_612, (funcp)transaction_619, (funcp)transaction_626, (funcp)transaction_633, (funcp)transaction_641};
const int NumRelocateId= 129;

void relocate(char *dp)
{
	iki_relocate(dp, "xsim.dir/internal_ram_func_synth/xsim.reloc",  (void **)funcTab, 129);
	iki_vhdl_file_variable_register(dp + 150824);
	iki_vhdl_file_variable_register(dp + 150880);


	/*Populate the transaction function pointer field in the whole net structure */
}

void sensitize(char *dp)
{
	iki_sensitize(dp, "xsim.dir/internal_ram_func_synth/xsim.reloc");
}

	// Initialize Verilog nets in mixed simulation, for the cases when the value at time 0 should be propagated from the mixed language Vhdl net

void simulate(char *dp)
{
		iki_schedule_processes_at_time_zero(dp, "xsim.dir/internal_ram_func_synth/xsim.reloc");

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
    iki_set_sv_type_file_path_name("xsim.dir/internal_ram_func_synth/xsim.svtype");
    iki_set_crvs_dump_file_path_name("xsim.dir/internal_ram_func_synth/xsim.crvsdump");
    void* design_handle = iki_create_design("xsim.dir/internal_ram_func_synth/xsim.mem", (void *)relocate, (void *)sensitize, (void *)simulate, (void*)0, 0, isimBridge_getWdbWriter(), 0, argc, argv);
     iki_set_rc_trial_count(100);
    (void) design_handle;
    return iki_simulate_design();
}
