//
// auto-generated by ops.py
//

#define OPS_GPU

int xdim0_tea_leaf_axpby_kernel;
int xdim1_tea_leaf_axpby_kernel;

//user function
inline void tea_leaf_axpby_kernel(ptr_double u, const ptr_double p,
                                  const double *alpha, const double *beta) {
  OPS_ACC(u, 0, 0) = (*alpha) * OPS_ACC(u, 0, 0) + (*beta) * OPS_ACC(p, 0, 0);
}


void tea_leaf_axpby_kernel_c_wrapper(
  double *p_a0,
  double *p_a1,
  double p_a2,
  double p_a3,
  int x_size, int y_size) {
  #ifdef OPS_GPU
  #pragma acc parallel deviceptr(p_a0,p_a1)
  #pragma acc loop
  #endif
  for ( int n_y=0; n_y<y_size; n_y++ ){
    #ifdef OPS_GPU
    #pragma acc loop
    #endif
    for ( int n_x=0; n_x<x_size; n_x++ ){
      ptr_double ptr0 = {p_a0 + n_x * 1 * 1 +
                             n_y * xdim0_tea_leaf_axpby_kernel * 1 * 1,
                         xdim0_tea_leaf_axpby_kernel};
      const ptr_double ptr1 = {p_a1 + n_x * 1 * 1 +
                                   n_y * xdim1_tea_leaf_axpby_kernel * 1 * 1,
                               xdim1_tea_leaf_axpby_kernel};
      tea_leaf_axpby_kernel(ptr0, ptr1, &p_a2, &p_a3);
    }
  }
}
