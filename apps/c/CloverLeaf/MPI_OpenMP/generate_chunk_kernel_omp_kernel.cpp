//
// auto-generated by ops.py
//
#ifdef _OPENMP
#include <omp.h>
#endif

//user function
inline
void generate_chunk_kernel( const double *vertexx, const double *vertexy,
                     double *energy0, double *density0,
                     double *xvel0,  double *yvel0,
                     const double *cellx, const double *celly) {

  double radius, x_cent, y_cent;


  energy0[OPS_ACC2(0,0)]= states[0].energy;
  density0[OPS_ACC3(0,0)]= states[0].density;
  xvel0[OPS_ACC4(0,0)]=states[0].xvel;
  yvel0[OPS_ACC5(0,0)]=states[0].yvel;

  for(int i = 1; i<number_of_states; i++) {

    x_cent=states[i].xmin;
    y_cent=states[i].ymin;

    if (states[i].geometry == g_rect) {
      if(vertexx[OPS_ACC0(1,0)] >= states[i].xmin  && vertexx[OPS_ACC0(0,0)] < states[i].xmax) {
        if(vertexy[OPS_ACC1(0,1)] >= states[i].ymin && vertexy[OPS_ACC1(0,0)] < states[i].ymax) {

          energy0[OPS_ACC2(0,0)] = states[i].energy;
          density0[OPS_ACC3(0,0)] = states[i].density;

          xvel0[OPS_ACC4(0,0)] = states[i].xvel;
          xvel0[OPS_ACC4(1,0)] = states[i].xvel;
          xvel0[OPS_ACC4(0,1)] = states[i].xvel;
          xvel0[OPS_ACC4(1,1)] = states[i].xvel;

          yvel0[OPS_ACC5(0,0)] = states[i].yvel;
          yvel0[OPS_ACC5(1,0)] = states[i].yvel;
          yvel0[OPS_ACC5(0,1)] = states[i].yvel;
          yvel0[OPS_ACC5(1,1)] = states[i].yvel;
        }
      }

    }
    else if(states[i].geometry == g_circ) {
      radius = sqrt ((cellx[OPS_ACC6(0,0)] - x_cent) * (cellx[OPS_ACC6(0,0)] - x_cent) +
                     (celly[OPS_ACC7(0,0)] - y_cent) * (celly[OPS_ACC7(0,0)] - y_cent));
      if(radius <= states[i].radius) {
        energy0[OPS_ACC2(0,0)] = states[i].energy;
        density0[OPS_ACC3(0,0)] = states[i].density;

        xvel0[OPS_ACC4(0,0)] = states[i].xvel;
        xvel0[OPS_ACC4(1,0)] = states[i].xvel;
        xvel0[OPS_ACC4(0,1)] = states[i].xvel;
        xvel0[OPS_ACC4(1,1)] = states[i].xvel;

        yvel0[OPS_ACC5(0,0)] = states[i].yvel;
        yvel0[OPS_ACC5(1,0)] = states[i].yvel;
        yvel0[OPS_ACC5(0,1)] = states[i].yvel;
        yvel0[OPS_ACC5(1,1)] = states[i].yvel;
      }
    }
    else if(states[i].geometry == g_point) {
      if(vertexx[OPS_ACC0(0,0)] == x_cent && vertexy[OPS_ACC1(0,0)] == y_cent) {
        energy0[OPS_ACC2(0,0)] = states[i].energy;
        density0[OPS_ACC3(0,0)] = states[i].density;

        xvel0[OPS_ACC4(0,0)] = states[i].xvel;
        xvel0[OPS_ACC4(1,0)] = states[i].xvel;
        xvel0[OPS_ACC4(0,1)] = states[i].xvel;
        xvel0[OPS_ACC4(1,1)] = states[i].xvel;

        yvel0[OPS_ACC5(0,0)] = states[i].yvel;
        yvel0[OPS_ACC5(1,0)] = states[i].yvel;
        yvel0[OPS_ACC5(0,1)] = states[i].yvel;
        yvel0[OPS_ACC5(1,1)] = states[i].yvel;
      }
    }
  }
}





