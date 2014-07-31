//
// auto-generated by ops.py on 2014-07-31 12:24
//

__constant__ int xdim0_advec_cell_kernel2_ydir;
__constant__ int ydim0_advec_cell_kernel2_ydir;
__constant__ int xdim1_advec_cell_kernel2_ydir;
__constant__ int ydim1_advec_cell_kernel2_ydir;
__constant__ int xdim2_advec_cell_kernel2_ydir;
__constant__ int ydim2_advec_cell_kernel2_ydir;
__constant__ int xdim3_advec_cell_kernel2_ydir;
__constant__ int ydim3_advec_cell_kernel2_ydir;
__constant__ int xdim4_advec_cell_kernel2_ydir;
__constant__ int ydim4_advec_cell_kernel2_ydir;

#define OPS_ACC0(x,y,z) (x+xdim0_advec_cell_kernel2_ydir*(y)+xdim0_advec_cell_kernel2_ydir*ydim0_advec_cell_kernel2_ydir*(z))
#define OPS_ACC1(x,y,z) (x+xdim1_advec_cell_kernel2_ydir*(y)+xdim1_advec_cell_kernel2_ydir*ydim1_advec_cell_kernel2_ydir*(z))
#define OPS_ACC2(x,y,z) (x+xdim2_advec_cell_kernel2_ydir*(y)+xdim2_advec_cell_kernel2_ydir*ydim2_advec_cell_kernel2_ydir*(z))
#define OPS_ACC3(x,y,z) (x+xdim3_advec_cell_kernel2_ydir*(y)+xdim3_advec_cell_kernel2_ydir*ydim3_advec_cell_kernel2_ydir*(z))
#define OPS_ACC4(x,y,z) (x+xdim4_advec_cell_kernel2_ydir*(y)+xdim4_advec_cell_kernel2_ydir*ydim4_advec_cell_kernel2_ydir*(z))

//user function
__device__

inline void advec_cell_kernel2_ydir( double *pre_vol, double *post_vol, const double *volume,
                        const double *vol_flux_y, const double *vol_flux_x) {

  pre_vol[OPS_ACC0(0,0,0)] = volume[OPS_ACC2(0,0,0)] + vol_flux_y[OPS_ACC3(0,1,0)] - vol_flux_y[OPS_ACC3(0,0,0)]
                                                     + vol_flux_x[OPS_ACC4(1,0,0)] - vol_flux_x[OPS_ACC4(0,0,0)];
  post_vol[OPS_ACC1(0,0,0)]= pre_vol[OPS_ACC0(0,0,0)]-(vol_flux_y[OPS_ACC3(0,1,0)] - vol_flux_y[OPS_ACC3(0,0,0)]);

}



#undef OPS_ACC0
#undef OPS_ACC1
#undef OPS_ACC2
#undef OPS_ACC3
#undef OPS_ACC4


__global__ void ops_advec_cell_kernel2_ydir(
double* __restrict arg0,
double* __restrict arg1,
const double* __restrict arg2,
const double* __restrict arg3,
const double* __restrict arg4,
int size0,
int size1,
int size2 ){


  int idx_z = blockDim.z * blockIdx.z + threadIdx.z;
  int idx_y = blockDim.y * blockIdx.y + threadIdx.y;
  int idx_x = blockDim.x * blockIdx.x + threadIdx.x;

  arg0 += idx_x * 1 + idx_y * 1 * xdim0_advec_cell_kernel2_ydir + idx_z * 1 * xdim0_advec_cell_kernel2_ydir * ydim0_advec_cell_kernel2_ydir;
  arg1 += idx_x * 1 + idx_y * 1 * xdim1_advec_cell_kernel2_ydir + idx_z * 1 * xdim1_advec_cell_kernel2_ydir * ydim1_advec_cell_kernel2_ydir;
  arg2 += idx_x * 1 + idx_y * 1 * xdim2_advec_cell_kernel2_ydir + idx_z * 1 * xdim2_advec_cell_kernel2_ydir * ydim2_advec_cell_kernel2_ydir;
  arg3 += idx_x * 1 + idx_y * 1 * xdim3_advec_cell_kernel2_ydir + idx_z * 1 * xdim3_advec_cell_kernel2_ydir * ydim3_advec_cell_kernel2_ydir;
  arg4 += idx_x * 1 + idx_y * 1 * xdim4_advec_cell_kernel2_ydir + idx_z * 1 * xdim4_advec_cell_kernel2_ydir * ydim4_advec_cell_kernel2_ydir;

  if (idx_x < size0 && idx_y < size1 && idx_z < size2) {
    advec_cell_kernel2_ydir(arg0, arg1, arg2, arg3,
                   arg4);
  }

}

