//
// auto-generated by ops.py
//
#include "./OpenACC/clover_leaf_common.h"

#define OPS_GPU

extern int xdim0_advec_cell_kernel4_xdir;
int xdim0_advec_cell_kernel4_xdir_h = -1;
extern int xdim1_advec_cell_kernel4_xdir;
int xdim1_advec_cell_kernel4_xdir_h = -1;
extern int xdim2_advec_cell_kernel4_xdir;
int xdim2_advec_cell_kernel4_xdir_h = -1;
extern int xdim3_advec_cell_kernel4_xdir;
int xdim3_advec_cell_kernel4_xdir_h = -1;
extern int xdim4_advec_cell_kernel4_xdir;
int xdim4_advec_cell_kernel4_xdir_h = -1;
extern int xdim5_advec_cell_kernel4_xdir;
int xdim5_advec_cell_kernel4_xdir_h = -1;
extern int xdim6_advec_cell_kernel4_xdir;
int xdim6_advec_cell_kernel4_xdir_h = -1;
extern int xdim7_advec_cell_kernel4_xdir;
int xdim7_advec_cell_kernel4_xdir_h = -1;
extern int xdim8_advec_cell_kernel4_xdir;
int xdim8_advec_cell_kernel4_xdir_h = -1;
extern int xdim9_advec_cell_kernel4_xdir;
int xdim9_advec_cell_kernel4_xdir_h = -1;
extern int xdim10_advec_cell_kernel4_xdir;
int xdim10_advec_cell_kernel4_xdir_h = -1;

#ifdef __cplusplus
extern "C" {
#endif
void advec_cell_kernel4_xdir_c_wrapper(
  double *p_a0,
  double *p_a1,
  double *p_a2,
  double *p_a3,
  double *p_a4,
  double *p_a5,
  double *p_a6,
  double *p_a7,
  double *p_a8,
  double *p_a9,
  double *p_a10,
  int x_size, int y_size);

#ifdef __cplusplus
}
#endif

