//
// auto-generated by ops.py on 2013-11-20 16:07
//

__constant__ int xdim0_PdV_kernel_predict;
__constant__ int xdim1_PdV_kernel_predict;
__constant__ int xdim2_PdV_kernel_predict;
__constant__ int xdim3_PdV_kernel_predict;
__constant__ int xdim4_PdV_kernel_predict;
__constant__ int xdim5_PdV_kernel_predict;
__constant__ int xdim6_PdV_kernel_predict;
__constant__ int xdim7_PdV_kernel_predict;
__constant__ int xdim8_PdV_kernel_predict;
__constant__ int xdim9_PdV_kernel_predict;
__constant__ int xdim10_PdV_kernel_predict;
__constant__ int xdim11_PdV_kernel_predict;

#define OPS_ACC0(x,y) (x+xdim0_PdV_kernel_predict*(y))
#define OPS_ACC1(x,y) (x+xdim1_PdV_kernel_predict*(y))
#define OPS_ACC2(x,y) (x+xdim2_PdV_kernel_predict*(y))
#define OPS_ACC3(x,y) (x+xdim3_PdV_kernel_predict*(y))
#define OPS_ACC4(x,y) (x+xdim4_PdV_kernel_predict*(y))
#define OPS_ACC5(x,y) (x+xdim5_PdV_kernel_predict*(y))
#define OPS_ACC6(x,y) (x+xdim6_PdV_kernel_predict*(y))
#define OPS_ACC7(x,y) (x+xdim7_PdV_kernel_predict*(y))
#define OPS_ACC8(x,y) (x+xdim8_PdV_kernel_predict*(y))
#define OPS_ACC9(x,y) (x+xdim9_PdV_kernel_predict*(y))
#define OPS_ACC10(x,y) (x+xdim10_PdV_kernel_predict*(y))
#define OPS_ACC11(x,y) (x+xdim11_PdV_kernel_predict*(y))

//user function
__device__

inline void PdV_kernel_predict(const double *xarea, const double *xvel0,
                const double *yarea, const double *yvel0,
                double *volume_change, const double *volume,
                const double *pressure,
                const double *density0, double *density1,
                const double *viscosity,
                const double *energy0, double *energy1) {


  double recip_volume, energy_change, min_cell_volume;
  double right_flux, left_flux, top_flux, bottom_flux, total_flux;

  left_flux = ( xarea[OPS_ACC0(0,0)] * ( xvel0[OPS_ACC1(0,0)] + xvel0[OPS_ACC1(0,1)] +
                                xvel0[OPS_ACC1(0,0)] + xvel0[OPS_ACC1(0,1)] ) ) * 0.25 * dt * 0.5;
  right_flux = ( xarea[OPS_ACC0(1,0)] * ( xvel0[OPS_ACC1(1,0)] + xvel0[OPS_ACC1(1,1)] +
                                 xvel0[OPS_ACC1(1,0)] + xvel0[OPS_ACC1(1,1)] ) ) * 0.25 * dt * 0.5;

  bottom_flux = ( yarea[OPS_ACC2(0,0)] * ( yvel0[OPS_ACC3(0,0)] + yvel0[OPS_ACC3(1,0)] +
                                  yvel0[OPS_ACC3(0,0)] + yvel0[OPS_ACC3(1,0)] ) ) * 0.25* dt * 0.5;
  top_flux = ( yarea[OPS_ACC2(0,1)] * ( yvel0[OPS_ACC3(0,1)] + yvel0[OPS_ACC3(1,1)] +
                               yvel0[OPS_ACC3(0,1)] + yvel0[OPS_ACC3(1,1)] ) ) * 0.25 * dt * 0.5;

  total_flux = right_flux - left_flux + top_flux - bottom_flux;

  volume_change[OPS_ACC4(0,0)] = (volume[OPS_ACC5(0,0)])/(volume[OPS_ACC5(0,0)] + total_flux);

  min_cell_volume = MIN( volume[OPS_ACC5(0,0)] + right_flux - left_flux + top_flux - bottom_flux ,
                           MIN(volume[OPS_ACC5(0,0)] + right_flux - left_flux,
                           volume[OPS_ACC5(0,0)] + top_flux - bottom_flux) );

  recip_volume = 1.0/volume[OPS_ACC5(0,0)];

  energy_change = ( pressure[OPS_ACC6(0,0)]/density0[OPS_ACC7(0,0)] +
                    viscosity[OPS_ACC9(0,0)]/density0[OPS_ACC7(0,0)] ) * total_flux * recip_volume;
  energy1[OPS_ACC11(0,0)] = energy0[OPS_ACC10(0,0)] - energy_change;
  density1[OPS_ACC8(0,0)] = density0[OPS_ACC7(0,0)] * volume_change[OPS_ACC4(0,0)];

}



