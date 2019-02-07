//
// auto-generated by ops.py
//

#ifdef OCL_FMA
#pragma OPENCL FP_CONTRACT ON
#else
#pragma OPENCL FP_CONTRACT OFF
#endif
#pragma OPENCL EXTENSION cl_khr_fp64 : enable

#include "ops_opencl_reduction.h"
#include "user_types.h"

#ifndef MIN
#define MIN(a, b) ((a < b) ? (a) : (b))
#endif
#ifndef MAX
#define MAX(a, b) ((a > b) ? (a) : (b))
#endif
#ifndef SIGN
#define SIGN(a, b) ((b < 0.0) ? (a * (-1)) : (a))
#endif
#define OPS_READ 0
#define OPS_WRITE 1
#define OPS_RW 2
#define OPS_INC 3
#define OPS_MIN 4
#define OPS_MAX 5
#define ZERO_double 0.0;
#define INFINITY_double INFINITY;
#define ZERO_float 0.0f;
#define INFINITY_float INFINITY;
#define ZERO_int 0;
#define INFINITY_int INFINITY;
#define ZERO_uint 0;
#define INFINITY_uint INFINITY;
#define ZERO_ll 0;
#define INFINITY_ll INFINITY;
#define ZERO_ull 0;
#define INFINITY_ull INFINITY;
#define ZERO_bool 0;

#undef OPS_ACC0
#undef OPS_ACC1

#define OPS_ACC0(x, y) (x + xdim0_tea_leaf_dot_kernel * (y))
#define OPS_ACC1(x, y) (x + xdim1_tea_leaf_dot_kernel * (y))

// user function
void tea_leaf_dot_kernel(const __global double *restrict r,
                         const __global double *restrict p,
                         double *restrict rro)

{
  *rro = *rro + r[OPS_ACC0(0, 0)] * p[OPS_ACC1(0, 0)];
}

__kernel void ops_tea_leaf_dot_kernel(__global const double *restrict arg0,
                                      __global const double *restrict arg1,
                                      __global double *restrict arg2,
                                      __local double *scratch2, int r_bytes2,
                                      const int base0, const int base1,
                                      const int size0, const int size1) {

  arg2 += r_bytes2;
  double arg2_l[1];
  for (int d = 0; d < 1; d++)
    arg2_l[d] = ZERO_double;

  int idx_y = get_global_id(1);
  int idx_x = get_global_id(0);

  if (idx_x < size0 && idx_y < size1) {
    tea_leaf_dot_kernel(&arg0[base0 + idx_x * 1 * 1 +
                              idx_y * 1 * 1 * xdim0_tea_leaf_dot_kernel],
                        &arg1[base1 + idx_x * 1 * 1 +
                              idx_y * 1 * 1 * xdim1_tea_leaf_dot_kernel],
                        arg2_l);
  }
  int group_index = get_group_id(0) + get_group_id(1) * get_num_groups(0) +
                    get_group_id(2) * get_num_groups(0) * get_num_groups(1);
  for (int d = 0; d < 1; d++)
    reduce_double(arg2_l[d], scratch2, &arg2[group_index * 1 + d], OPS_INC);
}
