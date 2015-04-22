//
// auto-generated by ops.py//

//header
#define OPS_ACC_MD_MACROS
#include "ops_lib_cpp.h"
#ifdef OPS_MPI
#include "ops_mpi_core.h"
#endif

//set max number of OMP threads for reductions
#ifndef MAX_REDUCT_THREADS
#define MAX_REDUCT_THREADS 64
#endif
//global constants
extern int nxp;
extern int nyp;
extern int xhalo;
extern double xmin;
extern double xmax;
extern double dx;
extern double pl;
extern double pr;
extern double rhol;
extern double rhor;
extern double ul;
extern double ur;
extern double gam;
extern double gam1;
extern double eps;
extern double lambda;
extern double dt;
extern double del2;
extern double akap2;
extern double tvdsmu;
extern double con;
extern double Mach;
extern double xt;
extern int scale;

//user kernel files
#include "gridgen_kernel_omp_kernel.cpp"
#include "init_kernel_omp_kernel.cpp"
#include "save_kernel_omp_kernel.cpp"
#include "calvar_kernel_omp_kernel.cpp"
#include "xder1_kernel_omp_kernel.cpp"
#include "residue_eval_omp_kernel.cpp"
#include "updateRK3_kernel_omp_kernel.cpp"
#include "Riemann_kernel_omp_kernel.cpp"
#include "limiter_kernel_omp_kernel.cpp"
#include "tvd_kernel_omp_kernel.cpp"
#include "vars_kernel_omp_kernel.cpp"
#include "calupwindeff_kernel_omp_kernel.cpp"
#include "fact_kernel_omp_kernel.cpp"
#include "update_kernel_omp_kernel.cpp"
#include "checkop_kernel_omp_kernel.cpp"
