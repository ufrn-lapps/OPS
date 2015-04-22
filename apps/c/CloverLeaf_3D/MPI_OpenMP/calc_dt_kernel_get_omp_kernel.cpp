//
// auto-generated by ops.py
//
#ifdef _OPENMP
#include <omp.h>
#endif

//user function
inline
void calc_dt_kernel_get(const double* cellx, const double* celly, double* xl_pos, double* yl_pos, const double *cellz, double *zl_pos) {
  *xl_pos = cellx[OPS_ACC0(0,0,0)];
  *yl_pos = celly[OPS_ACC1(0,0,0)];
  *zl_pos = cellz[OPS_ACC4(0,0,0)];
}





// host stub function
void ops_par_loop_calc_dt_kernel_get(char const *name, ops_block block, int dim, int* range,
 ops_arg arg0, ops_arg arg1, ops_arg arg2, ops_arg arg3,
 ops_arg arg4, ops_arg arg5) {

  //Timing
  double t1,t2,c1,c2;
  ops_timers_core(&c1,&t1);


  int  offs[6][3];
  ops_arg args[6] = { arg0, arg1, arg2, arg3, arg4, arg5};



  #ifdef CHECKPOINTING
  if (!ops_checkpointing_before(args,6,range,39)) return;
  #endif

  ops_timing_realloc(39,"calc_dt_kernel_get");
  OPS_kernels[39].count++;

  //compute locally allocated range for the sub-block

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
  #ifdef OPS_DEBUG
  ops_register_args(args, "calc_dt_kernel_get");
  #endif

  offs[0][0] = args[0].stencil->stride[0]*1;  //unit step in x dimension
  offs[0][1] = off3D(1, &start[0],
      &end[0],args[0].dat->size, args[0].stencil->stride) - offs[0][0];
  offs[0][2] = off3D(2, &start[0],
      &end[0],args[0].dat->size, args[0].stencil->stride) - offs[0][1] - offs[0][0];

  offs[1][0] = args[1].stencil->stride[0]*1;  //unit step in x dimension
  offs[1][1] = off3D(1, &start[0],
      &end[0],args[1].dat->size, args[1].stencil->stride) - offs[1][0];
  offs[1][2] = off3D(2, &start[0],
      &end[0],args[1].dat->size, args[1].stencil->stride) - offs[1][1] - offs[1][0];

  offs[4][0] = args[4].stencil->stride[0]*1;  //unit step in x dimension
  offs[4][1] = off3D(1, &start[0],
      &end[0],args[4].dat->size, args[4].stencil->stride) - offs[4][0];
  offs[4][2] = off3D(2, &start[0],
      &end[0],args[4].dat->size, args[4].stencil->stride) - offs[4][1] - offs[4][0];



  int off0_0 = offs[0][0];
  int off0_1 = offs[0][1];
  int off0_2 = offs[0][2];
  int dat0 = args[0].dat->elem_size;
  int off1_0 = offs[1][0];
  int off1_1 = offs[1][1];
  int off1_2 = offs[1][2];
  int dat1 = args[1].dat->elem_size;
  int off4_0 = offs[4][0];
  int off4_1 = offs[4][1];
  int off4_2 = offs[4][2];
  int dat4 = args[4].dat->elem_size;

  #ifdef OPS_MPI
  double *arg2h = (double *)(((ops_reduction)args[2].data)->data + ((ops_reduction)args[2].data)->size * block->index);
  #else //OPS_MPI
  double *arg2h = (double *)(((ops_reduction)args[2].data)->data);
  #endif //OPS_MPI
  #ifdef OPS_MPI
  double *arg3h = (double *)(((ops_reduction)args[3].data)->data + ((ops_reduction)args[3].data)->size * block->index);
  #else //OPS_MPI
  double *arg3h = (double *)(((ops_reduction)args[3].data)->data);
  #endif //OPS_MPI
  #ifdef OPS_MPI
  double *arg5h = (double *)(((ops_reduction)args[5].data)->data + ((ops_reduction)args[5].data)->size * block->index);
  #else //OPS_MPI
  double *arg5h = (double *)(((ops_reduction)args[5].data)->data);
  #endif //OPS_MPI

  #ifdef _OPENMP
  int nthreads = omp_get_max_threads( );
  #else
  int nthreads = 1;
  #endif
  //allocate and initialise arrays for global reduction
  //assumes a max of MAX_REDUCT_THREADS threads with a cacche line size of 64 bytes
  double arg_gbl2[MAX(1 , 64) * MAX_REDUCT_THREADS];
  double arg_gbl3[MAX(1 , 64) * MAX_REDUCT_THREADS];
  double arg_gbl5[MAX(1 , 64) * MAX_REDUCT_THREADS];
  for ( int thr=0; thr<nthreads; thr++ ){
    for ( int d=0; d<1; d++ ){
      arg_gbl2[d+64*thr] = ZERO_double;
    }
    for ( int d=0; d<1; d++ ){
      arg_gbl3[d+64*thr] = ZERO_double;
    }
    for ( int d=0; d<1; d++ ){
      arg_gbl5[d+64*thr] = ZERO_double;
    }
  }
  xdim0 = args[0].dat->size[0];
  ydim0 = args[0].dat->size[1];
  xdim1 = args[1].dat->size[0];
  ydim1 = args[1].dat->size[1];
  xdim4 = args[4].dat->size[0];
  ydim4 = args[4].dat->size[1];

  ops_H_D_exchanges_host(args, 6);

  //Halo Exchanges
  ops_halo_exchanges(args,6,range);


  ops_timers_core(&c2,&t2);
  OPS_kernels[39].mpi_time += t2-t1;


  #pragma omp parallel for
  for ( int thr=0; thr<nthreads; thr++ ){

    int z_size = end[2]-start[2];
    char *p_a[6];

    int start_i = start[2] + ((z_size-1)/nthreads+1)*thr;
    int finish_i = start[2] + MIN(((z_size-1)/nthreads+1)*(thr+1),z_size);

    //get address per thread
    int start0 = start[0];
    int start1 = start[1];
    int start2 = start_i;

    //set up initial pointers
    int d_m[OPS_MAX_DIM];
    #ifdef OPS_MPI
    for (int d = 0; d < dim; d++) d_m[d] = args[0].dat->d_m[d] + OPS_sub_dat_list[args[0].dat->index]->d_im[d];
    #else //OPS_MPI
    for (int d = 0; d < dim; d++) d_m[d] = args[0].dat->d_m[d];
    #endif //OPS_MPI
    int base0 = dat0 * 1 *
    (start0 * args[0].stencil->stride[0] - args[0].dat->base[0] - d_m[0]);
    base0 = base0+ dat0 *
      args[0].dat->size[0] *
      (start1 * args[0].stencil->stride[1] - args[0].dat->base[1] - d_m[1]);
    base0 = base0+ dat0 *
      args[0].dat->size[0] *
      args[0].dat->size[1] *
      (start2 * args[0].stencil->stride[2] - args[0].dat->base[2] - d_m[2]);
    p_a[0] = (char *)args[0].data + base0;

    #ifdef OPS_MPI
    for (int d = 0; d < dim; d++) d_m[d] = args[1].dat->d_m[d] + OPS_sub_dat_list[args[1].dat->index]->d_im[d];
    #else //OPS_MPI
    for (int d = 0; d < dim; d++) d_m[d] = args[1].dat->d_m[d];
    #endif //OPS_MPI
    int base1 = dat1 * 1 *
    (start0 * args[1].stencil->stride[0] - args[1].dat->base[0] - d_m[0]);
    base1 = base1+ dat1 *
      args[1].dat->size[0] *
      (start1 * args[1].stencil->stride[1] - args[1].dat->base[1] - d_m[1]);
    base1 = base1+ dat1 *
      args[1].dat->size[0] *
      args[1].dat->size[1] *
      (start2 * args[1].stencil->stride[2] - args[1].dat->base[2] - d_m[2]);
    p_a[1] = (char *)args[1].data + base1;

    p_a[2] = (char *)arg2h;

    p_a[3] = (char *)arg3h;

    #ifdef OPS_MPI
    for (int d = 0; d < dim; d++) d_m[d] = args[4].dat->d_m[d] + OPS_sub_dat_list[args[4].dat->index]->d_im[d];
    #else //OPS_MPI
    for (int d = 0; d < dim; d++) d_m[d] = args[4].dat->d_m[d];
    #endif //OPS_MPI
    int base4 = dat4 * 1 *
    (start0 * args[4].stencil->stride[0] - args[4].dat->base[0] - d_m[0]);
    base4 = base4+ dat4 *
      args[4].dat->size[0] *
      (start1 * args[4].stencil->stride[1] - args[4].dat->base[1] - d_m[1]);
    base4 = base4+ dat4 *
      args[4].dat->size[0] *
      args[4].dat->size[1] *
      (start2 * args[4].stencil->stride[2] - args[4].dat->base[2] - d_m[2]);
    p_a[4] = (char *)args[4].data + base4;

    p_a[5] = (char *)arg5h;


    for ( int n_z=start_i; n_z<finish_i; n_z++ ){
      for ( int n_y=start[1]; n_y<end[1]; n_y++ ){
        for ( int n_x=start[0]; n_x<start[0]+(end[0]-start[0])/SIMD_VEC; n_x++ ){
          //call kernel function, passing in pointers to data -vectorised
          for ( int i=0; i<SIMD_VEC; i++ ){
            calc_dt_kernel_get(  (const double * )p_a[0]+ i*1*1, (const double * )p_a[1]+ i*0*1, &arg_gbl2[64*thr],
           &arg_gbl3[64*thr], (const double * )p_a[4]+ i*0*1, &arg_gbl5[64*thr] );

          }

          //shift pointers to data x direction
          p_a[0]= p_a[0] + (dat0 * off0_0)*SIMD_VEC;
          p_a[1]= p_a[1] + (dat1 * off1_0)*SIMD_VEC;
          p_a[4]= p_a[4] + (dat4 * off4_0)*SIMD_VEC;
        }

        for ( int n_x=start[0]+((end[0]-start[0])/SIMD_VEC)*SIMD_VEC; n_x<end[0]; n_x++ ){
          //call kernel function, passing in pointers to data - remainder
          calc_dt_kernel_get(  (const double * )p_a[0], (const double * )p_a[1], &arg_gbl2[64*thr],
           &arg_gbl3[64*thr], (const double * )p_a[4], &arg_gbl5[64*thr] );


          //shift pointers to data x direction
          p_a[0]= p_a[0] + (dat0 * off0_0);
          p_a[1]= p_a[1] + (dat1 * off1_0);
          p_a[4]= p_a[4] + (dat4 * off4_0);
        }

        //shift pointers to data y direction
        p_a[0]= p_a[0] + (dat0 * off0_1);
        p_a[1]= p_a[1] + (dat1 * off1_1);
        p_a[4]= p_a[4] + (dat4 * off4_1);
      }
      //shift pointers to data z direction
      p_a[0]= p_a[0] + (dat0 * off0_2);
      p_a[1]= p_a[1] + (dat1 * off1_2);
      p_a[4]= p_a[4] + (dat4 * off4_2);
    }
  }

  ops_timers_core(&c1,&t1);
  OPS_kernels[39].time += t1-t2;


  // combine reduction data
  for ( int thr=0; thr<nthreads; thr++ ){
    for ( int d=0; d<1; d++ ){
      arg2h[d] += arg_gbl2[64*thr+d];
    }
    for ( int d=0; d<1; d++ ){
      arg3h[d] += arg_gbl3[64*thr+d];
    }
    for ( int d=0; d<1; d++ ){
      arg5h[d] += arg_gbl5[64*thr+d];
    }
  }
  ops_set_dirtybit_host(args, 6);


  //Update kernel record
  ops_timers_core(&c2,&t2);
  OPS_kernels[39].mpi_time += t2-t1;
  OPS_kernels[39].transfer += ops_compute_transfer(dim, range, &arg0);
  OPS_kernels[39].transfer += ops_compute_transfer(dim, range, &arg1);
  OPS_kernels[39].transfer += ops_compute_transfer(dim, range, &arg4);
}
