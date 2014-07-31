//
// auto-generated by ops.py on 2014-07-31 12:24
//

__constant__ int xdim0_update_halo_kernel1_r1;
__constant__ int ydim0_update_halo_kernel1_r1;
__constant__ int xdim1_update_halo_kernel1_r1;
__constant__ int ydim1_update_halo_kernel1_r1;
__constant__ int xdim2_update_halo_kernel1_r1;
__constant__ int ydim2_update_halo_kernel1_r1;
__constant__ int xdim3_update_halo_kernel1_r1;
__constant__ int ydim3_update_halo_kernel1_r1;
__constant__ int xdim4_update_halo_kernel1_r1;
__constant__ int ydim4_update_halo_kernel1_r1;
__constant__ int xdim5_update_halo_kernel1_r1;
__constant__ int ydim5_update_halo_kernel1_r1;
__constant__ int xdim6_update_halo_kernel1_r1;
__constant__ int ydim6_update_halo_kernel1_r1;

#define OPS_ACC0(x,y,z) (x+xdim0_update_halo_kernel1_r1*(y)+xdim0_update_halo_kernel1_r1*ydim0_update_halo_kernel1_r1*(z))
#define OPS_ACC1(x,y,z) (x+xdim1_update_halo_kernel1_r1*(y)+xdim1_update_halo_kernel1_r1*ydim1_update_halo_kernel1_r1*(z))
#define OPS_ACC2(x,y,z) (x+xdim2_update_halo_kernel1_r1*(y)+xdim2_update_halo_kernel1_r1*ydim2_update_halo_kernel1_r1*(z))
#define OPS_ACC3(x,y,z) (x+xdim3_update_halo_kernel1_r1*(y)+xdim3_update_halo_kernel1_r1*ydim3_update_halo_kernel1_r1*(z))
#define OPS_ACC4(x,y,z) (x+xdim4_update_halo_kernel1_r1*(y)+xdim4_update_halo_kernel1_r1*ydim4_update_halo_kernel1_r1*(z))
#define OPS_ACC5(x,y,z) (x+xdim5_update_halo_kernel1_r1*(y)+xdim5_update_halo_kernel1_r1*ydim5_update_halo_kernel1_r1*(z))
#define OPS_ACC6(x,y,z) (x+xdim6_update_halo_kernel1_r1*(y)+xdim6_update_halo_kernel1_r1*ydim6_update_halo_kernel1_r1*(z))

//user function
__device__

inline void update_halo_kernel1_r1(double *density0, double *density1,
                          double *energy0, double *energy1,
                          double *pressure, double *viscosity,
                          double *soundspeed , const int* fields) {
  if(fields[FIELD_DENSITY0] == 1) density0[OPS_ACC0(0,0,0)] = density0[OPS_ACC0(-1,0,0)];
  if(fields[FIELD_DENSITY1] == 1) density1[OPS_ACC1(0,0,0)] = density1[OPS_ACC1(-1,0,0)];
  if(fields[FIELD_ENERGY0] == 1) energy0[OPS_ACC2(0,0,0)] = energy0[OPS_ACC2(-1,0,0)];
  if(fields[FIELD_ENERGY1] == 1) energy1[OPS_ACC3(0,0,0)] = energy1[OPS_ACC3(-1,0,0)];
  if(fields[FIELD_PRESSURE] == 1) pressure[OPS_ACC4(0,0,0)] = pressure[OPS_ACC4(-1,0,0)];
  if(fields[FIELD_VISCOSITY] == 1) viscosity[OPS_ACC5(0,0,0)] = viscosity[OPS_ACC5(-1,0,0)];
  if(fields[FIELD_SOUNDSPEED] == 1) soundspeed[OPS_ACC6(0,0,0)] = soundspeed[OPS_ACC6(-1,0,0)];

}



#undef OPS_ACC0
#undef OPS_ACC1
#undef OPS_ACC2
#undef OPS_ACC3
#undef OPS_ACC4
#undef OPS_ACC5
#undef OPS_ACC6


