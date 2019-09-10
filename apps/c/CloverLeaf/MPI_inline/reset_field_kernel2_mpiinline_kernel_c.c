//
// auto-generated by ops.py
//

int xdim0_reset_field_kernel2;
int xdim1_reset_field_kernel2;
int xdim2_reset_field_kernel2;
int xdim3_reset_field_kernel2;


//user function



void reset_field_kernel2_c_wrapper(
  double * restrict xvel0_p,
  double * restrict xvel1_p,
  double * restrict yvel0_p,
  double * restrict yvel1_p,
  int x_size, int y_size) {
  #pragma omp parallel for
  for ( int n_y=0; n_y<y_size; n_y++ ){
    for ( int n_x=0; n_x<x_size; n_x++ ){
      ptr_double xvel0 = { xvel0_p + n_x*1 + n_y * xdim0_reset_field_kernel2*1, xdim0_reset_field_kernel2};
      const ptr_double xvel1 = { xvel1_p + n_x*1 + n_y * xdim1_reset_field_kernel2*1, xdim1_reset_field_kernel2};
      ptr_double yvel0 = { yvel0_p + n_x*1 + n_y * xdim2_reset_field_kernel2*1, xdim2_reset_field_kernel2};
      const ptr_double yvel1 = { yvel1_p + n_x*1 + n_y * xdim3_reset_field_kernel2*1, xdim3_reset_field_kernel2};

      OPS_ACC(xvel0, 0, 0) = OPS_ACC(xvel1, 0, 0);
      OPS_ACC(yvel0, 0, 0) = OPS_ACC(yvel1, 0, 0);
    }
  }
}
