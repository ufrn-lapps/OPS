//
// auto-generated by ops.py
//

int xdim0_initialise_chunk_kernel_zero;

#define OPS_ACC0(x, y)                                                         \
  (n_x * 1 + n_y * xdim0_initialise_chunk_kernel_zero * 1 + x +                \
   xdim0_initialise_chunk_kernel_zero * (y))

// user function

void initialise_chunk_kernel_zero_c_wrapper(double *restrict var, int x_size,
                                            int y_size) {
#pragma omp parallel for
  for (int n_y = 0; n_y < y_size; n_y++) {
    for (int n_x = 0; n_x < x_size; n_x++) {

      *var = 0.0;
    }
  }
}
#undef OPS_ACC0
