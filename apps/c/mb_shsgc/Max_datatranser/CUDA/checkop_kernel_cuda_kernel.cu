//
// auto-generated by ops.py
//
__constant__ int xdim0_checkop_kernel;
int xdim0_checkop_kernel_h = -1;
int ydim0_checkop_kernel_h = -1;
__constant__ int xdim1_checkop_kernel;
int xdim1_checkop_kernel_h = -1;
int ydim1_checkop_kernel_h = -1;
__constant__ int xdim2_checkop_kernel;
int xdim2_checkop_kernel_h = -1;
int ydim2_checkop_kernel_h = -1;

#define OPS_ACC0(x) (x)
#define OPS_ACC1(x) (x)
#define OPS_ACC2(x) (x)

//user function
__device__

void checkop_kernel(const double *rho_new, const double *x, const double *rhoin, double *pre, double *post,
  int *num) {

  double diff;
  diff = (rho_new[OPS_ACC0(0)] - rhoin[OPS_ACC2(0)]);
  if(fabs(diff)<0.01 && x[OPS_ACC1(0)] > -4.1){
    *post = *post + diff*diff;
    *num = *num + 1;

  }
  else
    *pre = *pre + (rho_new[OPS_ACC0(0)] - rhol)* (rho_new[OPS_ACC0(0)] - rhol);
}



#undef OPS_ACC0
#undef OPS_ACC1
#undef OPS_ACC2


__global__ void ops_checkop_kernel(
const double* __restrict arg0,
const double* __restrict arg1,
const double* __restrict arg2,
double* __restrict arg3,
double* __restrict arg4,
int* __restrict arg5,
int size0 ){

  double arg3_l[1];
  double arg4_l[1];
  int arg5_l[1];
  for (int d=0; d<1; d++) arg3_l[d] = ZERO_double;
  for (int d=0; d<1; d++) arg4_l[d] = ZERO_double;
  for (int d=0; d<1; d++) arg5_l[d] = ZERO_int;

  int idx_x = blockDim.x * blockIdx.x + threadIdx.x;

  arg0 += idx_x * 1*1;
  arg1 += idx_x * 1*1;
  arg2 += idx_x * 1*1;

  if (idx_x < size0) {
    checkop_kernel(arg0, arg1, arg2, arg3_l,
                   arg4_l, arg5_l);
  }
  for (int d=0; d<1; d++)
    ops_reduction_cuda<OPS_INC>(&arg3[d+(blockIdx.x + blockIdx.y*gridDim.x)*1],arg3_l[d]);
  for (int d=0; d<1; d++)
    ops_reduction_cuda<OPS_INC>(&arg4[d+(blockIdx.x + blockIdx.y*gridDim.x)*1],arg4_l[d]);
  for (int d=0; d<1; d++)
    ops_reduction_cuda<OPS_INC>(&arg5[d+(blockIdx.x + blockIdx.y*gridDim.x)*1],arg5_l[d]);

}