#undef OPS_ACC0
#undef OPS_ACC1
#undef OPS_ACC2
#undef OPS_ACC3
#undef OPS_ACC4
#undef OPS_ACC5
#undef OPS_ACC6
#undef OPS_ACC7
#undef OPS_ACC8
#undef OPS_ACC9
#undef OPS_ACC10
#undef OPS_ACC11


__global__ void ops_PdV_kernel_predict(
const double* __restrict arg0,
const double* __restrict arg1,
const double* __restrict arg2,
const double* __restrict arg3,
double* __restrict arg4,
const double* __restrict arg5,
const double* __restrict arg6,
const double* __restrict arg7,
double* __restrict arg8,
const double* __restrict arg9,
const double* __restrict arg10,
double* __restrict arg11,
int size0,
int size1 ){


  int idx_y = blockDim.y * blockIdx.y + threadIdx.y;
  int idx_x = blockDim.x * blockIdx.x + threadIdx.x;

  arg0 += idx_x * 1 + idx_y * 1 * xdim0_PdV_kernel_predict;
  arg1 += idx_x * 1 + idx_y * 1 * xdim1_PdV_kernel_predict;
  arg2 += idx_x * 1 + idx_y * 1 * xdim2_PdV_kernel_predict;
  arg3 += idx_x * 1 + idx_y * 1 * xdim3_PdV_kernel_predict;
  arg4 += idx_x * 1 + idx_y * 1 * xdim4_PdV_kernel_predict;
  arg5 += idx_x * 1 + idx_y * 1 * xdim5_PdV_kernel_predict;
  arg6 += idx_x * 1 + idx_y * 1 * xdim6_PdV_kernel_predict;
  arg7 += idx_x * 1 + idx_y * 1 * xdim7_PdV_kernel_predict;
  arg8 += idx_x * 1 + idx_y * 1 * xdim8_PdV_kernel_predict;
  arg9 += idx_x * 1 + idx_y * 1 * xdim9_PdV_kernel_predict;
  arg10 += idx_x * 1 + idx_y * 1 * xdim10_PdV_kernel_predict;
  arg11 += idx_x * 1 + idx_y * 1 * xdim11_PdV_kernel_predict;

  if (idx_x < size0 && idx_y < size1) {
    PdV_kernel_predict(arg0, arg1, arg2, arg3,
                   arg4, arg5, arg6, arg7, arg8,
                   arg9, arg10, arg11);
  }

}

