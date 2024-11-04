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
IKI_DLLESPEC extern void execute_153(char*, char *);
IKI_DLLESPEC extern void execute_154(char*, char *);
IKI_DLLESPEC extern void execute_201(char*, char *);
IKI_DLLESPEC extern void execute_203(char*, char *);
IKI_DLLESPEC extern void execute_204(char*, char *);
IKI_DLLESPEC extern void execute_260(char*, char *);
IKI_DLLESPEC extern void execute_261(char*, char *);
IKI_DLLESPEC extern void execute_262(char*, char *);
IKI_DLLESPEC extern void execute_263(char*, char *);
IKI_DLLESPEC extern void execute_264(char*, char *);
IKI_DLLESPEC extern void execute_265(char*, char *);
IKI_DLLESPEC extern void execute_266(char*, char *);
IKI_DLLESPEC extern void execute_277(char*, char *);
IKI_DLLESPEC extern void execute_520(char*, char *);
IKI_DLLESPEC extern void execute_528(char*, char *);
IKI_DLLESPEC extern void execute_560(char*, char *);
IKI_DLLESPEC extern void execute_568(char*, char *);
IKI_DLLESPEC extern void execute_705(char*, char *);
IKI_DLLESPEC extern void execute_706(char*, char *);
IKI_DLLESPEC extern void execute_707(char*, char *);
IKI_DLLESPEC extern void execute_708(char*, char *);
IKI_DLLESPEC extern void execute_709(char*, char *);
IKI_DLLESPEC extern void execute_710(char*, char *);
IKI_DLLESPEC extern void execute_711(char*, char *);
IKI_DLLESPEC extern void execute_806(char*, char *);
IKI_DLLESPEC extern void execute_814(char*, char *);
IKI_DLLESPEC extern void execute_815(char*, char *);
IKI_DLLESPEC extern void execute_816(char*, char *);
IKI_DLLESPEC extern void execute_818(char*, char *);
IKI_DLLESPEC extern void execute_819(char*, char *);
IKI_DLLESPEC extern void execute_820(char*, char *);
IKI_DLLESPEC extern void vhdl_transfunc_eventcallback(char*, char*, unsigned, unsigned, unsigned, char *);
IKI_DLLESPEC extern void transaction_47(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_49(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_56(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_101(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_102(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_103(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_104(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_105(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_106(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_108(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_109(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_110(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_111(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_112(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_113(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_124(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_125(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_126(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_127(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_128(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_129(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_133(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_136(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_137(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_138(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_211(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_212(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_230(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_237(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_244(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_251(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_258(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_265(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_272(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_279(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_286(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_293(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_300(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_307(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_314(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_321(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_328(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_335(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_342(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_349(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_356(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_363(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_370(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_377(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_384(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_391(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_398(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_405(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_412(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_419(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_426(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_433(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_440(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_447(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_454(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_460(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_466(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_472(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_478(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_484(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_490(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_496(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_502(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_508(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_514(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_520(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_526(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_532(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_538(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_544(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_550(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_556(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_562(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_568(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_574(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_580(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_586(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_592(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_598(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_604(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_610(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_616(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_622(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_628(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_634(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_640(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_646(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_653(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_660(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_667(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_674(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_681(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_688(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_707(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_714(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_721(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_728(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_735(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_742(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_749(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_756(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_763(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_770(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_777(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_785(char*, char*, unsigned, unsigned, unsigned);
funcp funcTab[146] = {(funcp)execute_23, (funcp)execute_25, (funcp)execute_26, (funcp)execute_27, (funcp)execute_153, (funcp)execute_154, (funcp)execute_201, (funcp)execute_203, (funcp)execute_204, (funcp)execute_260, (funcp)execute_261, (funcp)execute_262, (funcp)execute_263, (funcp)execute_264, (funcp)execute_265, (funcp)execute_266, (funcp)execute_277, (funcp)execute_520, (funcp)execute_528, (funcp)execute_560, (funcp)execute_568, (funcp)execute_705, (funcp)execute_706, (funcp)execute_707, (funcp)execute_708, (funcp)execute_709, (funcp)execute_710, (funcp)execute_711, (funcp)execute_806, (funcp)execute_814, (funcp)execute_815, (funcp)execute_816, (funcp)execute_818, (funcp)execute_819, (funcp)execute_820, (funcp)vhdl_transfunc_eventcallback, (funcp)transaction_47, (funcp)transaction_49, (funcp)transaction_56, (funcp)transaction_101, (funcp)transaction_102, (funcp)transaction_103, (funcp)transaction_104, (funcp)transaction_105, (funcp)transaction_106, (funcp)transaction_108, (funcp)transaction_109, (funcp)transaction_110, (funcp)transaction_111, (funcp)transaction_112, (funcp)transaction_113, (funcp)transaction_124, (funcp)transaction_125, (funcp)transaction_126, (funcp)transaction_127, (funcp)transaction_128, (funcp)transaction_129, (funcp)transaction_133, (funcp)transaction_136, (funcp)transaction_137, (funcp)transaction_138, (funcp)transaction_211, (funcp)transaction_212, (funcp)transaction_230, (funcp)transaction_237, (funcp)transaction_244, (funcp)transaction_251, (funcp)transaction_258, (funcp)transaction_265, (funcp)transaction_272, (funcp)transaction_279, (funcp)transaction_286, (funcp)transaction_293, (funcp)transaction_300, (funcp)transaction_307, (funcp)transaction_314, (funcp)transaction_321, (funcp)transaction_328, (funcp)transaction_335, (funcp)transaction_342, (funcp)transaction_349, (funcp)transaction_356, (funcp)transaction_363, (funcp)transaction_370, (funcp)transaction_377, (funcp)transaction_384, (funcp)transaction_391, (funcp)transaction_398, (funcp)transaction_405, (funcp)transaction_412, (funcp)transaction_419, (funcp)transaction_426, (funcp)transaction_433, (funcp)transaction_440, (funcp)transaction_447, (funcp)transaction_454, (funcp)transaction_460, (funcp)transaction_466, (funcp)transaction_472, (funcp)transaction_478, (funcp)transaction_484, (funcp)transaction_490, (funcp)transaction_496, (funcp)transaction_502, (funcp)transaction_508, (funcp)transaction_514, (funcp)transaction_520, (funcp)transaction_526, (funcp)transaction_532, (funcp)transaction_538, (funcp)transaction_544, (funcp)transaction_550, (funcp)transaction_556, (funcp)transaction_562, (funcp)transaction_568, (funcp)transaction_574, (funcp)transaction_580, (funcp)transaction_586, (funcp)transaction_592, (funcp)transaction_598, (funcp)transaction_604, (funcp)transaction_610, (funcp)transaction_616, (funcp)transaction_622, (funcp)transaction_628, (funcp)transaction_634, (funcp)transaction_640, (funcp)transaction_646, (funcp)transaction_653, (funcp)transaction_660, (funcp)transaction_667, (funcp)transaction_674, (funcp)transaction_681, (funcp)transaction_688, (funcp)transaction_707, (funcp)transaction_714, (funcp)transaction_721, (funcp)transaction_728, (funcp)transaction_735, (funcp)transaction_742, (funcp)transaction_749, (funcp)transaction_756, (funcp)transaction_763, (funcp)transaction_770, (funcp)transaction_777, (funcp)transaction_785};
const int NumRelocateId= 146;

void relocate(char *dp)
{
	iki_relocate(dp, "xsim.dir/internal_ram_func_synth/xsim.reloc",  (void **)funcTab, 146);
	iki_vhdl_file_variable_register(dp + 180776);
	iki_vhdl_file_variable_register(dp + 180832);


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
