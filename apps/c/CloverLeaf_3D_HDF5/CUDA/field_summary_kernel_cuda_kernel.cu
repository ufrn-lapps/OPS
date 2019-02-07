//
// auto-generated by ops.py
//
__constant__ int xdim0_field_summary_kernel;
int xdim0_field_summary_kernel_h = -1;
__constant__ int ydim0_field_summary_kernel;
int ydim0_field_summary_kernel_h = -1;
__constant__ int xdim1_field_summary_kernel;
int xdim1_field_summary_kernel_h = -1;
__constant__ int ydim1_field_summary_kernel;
int ydim1_field_summary_kernel_h = -1;
__constant__ int xdim2_field_summary_kernel;
int xdim2_field_summary_kernel_h = -1;
__constant__ int ydim2_field_summary_kernel;
int ydim2_field_summary_kernel_h = -1;
__constant__ int xdim3_field_summary_kernel;
int xdim3_field_summary_kernel_h = -1;
__constant__ int ydim3_field_summary_kernel;
int ydim3_field_summary_kernel_h = -1;
__constant__ int xdim4_field_summary_kernel;
int xdim4_field_summary_kernel_h = -1;
__constant__ int ydim4_field_summary_kernel;
int ydim4_field_summary_kernel_h = -1;
__constant__ int xdim5_field_summary_kernel;
int xdim5_field_summary_kernel_h = -1;
__constant__ int ydim5_field_summary_kernel;
int ydim5_field_summary_kernel_h = -1;
__constant__ int xdim6_field_summary_kernel;
int xdim6_field_summary_kernel_h = -1;
__constant__ int ydim6_field_summary_kernel;
int ydim6_field_summary_kernel_h = -1;

#undef OPS_ACC0
#undef OPS_ACC1
#undef OPS_ACC2
#undef OPS_ACC3
#undef OPS_ACC4
#undef OPS_ACC5
#undef OPS_ACC6

#define OPS_ACC0(x, y, z)                                                      \
  (x + xdim0_field_summary_kernel * (y) +                                      \
   xdim0_field_summary_kernel * ydim0_field_summary_kernel * (z))
#define OPS_ACC1(x, y, z)                                                      \
  (x + xdim1_field_summary_kernel * (y) +                                      \
   xdim1_field_summary_kernel * ydim1_field_summary_kernel * (z))
#define OPS_ACC2(x, y, z)                                                      \
  (x + xdim2_field_summary_kernel * (y) +                                      \
   xdim2_field_summary_kernel * ydim2_field_summary_kernel * (z))
#define OPS_ACC3(x, y, z)                                                      \
  (x + xdim3_field_summary_kernel * (y) +                                      \
   xdim3_field_summary_kernel * ydim3_field_summary_kernel * (z))
#define OPS_ACC4(x, y, z)                                                      \
  (x + xdim4_field_summary_kernel * (y) +                                      \
   xdim4_field_summary_kernel * ydim4_field_summary_kernel * (z))
#define OPS_ACC5(x, y, z)                                                      \
  (x + xdim5_field_summary_kernel * (y) +                                      \
   xdim5_field_summary_kernel * ydim5_field_summary_kernel * (z))
#define OPS_ACC6(x, y, z)                                                      \
  (x + xdim6_field_summary_kernel * (y) +                                      \
   xdim6_field_summary_kernel * ydim6_field_summary_kernel * (z))

