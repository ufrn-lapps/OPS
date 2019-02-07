//
// auto-generated by ops.py
//

#define OPS_GPU

int xdim0_tea_leaf_dot_kernel;
int xdim1_tea_leaf_dot_kernel;

#undef OPS_ACC0
#undef OPS_ACC1

#define OPS_ACC0(x, y) (x + xdim0_tea_leaf_dot_kernel * (y))
#define OPS_ACC1(x, y) (x + xdim1_tea_leaf_dot_kernel * (y))

// user function
inline void tea_leaf_dot_kernel(const double *r, const double *p, double *rro) {
  *rro = *rro + r[OPS_ACC0(0, 0)] * p[OPS_ACC1(0, 0)];
}

#undef OPS_ACC0
#undef OPS_ACC1

void tea_leaf_dot_kernel_c_wrapper(double *p_a0, double *p_a1, double *p_a2,
                                   int x_size, int y_size) {
  double p_a2_0 = p_a2[0];
#ifdef OPS_GPU
#pragma acc parallel deviceptr(p_a0, p_a1) reduction(+ : p_a2_0)
#pragma acc loop reduction(+ : p_a2_0)
#endif
  for (int n_y = 0; n_y < y_size; n_y++) {
#ifdef OPS_GPU
#pragma acc loop reduction(+ : p_a2_0)
#endif
    for (int n_x = 0; n_x < x_size; n_x++) {
      tea_leaf_dot_kernel(
          p_a0 + n_x * 1 * 1 + n_y * xdim0_tea_leaf_dot_kernel * 1 * 1,
          p_a1 + n_x * 1 * 1 + n_y * xdim1_tea_leaf_dot_kernel * 1 * 1,
          &p_a2_0);
    }
  }
  p_a2[0] = p_a2_0;
}
