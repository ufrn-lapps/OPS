//
// auto-generated by ops.py
//

int xdim0_tea_leaf_recip3_kernel;
int xdim1_tea_leaf_recip3_kernel;


//user function

void tea_leaf_recip3_kernel_c_wrapper(double *restrict z_p,
                                      double *restrict x_p,
                                      const double *restrict theta, int x_size,
                                      int y_size) {
#pragma omp parallel for
  for ( int n_y=0; n_y<y_size; n_y++ ){
    for ( int n_x=0; n_x<x_size; n_x++ ){
      ptr_double z = {z_p + n_x * 1 + n_y * xdim0_tea_leaf_recip3_kernel * 1,
                      xdim0_tea_leaf_recip3_kernel};
      const ptr_double x = {x_p + n_x * 1 +
                                n_y * xdim1_tea_leaf_recip3_kernel * 1,
                            xdim1_tea_leaf_recip3_kernel};

      OPS_ACC(z, 0, 0) = OPS_ACC(x, 0, 0) / (*theta);
    }
  }
}