// host stub function
void ops_par_loop_PdV_kernel_predict(char const *name, int dim, int* range,
 ops_arg arg0, ops_arg arg1, ops_arg arg2, ops_arg arg3,
 ops_arg arg4, ops_arg arg5, ops_arg arg6, ops_arg arg7, ops_arg arg8,
 ops_arg arg9, ops_arg arg10, ops_arg arg11) {

  ops_arg args[12] = { arg0, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9, arg10, arg11};


  int x_size = range[1]-range[0];
  int y_size = range[3]-range[2];

  int xdim0 = args[0].dat->block_size[0];
  int xdim1 = args[1].dat->block_size[0];
  int xdim2 = args[2].dat->block_size[0];
  int xdim3 = args[3].dat->block_size[0];
  int xdim4 = args[4].dat->block_size[0];
  int xdim5 = args[5].dat->block_size[0];
  int xdim6 = args[6].dat->block_size[0];
  int xdim7 = args[7].dat->block_size[0];
  int xdim8 = args[8].dat->block_size[0];
  int xdim9 = args[9].dat->block_size[0];
  int xdim10 = args[10].dat->block_size[0];
  int xdim11 = args[11].dat->block_size[0];

  ops_timing_realloc(80);
  if (OPS_kernels[80].count == 0) {
    cudaMemcpyToSymbol( xdim0_PdV_kernel_predict, &xdim0, sizeof(int) );
    cudaMemcpyToSymbol( xdim1_PdV_kernel_predict, &xdim1, sizeof(int) );
    cudaMemcpyToSymbol( xdim2_PdV_kernel_predict, &xdim2, sizeof(int) );
    cudaMemcpyToSymbol( xdim3_PdV_kernel_predict, &xdim3, sizeof(int) );
    cudaMemcpyToSymbol( xdim4_PdV_kernel_predict, &xdim4, sizeof(int) );
    cudaMemcpyToSymbol( xdim5_PdV_kernel_predict, &xdim5, sizeof(int) );
    cudaMemcpyToSymbol( xdim6_PdV_kernel_predict, &xdim6, sizeof(int) );
    cudaMemcpyToSymbol( xdim7_PdV_kernel_predict, &xdim7, sizeof(int) );
    cudaMemcpyToSymbol( xdim8_PdV_kernel_predict, &xdim8, sizeof(int) );
    cudaMemcpyToSymbol( xdim9_PdV_kernel_predict, &xdim9, sizeof(int) );
    cudaMemcpyToSymbol( xdim10_PdV_kernel_predict, &xdim10, sizeof(int) );
    cudaMemcpyToSymbol( xdim11_PdV_kernel_predict, &xdim11, sizeof(int) );
  }



  dim3 grid( (x_size-1)/OPS_block_size_x+ 1, (y_size-1)/OPS_block_size_y + 1, 1);
  dim3 block(OPS_block_size_x,OPS_block_size_y,1);




  char *p_a[12];


  //set up initial pointers
  p_a[0] = &args[0].data_d[
  + args[0].dat->size * args[0].dat->block_size[0] * ( range[2] * 1 - args[0].dat->offset[1] )
  + args[0].dat->size * ( range[0] * 1 - args[0].dat->offset[0] ) ];

  p_a[1] = &args[1].data_d[
  + args[1].dat->size * args[1].dat->block_size[0] * ( range[2] * 1 - args[1].dat->offset[1] )
  + args[1].dat->size * ( range[0] * 1 - args[1].dat->offset[0] ) ];

  p_a[2] = &args[2].data_d[
  + args[2].dat->size * args[2].dat->block_size[0] * ( range[2] * 1 - args[2].dat->offset[1] )
  + args[2].dat->size * ( range[0] * 1 - args[2].dat->offset[0] ) ];

  p_a[3] = &args[3].data_d[
  + args[3].dat->size * args[3].dat->block_size[0] * ( range[2] * 1 - args[3].dat->offset[1] )
  + args[3].dat->size * ( range[0] * 1 - args[3].dat->offset[0] ) ];

  p_a[4] = &args[4].data_d[
  + args[4].dat->size * args[4].dat->block_size[0] * ( range[2] * 1 - args[4].dat->offset[1] )
  + args[4].dat->size * ( range[0] * 1 - args[4].dat->offset[0] ) ];

  p_a[5] = &args[5].data_d[
  + args[5].dat->size * args[5].dat->block_size[0] * ( range[2] * 1 - args[5].dat->offset[1] )
  + args[5].dat->size * ( range[0] * 1 - args[5].dat->offset[0] ) ];

  p_a[6] = &args[6].data_d[
  + args[6].dat->size * args[6].dat->block_size[0] * ( range[2] * 1 - args[6].dat->offset[1] )
  + args[6].dat->size * ( range[0] * 1 - args[6].dat->offset[0] ) ];

  p_a[7] = &args[7].data_d[
  + args[7].dat->size * args[7].dat->block_size[0] * ( range[2] * 1 - args[7].dat->offset[1] )
  + args[7].dat->size * ( range[0] * 1 - args[7].dat->offset[0] ) ];

  p_a[8] = &args[8].data_d[
  + args[8].dat->size * args[8].dat->block_size[0] * ( range[2] * 1 - args[8].dat->offset[1] )
  + args[8].dat->size * ( range[0] * 1 - args[8].dat->offset[0] ) ];

  p_a[9] = &args[9].data_d[
  + args[9].dat->size * args[9].dat->block_size[0] * ( range[2] * 1 - args[9].dat->offset[1] )
  + args[9].dat->size * ( range[0] * 1 - args[9].dat->offset[0] ) ];

  p_a[10] = &args[10].data_d[
  + args[10].dat->size * args[10].dat->block_size[0] * ( range[2] * 1 - args[10].dat->offset[1] )
  + args[10].dat->size * ( range[0] * 1 - args[10].dat->offset[0] ) ];

  p_a[11] = &args[11].data_d[
  + args[11].dat->size * args[11].dat->block_size[0] * ( range[2] * 1 - args[11].dat->offset[1] )
  + args[11].dat->size * ( range[0] * 1 - args[11].dat->offset[0] ) ];


  ops_halo_exchanges_cuda(args, 12);


  //call kernel wrapper function, passing in pointers to data
  ops_PdV_kernel_predict<<<grid, block >>> (  (double *)p_a[0], (double *)p_a[1],
           (double *)p_a[2], (double *)p_a[3],
           (double *)p_a[4], (double *)p_a[5],
           (double *)p_a[6], (double *)p_a[7],
           (double *)p_a[8], (double *)p_a[9],
           (double *)p_a[10], (double *)p_a[11],x_size, y_size);

  ops_set_dirtybit_cuda(args, 12);
  OPS_kernels[80].count++;
}