// user function
__device__

    void
    field_summary_kernel_gpu(const double *volume, const double *density0,
                             const double *energy0, const double *pressure,
                             const double *xvel0, const double *yvel0,
                             const double *zvel0, double *vol, double *mass,
                             double *ie, double *ke, double *press) {

  double vsqrd, cell_vol, cell_mass;

  vsqrd = 0.0;
  vsqrd += 0.125 * (xvel0[OPS_ACC4(0, 0, 0)] * xvel0[OPS_ACC4(0, 0, 0)] +
                    yvel0[OPS_ACC5(0, 0, 0)] * yvel0[OPS_ACC5(0, 0, 0)] +
                    zvel0[OPS_ACC6(0, 0, 0)] * zvel0[OPS_ACC6(0, 0, 0)]);
  vsqrd += 0.125 * (xvel0[OPS_ACC4(1, 0, 0)] * xvel0[OPS_ACC4(1, 0, 0)] +
                    yvel0[OPS_ACC5(1, 0, 0)] * yvel0[OPS_ACC5(1, 0, 0)] +
                    zvel0[OPS_ACC6(1, 0, 0)] * zvel0[OPS_ACC6(1, 0, 0)]);
  vsqrd += 0.125 * (xvel0[OPS_ACC4(0, 1, 0)] * xvel0[OPS_ACC4(0, 1, 0)] +
                    yvel0[OPS_ACC5(0, 1, 0)] * yvel0[OPS_ACC5(0, 1, 0)] +
                    zvel0[OPS_ACC6(0, 1, 0)] * zvel0[OPS_ACC6(0, 1, 0)]);
  vsqrd += 0.125 * (xvel0[OPS_ACC4(1, 1, 0)] * xvel0[OPS_ACC4(1, 1, 0)] +
                    yvel0[OPS_ACC5(1, 1, 0)] * yvel0[OPS_ACC5(1, 1, 0)] +
                    zvel0[OPS_ACC6(1, 1, 0)] * zvel0[OPS_ACC6(1, 1, 0)]);
  vsqrd += 0.125 * (xvel0[OPS_ACC4(0, 0, 1)] * xvel0[OPS_ACC4(0, 0, 1)] +
                    yvel0[OPS_ACC5(0, 0, 1)] * yvel0[OPS_ACC5(0, 0, 1)] +
                    zvel0[OPS_ACC6(0, 0, 1)] * zvel0[OPS_ACC6(0, 0, 1)]);
  vsqrd += 0.125 * (xvel0[OPS_ACC4(1, 0, 1)] * xvel0[OPS_ACC4(1, 0, 1)] +
                    yvel0[OPS_ACC5(1, 0, 1)] * yvel0[OPS_ACC5(1, 0, 1)] +
                    zvel0[OPS_ACC6(1, 0, 1)] * zvel0[OPS_ACC6(1, 0, 1)]);
  vsqrd += 0.125 * (xvel0[OPS_ACC4(0, 1, 1)] * xvel0[OPS_ACC4(0, 1, 1)] +
                    yvel0[OPS_ACC5(0, 1, 1)] * yvel0[OPS_ACC5(0, 1, 1)] +
                    zvel0[OPS_ACC6(0, 1, 1)] * zvel0[OPS_ACC6(0, 1, 1)]);
  vsqrd += 0.125 * (xvel0[OPS_ACC4(1, 1, 1)] * xvel0[OPS_ACC4(1, 1, 1)] +
                    yvel0[OPS_ACC5(1, 1, 1)] * yvel0[OPS_ACC5(1, 1, 1)] +
                    zvel0[OPS_ACC6(1, 1, 1)] * zvel0[OPS_ACC6(1, 1, 1)]);

  cell_vol = volume[OPS_ACC0(0, 0, 0)];
  cell_mass = cell_vol * density0[OPS_ACC1(0, 0, 0)];
  *vol = *vol + cell_vol;
  *mass = *mass + cell_mass;
  *ie = *ie + cell_mass * energy0[OPS_ACC2(0, 0, 0)];
  *ke = *ke + cell_mass * 0.5 * vsqrd;
  *press = *press + cell_vol * pressure[OPS_ACC3(0, 0, 0)];
}

#undef OPS_ACC0
#undef OPS_ACC1
#undef OPS_ACC2
#undef OPS_ACC3
#undef OPS_ACC4
#undef OPS_ACC5
#undef OPS_ACC6