// host stub function
void ops_par_loop_generate_chunk_kernel(char const *name, ops_block block, int dim, int* range,
 ops_arg arg0, ops_arg arg1, ops_arg arg2, ops_arg arg3,
 ops_arg arg4, ops_arg arg5, ops_arg arg6, ops_arg arg7) {

  //Timing
  double t1,t2,c1,c2;
  ops_timers_core(&c1,&t1);


  int  offs[8][2];
  ops_arg args[8] = { arg0, arg1, arg2, arg3, arg4, arg5, arg6, arg7};



  #ifdef CHECKPOINTING
  if (!ops_checkpointing_before(args,8,range,42)) return;
  #endif

  ops_timing_realloc(42,"generate_chunk_kernel");
  OPS_kernels[42].count++;

  //compute locally allocated range for the sub-block

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
  #ifdef OPS_DEBUG
  ops_register_args(args, "generate_chunk_kernel");
  #endif

  offs[0][0] = args[0].stencil->stride[0]*1;  //unit step in x dimension
  offs[0][1] = off2D(1, &start[0],
      &end[0],args[0].dat->size, args[0].stencil->stride) - offs[0][0];

  offs[1][0] = args[1].stencil->stride[0]*1;  //unit step in x dimension
  offs[1][1] = off2D(1, &start[0],
      &end[0],args[1].dat->size, args[1].stencil->stride) - offs[1][0];

  offs[2][0] = args[2].stencil->stride[0]*1;  //unit step in x dimension
  offs[2][1] = off2D(1, &start[0],
      &end[0],args[2].dat->size, args[2].stencil->stride) - offs[2][0];

  offs[3][0] = args[3].stencil->stride[0]*1;  //unit step in x dimension
  offs[3][1] = off2D(1, &start[0],
      &end[0],args[3].dat->size, args[3].stencil->stride) - offs[3][0];

  offs[4][0] = args[4].stencil->stride[0]*1;  //unit step in x dimension
  offs[4][1] = off2D(1, &start[0],
      &end[0],args[4].dat->size, args[4].stencil->stride) - offs[4][0];

  offs[5][0] = args[5].stencil->stride[0]*1;  //unit step in x dimension
  offs[5][1] = off2D(1, &start[0],
      &end[0],args[5].dat->size, args[5].stencil->stride) - offs[5][0];

  offs[6][0] = args[6].stencil->stride[0]*1;  //unit step in x dimension
  offs[6][1] = off2D(1, &start[0],
      &end[0],args[6].dat->size, args[6].stencil->stride) - offs[6][0];

  offs[7][0] = args[7].stencil->stride[0]*1;  //unit step in x dimension
  offs[7][1] = off2D(1, &start[0],
      &end[0],args[7].dat->size, args[7].stencil->stride) - offs[7][0];



  int off0_0 = offs[0][0];
  int off0_1 = offs[0][1];
  int dat0 = args[0].dat->elem_size;
  int off1_0 = offs[1][0];
  int off1_1 = offs[1][1];
  int dat1 = args[1].dat->elem_size;
  int off2_0 = offs[2][0];
  int off2_1 = offs[2][1];
  int dat2 = args[2].dat->elem_size;
  int off3_0 = offs[3][0];
  int off3_1 = offs[3][1];
  int dat3 = args[3].dat->elem_size;
  int off4_0 = offs[4][0];
  int off4_1 = offs[4][1];
  int dat4 = args[4].dat->elem_size;
  int off5_0 = offs[5][0];
  int off5_1 = offs[5][1];
  int dat5 = args[5].dat->elem_size;
  int off6_0 = offs[6][0];
  int off6_1 = offs[6][1];
  int dat6 = args[6].dat->elem_size;
  int off7_0 = offs[7][0];
  int off7_1 = offs[7][1];
  int dat7 = args[7].dat->elem_size;


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
  xdim6 = args[6].dat->size[0];
  xdim7 = args[7].dat->size[0];

  ops_H_D_exchanges_host(args, 8);

  //Halo Exchanges
  ops_halo_exchanges(args,8,range);


  ops_timers_core(&c2,&t2);
  OPS_kernels[42].mpi_time += t2-t1;


  #pragma omp parallel for
  for ( int thr=0; thr<nthreads; thr++ ){

    int y_size = end[1]-start[1];
    char *p_a[8];

    int start_i = start[1] + ((y_size-1)/nthreads+1)*thr;
    int finish_i = start[1] + MIN(((y_size-1)/nthreads+1)*(thr+1),y_size);

    //get address per thread
    int start0 = start[0];
    int start1 = start_i;

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
    p_a[1] = (char *)args[1].data + base1;

    #ifdef OPS_MPI
    for (int d = 0; d < dim; d++) d_m[d] = args[2].dat->d_m[d] + OPS_sub_dat_list[args[2].dat->index]->d_im[d];
    #else //OPS_MPI
    for (int d = 0; d < dim; d++) d_m[d] = args[2].dat->d_m[d];
    #endif //OPS_MPI
    int base2 = dat2 * 1 *
    (start0 * args[2].stencil->stride[0] - args[2].dat->base[0] - d_m[0]);
    base2 = base2+ dat2 *
      args[2].dat->size[0] *
      (start1 * args[2].stencil->stride[1] - args[2].dat->base[1] - d_m[1]);
    p_a[2] = (char *)args[2].data + base2;

    #ifdef OPS_MPI
    for (int d = 0; d < dim; d++) d_m[d] = args[3].dat->d_m[d] + OPS_sub_dat_list[args[3].dat->index]->d_im[d];
    #else //OPS_MPI
    for (int d = 0; d < dim; d++) d_m[d] = args[3].dat->d_m[d];
    #endif //OPS_MPI
    int base3 = dat3 * 1 *
    (start0 * args[3].stencil->stride[0] - args[3].dat->base[0] - d_m[0]);
    base3 = base3+ dat3 *
      args[3].dat->size[0] *
      (start1 * args[3].stencil->stride[1] - args[3].dat->base[1] - d_m[1]);
    p_a[3] = (char *)args[3].data + base3;

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
    p_a[4] = (char *)args[4].data + base4;

    #ifdef OPS_MPI
    for (int d = 0; d < dim; d++) d_m[d] = args[5].dat->d_m[d] + OPS_sub_dat_list[args[5].dat->index]->d_im[d];
    #else //OPS_MPI
    for (int d = 0; d < dim; d++) d_m[d] = args[5].dat->d_m[d];
    #endif //OPS_MPI
    int base5 = dat5 * 1 *
    (start0 * args[5].stencil->stride[0] - args[5].dat->base[0] - d_m[0]);
    base5 = base5+ dat5 *
      args[5].dat->size[0] *
      (start1 * args[5].stencil->stride[1] - args[5].dat->base[1] - d_m[1]);
    p_a[5] = (char *)args[5].data + base5;

    #ifdef OPS_MPI
    for (int d = 0; d < dim; d++) d_m[d] = args[6].dat->d_m[d] + OPS_sub_dat_list[args[6].dat->index]->d_im[d];
    #else //OPS_MPI
    for (int d = 0; d < dim; d++) d_m[d] = args[6].dat->d_m[d];
    #endif //OPS_MPI
    int base6 = dat6 * 1 *
    (start0 * args[6].stencil->stride[0] - args[6].dat->base[0] - d_m[0]);
    base6 = base6+ dat6 *
      args[6].dat->size[0] *
      (start1 * args[6].stencil->stride[1] - args[6].dat->base[1] - d_m[1]);
    p_a[6] = (char *)args[6].data + base6;

    #ifdef OPS_MPI
    for (int d = 0; d < dim; d++) d_m[d] = args[7].dat->d_m[d] + OPS_sub_dat_list[args[7].dat->index]->d_im[d];
    #else //OPS_MPI
    for (int d = 0; d < dim; d++) d_m[d] = args[7].dat->d_m[d];
    #endif //OPS_MPI
    int base7 = dat7 * 1 *
    (start0 * args[7].stencil->stride[0] - args[7].dat->base[0] - d_m[0]);
    base7 = base7+ dat7 *
      args[7].dat->size[0] *
      (start1 * args[7].stencil->stride[1] - args[7].dat->base[1] - d_m[1]);
    p_a[7] = (char *)args[7].data + base7;


    for ( int n_y=start_i; n_y<finish_i; n_y++ ){
      for ( int n_x=start[0]; n_x<start[0]+(end[0]-start[0])/SIMD_VEC; n_x++ ){
        //call kernel function, passing in pointers to data -vectorised
        #pragma simd
        for ( int i=0; i<SIMD_VEC; i++ ){
          generate_chunk_kernel(  (const double * )p_a[0]+ i*1*1, (const double * )p_a[1]+ i*0*1, (double * )p_a[2]+ i*1*1,
           (double * )p_a[3]+ i*1*1, (double * )p_a[4]+ i*1*1, (double * )p_a[5]+ i*1*1, (const double * )p_a[6]+ i*1*1,
           (const double * )p_a[7]+ i*0*1 );

        }

        //shift pointers to data x direction
        p_a[0]= p_a[0] + (dat0 * off0_0)*SIMD_VEC;
        p_a[1]= p_a[1] + (dat1 * off1_0)*SIMD_VEC;
        p_a[2]= p_a[2] + (dat2 * off2_0)*SIMD_VEC;
        p_a[3]= p_a[3] + (dat3 * off3_0)*SIMD_VEC;
        p_a[4]= p_a[4] + (dat4 * off4_0)*SIMD_VEC;
        p_a[5]= p_a[5] + (dat5 * off5_0)*SIMD_VEC;
        p_a[6]= p_a[6] + (dat6 * off6_0)*SIMD_VEC;
        p_a[7]= p_a[7] + (dat7 * off7_0)*SIMD_VEC;
      }

      for ( int n_x=start[0]+((end[0]-start[0])/SIMD_VEC)*SIMD_VEC; n_x<end[0]; n_x++ ){
        //call kernel function, passing in pointers to data - remainder
        generate_chunk_kernel(  (const double * )p_a[0], (const double * )p_a[1], (double * )p_a[2],
           (double * )p_a[3], (double * )p_a[4], (double * )p_a[5], (const double * )p_a[6],
           (const double * )p_a[7] );


        //shift pointers to data x direction
        p_a[0]= p_a[0] + (dat0 * off0_0);
        p_a[1]= p_a[1] + (dat1 * off1_0);
        p_a[2]= p_a[2] + (dat2 * off2_0);
        p_a[3]= p_a[3] + (dat3 * off3_0);
        p_a[4]= p_a[4] + (dat4 * off4_0);
        p_a[5]= p_a[5] + (dat5 * off5_0);
        p_a[6]= p_a[6] + (dat6 * off6_0);
        p_a[7]= p_a[7] + (dat7 * off7_0);
      }

      //shift pointers to data y direction
      p_a[0]= p_a[0] + (dat0 * off0_1);
      p_a[1]= p_a[1] + (dat1 * off1_1);
      p_a[2]= p_a[2] + (dat2 * off2_1);
      p_a[3]= p_a[3] + (dat3 * off3_1);
      p_a[4]= p_a[4] + (dat4 * off4_1);
      p_a[5]= p_a[5] + (dat5 * off5_1);
      p_a[6]= p_a[6] + (dat6 * off6_1);
      p_a[7]= p_a[7] + (dat7 * off7_1);
    }
  }

  ops_timers_core(&c1,&t1);
  OPS_kernels[42].time += t1-t2;

  ops_set_dirtybit_host(args, 8);

  ops_set_halo_dirtybit3(&args[2],range);
  ops_set_halo_dirtybit3(&args[3],range);
  ops_set_halo_dirtybit3(&args[4],range);
  ops_set_halo_dirtybit3(&args[5],range);

  //Update kernel record
  ops_timers_core(&c2,&t2);
  OPS_kernels[42].mpi_time += t2-t1;
  OPS_kernels[42].transfer += ops_compute_transfer(dim, range, &arg0);
  OPS_kernels[42].transfer += ops_compute_transfer(dim, range, &arg1);
  OPS_kernels[42].transfer += ops_compute_transfer(dim, range, &arg2);
  OPS_kernels[42].transfer += ops_compute_transfer(dim, range, &arg3);
  OPS_kernels[42].transfer += ops_compute_transfer(dim, range, &arg4);
  OPS_kernels[42].transfer += ops_compute_transfer(dim, range, &arg5);
  OPS_kernels[42].transfer += ops_compute_transfer(dim, range, &arg6);
  OPS_kernels[42].transfer += ops_compute_transfer(dim, range, &arg7);
}