__global__ void ops_update_halo_kernel1_r1(
double* __restrict arg0,
double* __restrict arg1,
double* __restrict arg2,
double* __restrict arg3,
double* __restrict arg4,
double* __restrict arg5,
double* __restrict arg6,
const int* __restrict arg7,
int size0,
int size1,
int size2 ){


  int idx_z = blockDim.z * blockIdx.z + threadIdx.z;
  int idx_y = blockDim.y * blockIdx.y + threadIdx.y;
  int idx_x = blockDim.x * blockIdx.x + threadIdx.x;

  arg0 += idx_x * 1 + idx_y * 1 * xdim0_update_halo_kernel1_r1 + idx_z * 1 * xdim0_update_halo_kernel1_r1 * ydim0_update_halo_kernel1_r1;
  arg1 += idx_x * 1 + idx_y * 1 * xdim1_update_halo_kernel1_r1 + idx_z * 1 * xdim1_update_halo_kernel1_r1 * ydim1_update_halo_kernel1_r1;
  arg2 += idx_x * 1 + idx_y * 1 * xdim2_update_halo_kernel1_r1 + idx_z * 1 * xdim2_update_halo_kernel1_r1 * ydim2_update_halo_kernel1_r1;
  arg3 += idx_x * 1 + idx_y * 1 * xdim3_update_halo_kernel1_r1 + idx_z * 1 * xdim3_update_halo_kernel1_r1 * ydim3_update_halo_kernel1_r1;
  arg4 += idx_x * 1 + idx_y * 1 * xdim4_update_halo_kernel1_r1 + idx_z * 1 * xdim4_update_halo_kernel1_r1 * ydim4_update_halo_kernel1_r1;
  arg5 += idx_x * 1 + idx_y * 1 * xdim5_update_halo_kernel1_r1 + idx_z * 1 * xdim5_update_halo_kernel1_r1 * ydim5_update_halo_kernel1_r1;
  arg6 += idx_x * 1 + idx_y * 1 * xdim6_update_halo_kernel1_r1 + idx_z * 1 * xdim6_update_halo_kernel1_r1 * ydim6_update_halo_kernel1_r1;

  if (idx_x < size0 && idx_y < size1 && idx_z < size2) {
    update_halo_kernel1_r1(arg0, arg1, arg2, arg3,
                   arg4, arg5, arg6, arg7);
  }

}

