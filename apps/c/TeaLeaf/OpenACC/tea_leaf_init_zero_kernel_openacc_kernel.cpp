//
// auto-generated by ops.py
//

#define OPS_GPU

extern int xdim0_tea_leaf_init_zero_kernel;
int xdim0_tea_leaf_init_zero_kernel_h = -1;

#ifdef __cplusplus
extern "C" {
#endif
void tea_leaf_init_zero_kernel_c_wrapper(double *p_a0, int x_size, int y_size);

#ifdef __cplusplus
}
#endif

// host stub function
void ops_par_loop_tea_leaf_init_zero_kernel(char const *name, ops_block block,
                                            int dim, int *range, ops_arg arg0) {

  // Timing
  double t1, t2, c1, c2;
  ops_arg args[1] = {arg0};

#ifdef CHECKPOINTING
  if (!ops_checkpointing_before(args, 1, range, 45))
    return;
#endif

  if (OPS_diags > 1) {
    ops_timing_realloc(45, "tea_leaf_init_zero_kernel");
    OPS_kernels[45].count++;
    ops_timers_core(&c1, &t1);
  }

  // compute localy allocated range for the sub-block

  int start[2];
  int end[2];
#ifdef OPS_MPI
  sub_block_list sb = OPS_sub_block_list[block->index];
  if (!sb->owned)
    return;
  for (int n = 0; n < 2; n++) {
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
  for (int n = 0; n < 2; n++) {
    start[n] = range[2 * n];
    end[n] = range[2 * n + 1];
  }
#endif

  int x_size = MAX(0, end[0] - start[0]);
  int y_size = MAX(0, end[1] - start[1]);

  xdim0 = args[0].dat->size[0];
  if (xdim0 != xdim0_tea_leaf_init_zero_kernel_h) {
    xdim0_tea_leaf_init_zero_kernel = xdim0;
    xdim0_tea_leaf_init_zero_kernel_h = xdim0;
  }

  // set up initial pointers
  int base0 = args[0].dat->base_offset +
              (OPS_soa ? args[0].dat->type_size : args[0].dat->elem_size) *
                  start[0] * args[0].stencil->stride[0];
  base0 = base0 +
          (OPS_soa ? args[0].dat->type_size : args[0].dat->elem_size) *
              args[0].dat->size[0] * start[1] * args[0].stencil->stride[1];
#ifdef OPS_GPU
  double *p_a0 = (double *)((char *)args[0].data_d + base0);
#else
  double *p_a0 = (double *)((char *)args[0].data + base0);
#endif

#ifdef OPS_GPU
  ops_H_D_exchanges_device(args, 1);
#else
  ops_H_D_exchanges_host(args, 1);
#endif
  ops_halo_exchanges(args, 1, range);

#ifdef OPS_GPU
  ops_H_D_exchanges_device(args, 1);
#else
  ops_H_D_exchanges_host(args, 1);
#endif
  if (OPS_diags > 1) {
    ops_timers_core(&c2, &t2);
    OPS_kernels[45].mpi_time += t2 - t1;
  }

  tea_leaf_init_zero_kernel_c_wrapper(p_a0, x_size, y_size);

  if (OPS_diags > 1) {
    ops_timers_core(&c1, &t1);
    OPS_kernels[45].time += t1 - t2;
  }
#ifdef OPS_GPU
  ops_set_dirtybit_device(args, 1);
#else
  ops_set_dirtybit_host(args, 1);
#endif
  ops_set_halo_dirtybit3(&args[0], range);

  if (OPS_diags > 1) {
    // Update kernel record
    ops_timers_core(&c2, &t2);
    OPS_kernels[45].mpi_time += t2 - t1;
    OPS_kernels[45].transfer += ops_compute_transfer(dim, start, end, &arg0);
  }
}
