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
IKI_DLLESPEC extern void execute_58(char*, char *);
IKI_DLLESPEC extern void execute_59(char*, char *);
IKI_DLLESPEC extern void execute_61(char*, char *);
IKI_DLLESPEC extern void execute_62(char*, char *);
IKI_DLLESPEC extern void execute_64(char*, char *);
IKI_DLLESPEC extern void execute_65(char*, char *);
IKI_DLLESPEC extern void execute_66(char*, char *);
IKI_DLLESPEC extern void execute_176(char*, char *);
IKI_DLLESPEC extern void execute_179(char*, char *);
IKI_DLLESPEC extern void execute_182(char*, char *);
IKI_DLLESPEC extern void execute_185(char*, char *);
IKI_DLLESPEC extern void execute_202(char*, char *);
IKI_DLLESPEC extern void execute_205(char*, char *);
IKI_DLLESPEC extern void execute_211(char*, char *);
IKI_DLLESPEC extern void execute_246(char*, char *);
IKI_DLLESPEC extern void execute_281(char*, char *);
IKI_DLLESPEC extern void execute_306(char*, char *);
IKI_DLLESPEC extern void execute_320(char*, char *);
IKI_DLLESPEC extern void execute_355(char*, char *);
IKI_DLLESPEC extern void execute_390(char*, char *);
IKI_DLLESPEC extern void execute_425(char*, char *);
IKI_DLLESPEC extern void execute_449(char*, char *);
IKI_DLLESPEC extern void execute_463(char*, char *);
IKI_DLLESPEC extern void execute_498(char*, char *);
IKI_DLLESPEC extern void execute_533(char*, char *);
IKI_DLLESPEC extern void execute_568(char*, char *);
IKI_DLLESPEC extern void execute_603(char*, char *);
IKI_DLLESPEC extern void execute_642(char*, char *);
IKI_DLLESPEC extern void execute_677(char*, char *);
IKI_DLLESPEC extern void execute_712(char*, char *);
IKI_DLLESPEC extern void execute_747(char*, char *);
IKI_DLLESPEC extern void execute_751(char*, char *);
IKI_DLLESPEC extern void execute_754(char*, char *);
IKI_DLLESPEC extern void execute_764(char*, char *);
IKI_DLLESPEC extern void execute_767(char*, char *);
IKI_DLLESPEC extern void execute_773(char*, char *);
IKI_DLLESPEC extern void execute_774(char*, char *);
IKI_DLLESPEC extern void execute_775(char*, char *);
IKI_DLLESPEC extern void execute_798(char*, char *);
IKI_DLLESPEC extern void execute_800(char*, char *);
IKI_DLLESPEC extern void execute_804(char*, char *);
IKI_DLLESPEC extern void execute_805(char*, char *);
IKI_DLLESPEC extern void execute_806(char*, char *);
IKI_DLLESPEC extern void execute_824(char*, char *);
IKI_DLLESPEC extern void execute_825(char*, char *);
IKI_DLLESPEC extern void execute_826(char*, char *);
IKI_DLLESPEC extern void execute_827(char*, char *);
IKI_DLLESPEC extern void execute_828(char*, char *);
IKI_DLLESPEC extern void execute_829(char*, char *);
IKI_DLLESPEC extern void execute_830(char*, char *);
IKI_DLLESPEC extern void execute_1085(char*, char *);
IKI_DLLESPEC extern void vhdl_transfunc_eventcallback(char*, char*, unsigned, unsigned, unsigned, char *);
IKI_DLLESPEC extern void transaction_34(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_36(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_54(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_55(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_56(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_57(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_126(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_133(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_140(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_147(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_154(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_161(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_168(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_175(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_182(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_189(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_196(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_203(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_210(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_217(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_224(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_231(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_252(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_259(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_266(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_275(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_297(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_304(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_311(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_320(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_342(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_349(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_356(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_365(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_388(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_395(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_402(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_416(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_438(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_445(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_452(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_461(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_483(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_490(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_497(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_506(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_528(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_535(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_542(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_551(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_574(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_581(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_588(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_600(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_622(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_629(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_636(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_645(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_667(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_674(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_681(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_690(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_712(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_719(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_726(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_735(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_757(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_764(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_771(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_780(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_804(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_811(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_818(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_832(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_854(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_861(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_868(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_877(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_899(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_906(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_913(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_922(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_944(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_951(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_958(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_967(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_989(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_996(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_1003(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_1010(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_1127(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_1135(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_1143(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_1151(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_1159(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_1166(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_1173(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_1180(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_1187(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_1194(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_1202(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_1209(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_1216(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_1223(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_1230(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_1237(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_1244(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_1251(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_1258(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_1265(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_1272(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_1279(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_1286(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_1293(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_1300(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_1307(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_1314(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_1321(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_1328(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_1335(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_1342(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_1349(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_1356(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_1363(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_1370(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_1377(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_1384(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_1391(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_1398(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_1405(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_1412(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_1419(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_1426(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_1434(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_1442(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_1450(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_1458(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_1466(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_1474(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_1482(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_1490(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_1498(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_1506(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_1514(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_1522(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_1530(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_1538(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_1546(char*, char*, unsigned, unsigned, unsigned);
funcp funcTab[204] = {(funcp)execute_16, (funcp)execute_48, (funcp)execute_50, (funcp)execute_51, (funcp)execute_58, (funcp)execute_59, (funcp)execute_61, (funcp)execute_62, (funcp)execute_64, (funcp)execute_65, (funcp)execute_66, (funcp)execute_176, (funcp)execute_179, (funcp)execute_182, (funcp)execute_185, (funcp)execute_202, (funcp)execute_205, (funcp)execute_211, (funcp)execute_246, (funcp)execute_281, (funcp)execute_306, (funcp)execute_320, (funcp)execute_355, (funcp)execute_390, (funcp)execute_425, (funcp)execute_449, (funcp)execute_463, (funcp)execute_498, (funcp)execute_533, (funcp)execute_568, (funcp)execute_603, (funcp)execute_642, (funcp)execute_677, (funcp)execute_712, (funcp)execute_747, (funcp)execute_751, (funcp)execute_754, (funcp)execute_764, (funcp)execute_767, (funcp)execute_773, (funcp)execute_774, (funcp)execute_775, (funcp)execute_798, (funcp)execute_800, (funcp)execute_804, (funcp)execute_805, (funcp)execute_806, (funcp)execute_824, (funcp)execute_825, (funcp)execute_826, (funcp)execute_827, (funcp)execute_828, (funcp)execute_829, (funcp)execute_830, (funcp)execute_1085, (funcp)vhdl_transfunc_eventcallback, (funcp)transaction_34, (funcp)transaction_36, (funcp)transaction_54, (funcp)transaction_55, (funcp)transaction_56, (funcp)transaction_57, (funcp)transaction_126, (funcp)transaction_133, (funcp)transaction_140, (funcp)transaction_147, (funcp)transaction_154, (funcp)transaction_161, (funcp)transaction_168, (funcp)transaction_175, (funcp)transaction_182, (funcp)transaction_189, (funcp)transaction_196, (funcp)transaction_203, (funcp)transaction_210, (funcp)transaction_217, (funcp)transaction_224, (funcp)transaction_231, (funcp)transaction_252, (funcp)transaction_259, (funcp)transaction_266, (funcp)transaction_275, (funcp)transaction_297, (funcp)transaction_304, (funcp)transaction_311, (funcp)transaction_320, (funcp)transaction_342, (funcp)transaction_349, (funcp)transaction_356, (funcp)transaction_365, (funcp)transaction_388, (funcp)transaction_395, (funcp)transaction_402, (funcp)transaction_416, (funcp)transaction_438, (funcp)transaction_445, (funcp)transaction_452, (funcp)transaction_461, (funcp)transaction_483, (funcp)transaction_490, (funcp)transaction_497, (funcp)transaction_506, (funcp)transaction_528, (funcp)transaction_535, (funcp)transaction_542, (funcp)transaction_551, (funcp)transaction_574, (funcp)transaction_581, (funcp)transaction_588, (funcp)transaction_600, (funcp)transaction_622, (funcp)transaction_629, (funcp)transaction_636, (funcp)transaction_645, (funcp)transaction_667, (funcp)transaction_674, (funcp)transaction_681, (funcp)transaction_690, (funcp)transaction_712, (funcp)transaction_719, (funcp)transaction_726, (funcp)transaction_735, (funcp)transaction_757, (funcp)transaction_764, (funcp)transaction_771, (funcp)transaction_780, (funcp)transaction_804, (funcp)transaction_811, (funcp)transaction_818, (funcp)transaction_832, (funcp)transaction_854, (funcp)transaction_861, (funcp)transaction_868, (funcp)transaction_877, (funcp)transaction_899, (funcp)transaction_906, (funcp)transaction_913, (funcp)transaction_922, (funcp)transaction_944, (funcp)transaction_951, (funcp)transaction_958, (funcp)transaction_967, (funcp)transaction_989, (funcp)transaction_996, (funcp)transaction_1003, (funcp)transaction_1010, (funcp)transaction_1127, (funcp)transaction_1135, (funcp)transaction_1143, (funcp)transaction_1151, (funcp)transaction_1159, (funcp)transaction_1166, (funcp)transaction_1173, (funcp)transaction_1180, (funcp)transaction_1187, (funcp)transaction_1194, (funcp)transaction_1202, (funcp)transaction_1209, (funcp)transaction_1216, (funcp)transaction_1223, (funcp)transaction_1230, (funcp)transaction_1237, (funcp)transaction_1244, (funcp)transaction_1251, (funcp)transaction_1258, (funcp)transaction_1265, (funcp)transaction_1272, (funcp)transaction_1279, (funcp)transaction_1286, (funcp)transaction_1293, (funcp)transaction_1300, (funcp)transaction_1307, (funcp)transaction_1314, (funcp)transaction_1321, (funcp)transaction_1328, (funcp)transaction_1335, (funcp)transaction_1342, (funcp)transaction_1349, (funcp)transaction_1356, (funcp)transaction_1363, (funcp)transaction_1370, (funcp)transaction_1377, (funcp)transaction_1384, (funcp)transaction_1391, (funcp)transaction_1398, (funcp)transaction_1405, (funcp)transaction_1412, (funcp)transaction_1419, (funcp)transaction_1426, (funcp)transaction_1434, (funcp)transaction_1442, (funcp)transaction_1450, (funcp)transaction_1458, (funcp)transaction_1466, (funcp)transaction_1474, (funcp)transaction_1482, (funcp)transaction_1490, (funcp)transaction_1498, (funcp)transaction_1506, (funcp)transaction_1514, (funcp)transaction_1522, (funcp)transaction_1530, (funcp)transaction_1538, (funcp)transaction_1546};
const int NumRelocateId= 204;

void relocate(char *dp)
{
	iki_relocate(dp, "xsim.dir/sample_control_TOP_func_synth/xsim.reloc",  (void **)funcTab, 204);
	iki_vhdl_file_variable_register(dp + 340608);
	iki_vhdl_file_variable_register(dp + 340664);


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
