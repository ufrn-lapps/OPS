//
// auto-generated by ops.py
//

#define OPS_GPU

int xdim0_fact_kernel;
int xdim1_fact_kernel;

//user function
inline void fact_kernel(const ptrm_double eff, ptrm_double s) {
  double fact;
  for (int m=0; m < 3 ;m++) {
    fact  = 0.50 * dt / dx ;
    OPS_ACC(s, m, 0) = -fact * (OPS_ACC(eff, m, 0) - OPS_ACC(eff, m, -1));
  }
}


void fact_kernel_c_wrapper(
  double *p_a0,
  double *p_a1,
  int x_size) {
  #ifdef OPS_GPU
  #pragma acc parallel deviceptr(p_a0,p_a1)
  #pragma acc loop
  #endif
  for ( int n_x=0; n_x<x_size; n_x++ ){
#ifdef OPS_SOA
    const ptrm_double ptr0 = {p_a0 + n_x * 1 * 3, xdim0_fact_kernel};
#else
    const ptrm_double ptr0 = {p_a0 + n_x * 1 * 3, 3};
#endif
#ifdef OPS_SOA
    ptrm_double ptr1 = {p_a1 + n_x * 1 * 3, xdim1_fact_kernel};
#else
    ptrm_double ptr1 = {p_a1 + n_x * 1 * 3, 3};
#endif
    fact_kernel(ptr0, ptr1);
  }
}