__global__ void ops_field_summary_kernel(
    const double *__restrict arg0, const double *__restrict arg1,
    const double *__restrict arg2, const double *__restrict arg3,
    const double *__restrict arg4, const double *__restrict arg5,
    const double *__restrict arg6, double *__restrict arg7,
    double *__restrict arg8, double *__restrict arg9, double *__restrict arg10,
    double *__restrict arg11, int size0, int size1, int size2) {

  double arg7_l[1];
  double arg8_l[1];
  double arg9_l[1];
  double arg10_l[1];
  double arg11_l[1];
  for (int d = 0; d < 1; d++)
    arg7_l[d] = ZERO_double;
  for (int d = 0; d < 1; d++)
    arg8_l[d] = ZERO_double;
  for (int d = 0; d < 1; d++)
    arg9_l[d] = ZERO_double;
  for (int d = 0; d < 1; d++)
    arg10_l[d] = ZERO_double;
  for (int d = 0; d < 1; d++)
    arg11_l[d] = ZERO_double;

  int idx_z = blockDim.z * blockIdx.z + threadIdx.z;
  int idx_y = blockDim.y * blockIdx.y + threadIdx.y;
  int idx_x = blockDim.x * blockIdx.x + threadIdx.x;

  arg0 +=
      idx_x * 1 * 1 + idx_y * 1 * 1 * xdim0_field_summary_kernel +
      idx_z * 1 * 1 * xdim0_field_summary_kernel * ydim0_field_summary_kernel;
  arg1 +=
      idx_x * 1 * 1 + idx_y * 1 * 1 * xdim1_field_summary_kernel +
      idx_z * 1 * 1 * xdim1_field_summary_kernel * ydim1_field_summary_kernel;
  arg2 +=
      idx_x * 1 * 1 + idx_y * 1 * 1 * xdim2_field_summary_kernel +
      idx_z * 1 * 1 * xdim2_field_summary_kernel * ydim2_field_summary_kernel;
  arg3 +=
      idx_x * 1 * 1 + idx_y * 1 * 1 * xdim3_field_summary_kernel +
      idx_z * 1 * 1 * xdim3_field_summary_kernel * ydim3_field_summary_kernel;
  arg4 +=
      idx_x * 1 * 1 + idx_y * 1 * 1 * xdim4_field_summary_kernel +
      idx_z * 1 * 1 * xdim4_field_summary_kernel * ydim4_field_summary_kernel;
  arg5 +=
      idx_x * 1 * 1 + idx_y * 1 * 1 * xdim5_field_summary_kernel +
      idx_z * 1 * 1 * xdim5_field_summary_kernel * ydim5_field_summary_kernel;
  arg6 +=
      idx_x * 1 * 1 + idx_y * 1 * 1 * xdim6_field_summary_kernel +
      idx_z * 1 * 1 * xdim6_field_summary_kernel * ydim6_field_summary_kernel;

  if (idx_x < size0 && idx_y < size1 && idx_z < size2) {
    field_summary_kernel_gpu(arg0, arg1, arg2, arg3, arg4, arg5, arg6, arg7_l,
                             arg8_l, arg9_l, arg10_l, arg11_l);
  }
  for (int d = 0; d < 1; d++)
    ops_reduction_cuda<OPS_INC>(&arg7[d +
                                      (blockIdx.x + blockIdx.y * gridDim.x +
                                       blockIdx.z * gridDim.x * gridDim.y) *
                                          1],
                                arg7_l[d]);
  for (int d = 0; d < 1; d++)
    ops_reduction_cuda<OPS_INC>(&arg8[d +
                                      (blockIdx.x + blockIdx.y * gridDim.x +
                                       blockIdx.z * gridDim.x * gridDim.y) *
                                          1],
                                arg8_l[d]);
  for (int d = 0; d < 1; d++)
    ops_reduction_cuda<OPS_INC>(&arg9[d +
                                      (blockIdx.x + blockIdx.y * gridDim.x +
                                       blockIdx.z * gridDim.x * gridDim.y) *
                                          1],
                                arg9_l[d]);
  for (int d = 0; d < 1; d++)
    ops_reduction_cuda<OPS_INC>(&arg10[d +
                                       (blockIdx.x + blockIdx.y * gridDim.x +
                                        blockIdx.z * gridDim.x * gridDim.y) *
                                           1],
                                arg10_l[d]);
  for (int d = 0; d < 1; d++)
    ops_reduction_cuda<OPS_INC>(&arg11[d +
                                       (blockIdx.x + blockIdx.y * gridDim.x +
                                        blockIdx.z * gridDim.x * gridDim.y) *
                                           1],
                                arg11_l[d]);
}

