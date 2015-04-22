//
// auto-generated by ops.py
//
#ifdef _OPENMP
#include <omp.h>
#endif

//user function
inline
void save_kernel(double *rho_old, double *rhou_old, double *rhoE_old,
                       const double *rho_new, const double *rhou_new, const double *rhoE_new) {
      rho_old[OPS_ACC0(0)]=rho_new[OPS_ACC3(0)];
      rhou_old[OPS_ACC1(0)]=rhou_new[OPS_ACC4(0)];
      rhoE_old[OPS_ACC2(0)]=rhoE_new[OPS_ACC5(0)];
}





// host stub function
void ops_par_loop_save_kernel(char const *name, ops_block block, int dim, int* range,
 ops_arg arg0, ops_arg arg1, ops_arg arg2, ops_arg arg3,
 ops_arg arg4, ops_arg arg5) {

  //Timing
  double t1,t2,c1,c2;
  ops_timers_core(&c1,&t1);


  int  offs[6][1];
  ops_arg args[6] = { arg0, arg1, arg2, arg3, arg4, arg5};



  #ifdef CHECKPOINTING
  if (!ops_checkpointing_before(args,6,range,1)) return;
  #endif

  ops_timing_realloc(1,"save_kernel");
  OPS_kernels[1].count++;

  //compute locally allocated range for the sub-block

  int start[1];
  int end[1];

  #ifdef OPS_MPI
  sub_block_list sb = OPS_sub_block_list[block->index];
  if (!sb->owned) return;
  for ( int n=0; n<1; n++ ){
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
  for ( int n=0; n<1; n++ ){
    start[n] = range[2*n];end[n] = range[2*n+1];
  }
  #endif //OPS_MPI
  #ifdef OPS_DEBUG
  ops_register_args(args, "save_kernel");
  #endif

  offs[0][0] = args[0].stencil->stride[0]*1;  //unit step in x dimension

  offs[1][0] = args[1].stencil->stride[0]*1;  //unit step in x dimension

  offs[2][0] = args[2].stencil->stride[0]*1;  //unit step in x dimension

  offs[3][0] = args[3].stencil->stride[0]*1;  //unit step in x dimension

  offs[4][0] = args[4].stencil->stride[0]*1;  //unit step in x dimension

  offs[5][0] = args[5].stencil->stride[0]*1;  //unit step in x dimension



  int off0_0 = offs[0][0];
  int dat0 = args[0].dat->elem_size;
  int off1_0 = offs[1][0];
  int dat1 = args[1].dat->elem_size;
  int off2_0 = offs[2][0];
  int dat2 = args[2].dat->elem_size;
  int off3_0 = offs[3][0];
  int dat3 = args[3].dat->elem_size;
  int off4_0 = offs[4][0];
  int dat4 = args[4].dat->elem_size;
  int off5_0 = offs[5][0];
  int dat5 = args[5].dat->elem_size;


  #ifdef _OPENMP
  int nthreads = omp_get_max_threads( );
  #else
  int nthreads = 1;
  #endif
  xdim0 = args[0].dat->size[0];
  xdim1 = args[1].dat->size[0];
  xdim2 = args[2].dat->size[0];
  xdim3 = args[3].dat->size[0];
  xdim4 = args[4].dat->size[0];
  xdim5 = args[5].dat->size[0];

  ops_H_D_exchanges_host(args, 6);

  //Halo Exchanges
  ops_halo_exchanges(args,6,range);


  ops_timers_core(&c2,&t2);
  OPS_kernels[1].mpi_time += t2-t1;


  #pragma omp parallel for
  for ( int thr=0; thr<nthreads; thr++ ){

    int x_size = end[0]-start[0];
    char *p_a[6];

    int start_i = start[0] + ((x_size-1)/nthreads+1)*thr;
    int finish_i = start[0] + MIN(((x_size-1)/nthreads+1)*(thr+1),x_size);

    //get address per thread
    int start0 = start_i;

    //set up initial pointers
    int d_m[OPS_MAX_DIM];
    #ifdef OPS_MPI
    for (int d = 0; d < dim; d++) d_m[d] = args[0].dat->d_m[d] + OPS_sub_dat_list[args[0].dat->index]->d_im[d];
    #else //OPS_MPI
    for (int d = 0; d < dim; d++) d_m[d] = args[0].dat->d_m[d];
    #endif //OPS_MPI
    int base0 = dat0 * 1 *
    (start0 * args[0].stencil->stride[0] - args[0].dat->base[0] - d_m[0]);
    p_a[0] = (char *)args[0].data + base0;

    #ifdef OPS_MPI
    for (int d = 0; d < dim; d++) d_m[d] = args[1].dat->d_m[d] + OPS_sub_dat_list[args[1].dat->index]->d_im[d];
    #else //OPS_MPI
    for (int d = 0; d < dim; d++) d_m[d] = args[1].dat->d_m[d];
    #endif //OPS_MPI
    int base1 = dat1 * 1 *
    (start0 * args[1].stencil->stride[0] - args[1].dat->base[0] - d_m[0]);
    p_a[1] = (char *)args[1].data + base1;

    #ifdef OPS_MPI
    for (int d = 0; d < dim; d++) d_m[d] = args[2].dat->d_m[d] + OPS_sub_dat_list[args[2].dat->index]->d_im[d];
    #else //OPS_MPI
    for (int d = 0; d < dim; d++) d_m[d] = args[2].dat->d_m[d];
    #endif //OPS_MPI
    int base2 = dat2 * 1 *
    (start0 * args[2].stencil->stride[0] - args[2].dat->base[0] - d_m[0]);
    p_a[2] = (char *)args[2].data + base2;

    #ifdef OPS_MPI
    for (int d = 0; d < dim; d++) d_m[d] = args[3].dat->d_m[d] + OPS_sub_dat_list[args[3].dat->index]->d_im[d];
    #else //OPS_MPI
    for (int d = 0; d < dim; d++) d_m[d] = args[3].dat->d_m[d];
    #endif //OPS_MPI
    int base3 = dat3 * 1 *
    (start0 * args[3].stencil->stride[0] - args[3].dat->base[0] - d_m[0]);
    p_a[3] = (char *)args[3].data + base3;

    #ifdef OPS_MPI
    for (int d = 0; d < dim; d++) d_m[d] = args[4].dat->d_m[d] + OPS_sub_dat_list[args[4].dat->index]->d_im[d];
    #else //OPS_MPI
    for (int d = 0; d < dim; d++) d_m[d] = args[4].dat->d_m[d];
    #endif //OPS_MPI
    int base4 = dat4 * 1 *
    (start0 * args[4].stencil->stride[0] - args[4].dat->base[0] - d_m[0]);
    p_a[4] = (char *)args[4].data + base4;

    #ifdef OPS_MPI
    for (int d = 0; d < dim; d++) d_m[d] = args[5].dat->d_m[d] + OPS_sub_dat_list[args[5].dat->index]->d_im[d];
    #else //OPS_MPI
    for (int d = 0; d < dim; d++) d_m[d] = args[5].dat->d_m[d];
    #endif //OPS_MPI
    int base5 = dat5 * 1 *
    (start0 * args[5].stencil->stride[0] - args[5].dat->base[0] - d_m[0]);
    p_a[5] = (char *)args[5].data + base5;


    for ( int n_x=start_i; n_x<start_i+(finish_i-start_i)/SIMD_VEC; n_x++ ){
      //call kernel function, passing in pointers to data -vectorised
      #pragma simd
      for ( int i=0; i<SIMD_VEC; i++ ){
        save_kernel(  (double * )p_a[0]+ i*1*1, (double * )p_a[1]+ i*1*1, (double * )p_a[2]+ i*1*1,
           (const double * )p_a[3]+ i*1*1, (const double * )p_a[4]+ i*1*1, (const double * )p_a[5]+ i*1*1 );

      }

      //shift pointers to data x direction
      p_a[0]= p_a[0] + (dat0 * off0_0)*SIMD_VEC;
      p_a[1]= p_a[1] + (dat1 * off1_0)*SIMD_VEC;
      p_a[2]= p_a[2] + (dat2 * off2_0)*SIMD_VEC;
      p_a[3]= p_a[3] + (dat3 * off3_0)*SIMD_VEC;
      p_a[4]= p_a[4] + (dat4 * off4_0)*SIMD_VEC;
      p_a[5]= p_a[5] + (dat5 * off5_0)*SIMD_VEC;
    }

    for ( int n_x=start_i+((finish_i-start_i)/SIMD_VEC)*SIMD_VEC; n_x<finish_i; n_x++ ){
      //call kernel function, passing in pointers to data - remainder
      save_kernel(  (double * )p_a[0], (double * )p_a[1], (double * )p_a[2],
           (const double * )p_a[3], (const double * )p_a[4], (const double * )p_a[5] );


      //shift pointers to data x direction
      p_a[0]= p_a[0] + (dat0 * off0_0);
      p_a[1]= p_a[1] + (dat1 * off1_0);
      p_a[2]= p_a[2] + (dat2 * off2_0);
      p_a[3]= p_a[3] + (dat3 * off3_0);
      p_a[4]= p_a[4] + (dat4 * off4_0);
      p_a[5]= p_a[5] + (dat5 * off5_0);
    }

  }

  ops_timers_core(&c1,&t1);
  OPS_kernels[1].time += t1-t2;

  ops_set_dirtybit_host(args, 6);

  ops_set_halo_dirtybit3(&args[0],range);
  ops_set_halo_dirtybit3(&args[1],range);
  ops_set_halo_dirtybit3(&args[2],range);

  //Update kernel record
  ops_timers_core(&c2,&t2);
  OPS_kernels[1].mpi_time += t2-t1;
  OPS_kernels[1].transfer += ops_compute_transfer(dim, range, &arg0);
  OPS_kernels[1].transfer += ops_compute_transfer(dim, range, &arg1);
  OPS_kernels[1].transfer += ops_compute_transfer(dim, range, &arg2);
  OPS_kernels[1].transfer += ops_compute_transfer(dim, range, &arg3);
  OPS_kernels[1].transfer += ops_compute_transfer(dim, range, &arg4);
  OPS_kernels[1].transfer += ops_compute_transfer(dim, range, &arg5);
}
