//
// auto-generated by ops.py
//

#define OPS_GPU

int xdim0_tea_leaf_init_zero2_kernel;
int xdim1_tea_leaf_init_zero2_kernel;

//user function
inline void tea_leaf_init_zero2_kernel(ptr_double p, ptr_double z) {
  OPS_ACC(p, 0, 0) = 0.0;
  OPS_ACC(z, 0, 0) = 0.0;
}


void tea_leaf_init_zero2_kernel_c_wrapper(
  double *p_a0,
  double *p_a1,
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
                             n_y * xdim0_tea_leaf_init_zero2_kernel * 1 * 1,
                         xdim0_tea_leaf_init_zero2_kernel};
      ptr_double ptr1 = {p_a1 + n_x * 1 * 1 +
                             n_y * xdim1_tea_leaf_init_zero2_kernel * 1 * 1,
                         xdim1_tea_leaf_init_zero2_kernel};
      tea_leaf_init_zero2_kernel(ptr0, ptr1);
    }
  }
}