// host stub function
void ops_par_loop_advec_cell_kernel4_xdir(char const *name, ops_block block, int dim, int* range,
 ops_arg arg0, ops_arg arg1, ops_arg arg2, ops_arg arg3, ops_arg arg4, ops_arg arg5, ops_arg arg6, ops_arg arg7, ops_arg arg8, ops_arg arg9, ops_arg arg10) {

  ops_arg args[11] = { arg0, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9, arg10};


  #ifdef CHECKPOINTING
  if (!ops_checkpointing_before(args,11,range,10)) return;
  #endif

  ops_timing_realloc(10,"advec_cell_kernel4_xdir");
  OPS_kernels[10].count++;

  //compute localy allocated range for the sub-block
  int start[2];
  int end[2];
  #ifdef OPS_MPI
  sub_block_list sb = OPS_sub_block_list[block->index];
  if (!sb->owned) return;
  for ( int n=0; n<2; n++ ){
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
  for ( int n=0; n<2; n++ ){
    start[n] = range[2*n];end[n] = range[2*n+1];
  }
  #endif //OPS_MPI

  int x_size = MAX(0,end[0]-start[0]);
  int y_size = MAX(0,end[1]-start[1]);


  xdim0 = args[0].dat->size[0];
  xdim1 = args[1].dat->size[0];
  xdim2 = args[2].dat->size[0];
  xdim3 = args[3].dat->size[0];
  xdim4 = args[4].dat->size[0];
  xdim5 = args[5].dat->size[0];
  xdim6 = args[6].dat->size[0];
  xdim7 = args[7].dat->size[0];
  xdim8 = args[8].dat->size[0];
  xdim9 = args[9].dat->size[0];
  xdim10 = args[10].dat->size[0];

  //Timing
  double t1,t2,c1,c2;
  ops_timers_core(&c2,&t2);

  if (xdim0 != xdim0_advec_cell_kernel4_xdir_h || xdim1 != xdim1_advec_cell_kernel4_xdir_h || xdim2 != xdim2_advec_cell_kernel4_xdir_h || xdim3 != xdim3_advec_cell_kernel4_xdir_h || xdim4 != xdim4_advec_cell_kernel4_xdir_h || xdim5 != xdim5_advec_cell_kernel4_xdir_h || xdim6 != xdim6_advec_cell_kernel4_xdir_h || xdim7 != xdim7_advec_cell_kernel4_xdir_h || xdim8 != xdim8_advec_cell_kernel4_xdir_h || xdim9 != xdim9_advec_cell_kernel4_xdir_h || xdim10 != xdim10_advec_cell_kernel4_xdir_h) {
    xdim0_advec_cell_kernel4_xdir = xdim0;
    xdim0_advec_cell_kernel4_xdir_h = xdim0;
    xdim1_advec_cell_kernel4_xdir = xdim1;
    xdim1_advec_cell_kernel4_xdir_h = xdim1;
    xdim2_advec_cell_kernel4_xdir = xdim2;
    xdim2_advec_cell_kernel4_xdir_h = xdim2;
    xdim3_advec_cell_kernel4_xdir = xdim3;
    xdim3_advec_cell_kernel4_xdir_h = xdim3;
    xdim4_advec_cell_kernel4_xdir = xdim4;
    xdim4_advec_cell_kernel4_xdir_h = xdim4;
    xdim5_advec_cell_kernel4_xdir = xdim5;
    xdim5_advec_cell_kernel4_xdir_h = xdim5;
    xdim6_advec_cell_kernel4_xdir = xdim6;
    xdim6_advec_cell_kernel4_xdir_h = xdim6;
    xdim7_advec_cell_kernel4_xdir = xdim7;
    xdim7_advec_cell_kernel4_xdir_h = xdim7;
    xdim8_advec_cell_kernel4_xdir = xdim8;
    xdim8_advec_cell_kernel4_xdir_h = xdim8;
    xdim9_advec_cell_kernel4_xdir = xdim9;
    xdim9_advec_cell_kernel4_xdir_h = xdim9;
    xdim10_advec_cell_kernel4_xdir = xdim10;
    xdim10_advec_cell_kernel4_xdir_h = xdim10;
  }

  int dat0 = args[0].dat->elem_size;
  int dat1 = args[1].dat->elem_size;
  int dat2 = args[2].dat->elem_size;
  int dat3 = args[3].dat->elem_size;
  int dat4 = args[4].dat->elem_size;
  int dat5 = args[5].dat->elem_size;
  int dat6 = args[6].dat->elem_size;
  int dat7 = args[7].dat->elem_size;
  int dat8 = args[8].dat->elem_size;
  int dat9 = args[9].dat->elem_size;
  int dat10 = args[10].dat->elem_size;


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
  #ifdef OPS_GPU
  double *p_a5 = (double *)((char *)args[5].data_d + base5);
  #else
  double *p_a5 = (double *)((char *)args[5].data + base5);
  #endif

  #ifdef OPS_MPI
  for (int d = 0; d < dim; d++) d_m[d] = args[6].dat->d_m[d] + OPS_sub_dat_list[args[6].dat->index]->d_im[d];
  #else //OPS_MPI
  for (int d = 0; d < dim; d++) d_m[d] = args[6].dat->d_m[d];
  #endif //OPS_MPI
  int base6 = dat6 * 1 *
    (start[0] * args[6].stencil->stride[0] - args[6].dat->base[0] - d_m[0]);
  base6 = base6+ dat6 *
    args[6].dat->size[0] *
    (start[1] * args[6].stencil->stride[1] - args[6].dat->base[1] - d_m[1]);
  #ifdef OPS_GPU
  double *p_a6 = (double *)((char *)args[6].data_d + base6);
  #else
  double *p_a6 = (double *)((char *)args[6].data + base6);
  #endif

  #ifdef OPS_MPI
  for (int d = 0; d < dim; d++) d_m[d] = args[7].dat->d_m[d] + OPS_sub_dat_list[args[7].dat->index]->d_im[d];
  #else //OPS_MPI
  for (int d = 0; d < dim; d++) d_m[d] = args[7].dat->d_m[d];
  #endif //OPS_MPI
  int base7 = dat7 * 1 *
    (start[0] * args[7].stencil->stride[0] - args[7].dat->base[0] - d_m[0]);
  base7 = base7+ dat7 *
    args[7].dat->size[0] *
    (start[1] * args[7].stencil->stride[1] - args[7].dat->base[1] - d_m[1]);
  #ifdef OPS_GPU
  double *p_a7 = (double *)((char *)args[7].data_d + base7);
  #else
  double *p_a7 = (double *)((char *)args[7].data + base7);
  #endif

  #ifdef OPS_MPI
  for (int d = 0; d < dim; d++) d_m[d] = args[8].dat->d_m[d] + OPS_sub_dat_list[args[8].dat->index]->d_im[d];
  #else //OPS_MPI
  for (int d = 0; d < dim; d++) d_m[d] = args[8].dat->d_m[d];
  #endif //OPS_MPI
  int base8 = dat8 * 1 *
    (start[0] * args[8].stencil->stride[0] - args[8].dat->base[0] - d_m[0]);
  base8 = base8+ dat8 *
    args[8].dat->size[0] *
    (start[1] * args[8].stencil->stride[1] - args[8].dat->base[1] - d_m[1]);
  #ifdef OPS_GPU
  double *p_a8 = (double *)((char *)args[8].data_d + base8);
  #else
  double *p_a8 = (double *)((char *)args[8].data + base8);
  #endif

  #ifdef OPS_MPI
  for (int d = 0; d < dim; d++) d_m[d] = args[9].dat->d_m[d] + OPS_sub_dat_list[args[9].dat->index]->d_im[d];
  #else //OPS_MPI
  for (int d = 0; d < dim; d++) d_m[d] = args[9].dat->d_m[d];
  #endif //OPS_MPI
  int base9 = dat9 * 1 *
    (start[0] * args[9].stencil->stride[0] - args[9].dat->base[0] - d_m[0]);
  base9 = base9+ dat9 *
    args[9].dat->size[0] *
    (start[1] * args[9].stencil->stride[1] - args[9].dat->base[1] - d_m[1]);
  #ifdef OPS_GPU
  double *p_a9 = (double *)((char *)args[9].data_d + base9);
  #else
  double *p_a9 = (double *)((char *)args[9].data + base9);
  #endif

  #ifdef OPS_MPI
  for (int d = 0; d < dim; d++) d_m[d] = args[10].dat->d_m[d] + OPS_sub_dat_list[args[10].dat->index]->d_im[d];
  #else //OPS_MPI
  for (int d = 0; d < dim; d++) d_m[d] = args[10].dat->d_m[d];
  #endif //OPS_MPI
  int base10 = dat10 * 1 *
    (start[0] * args[10].stencil->stride[0] - args[10].dat->base[0] - d_m[0]);
  base10 = base10+ dat10 *
    args[10].dat->size[0] *
    (start[1] * args[10].stencil->stride[1] - args[10].dat->base[1] - d_m[1]);
  #ifdef OPS_GPU
  double *p_a10 = (double *)((char *)args[10].data_d + base10);
  #else
  double *p_a10 = (double *)((char *)args[10].data + base10);
  #endif


  #ifdef OPS_GPU
  ops_H_D_exchanges_device(args, 11);
  #else
  ops_H_D_exchanges_host(args, 11);
  #endif
  ops_halo_exchanges(args,11,range);

  ops_timers_core(&c1,&t1);
  OPS_kernels[10].mpi_time += t1-t2;

  advec_cell_kernel4_xdir_c_wrapper(
    p_a0,
    p_a1,
    p_a2,
    p_a3,
    p_a4,
    p_a5,
    p_a6,
    p_a7,
    p_a8,
    p_a9,
    p_a10,
    x_size, y_size);

  ops_timers_core(&c2,&t2);
  OPS_kernels[10].time += t2-t1;
  #ifdef OPS_GPU
  ops_set_dirtybit_device(args, 11);
  #else
  ops_set_dirtybit_host(args, 11);
  #endif
  ops_set_halo_dirtybit3(&args[0],range);
  ops_set_halo_dirtybit3(&args[1],range);
  ops_set_halo_dirtybit3(&args[6],range);
  ops_set_halo_dirtybit3(&args[7],range);
  ops_set_halo_dirtybit3(&args[8],range);
  ops_set_halo_dirtybit3(&args[9],range);

  //Update kernel record
  OPS_kernels[10].transfer += ops_compute_transfer(dim, range, &arg0);
  OPS_kernels[10].transfer += ops_compute_transfer(dim, range, &arg1);
  OPS_kernels[10].transfer += ops_compute_transfer(dim, range, &arg2);
  OPS_kernels[10].transfer += ops_compute_transfer(dim, range, &arg3);
  OPS_kernels[10].transfer += ops_compute_transfer(dim, range, &arg4);
  OPS_kernels[10].transfer += ops_compute_transfer(dim, range, &arg5);
  OPS_kernels[10].transfer += ops_compute_transfer(dim, range, &arg6);
  OPS_kernels[10].transfer += ops_compute_transfer(dim, range, &arg7);
  OPS_kernels[10].transfer += ops_compute_transfer(dim, range, &arg8);
  OPS_kernels[10].transfer += ops_compute_transfer(dim, range, &arg9);
  OPS_kernels[10].transfer += ops_compute_transfer(dim, range, &arg10);
}