// host stub function
void ops_par_loop_checkop_kernel(char const *name, ops_block block, int dim, int* range,
 ops_arg arg0, ops_arg arg1, ops_arg arg2, ops_arg arg3,
 ops_arg arg4, ops_arg arg5) {

  ops_arg args[6] = { arg0, arg1, arg2, arg3, arg4, arg5};


  #ifdef CHECKPOINTING
  if (!ops_checkpointing_before(args,6,range,14)) return;
  #endif

  ops_timing_realloc(14,"checkop_kernel");
  OPS_kernels[14].count++;

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

  int x_size = MAX(0,end[0]-start[0]);

  int xdim0 = args[0].dat->size[0];
  int xdim1 = args[1].dat->size[0];
  int xdim2 = args[2].dat->size[0];


  //Timing
  double t1,t2,c1,c2;
  ops_timers_core(&c2,&t2);

  if (xdim0 != xdim0_checkop_kernel_h || xdim1 != xdim1_checkop_kernel_h || xdim2 != xdim2_checkop_kernel_h) {
    cudaMemcpyToSymbol( xdim0_checkop_kernel, &xdim0, sizeof(int) );
    xdim0_checkop_kernel_h = xdim0;
    cudaMemcpyToSymbol( xdim1_checkop_kernel, &xdim1, sizeof(int) );
    xdim1_checkop_kernel_h = xdim1;
    cudaMemcpyToSymbol( xdim2_checkop_kernel, &xdim2, sizeof(int) );
    xdim2_checkop_kernel_h = xdim2;
  }


  #ifdef OPS_MPI
  double *arg3h = (double *)(((ops_reduction)args[3].data)->data + ((ops_reduction)args[3].data)->size * block->index);
  #else //OPS_MPI
  double *arg3h = (double *)(((ops_reduction)args[3].data)->data);
  #endif //OPS_MPI
  #ifdef OPS_MPI
  double *arg4h = (double *)(((ops_reduction)args[4].data)->data + ((ops_reduction)args[4].data)->size * block->index);
  #else //OPS_MPI
  double *arg4h = (double *)(((ops_reduction)args[4].data)->data);
  #endif //OPS_MPI
  #ifdef OPS_MPI
  int *arg5h = (int *)(((ops_reduction)args[5].data)->data + ((ops_reduction)args[5].data)->size * block->index);
  #else //OPS_MPI
  int *arg5h = (int *)(((ops_reduction)args[5].data)->data);
  #endif //OPS_MPI

  dim3 grid( (x_size-1)/OPS_block_size_x+ 1, 1, 1);
  dim3 tblock(OPS_block_size_x,1,1);

  int nblocks = ((x_size-1)/OPS_block_size_x+ 1);
  int maxblocks = nblocks;
  int reduct_bytes = 0;
  int reduct_size = 0;

  reduct_bytes += ROUND_UP(maxblocks*1*sizeof(double));
  reduct_size = MAX(reduct_size,sizeof(double)*1);
  reduct_bytes += ROUND_UP(maxblocks*1*sizeof(double));
  reduct_size = MAX(reduct_size,sizeof(double)*1);
  reduct_bytes += ROUND_UP(maxblocks*1*sizeof(int));
  reduct_size = MAX(reduct_size,sizeof(int)*1);

  reallocReductArrays(reduct_bytes);
  reduct_bytes = 0;

  arg3.data = OPS_reduct_h + reduct_bytes;
  arg3.data_d = OPS_reduct_d + reduct_bytes;
  for (int b=0; b<maxblocks; b++)
  for (int d=0; d<1; d++) ((double *)arg3.data)[d+b*1] = ZERO_double;
  reduct_bytes += ROUND_UP(maxblocks*1*sizeof(double));

  arg4.data = OPS_reduct_h + reduct_bytes;
  arg4.data_d = OPS_reduct_d + reduct_bytes;
  for (int b=0; b<maxblocks; b++)
  for (int d=0; d<1; d++) ((double *)arg4.data)[d+b*1] = ZERO_double;
  reduct_bytes += ROUND_UP(maxblocks*1*sizeof(double));

  arg5.data = OPS_reduct_h + reduct_bytes;
  arg5.data_d = OPS_reduct_d + reduct_bytes;
  for (int b=0; b<maxblocks; b++)
  for (int d=0; d<1; d++) ((int *)arg5.data)[d+b*1] = ZERO_int;
  reduct_bytes += ROUND_UP(maxblocks*1*sizeof(int));


  mvReductArraysToDevice(reduct_bytes);
  int dat0 = args[0].dat->elem_size;
  int dat1 = args[1].dat->elem_size;
  int dat2 = args[2].dat->elem_size;

  char *p_a[6];

  //set up initial pointers
  int d_m[OPS_MAX_DIM];
  #ifdef OPS_MPI
  for (int d = 0; d < dim; d++) d_m[d] = args[0].dat->d_m[d] + OPS_sub_dat_list[args[0].dat->index]->d_im[d];
  #else //OPS_MPI
  for (int d = 0; d < dim; d++) d_m[d] = args[0].dat->d_m[d];
  #endif //OPS_MPI
  int base0 = dat0 * 1 *
  (start[0] * args[0].stencil->stride[0] - args[0].dat->base[0] - d_m[0]);
  p_a[0] = (char *)args[0].data_d + base0;

  #ifdef OPS_MPI
  for (int d = 0; d < dim; d++) d_m[d] = args[1].dat->d_m[d] + OPS_sub_dat_list[args[1].dat->index]->d_im[d];
  #else //OPS_MPI
  for (int d = 0; d < dim; d++) d_m[d] = args[1].dat->d_m[d];
  #endif //OPS_MPI
  int base1 = dat1 * 1 *
  (start[0] * args[1].stencil->stride[0] - args[1].dat->base[0] - d_m[0]);
  p_a[1] = (char *)args[1].data_d + base1;

  #ifdef OPS_MPI
  for (int d = 0; d < dim; d++) d_m[d] = args[2].dat->d_m[d] + OPS_sub_dat_list[args[2].dat->index]->d_im[d];
  #else //OPS_MPI
  for (int d = 0; d < dim; d++) d_m[d] = args[2].dat->d_m[d];
  #endif //OPS_MPI
  int base2 = dat2 * 1 *
  (start[0] * args[2].stencil->stride[0] - args[2].dat->base[0] - d_m[0]);
  p_a[2] = (char *)args[2].data_d + base2;


  ops_H_D_exchanges_device(args, 6);
  ops_halo_exchanges(args,6,range);

  ops_timers_core(&c1,&t1);
  OPS_kernels[14].mpi_time += t1-t2;

  int nshared = 0;
  int nthread = OPS_block_size_x*OPS_block_size_y;

  nshared = MAX(nshared,sizeof(double)*1);
  nshared = MAX(nshared,sizeof(double)*1);
  nshared = MAX(nshared,sizeof(int)*1);

  nshared = MAX(nshared*nthread,reduct_size*nthread);

  //call kernel wrapper function, passing in pointers to data
  ops_checkop_kernel<<<grid, tblock, nshared >>> (  (double *)p_a[0], (double *)p_a[1],
           (double *)p_a[2], (double *)arg3.data_d,
           (double *)arg4.data_d, (int *)arg5.data_d,x_size);

  mvReductArraysToHost(reduct_bytes);
  for ( int b=0; b<maxblocks; b++ ){
    for ( int d=0; d<1; d++ ){
      arg3h[d] = arg3h[d] + ((double *)arg3.data)[d+b*1];
    }
  }
  arg3.data = (char *)arg3h;

  for ( int b=0; b<maxblocks; b++ ){
    for ( int d=0; d<1; d++ ){
      arg4h[d] = arg4h[d] + ((double *)arg4.data)[d+b*1];
    }
  }
  arg4.data = (char *)arg4h;

  for ( int b=0; b<maxblocks; b++ ){
    for ( int d=0; d<1; d++ ){
      arg5h[d] = arg5h[d] + ((int *)arg5.data)[d+b*1];
    }
  }
  arg5.data = (char *)arg5h;

  if (OPS_diags>1) {
    cutilSafeCall(cudaDeviceSynchronize());
  }
  ops_timers_core(&c2,&t2);
  OPS_kernels[14].time += t2-t1;
  ops_set_dirtybit_device(args, 6);

  //Update kernel record
  OPS_kernels[14].transfer += ops_compute_transfer(dim, range, &arg0);
  OPS_kernels[14].transfer += ops_compute_transfer(dim, range, &arg1);
  OPS_kernels[14].transfer += ops_compute_transfer(dim, range, &arg2);
}