// host stub function
#ifndef OPS_LAZY
void ops_par_loop_field_summary_kernel(char const *name, ops_block block,
                                       int dim, int *range, ops_arg arg0,
                                       ops_arg arg1, ops_arg arg2, ops_arg arg3,
                                       ops_arg arg4, ops_arg arg5, ops_arg arg6,
                                       ops_arg arg7, ops_arg arg8, ops_arg arg9,
                                       ops_arg arg10, ops_arg arg11) {
#else
void ops_par_loop_field_summary_kernel_execute(ops_kernel_descriptor *desc) {
  int dim = desc->dim;
  int *range = desc->range;
  ops_arg arg0 = desc->args[0];
  ops_arg arg1 = desc->args[1];
  ops_arg arg2 = desc->args[2];
  ops_arg arg3 = desc->args[3];
  ops_arg arg4 = desc->args[4];
  ops_arg arg5 = desc->args[5];
  ops_arg arg6 = desc->args[6];
  ops_arg arg7 = desc->args[7];
  ops_arg arg8 = desc->args[8];
  ops_arg arg9 = desc->args[9];
  ops_arg arg10 = desc->args[10];
  ops_arg arg11 = desc->args[11];
#endif

  // Timing
  double t1, t2, c1, c2;

  ops_arg args[12] = {arg0, arg1, arg2, arg3, arg4,  arg5,
                      arg6, arg7, arg8, arg9, arg10, arg11};

#if CHECKPOINTING && !OPS_LAZY
  if (!ops_checkpointing_before(args, 12, range, 95))
    return;
#endif

  if (OPS_diags > 1) {
    ops_timing_realloc(95, "field_summary_kernel");
    OPS_kernels[95].count++;
    ops_timers_core(&c1, &t1);
  }

  // compute locally allocated range for the sub-block
  int start[3];
  int end[3];
#if OPS_MPI && !OPS_LAZY
  sub_block_list sb = OPS_sub_block_list[block->index];
  if (!sb->owned)
    return;
  for (int n = 0; n < 3; n++) {
    start[n] = sb->decomp_disp[n];
    end[n] = sb->decomp_disp[n] + sb->decomp_size[n];
    if (start[n] >= range[2 * n]) {
      start[n] = 0;
    } else {
      start[n] = range[2 * n] - start[n];
    }
    if (sb->id_m[n] == MPI_PROC_NULL && range[2 * n] < 0)
      start[n] = range[2 * n];
    if (end[n] >= range[2 * n + 1]) {
      end[n] = range[2 * n + 1] - sb->decomp_disp[n];
    } else {
      end[n] = sb->decomp_size[n];
    }
    if (sb->id_p[n] == MPI_PROC_NULL &&
        (range[2 * n + 1] > sb->decomp_disp[n] + sb->decomp_size[n]))
      end[n] += (range[2 * n + 1] - sb->decomp_disp[n] - sb->decomp_size[n]);
  }
#else
  for (int n = 0; n < 3; n++) {
    start[n] = range[2 * n];
    end[n] = range[2 * n + 1];
  }
#endif

  int x_size = MAX(0, end[0] - start[0]);
  int y_size = MAX(0, end[1] - start[1]);
  int z_size = MAX(0, end[2] - start[2]);

  int xdim0 = args[0].dat->size[0];
  int ydim0 = args[0].dat->size[1];
  int xdim1 = args[1].dat->size[0];
  int ydim1 = args[1].dat->size[1];
  int xdim2 = args[2].dat->size[0];
  int ydim2 = args[2].dat->size[1];
  int xdim3 = args[3].dat->size[0];
  int ydim3 = args[3].dat->size[1];
  int xdim4 = args[4].dat->size[0];
  int ydim4 = args[4].dat->size[1];
  int xdim5 = args[5].dat->size[0];
  int ydim5 = args[5].dat->size[1];
  int xdim6 = args[6].dat->size[0];
  int ydim6 = args[6].dat->size[1];

  if (xdim0 != xdim0_field_summary_kernel_h ||
      ydim0 != ydim0_field_summary_kernel_h ||
      xdim1 != xdim1_field_summary_kernel_h ||
      ydim1 != ydim1_field_summary_kernel_h ||
      xdim2 != xdim2_field_summary_kernel_h ||
      ydim2 != ydim2_field_summary_kernel_h ||
      xdim3 != xdim3_field_summary_kernel_h ||
      ydim3 != ydim3_field_summary_kernel_h ||
      xdim4 != xdim4_field_summary_kernel_h ||
      ydim4 != ydim4_field_summary_kernel_h ||
      xdim5 != xdim5_field_summary_kernel_h ||
      ydim5 != ydim5_field_summary_kernel_h ||
      xdim6 != xdim6_field_summary_kernel_h ||
      ydim6 != ydim6_field_summary_kernel_h) {
    cudaMemcpyToSymbol(xdim0_field_summary_kernel, &xdim0, sizeof(int));
    xdim0_field_summary_kernel_h = xdim0;
    cudaMemcpyToSymbol(ydim0_field_summary_kernel, &ydim0, sizeof(int));
    ydim0_field_summary_kernel_h = ydim0;
    cudaMemcpyToSymbol(xdim1_field_summary_kernel, &xdim1, sizeof(int));
    xdim1_field_summary_kernel_h = xdim1;
    cudaMemcpyToSymbol(ydim1_field_summary_kernel, &ydim1, sizeof(int));
    ydim1_field_summary_kernel_h = ydim1;
    cudaMemcpyToSymbol(xdim2_field_summary_kernel, &xdim2, sizeof(int));
    xdim2_field_summary_kernel_h = xdim2;
    cudaMemcpyToSymbol(ydim2_field_summary_kernel, &ydim2, sizeof(int));
    ydim2_field_summary_kernel_h = ydim2;
    cudaMemcpyToSymbol(xdim3_field_summary_kernel, &xdim3, sizeof(int));
    xdim3_field_summary_kernel_h = xdim3;
    cudaMemcpyToSymbol(ydim3_field_summary_kernel, &ydim3, sizeof(int));
    ydim3_field_summary_kernel_h = ydim3;
    cudaMemcpyToSymbol(xdim4_field_summary_kernel, &xdim4, sizeof(int));
    xdim4_field_summary_kernel_h = xdim4;
    cudaMemcpyToSymbol(ydim4_field_summary_kernel, &ydim4, sizeof(int));
    ydim4_field_summary_kernel_h = ydim4;
    cudaMemcpyToSymbol(xdim5_field_summary_kernel, &xdim5, sizeof(int));
    xdim5_field_summary_kernel_h = xdim5;
    cudaMemcpyToSymbol(ydim5_field_summary_kernel, &ydim5, sizeof(int));
    ydim5_field_summary_kernel_h = ydim5;
    cudaMemcpyToSymbol(xdim6_field_summary_kernel, &xdim6, sizeof(int));
    xdim6_field_summary_kernel_h = xdim6;
    cudaMemcpyToSymbol(ydim6_field_summary_kernel, &ydim6, sizeof(int));
    ydim6_field_summary_kernel_h = ydim6;
  }

#ifdef OPS_LAZY
  ops_block block = desc->block;
#endif
#ifdef OPS_MPI
  double *arg7h =
      (double *)(((ops_reduction)args[7].data)->data +
                 ((ops_reduction)args[7].data)->size * block->index);
#else
  double *arg7h = (double *)(((ops_reduction)args[7].data)->data);
#endif
#ifdef OPS_MPI
  double *arg8h =
      (double *)(((ops_reduction)args[8].data)->data +
                 ((ops_reduction)args[8].data)->size * block->index);
#else
  double *arg8h = (double *)(((ops_reduction)args[8].data)->data);
#endif
#ifdef OPS_MPI
  double *arg9h =
      (double *)(((ops_reduction)args[9].data)->data +
                 ((ops_reduction)args[9].data)->size * block->index);
#else
  double *arg9h = (double *)(((ops_reduction)args[9].data)->data);
#endif
#ifdef OPS_MPI
  double *arg10h =
      (double *)(((ops_reduction)args[10].data)->data +
                 ((ops_reduction)args[10].data)->size * block->index);
#else
  double *arg10h = (double *)(((ops_reduction)args[10].data)->data);
#endif
#ifdef OPS_MPI
  double *arg11h =
      (double *)(((ops_reduction)args[11].data)->data +
                 ((ops_reduction)args[11].data)->size * block->index);
#else
  double *arg11h = (double *)(((ops_reduction)args[11].data)->data);
#endif

  dim3 grid((x_size - 1) / OPS_block_size_x + 1,
            (y_size - 1) / OPS_block_size_y + 1,
            (z_size - 1) / OPS_block_size_z + 1);
  dim3 tblock(OPS_block_size_x, OPS_block_size_y, OPS_block_size_z);

  int nblocks = ((x_size - 1) / OPS_block_size_x + 1) *
                ((y_size - 1) / OPS_block_size_y + 1) *
                ((z_size - 1) / OPS_block_size_z + 1);
  int maxblocks = nblocks;
  int reduct_bytes = 0;
  int reduct_size = 0;

  reduct_bytes += ROUND_UP(maxblocks * 1 * sizeof(double));
  reduct_size = MAX(reduct_size, sizeof(double) * 1);
  reduct_bytes += ROUND_UP(maxblocks * 1 * sizeof(double));
  reduct_size = MAX(reduct_size, sizeof(double) * 1);
  reduct_bytes += ROUND_UP(maxblocks * 1 * sizeof(double));
  reduct_size = MAX(reduct_size, sizeof(double) * 1);
  reduct_bytes += ROUND_UP(maxblocks * 1 * sizeof(double));
  reduct_size = MAX(reduct_size, sizeof(double) * 1);
  reduct_bytes += ROUND_UP(maxblocks * 1 * sizeof(double));
  reduct_size = MAX(reduct_size, sizeof(double) * 1);

  reallocReductArrays(reduct_bytes);
  reduct_bytes = 0;

  arg7.data = OPS_reduct_h + reduct_bytes;
  arg7.data_d = OPS_reduct_d + reduct_bytes;
  for (int b = 0; b < maxblocks; b++)
    for (int d = 0; d < 1; d++)
      ((double *)arg7.data)[d + b * 1] = ZERO_double;
  reduct_bytes += ROUND_UP(maxblocks * 1 * sizeof(double));

  arg8.data = OPS_reduct_h + reduct_bytes;
  arg8.data_d = OPS_reduct_d + reduct_bytes;
  for (int b = 0; b < maxblocks; b++)
    for (int d = 0; d < 1; d++)
      ((double *)arg8.data)[d + b * 1] = ZERO_double;
  reduct_bytes += ROUND_UP(maxblocks * 1 * sizeof(double));

  arg9.data = OPS_reduct_h + reduct_bytes;
  arg9.data_d = OPS_reduct_d + reduct_bytes;
  for (int b = 0; b < maxblocks; b++)
    for (int d = 0; d < 1; d++)
      ((double *)arg9.data)[d + b * 1] = ZERO_double;
  reduct_bytes += ROUND_UP(maxblocks * 1 * sizeof(double));

  arg10.data = OPS_reduct_h + reduct_bytes;
  arg10.data_d = OPS_reduct_d + reduct_bytes;
  for (int b = 0; b < maxblocks; b++)
    for (int d = 0; d < 1; d++)
      ((double *)arg10.data)[d + b * 1] = ZERO_double;
  reduct_bytes += ROUND_UP(maxblocks * 1 * sizeof(double));

  arg11.data = OPS_reduct_h + reduct_bytes;
  arg11.data_d = OPS_reduct_d + reduct_bytes;
  for (int b = 0; b < maxblocks; b++)
    for (int d = 0; d < 1; d++)
      ((double *)arg11.data)[d + b * 1] = ZERO_double;
  reduct_bytes += ROUND_UP(maxblocks * 1 * sizeof(double));

  mvReductArraysToDevice(reduct_bytes);
  int dat0 = (OPS_soa ? args[0].dat->type_size : args[0].dat->elem_size);
  int dat1 = (OPS_soa ? args[1].dat->type_size : args[1].dat->elem_size);
  int dat2 = (OPS_soa ? args[2].dat->type_size : args[2].dat->elem_size);
  int dat3 = (OPS_soa ? args[3].dat->type_size : args[3].dat->elem_size);
  int dat4 = (OPS_soa ? args[4].dat->type_size : args[4].dat->elem_size);
  int dat5 = (OPS_soa ? args[5].dat->type_size : args[5].dat->elem_size);
  int dat6 = (OPS_soa ? args[6].dat->type_size : args[6].dat->elem_size);

  char *p_a[12];

  // set up initial pointers
  int base0 = args[0].dat->base_offset +
              dat0 * 1 * (start[0] * args[0].stencil->stride[0]);
  base0 = base0 +
          dat0 * args[0].dat->size[0] * (start[1] * args[0].stencil->stride[1]);
  base0 = base0 +
          dat0 * args[0].dat->size[0] * args[0].dat->size[1] *
              (start[2] * args[0].stencil->stride[2]);
  p_a[0] = (char *)args[0].data_d + base0;

  int base1 = args[1].dat->base_offset +
              dat1 * 1 * (start[0] * args[1].stencil->stride[0]);
  base1 = base1 +
          dat1 * args[1].dat->size[0] * (start[1] * args[1].stencil->stride[1]);
  base1 = base1 +
          dat1 * args[1].dat->size[0] * args[1].dat->size[1] *
              (start[2] * args[1].stencil->stride[2]);
  p_a[1] = (char *)args[1].data_d + base1;

  int base2 = args[2].dat->base_offset +
              dat2 * 1 * (start[0] * args[2].stencil->stride[0]);
  base2 = base2 +
          dat2 * args[2].dat->size[0] * (start[1] * args[2].stencil->stride[1]);
  base2 = base2 +
          dat2 * args[2].dat->size[0] * args[2].dat->size[1] *
              (start[2] * args[2].stencil->stride[2]);
  p_a[2] = (char *)args[2].data_d + base2;

  int base3 = args[3].dat->base_offset +
              dat3 * 1 * (start[0] * args[3].stencil->stride[0]);
  base3 = base3 +
          dat3 * args[3].dat->size[0] * (start[1] * args[3].stencil->stride[1]);
  base3 = base3 +
          dat3 * args[3].dat->size[0] * args[3].dat->size[1] *
              (start[2] * args[3].stencil->stride[2]);
  p_a[3] = (char *)args[3].data_d + base3;

  int base4 = args[4].dat->base_offset +
              dat4 * 1 * (start[0] * args[4].stencil->stride[0]);
  base4 = base4 +
          dat4 * args[4].dat->size[0] * (start[1] * args[4].stencil->stride[1]);
  base4 = base4 +
          dat4 * args[4].dat->size[0] * args[4].dat->size[1] *
              (start[2] * args[4].stencil->stride[2]);
  p_a[4] = (char *)args[4].data_d + base4;

  int base5 = args[5].dat->base_offset +
              dat5 * 1 * (start[0] * args[5].stencil->stride[0]);
  base5 = base5 +
          dat5 * args[5].dat->size[0] * (start[1] * args[5].stencil->stride[1]);
  base5 = base5 +
          dat5 * args[5].dat->size[0] * args[5].dat->size[1] *
              (start[2] * args[5].stencil->stride[2]);
  p_a[5] = (char *)args[5].data_d + base5;

  int base6 = args[6].dat->base_offset +
              dat6 * 1 * (start[0] * args[6].stencil->stride[0]);
  base6 = base6 +
          dat6 * args[6].dat->size[0] * (start[1] * args[6].stencil->stride[1]);
  base6 = base6 +
          dat6 * args[6].dat->size[0] * args[6].dat->size[1] *
              (start[2] * args[6].stencil->stride[2]);
  p_a[6] = (char *)args[6].data_d + base6;

#ifndef OPS_LAZY
  ops_H_D_exchanges_device(args, 12);
  ops_halo_exchanges(args, 12, range);
#endif

  if (OPS_diags > 1) {
    ops_timers_core(&c2, &t2);
    OPS_kernels[95].mpi_time += t2 - t1;
  }

  int nshared = 0;
  int nthread = OPS_block_size_x * OPS_block_size_y * OPS_block_size_z;

  nshared = MAX(nshared, sizeof(double) * 1);
  nshared = MAX(nshared, sizeof(double) * 1);
  nshared = MAX(nshared, sizeof(double) * 1);
  nshared = MAX(nshared, sizeof(double) * 1);
  nshared = MAX(nshared, sizeof(double) * 1);

  nshared = MAX(nshared * nthread, reduct_size * nthread);

  // call kernel wrapper function, passing in pointers to data
  if (x_size > 0 && y_size > 0 && z_size > 0)
    ops_field_summary_kernel<<<grid, tblock, nshared>>>(
        (double *)p_a[0], (double *)p_a[1], (double *)p_a[2], (double *)p_a[3],
        (double *)p_a[4], (double *)p_a[5], (double *)p_a[6],
        (double *)arg7.data_d, (double *)arg8.data_d, (double *)arg9.data_d,
        (double *)arg10.data_d, (double *)arg11.data_d, x_size, y_size, z_size);

  cutilSafeCall(cudaGetLastError());

  mvReductArraysToHost(reduct_bytes);
  for (int b = 0; b < maxblocks; b++) {
    for (int d = 0; d < 1; d++) {
      arg7h[d] = arg7h[d] + ((double *)arg7.data)[d + b * 1];
    }
  }
  arg7.data = (char *)arg7h;

  for (int b = 0; b < maxblocks; b++) {
    for (int d = 0; d < 1; d++) {
      arg8h[d] = arg8h[d] + ((double *)arg8.data)[d + b * 1];
    }
  }
  arg8.data = (char *)arg8h;

  for (int b = 0; b < maxblocks; b++) {
    for (int d = 0; d < 1; d++) {
      arg9h[d] = arg9h[d] + ((double *)arg9.data)[d + b * 1];
    }
  }
  arg9.data = (char *)arg9h;

  for (int b = 0; b < maxblocks; b++) {
    for (int d = 0; d < 1; d++) {
      arg10h[d] = arg10h[d] + ((double *)arg10.data)[d + b * 1];
    }
  }
  arg10.data = (char *)arg10h;

  for (int b = 0; b < maxblocks; b++) {
    for (int d = 0; d < 1; d++) {
      arg11h[d] = arg11h[d] + ((double *)arg11.data)[d + b * 1];
    }
  }
  arg11.data = (char *)arg11h;

  if (OPS_diags > 1) {
    cutilSafeCall(cudaDeviceSynchronize());
    ops_timers_core(&c1, &t1);
    OPS_kernels[95].time += t1 - t2;
  }

#ifndef OPS_LAZY
  ops_set_dirtybit_device(args, 12);
#endif

  if (OPS_diags > 1) {
    // Update kernel record
    ops_timers_core(&c2, &t2);
    OPS_kernels[95].mpi_time += t2 - t1;
    OPS_kernels[95].transfer += ops_compute_transfer(dim, start, end, &arg0);
    OPS_kernels[95].transfer += ops_compute_transfer(dim, start, end, &arg1);
    OPS_kernels[95].transfer += ops_compute_transfer(dim, start, end, &arg2);
    OPS_kernels[95].transfer += ops_compute_transfer(dim, start, end, &arg3);
    OPS_kernels[95].transfer += ops_compute_transfer(dim, start, end, &arg4);
    OPS_kernels[95].transfer += ops_compute_transfer(dim, start, end, &arg5);
    OPS_kernels[95].transfer += ops_compute_transfer(dim, start, end, &arg6);
  }
}

#ifdef OPS_LAZY
void ops_par_loop_field_summary_kernel(char const *name, ops_block block,
                                       int dim, int *range, ops_arg arg0,
                                       ops_arg arg1, ops_arg arg2, ops_arg arg3,
                                       ops_arg arg4, ops_arg arg5, ops_arg arg6,
                                       ops_arg arg7, ops_arg arg8, ops_arg arg9,
                                       ops_arg arg10, ops_arg arg11) {
  ops_kernel_descriptor *desc =
      (ops_kernel_descriptor *)malloc(sizeof(ops_kernel_descriptor));
  desc->name = name;
  desc->block = block;
  desc->dim = dim;
  desc->device = 1;
  desc->index = 95;
  desc->hash = 5381;
  desc->hash = ((desc->hash << 5) + desc->hash) + 95;
  for (int i = 0; i < 6; i++) {
    desc->range[i] = range[i];
    desc->orig_range[i] = range[i];
    desc->hash = ((desc->hash << 5) + desc->hash) + range[i];
  }
  desc->nargs = 12;
  desc->args = (ops_arg *)malloc(12 * sizeof(ops_arg));
  desc->args[0] = arg0;
  desc->hash = ((desc->hash << 5) + desc->hash) + arg0.dat->index;
  desc->args[1] = arg1;
  desc->hash = ((desc->hash << 5) + desc->hash) + arg1.dat->index;
  desc->args[2] = arg2;
  desc->hash = ((desc->hash << 5) + desc->hash) + arg2.dat->index;
  desc->args[3] = arg3;
  desc->hash = ((desc->hash << 5) + desc->hash) + arg3.dat->index;
  desc->args[4] = arg4;
  desc->hash = ((desc->hash << 5) + desc->hash) + arg4.dat->index;
  desc->args[5] = arg5;
  desc->hash = ((desc->hash << 5) + desc->hash) + arg5.dat->index;
  desc->args[6] = arg6;
  desc->hash = ((desc->hash << 5) + desc->hash) + arg6.dat->index;
  desc->args[7] = arg7;
  desc->args[8] = arg8;
  desc->args[9] = arg9;
  desc->args[10] = arg10;
  desc->args[11] = arg11;
  desc->function = ops_par_loop_field_summary_kernel_execute;
  if (OPS_diags > 1) {
    ops_timing_realloc(95, "field_summary_kernel");
  }
  ops_enqueue_kernel(desc);
}
#endif
