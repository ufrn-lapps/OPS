//
// auto-generated by ops.py
//
#include "./OpenACC/clover_leaf_common.h"

#define OPS_GPU

extern int xdim0_reset_field_kernel2;
int xdim0_reset_field_kernel2_h = -1;
extern int ydim0_reset_field_kernel2;
int ydim0_reset_field_kernel2_h = -1;
extern int xdim1_reset_field_kernel2;
int xdim1_reset_field_kernel2_h = -1;
extern int ydim1_reset_field_kernel2;
int ydim1_reset_field_kernel2_h = -1;
extern int xdim2_reset_field_kernel2;
int xdim2_reset_field_kernel2_h = -1;
extern int ydim2_reset_field_kernel2;
int ydim2_reset_field_kernel2_h = -1;
extern int xdim3_reset_field_kernel2;
int xdim3_reset_field_kernel2_h = -1;
extern int ydim3_reset_field_kernel2;
int ydim3_reset_field_kernel2_h = -1;
extern int xdim4_reset_field_kernel2;
int xdim4_reset_field_kernel2_h = -1;
extern int ydim4_reset_field_kernel2;
int ydim4_reset_field_kernel2_h = -1;
extern int xdim5_reset_field_kernel2;
int xdim5_reset_field_kernel2_h = -1;
extern int ydim5_reset_field_kernel2;
int ydim5_reset_field_kernel2_h = -1;

#ifdef __cplusplus
extern "C" {
#endif
void reset_field_kernel2_c_wrapper(
  double *p_a0,
  double *p_a1,
  double *p_a2,
  double *p_a3,
  double *p_a4,
  double *p_a5,
  int x_size, int y_size, int z_size);

#ifdef __cplusplus
}
#endif

