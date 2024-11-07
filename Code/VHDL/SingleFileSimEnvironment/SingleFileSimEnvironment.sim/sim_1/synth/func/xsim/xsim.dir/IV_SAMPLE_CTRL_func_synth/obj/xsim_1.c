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
IKI_DLLESPEC extern void execute_21(char*, char *);
IKI_DLLESPEC extern void execute_23(char*, char *);
IKI_DLLESPEC extern void execute_24(char*, char *);
IKI_DLLESPEC extern void execute_25(char*, char *);
IKI_DLLESPEC extern void execute_87(char*, char *);
IKI_DLLESPEC extern void execute_88(char*, char *);
IKI_DLLESPEC extern void execute_89(char*, char *);
IKI_DLLESPEC extern void execute_90(char*, char *);
IKI_DLLESPEC extern void execute_91(char*, char *);
IKI_DLLESPEC extern void execute_92(char*, char *);
IKI_DLLESPEC extern void execute_93(char*, char *);
IKI_DLLESPEC extern void execute_104(char*, char *);
IKI_DLLESPEC extern void execute_347(char*, char *);
IKI_DLLESPEC extern void execute_349(char*, char *);
IKI_DLLESPEC extern void execute_351(char*, char *);
IKI_DLLESPEC extern void execute_352(char*, char *);
IKI_DLLESPEC extern void execute_456(char*, char *);
IKI_DLLESPEC extern void execute_457(char*, char *);
IKI_DLLESPEC extern void execute_510(char*, char *);
IKI_DLLESPEC extern void execute_517(char*, char *);
IKI_DLLESPEC extern void execute_562(char*, char *);
IKI_DLLESPEC extern void execute_567(char*, char *);
IKI_DLLESPEC extern void execute_636(char*, char *);
IKI_DLLESPEC extern void execute_641(char*, char *);
IKI_DLLESPEC extern void execute_643(char*, char *);
IKI_DLLESPEC extern void execute_644(char*, char *);
IKI_DLLESPEC extern void execute_645(char*, char *);
IKI_DLLESPEC extern void execute_648(char*, char *);
IKI_DLLESPEC extern void execute_667(char*, char *);
IKI_DLLESPEC extern void execute_673(char*, char *);
IKI_DLLESPEC extern void vhdl_transfunc_eventcallback(char*, char*, unsigned, unsigned, unsigned, char *);
IKI_DLLESPEC extern void transaction_73(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_173(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_180(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_187(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_194(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_201(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_208(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_215(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_222(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_229(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_236(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_243(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_250(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_257(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_264(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_271(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_278(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_285(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_291(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_297(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_303(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_309(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_315(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_321(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_327(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_333(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_339(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_345(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_351(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_357(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_363(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_369(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_375(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_381(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_387(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_393(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_399(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_405(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_411(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_417(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_423(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_429(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_435(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_441(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_447(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_453(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_459(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_465(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_471(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_478(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_484(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_491(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_498(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_505(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_512(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_519(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_526(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_533(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_540(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_547(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_554(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_561(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_568(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_575(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_582(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_589(char*, char*, unsigned, unsigned, unsigned);
funcp funcTab[97] = {(funcp)execute_21, (funcp)execute_23, (funcp)execute_24, (funcp)execute_25, (funcp)execute_87, (funcp)execute_88, (funcp)execute_89, (funcp)execute_90, (funcp)execute_91, (funcp)execute_92, (funcp)execute_93, (funcp)execute_104, (funcp)execute_347, (funcp)execute_349, (funcp)execute_351, (funcp)execute_352, (funcp)execute_456, (funcp)execute_457, (funcp)execute_510, (funcp)execute_517, (funcp)execute_562, (funcp)execute_567, (funcp)execute_636, (funcp)execute_641, (funcp)execute_643, (funcp)execute_644, (funcp)execute_645, (funcp)execute_648, (funcp)execute_667, (funcp)execute_673, (funcp)vhdl_transfunc_eventcallback, (funcp)transaction_73, (funcp)transaction_173, (funcp)transaction_180, (funcp)transaction_187, (funcp)transaction_194, (funcp)transaction_201, (funcp)transaction_208, (funcp)transaction_215, (funcp)transaction_222, (funcp)transaction_229, (funcp)transaction_236, (funcp)transaction_243, (funcp)transaction_250, (funcp)transaction_257, (funcp)transaction_264, (funcp)transaction_271, (funcp)transaction_278, (funcp)transaction_285, (funcp)transaction_291, (funcp)transaction_297, (funcp)transaction_303, (funcp)transaction_309, (funcp)transaction_315, (funcp)transaction_321, (funcp)transaction_327, (funcp)transaction_333, (funcp)transaction_339, (funcp)transaction_345, (funcp)transaction_351, (funcp)transaction_357, (funcp)transaction_363, (funcp)transaction_369, (funcp)transaction_375, (funcp)transaction_381, (funcp)transaction_387, (funcp)transaction_393, (funcp)transaction_399, (funcp)transaction_405, (funcp)transaction_411, (funcp)transaction_417, (funcp)transaction_423, (funcp)transaction_429, (funcp)transaction_435, (funcp)transaction_441, (funcp)transaction_447, (funcp)transaction_453, (funcp)transaction_459, (funcp)transaction_465, (funcp)transaction_471, (funcp)transaction_478, (funcp)transaction_484, (funcp)transaction_491, (funcp)transaction_498, (funcp)transaction_505, (funcp)transaction_512, (funcp)transaction_519, (funcp)transaction_526, (funcp)transaction_533, (funcp)transaction_540, (funcp)transaction_547, (funcp)transaction_554, (funcp)transaction_561, (funcp)transaction_568, (funcp)transaction_575, (funcp)transaction_582, (funcp)transaction_589};
const int NumRelocateId= 97;

void relocate(char *dp)
{
	iki_relocate(dp, "xsim.dir/IV_SAMPLE_CTRL_func_synth/xsim.reloc",  (void **)funcTab, 97);
	iki_vhdl_file_variable_register(dp + 139104);
	iki_vhdl_file_variable_register(dp + 139160);


	/*Populate the transaction function pointer field in the whole net structure */
}

void sensitize(char *dp)
{
	iki_sensitize(dp, "xsim.dir/IV_SAMPLE_CTRL_func_synth/xsim.reloc");
}

	// Initialize Verilog nets in mixed simulation, for the cases when the value at time 0 should be propagated from the mixed language Vhdl net

void simulate(char *dp)
{
		iki_schedule_processes_at_time_zero(dp, "xsim.dir/IV_SAMPLE_CTRL_func_synth/xsim.reloc");

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
    iki_set_sv_type_file_path_name("xsim.dir/IV_SAMPLE_CTRL_func_synth/xsim.svtype");
    iki_set_crvs_dump_file_path_name("xsim.dir/IV_SAMPLE_CTRL_func_synth/xsim.crvsdump");
    void* design_handle = iki_create_design("xsim.dir/IV_SAMPLE_CTRL_func_synth/xsim.mem", (void *)relocate, (void *)sensitize, (void *)simulate, (void*)0, 0, isimBridge_getWdbWriter(), 0, argc, argv);
     iki_set_rc_trial_count(100);
    (void) design_handle;
    return iki_simulate_design();
}