// host stub function
void ops_par_loop_update_halo_kernel1_r1(char const *name, ops_block Block, int dim, int* range,
 ops_arg arg0, ops_arg arg1, ops_arg arg2, ops_arg arg3,
 ops_arg arg4, ops_arg arg5, ops_arg arg6, ops_arg arg7) {

  ops_arg args[8] = { arg0, arg1, arg2, arg3, arg4, arg5, arg6, arg7};

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
  int xdim5 = args[5].dat->block_size[0]*args[5].dat->dim;
  int ydim5 = args[5].dat->block_size[1];
  int xdim6 = args[6].dat->block_size[0]*args[6].dat->dim;
  int ydim6 = args[6].dat->block_size[1];


  //Timing
  double t1,t2,c1,c2;
  ops_timing_realloc(48,"update_halo_kernel1_r1");
  ops_timers_core(&c2,&t2);

  if (OPS_kernels[48].count == 0) {
    cudaMemcpyToSymbol( xdim0_update_halo_kernel1_r1, &xdim0, sizeof(int) );
    cudaMemcpyToSymbol( ydim0_update_halo_kernel1_r1, &ydim0, sizeof(int) );
    cudaMemcpyToSymbol( xdim1_update_halo_kernel1_r1, &xdim1, sizeof(int) );
    cudaMemcpyToSymbol( ydim1_update_halo_kernel1_r1, &ydim1, sizeof(int) );
    cudaMemcpyToSymbol( xdim2_update_halo_kernel1_r1, &xdim2, sizeof(int) );
    cudaMemcpyToSymbol( ydim2_update_halo_kernel1_r1, &ydim2, sizeof(int) );
    cudaMemcpyToSymbol( xdim3_update_halo_kernel1_r1, &xdim3, sizeof(int) );
    cudaMemcpyToSymbol( ydim3_update_halo_kernel1_r1, &ydim3, sizeof(int) );
    cudaMemcpyToSymbol( xdim4_update_halo_kernel1_r1, &xdim4, sizeof(int) );
    cudaMemcpyToSymbol( ydim4_update_halo_kernel1_r1, &ydim4, sizeof(int) );
    cudaMemcpyToSymbol( xdim5_update_halo_kernel1_r1, &xdim5, sizeof(int) );
    cudaMemcpyToSymbol( ydim5_update_halo_kernel1_r1, &ydim5, sizeof(int) );
    cudaMemcpyToSymbol( xdim6_update_halo_kernel1_r1, &xdim6, sizeof(int) );
    cudaMemcpyToSymbol( ydim6_update_halo_kernel1_r1, &ydim6, sizeof(int) );
  }


  int *arg7h = (int *)arg7.data;

  dim3 grid( (x_size-1)/OPS_block_size_x+ 1, (y_size-1)/OPS_block_size_y + 1, z_size);
  dim3 block(OPS_block_size_x,OPS_block_size_y,1);

  int consts_bytes = 0;

  consts_bytes += ROUND_UP(NUM_FIELDS*sizeof(int));

  reallocConstArrays(consts_bytes);

  consts_bytes = 0;
  arg7.data = OPS_consts_h + consts_bytes;
  arg7.data_d = OPS_consts_d + consts_bytes;
  for (int d=0; d<NUM_FIELDS; d++) ((int *)arg7.data)[d] = arg7h[d];
  consts_bytes += ROUND_UP(NUM_FIELDS*sizeof(int));
  mvConstArraysToDevice(consts_bytes);
  int dat0 = args[0].dat->size;
  int dat1 = args[1].dat->size;
  int dat2 = args[2].dat->size;
  int dat3 = args[3].dat->size;
  int dat4 = args[4].dat->size;
  int dat5 = args[5].dat->size;
  int dat6 = args[6].dat->size;

  char *p_a[8];

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

  int base5 = dat5 * 1 * 
  (start_add[0] * args[5].stencil->stride[0] - args[5].dat->offset[0]);
  base5 = base5+ dat5 *
    args[5].dat->block_size[0] *
    (start_add[1] * args[5].stencil->stride[1] - args[5].dat->offset[1]);
  base5 = base5+ dat5 *
    args[5].dat->block_size[0] *
    args[5].dat->block_size[1] *
    (start_add[2] * args[5].stencil->stride[2] - args[5].dat->offset[2]);
  p_a[5] = (char *)args[5].data_d + base5;

  int base6 = dat6 * 1 * 
  (start_add[0] * args[6].stencil->stride[0] - args[6].dat->offset[0]);
  base6 = base6+ dat6 *
    args[6].dat->block_size[0] *
    (start_add[1] * args[6].stencil->stride[1] - args[6].dat->offset[1]);
  base6 = base6+ dat6 *
    args[6].dat->block_size[0] *
    args[6].dat->block_size[1] *
    (start_add[2] * args[6].stencil->stride[2] - args[6].dat->offset[2]);
  p_a[6] = (char *)args[6].data_d + base6;


  ops_H_D_exchanges_cuda(args, 8);
  ops_halo_exchanges(args,8,range);

  ops_timers_core(&c1,&t1);
  OPS_kernels[48].mpi_time += t1-t2;


  //call kernel wrapper function, passing in pointers to data
  ops_update_halo_kernel1_r1<<<grid, block >>> (  (double *)p_a[0], (double *)p_a[1],
           (double *)p_a[2], (double *)p_a[3],
           (double *)p_a[4], (double *)p_a[5],
           (double *)p_a[6], (int *)arg7.data_d,x_size, y_size, z_size);

  if (OPS_diags>1) {
    cutilSafeCall(cudaDeviceSynchronize());
  }
  ops_timers_core(&c2,&t2);
  OPS_kernels[48].time += t2-t1;
  ops_timers_core(&c1,&t1);
  OPS_kernels[48].mpi_time += t1-t2;
  ops_set_dirtybit_cuda(args, 8);
  ops_set_halo_dirtybit3(&args[0],range);
  ops_set_halo_dirtybit3(&args[1],range);
  ops_set_halo_dirtybit3(&args[2],range);
  ops_set_halo_dirtybit3(&args[3],range);
  ops_set_halo_dirtybit3(&args[4],range);
  ops_set_halo_dirtybit3(&args[5],range);
  ops_set_halo_dirtybit3(&args[6],range);

  //Update kernel record
  OPS_kernels[48].count++;
  OPS_kernels[48].transfer += ops_compute_transfer(dim, range, &arg0);
  OPS_kernels[48].transfer += ops_compute_transfer(dim, range, &arg1);
  OPS_kernels[48].transfer += ops_compute_transfer(dim, range, &arg2);
  OPS_kernels[48].transfer += ops_compute_transfer(dim, range, &arg3);
  OPS_kernels[48].transfer += ops_compute_transfer(dim, range, &arg4);
  OPS_kernels[48].transfer += ops_compute_transfer(dim, range, &arg5);
  OPS_kernels[48].transfer += ops_compute_transfer(dim, range, &arg6);
}
