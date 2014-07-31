//
// auto-generated by ops.py on 2014-07-31 12:24
//

__constant__ int xdim0_update_halo_kernel2_yvel_plus_4_right;
__constant__ int ydim0_update_halo_kernel2_yvel_plus_4_right;
__constant__ int xdim1_update_halo_kernel2_yvel_plus_4_right;
__constant__ int ydim1_update_halo_kernel2_yvel_plus_4_right;

#define OPS_ACC0(x,y,z) (x+xdim0_update_halo_kernel2_yvel_plus_4_right*(y)+xdim0_update_halo_kernel2_yvel_plus_4_right*ydim0_update_halo_kernel2_yvel_plus_4_right*(z))
#define OPS_ACC1(x,y,z) (x+xdim1_update_halo_kernel2_yvel_plus_4_right*(y)+xdim1_update_halo_kernel2_yvel_plus_4_right*ydim1_update_halo_kernel2_yvel_plus_4_right*(z))

//user function
__device__

inline void update_halo_kernel2_yvel_plus_4_right(double *yvel0, double *yvel1, const int* fields)
{
  if(fields[FIELD_YVEL0] == 1) yvel0[OPS_ACC0(0,0,0)] = yvel0[OPS_ACC0(-4,0,0)];
  if(fields[FIELD_YVEL1] == 1) yvel1[OPS_ACC1(0,0,0)] = yvel1[OPS_ACC1(-4,0,0)];
}



#undef OPS_ACC0
#undef OPS_ACC1


__global__ void ops_update_halo_kernel2_yvel_plus_4_right(
double* __restrict arg0,
double* __restrict arg1,
const int* __restrict arg2,
int size0,
int size1,
int size2 ){


  int idx_z = blockDim.z * blockIdx.z + threadIdx.z;
  int idx_y = blockDim.y * blockIdx.y + threadIdx.y;
  int idx_x = blockDim.x * blockIdx.x + threadIdx.x;

  arg0 += idx_x * 1 + idx_y * 1 * xdim0_update_halo_kernel2_yvel_plus_4_right + idx_z * 1 * xdim0_update_halo_kernel2_yvel_plus_4_right * ydim0_update_halo_kernel2_yvel_plus_4_right;
  arg1 += idx_x * 1 + idx_y * 1 * xdim1_update_halo_kernel2_yvel_plus_4_right + idx_z * 1 * xdim1_update_halo_kernel2_yvel_plus_4_right * ydim1_update_halo_kernel2_yvel_plus_4_right;

  if (idx_x < size0 && idx_y < size1 && idx_z < size2) {
    update_halo_kernel2_yvel_plus_4_right(arg0, arg1, arg2);
  }

}

// host stub function
void ops_par_loop_update_halo_kernel2_yvel_plus_4_right(char const *name, ops_block Block, int dim, int* range,
 ops_arg arg0, ops_arg arg1, ops_arg arg2) {

  ops_arg args[3] = { arg0, arg1, arg2};

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


  //Timing
  double t1,t2,c1,c2;
  ops_timing_realloc(71,"update_halo_kernel2_yvel_plus_4_right");
  ops_timers_core(&c2,&t2);

  if (OPS_kernels[71].count == 0) {
    cudaMemcpyToSymbol( xdim0_update_halo_kernel2_yvel_plus_4_right, &xdim0, sizeof(int) );
    cudaMemcpyToSymbol( ydim0_update_halo_kernel2_yvel_plus_4_right, &ydim0, sizeof(int) );
    cudaMemcpyToSymbol( xdim1_update_halo_kernel2_yvel_plus_4_right, &xdim1, sizeof(int) );
    cudaMemcpyToSymbol( ydim1_update_halo_kernel2_yvel_plus_4_right, &ydim1, sizeof(int) );
  }


  int *arg2h = (int *)arg2.data;

  dim3 grid( (x_size-1)/OPS_block_size_x+ 1, (y_size-1)/OPS_block_size_y + 1, z_size);
  dim3 block(OPS_block_size_x,OPS_block_size_y,1);

  int consts_bytes = 0;

  consts_bytes += ROUND_UP(NUM_FIELDS*sizeof(int));

  reallocConstArrays(consts_bytes);

  consts_bytes = 0;
  arg2.data = OPS_consts_h + consts_bytes;
  arg2.data_d = OPS_consts_d + consts_bytes;
  for (int d=0; d<NUM_FIELDS; d++) ((int *)arg2.data)[d] = arg2h[d];
  consts_bytes += ROUND_UP(NUM_FIELDS*sizeof(int));
  mvConstArraysToDevice(consts_bytes);
  int dat0 = args[0].dat->size;
  int dat1 = args[1].dat->size;

  char *p_a[3];

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


  ops_H_D_exchanges_cuda(args, 3);
  ops_halo_exchanges(args,3,range);

  ops_timers_core(&c1,&t1);
  OPS_kernels[71].mpi_time += t1-t2;


  //call kernel wrapper function, passing in pointers to data
  ops_update_halo_kernel2_yvel_plus_4_right<<<grid, block >>> (  (double *)p_a[0], (double *)p_a[1],
           (int *)arg2.data_d,x_size, y_size, z_size);

  if (OPS_diags>1) {
    cutilSafeCall(cudaDeviceSynchronize());
  }
  ops_timers_core(&c2,&t2);
  OPS_kernels[71].time += t2-t1;
  ops_timers_core(&c1,&t1);
  OPS_kernels[71].mpi_time += t1-t2;
  ops_set_dirtybit_cuda(args, 3);
  ops_set_halo_dirtybit3(&args[0],range);
  ops_set_halo_dirtybit3(&args[1],range);

  //Update kernel record
  OPS_kernels[71].count++;
  OPS_kernels[71].transfer += ops_compute_transfer(dim, range, &arg0);
  OPS_kernels[71].transfer += ops_compute_transfer(dim, range, &arg1);
}