// host stub function
void ops_par_loop_reset_field_kernel2(char const *name, ops_block block, int dim, int* range,
 ops_arg arg0, ops_arg arg1, ops_arg arg2, ops_arg arg3, ops_arg arg4, ops_arg arg5) {

  ops_arg args[6] = { arg0, arg1, arg2, arg3, arg4, arg5};


  #ifdef CHECKPOINTING
  if (!ops_checkpointing_before(args,6,range,2)) return;
  #endif

  ops_timing_realloc(2,"reset_field_kernel2");
  OPS_kernels[2].count++;

  //compute localy allocated range for the sub-block
  int start[3];
  int end[3];
  #ifdef OPS_MPI
  sub_block_list sb = OPS_sub_block_list[block->index];
  if (!sb->owned) return;
  for ( int n=0; n<3; n++ ){
    start[n] = sb->decomp_disp[n];end[n] = sb->decomp_disp[n]+sb->decomp_size[n];
    if (start[n] >= range[2*n]) {
      start[n] = 0;
    }
    else {
      start[n] = range[2*n] - start[n];
    }
    if (sb->id_m[n]==MPI_PROC_NULL && range[2*n] < 0) start[n] = range[2*n];
    if (end[n] >= range[2*n+1]) {
      end[n] = range[2*n+1] - sb->decomp_disp[n];
    }
    else {
      end[n] = sb->decomp_size[n];
    }
    if (sb->id_p[n]==MPI_PROC_NULL && (range[2*n+1] > sb->decomp_disp[n]+sb->decomp_size[n]))
      end[n] += (range[2*n+1]-sb->decomp_disp[n]-sb->decomp_size[n]);
  }
  #else //OPS_MPI
  for ( int n=0; n<3; n++ ){
    start[n] = range[2*n];end[n] = range[2*n+1];
  }
  #endif //OPS_MPI

  int x_size = MAX(0,end[0]-start[0]);
  int y_size = MAX(0,end[1]-start[1]);
  int z_size = MAX(0,end[2]-start[2]);


  xdim0 = args[0].dat->size[0];
  ydim0 = args[0].dat->size[1];
  xdim1 = args[1].dat->size[0];
  ydim1 = args[1].dat->size[1];
  xdim2 = args[2].dat->size[0];
  ydim2 = args[2].dat->size[1];
  xdim3 = args[3].dat->size[0];
  ydim3 = args[3].dat->size[1];
  xdim4 = args[4].dat->size[0];
  ydim4 = args[4].dat->size[1];
  xdim5 = args[5].dat->size[0];
  ydim5 = args[5].dat->size[1];

  //Timing
  double t1,t2,c1,c2;
  ops_timers_core(&c2,&t2);

  if (xdim0 != xdim0_reset_field_kernel2_h || ydim0 != ydim0_reset_field_kernel2_h || xdim1 != xdim1_reset_field_kernel2_h || ydim1 != ydim1_reset_field_kernel2_h || xdim2 != xdim2_reset_field_kernel2_h || ydim2 != ydim2_reset_field_kernel2_h || xdim3 != xdim3_reset_field_kernel2_h || ydim3 != ydim3_reset_field_kernel2_h || xdim4 != xdim4_reset_field_kernel2_h || ydim4 != ydim4_reset_field_kernel2_h || xdim5 != xdim5_reset_field_kernel2_h || ydim5 != ydim5_reset_field_kernel2_h) {
    xdim0_reset_field_kernel2 = xdim0;
    xdim0_reset_field_kernel2_h = xdim0;
    ydim0_reset_field_kernel2 = ydim0;
    ydim0_reset_field_kernel2_h = ydim0;
    xdim1_reset_field_kernel2 = xdim1;
    xdim1_reset_field_kernel2_h = xdim1;
    ydim1_reset_field_kernel2 = ydim1;
    ydim1_reset_field_kernel2_h = ydim1;
    xdim2_reset_field_kernel2 = xdim2;
    xdim2_reset_field_kernel2_h = xdim2;
    ydim2_reset_field_kernel2 = ydim2;
    ydim2_reset_field_kernel2_h = ydim2;
    xdim3_reset_field_kernel2 = xdim3;
    xdim3_reset_field_kernel2_h = xdim3;
    ydim3_reset_field_kernel2 = ydim3;
    ydim3_reset_field_kernel2_h = ydim3;
    xdim4_reset_field_kernel2 = xdim4;
    xdim4_reset_field_kernel2_h = xdim4;
    ydim4_reset_field_kernel2 = ydim4;
    ydim4_reset_field_kernel2_h = ydim4;
    xdim5_reset_field_kernel2 = xdim5;
    xdim5_reset_field_kernel2_h = xdim5;
    ydim5_reset_field_kernel2 = ydim5;
    ydim5_reset_field_kernel2_h = ydim5;
  }

  int dat0 = args[0].dat->elem_size;
  int dat1 = args[1].dat->elem_size;
  int dat2 = args[2].dat->elem_size;
  int dat3 = args[3].dat->elem_size;
  int dat4 = args[4].dat->elem_size;
  int dat5 = args[5].dat->elem_size;


  //set up initial pointers
  int d_m[OPS_MAX_DIM];
  #ifdef OPS_MPI
  for (int d = 0; d < dim; d++) d_m[d] = args[0].dat->d_m[d] + OPS_sub_dat_list[args[0].dat->index]->d_im[d];
  #else //OPS_MPI
  for (int d = 0; d < dim; d++) d_m[d] = args[0].dat->d_m[d];
  #endif //OPS_MPI
  int base0 = dat0 * 1 *
    (start[0] * args[0].stencil->stride[0] - args[0].dat->base[0] - d_m[0]);
  base0 = base0+ dat0 *
    args[0].dat->size[0] *
    (start[1] * args[0].stencil->stride[1] - args[0].dat->base[1] - d_m[1]);
  base0 = base0+ dat0 *
    args[0].dat->size[0] *
    args[0].dat->size[1] *
    (start[2] * args[0].stencil->stride[2] - args[0].dat->base[2] - d_m[2]);
  #ifdef OPS_GPU
  double *p_a0 = (double *)((char *)args[0].data_d + base0);
  #else
  double *p_a0 = (double *)((char *)args[0].data + base0);
  #endif

  #ifdef OPS_MPI
  for (int d = 0; d < dim; d++) d_m[d] = args[1].dat->d_m[d] + OPS_sub_dat_list[args[1].dat->index]->d_im[d];
  #else //OPS_MPI
  for (int d = 0; d < dim; d++) d_m[d] = args[1].dat->d_m[d];
  #endif //OPS_MPI
  int base1 = dat1 * 1 *
    (start[0] * args[1].stencil->stride[0] - args[1].dat->base[0] - d_m[0]);
  base1 = base1+ dat1 *
    args[1].dat->size[0] *
    (start[1] * args[1].stencil->stride[1] - args[1].dat->base[1] - d_m[1]);
  base1 = base1+ dat1 *
    args[1].dat->size[0] *
    args[1].dat->size[1] *
    (start[2] * args[1].stencil->stride[2] - args[1].dat->base[2] - d_m[2]);
  #ifdef OPS_GPU
  double *p_a1 = (double *)((char *)args[1].data_d + base1);
  #else
  double *p_a1 = (double *)((char *)args[1].data + base1);
  #endif

  #ifdef OPS_MPI
  for (int d = 0; d < dim; d++) d_m[d] = args[2].dat->d_m[d] + OPS_sub_dat_list[args[2].dat->index]->d_im[d];
  #else //OPS_MPI
  for (int d = 0; d < dim; d++) d_m[d] = args[2].dat->d_m[d];
  #endif //OPS_MPI
  int base2 = dat2 * 1 *
    (start[0] * args[2].stencil->stride[0] - args[2].dat->base[0] - d_m[0]);
  base2 = base2+ dat2 *
    args[2].dat->size[0] *
    (start[1] * args[2].stencil->stride[1] - args[2].dat->base[1] - d_m[1]);
  base2 = base2+ dat2 *
    args[2].dat->size[0] *
    args[2].dat->size[1] *
    (start[2] * args[2].stencil->stride[2] - args[2].dat->base[2] - d_m[2]);
  #ifdef OPS_GPU
  double *p_a2 = (double *)((char *)args[2].data_d + base2);
  #else
  double *p_a2 = (double *)((char *)args[2].data + base2);
  #endif

  #ifdef OPS_MPI
  for (int d = 0; d < dim; d++) d_m[d] = args[3].dat->d_m[d] + OPS_sub_dat_list[args[3].dat->index]->d_im[d];
  #else //OPS_MPI
  for (int d = 0; d < dim; d++) d_m[d] = args[3].dat->d_m[d];
  #endif //OPS_MPI
  int base3 = dat3 * 1 *
    (start[0] * args[3].stencil->stride[0] - args[3].dat->base[0] - d_m[0]);
  base3 = base3+ dat3 *
    args[3].dat->size[0] *
    (start[1] * args[3].stencil->stride[1] - args[3].dat->base[1] - d_m[1]);
  base3 = base3+ dat3 *
    args[3].dat->size[0] *
    args[3].dat->size[1] *
    (start[2] * args[3].stencil->stride[2] - args[3].dat->base[2] - d_m[2]);
  #ifdef OPS_GPU
  double *p_a3 = (double *)((char *)args[3].data_d + base3);
  #else
  double *p_a3 = (double *)((char *)args[3].data + base3);
  #endif

  #ifdef OPS_MPI
  for (int d = 0; d < dim; d++) d_m[d] = args[4].dat->d_m[d] + OPS_sub_dat_list[args[4].dat->index]->d_im[d];
  #else //OPS_MPI
  for (int d = 0; d < dim; d++) d_m[d] = args[4].dat->d_m[d];
  #endif //OPS_MPI
  int base4 = dat4 * 1 *
    (start[0] * args[4].stencil->stride[0] - args[4].dat->base[0] - d_m[0]);
  base4 = base4+ dat4 *
    args[4].dat->size[0] *
    (start[1] * args[4].stencil->stride[1] - args[4].dat->base[1] - d_m[1]);
  base4 = base4+ dat4 *
    args[4].dat->size[0] *
    args[4].dat->size[1] *
    (start[2] * args[4].stencil->stride[2] - args[4].dat->base[2] - d_m[2]);
  #ifdef OPS_GPU
  double *p_a4 = (double *)((char *)args[4].data_d + base4);
  #else
  double *p_a4 = (double *)((char *)args[4].data + base4);
  #endif

  #ifdef OPS_MPI
  for (int d = 0; d < dim; d++) d_m[d] = args[5].dat->d_m[d] + OPS_sub_dat_list[args[5].dat->index]->d_im[d];
  #else //OPS_MPI
  for (int d = 0; d < dim; d++) d_m[d] = args[5].dat->d_m[d];
  #endif //OPS_MPI
  int base5 = dat5 * 1 *
    (start[0] * args[5].stencil->stride[0] - args[5].dat->base[0] - d_m[0]);
  base5 = base5+ dat5 *
    args[5].dat->size[0] *
    (start[1] * args[5].stencil->stride[1] - args[5].dat->base[1] - d_m[1]);
  base5 = base5+ dat5 *
    args[5].dat->size[0] *
    args[5].dat->size[1] *
    (start[2] * args[5].stencil->stride[2] - args[5].dat->base[2] - d_m[2]);
  #ifdef OPS_GPU
  double *p_a5 = (double *)((char *)args[5].data_d + base5);
  #else
  double *p_a5 = (double *)((char *)args[5].data + base5);
  #endif


  #ifdef OPS_GPU
  ops_H_D_exchanges_device(args, 6);
  #else
  ops_H_D_exchanges_host(args, 6);
  #endif
  ops_halo_exchanges(args,6,range);

  ops_timers_core(&c1,&t1);
  OPS_kernels[2].mpi_time += t1-t2;

  reset_field_kernel2_c_wrapper(
    p_a0,
    p_a1,
    p_a2,
    p_a3,
    p_a4,
    p_a5,
    x_size, y_size, z_size);

  ops_timers_core(&c2,&t2);
  OPS_kernels[2].time += t2-t1;
  #ifdef OPS_GPU
  ops_set_dirtybit_device(args, 6);
  #else
  ops_set_dirtybit_host(args, 6);
  #endif
  ops_set_halo_dirtybit3(&args[0],range);
  ops_set_halo_dirtybit3(&args[2],range);
  ops_set_halo_dirtybit3(&args[4],range);

  //Update kernel record
  OPS_kernels[2].transfer += ops_compute_transfer(dim, range, &arg0);
  OPS_kernels[2].transfer += ops_compute_transfer(dim, range, &arg1);
  OPS_kernels[2].transfer += ops_compute_transfer(dim, range, &arg2);
  OPS_kernels[2].transfer += ops_compute_transfer(dim, range, &arg3);
  OPS_kernels[2].transfer += ops_compute_transfer(dim, range, &arg4);
  OPS_kernels[2].transfer += ops_compute_transfer(dim, range, &arg5);
}
