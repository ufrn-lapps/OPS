//
// auto-generated by ops.py
//
#include "./OpenACC/shsgc_common.h"

#define OPS_GPU

int xdim0_test_kernel;

#define OPS_ACC0(x) (x)

//user function
inline
void test_kernel(const double *rho_new, double *rms) {

  rms[0] = rms[0] + pow (rho_new[OPS_ACC0(0)], 2.0);
}


#undef OPS_ACC0



void test_kernel_c_wrapper(
  double *p_a0,
  double *p_a1,
  int x_size) {
  double p_a1_0 = p_a1[0];
  #ifdef OPS_GPU
  #pragma acc parallel deviceptr(p_a0) reduction(+:p_a1_0)
  #pragma acc loop reduction(+:p_a1_0)
  #endif
  for ( int n_x=0; n_x<x_size; n_x++ ){
    test_kernel(  p_a0 + n_x*1*1,
           &p_a1_0 );

  }
  p_a1[0] = p_a1_0;
}
