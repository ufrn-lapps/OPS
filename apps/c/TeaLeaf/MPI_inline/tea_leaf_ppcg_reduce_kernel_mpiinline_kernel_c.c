//
// auto-generated by ops.py
//

int xdim0_tea_leaf_ppcg_reduce_kernel;
int xdim1_tea_leaf_ppcg_reduce_kernel;
int xdim2_tea_leaf_ppcg_reduce_kernel;


//user function

void tea_leaf_ppcg_reduce_kernel_c_wrapper(double *restrict rstore_p,
                                           double *restrict r_p,
                                           double *restrict z_p,
                                           double *restrict rnn_g, int x_size,
                                           int y_size) {
  double rnn_0 = rnn_g[0];
  #pragma omp parallel for reduction(+:rnn_0)
  for ( int n_y=0; n_y<y_size; n_y++ ){
    for ( int n_x=0; n_x<x_size; n_x++ ){
      double rnn[1];
      rnn[0] = ZERO_double;
      const ptr_double rstore = {
          rstore_p + n_x * 1 + n_y * xdim0_tea_leaf_ppcg_reduce_kernel * 1,
          xdim0_tea_leaf_ppcg_reduce_kernel};
      const ptr_double r = {r_p + n_x * 1 +
                                n_y * xdim1_tea_leaf_ppcg_reduce_kernel * 1,
                            xdim1_tea_leaf_ppcg_reduce_kernel};
      const ptr_double z = {z_p + n_x * 1 +
                                n_y * xdim2_tea_leaf_ppcg_reduce_kernel * 1,
                            xdim2_tea_leaf_ppcg_reduce_kernel};

      *rnn =
          *rnn + (OPS_ACC(r, 0, 0) - OPS_ACC(rstore, 0, 0)) * OPS_ACC(z, 0, 0);

      rnn_0 +=rnn[0];
    }
  }
  rnn_g[0] = rnn_0;
}