// host stub function
void ops_par_loop_advec_cell_kernel2_ydir(char const *name, ops_block Block, int dim, int* range,
 ops_arg arg0, ops_arg arg1, ops_arg arg2, ops_arg arg3,
 ops_arg arg4) {

  ops_arg args[5] = { arg0, arg1, arg2, arg3, arg4};

  sub_block_list sb = OPS_sub_block_list[Block->index];
  //compute localy allocated range for the sub-block
  int start_add[3];
  int end_add[3];
  for ( int n=0; n<3; n++ ){
    start_add[n] = sb->istart[n];end_add[n] = sb->iend[n]+1;
    if (start_add[n] >= range[2*n]) {
      start_add[n] = 0;
    }
    else {
      start_add[n] = range[2*n] - start_add[n];
    }
    if (end_add[n] >= range[2*n+1]) {
      end_add[n] = range[2*n+1] - sb->istart[n];
    }
    else {
      end_add[n] = sb->sizes[n];
    }
  }


  int x_size = MAX(0,end_add[0]-start_add[0]);
  int y_size = MAX(0,end_add[1]-start_add[1]);
  int z_size = MAX(0,end_add[2]-start_add[2]);

  int xdim0 = args[0].dat->block_size[0]*args[0].dat->dim;
  int ydim0 = args[0].dat->block_size[1];
  int xdim1 = args[1].dat->block_size[0]*args[1].dat->dim;
  int ydim1 = args[1].dat->block_size[1];
  int xdim2 = args[2].dat->block_size[0]*args[2].dat->dim;
  int ydim2 = args[2].dat->block_size[1];
  int xdim3 = args[3].dat->block_size[0]*args[3].dat->dim;
  int ydim3 = args[3].dat->block_size[1];
  int xdim4 = args[4].dat->block_size[0]*args[4].dat->dim;
  int ydim4 = args[4].dat->block_size[1];


  //Timing
  double t1,t2,c1,c2;
  ops_timing_realloc(34,"advec_cell_kernel2_ydir");
  ops_timers_core(&c2,&t2);

  if (OPS_kernels[34].count == 0) {
    cudaMemcpyToSymbol( xdim0_advec_cell_kernel2_ydir, &xdim0, sizeof(int) );
    cudaMemcpyToSymbol( ydim0_advec_cell_kernel2_ydir, &ydim0, sizeof(int) );
    cudaMemcpyToSymbol( xdim1_advec_cell_kernel2_ydir, &xdim1, sizeof(int) );
    cudaMemcpyToSymbol( ydim1_advec_cell_kernel2_ydir, &ydim1, sizeof(int) );
    cudaMemcpyToSymbol( xdim2_advec_cell_kernel2_ydir, &xdim2, sizeof(int) );
    cudaMemcpyToSymbol( ydim2_advec_cell_kernel2_ydir, &ydim2, sizeof(int) );
    cudaMemcpyToSymbol( xdim3_advec_cell_kernel2_ydir, &xdim3, sizeof(int) );
    cudaMemcpyToSymbol( ydim3_advec_cell_kernel2_ydir, &ydim3, sizeof(int) );
    cudaMemcpyToSymbol( xdim4_advec_cell_kernel2_ydir, &xdim4, sizeof(int) );
    cudaMemcpyToSymbol( ydim4_advec_cell_kernel2_ydir, &ydim4, sizeof(int) );
  }



  dim3 grid( (x_size-1)/OPS_block_size_x+ 1, (y_size-1)/OPS_block_size_y + 1, z_size);
  dim3 block(OPS_block_size_x,OPS_block_size_y,1);



  int dat0 = args[0].dat->size;
  int dat1 = args[1].dat->size;
  int dat2 = args[2].dat->size;
  int dat3 = args[3].dat->size;
  int dat4 = args[4].dat->size;

  char *p_a[5];

  //set up initial pointers
  int base0 = dat0 * 1 * 
  (start_add[0] * args[0].stencil->stride[0] - args[0].dat->offset[0]);
  base0 = base0+ dat0 *
    args[0].dat->block_size[0] *
    (start_add[1] * args[0].stencil->stride[1] - args[0].dat->offset[1]);
  base0 = base0+ dat0 *
    args[0].dat->block_size[0] *
    args[0].dat->block_size[1] *
    (start_add[2] * args[0].stencil->stride[2] - args[0].dat->offset[2]);
  p_a[0] = (char *)args[0].data_d + base0;

  int base1 = dat1 * 1 * 
  (start_add[0] * args[1].stencil->stride[0] - args[1].dat->offset[0]);
  base1 = base1+ dat1 *
    args[1].dat->block_size[0] *
    (start_add[1] * args[1].stencil->stride[1] - args[1].dat->offset[1]);
  base1 = base1+ dat1 *
    args[1].dat->block_size[0] *
    args[1].dat->block_size[1] *
    (start_add[2] * args[1].stencil->stride[2] - args[1].dat->offset[2]);
  p_a[1] = (char *)args[1].data_d + base1;

  int base2 = dat2 * 1 * 
  (start_add[0] * args[2].stencil->stride[0] - args[2].dat->offset[0]);
  base2 = base2+ dat2 *
    args[2].dat->block_size[0] *
    (start_add[1] * args[2].stencil->stride[1] - args[2].dat->offset[1]);
  base2 = base2+ dat2 *
    args[2].dat->block_size[0] *
    args[2].dat->block_size[1] *
    (start_add[2] * args[2].stencil->stride[2] - args[2].dat->offset[2]);
  p_a[2] = (char *)args[2].data_d + base2;

  int base3 = dat3 * 1 * 
  (start_add[0] * args[3].stencil->stride[0] - args[3].dat->offset[0]);
  base3 = base3+ dat3 *
    args[3].dat->block_size[0] *
    (start_add[1] * args[3].stencil->stride[1] - args[3].dat->offset[1]);
  base3 = base3+ dat3 *
    args[3].dat->block_size[0] *
    args[3].dat->block_size[1] *
    (start_add[2] * args[3].stencil->stride[2] - args[3].dat->offset[2]);
  p_a[3] = (char *)args[3].data_d + base3;

  int base4 = dat4 * 1 * 
  (start_add[0] * args[4].stencil->stride[0] - args[4].dat->offset[0]);
  base4 = base4+ dat4 *
    args[4].dat->block_size[0] *
    (start_add[1] * args[4].stencil->stride[1] - args[4].dat->offset[1]);
  base4 = base4+ dat4 *
    args[4].dat->block_size[0] *
    args[4].dat->block_size[1] *
    (start_add[2] * args[4].stencil->stride[2] - args[4].dat->offset[2]);
  p_a[4] = (char *)args[4].data_d + base4;


  ops_H_D_exchanges_cuda(args, 5);
  ops_halo_exchanges(args,5,range);

  ops_timers_core(&c1,&t1);
  OPS_kernels[34].mpi_time += t1-t2;


  //call kernel wrapper function, passing in pointers to data
  ops_advec_cell_kernel2_ydir<<<grid, block >>> (  (double *)p_a[0], (double *)p_a[1],
           (double *)p_a[2], (double *)p_a[3],
           (double *)p_a[4],x_size, y_size, z_size);

  if (OPS_diags>1) {
    cutilSafeCall(cudaDeviceSynchronize());
  }
  ops_timers_core(&c2,&t2);
  OPS_kernels[34].time += t2-t1;
  ops_set_dirtybit_cuda(args, 5);
  ops_set_halo_dirtybit3(&args[0],range);
  ops_set_halo_dirtybit3(&args[1],range);

  //Update kernel record
  OPS_kernels[34].count++;
  OPS_kernels[34].transfer += ops_compute_transfer(dim, range, &arg0);
  OPS_kernels[34].transfer += ops_compute_transfer(dim, range, &arg1);
  OPS_kernels[34].transfer += ops_compute_transfer(dim, range, &arg2);
  OPS_kernels[34].transfer += ops_compute_transfer(dim, range, &arg3);
  OPS_kernels[34].transfer += ops_compute_transfer(dim, range, &arg4);
}
