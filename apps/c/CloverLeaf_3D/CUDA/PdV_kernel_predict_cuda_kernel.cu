//
// auto-generated by ops.py
//
__constant__ int xdim0_PdV_kernel_predict;
int xdim0_PdV_kernel_predict_h = -1;
__constant__ int ydim0_PdV_kernel_predict;
int ydim0_PdV_kernel_predict_h = -1;
__constant__ int xdim1_PdV_kernel_predict;
int xdim1_PdV_kernel_predict_h = -1;
__constant__ int ydim1_PdV_kernel_predict;
int ydim1_PdV_kernel_predict_h = -1;
__constant__ int xdim2_PdV_kernel_predict;
int xdim2_PdV_kernel_predict_h = -1;
__constant__ int ydim2_PdV_kernel_predict;
int ydim2_PdV_kernel_predict_h = -1;
__constant__ int xdim3_PdV_kernel_predict;
int xdim3_PdV_kernel_predict_h = -1;
__constant__ int ydim3_PdV_kernel_predict;
int ydim3_PdV_kernel_predict_h = -1;
__constant__ int xdim4_PdV_kernel_predict;
int xdim4_PdV_kernel_predict_h = -1;
__constant__ int ydim4_PdV_kernel_predict;
int ydim4_PdV_kernel_predict_h = -1;
__constant__ int xdim5_PdV_kernel_predict;
int xdim5_PdV_kernel_predict_h = -1;
__constant__ int ydim5_PdV_kernel_predict;
int ydim5_PdV_kernel_predict_h = -1;
__constant__ int xdim6_PdV_kernel_predict;
int xdim6_PdV_kernel_predict_h = -1;
__constant__ int ydim6_PdV_kernel_predict;
int ydim6_PdV_kernel_predict_h = -1;
__constant__ int xdim7_PdV_kernel_predict;
int xdim7_PdV_kernel_predict_h = -1;
__constant__ int ydim7_PdV_kernel_predict;
int ydim7_PdV_kernel_predict_h = -1;
__constant__ int xdim8_PdV_kernel_predict;
int xdim8_PdV_kernel_predict_h = -1;
__constant__ int ydim8_PdV_kernel_predict;
int ydim8_PdV_kernel_predict_h = -1;
__constant__ int xdim9_PdV_kernel_predict;
int xdim9_PdV_kernel_predict_h = -1;
__constant__ int ydim9_PdV_kernel_predict;
int ydim9_PdV_kernel_predict_h = -1;
__constant__ int xdim10_PdV_kernel_predict;
int xdim10_PdV_kernel_predict_h = -1;
__constant__ int ydim10_PdV_kernel_predict;
int ydim10_PdV_kernel_predict_h = -1;
__constant__ int xdim11_PdV_kernel_predict;
int xdim11_PdV_kernel_predict_h = -1;
__constant__ int ydim11_PdV_kernel_predict;
int ydim11_PdV_kernel_predict_h = -1;
__constant__ int xdim12_PdV_kernel_predict;
int xdim12_PdV_kernel_predict_h = -1;
__constant__ int ydim12_PdV_kernel_predict;
int ydim12_PdV_kernel_predict_h = -1;
__constant__ int xdim13_PdV_kernel_predict;
int xdim13_PdV_kernel_predict_h = -1;
__constant__ int ydim13_PdV_kernel_predict;
int ydim13_PdV_kernel_predict_h = -1;

#define OPS_ACC0(x,y,z) (x+xdim0_PdV_kernel_predict*(y)+xdim0_PdV_kernel_predict*ydim0_PdV_kernel_predict*(z))
#define OPS_ACC1(x,y,z) (x+xdim1_PdV_kernel_predict*(y)+xdim1_PdV_kernel_predict*ydim1_PdV_kernel_predict*(z))
#define OPS_ACC2(x,y,z) (x+xdim2_PdV_kernel_predict*(y)+xdim2_PdV_kernel_predict*ydim2_PdV_kernel_predict*(z))
#define OPS_ACC3(x,y,z) (x+xdim3_PdV_kernel_predict*(y)+xdim3_PdV_kernel_predict*ydim3_PdV_kernel_predict*(z))
#define OPS_ACC4(x,y,z) (x+xdim4_PdV_kernel_predict*(y)+xdim4_PdV_kernel_predict*ydim4_PdV_kernel_predict*(z))
#define OPS_ACC5(x,y,z) (x+xdim5_PdV_kernel_predict*(y)+xdim5_PdV_kernel_predict*ydim5_PdV_kernel_predict*(z))
#define OPS_ACC6(x,y,z) (x+xdim6_PdV_kernel_predict*(y)+xdim6_PdV_kernel_predict*ydim6_PdV_kernel_predict*(z))
#define OPS_ACC7(x,y,z) (x+xdim7_PdV_kernel_predict*(y)+xdim7_PdV_kernel_predict*ydim7_PdV_kernel_predict*(z))
#define OPS_ACC8(x,y,z) (x+xdim8_PdV_kernel_predict*(y)+xdim8_PdV_kernel_predict*ydim8_PdV_kernel_predict*(z))
#define OPS_ACC9(x,y,z) (x+xdim9_PdV_kernel_predict*(y)+xdim9_PdV_kernel_predict*ydim9_PdV_kernel_predict*(z))
#define OPS_ACC10(x,y,z) (x+xdim10_PdV_kernel_predict*(y)+xdim10_PdV_kernel_predict*ydim10_PdV_kernel_predict*(z))
#define OPS_ACC11(x,y,z) (x+xdim11_PdV_kernel_predict*(y)+xdim11_PdV_kernel_predict*ydim11_PdV_kernel_predict*(z))
#define OPS_ACC12(x,y,z) (x+xdim12_PdV_kernel_predict*(y)+xdim12_PdV_kernel_predict*ydim12_PdV_kernel_predict*(z))
#define OPS_ACC13(x,y,z) (x+xdim13_PdV_kernel_predict*(y)+xdim13_PdV_kernel_predict*ydim13_PdV_kernel_predict*(z))

//user function
__device__

void PdV_kernel_predict(const double *xarea, const double *xvel0,
                const double *yarea, const double *yvel0,
                double *volume_change, const double *volume,
                const double *pressure,
                const double *density0, double *density1,
                const double *viscosity,
                const double *energy0, double *energy1, const double *zarea, const double *zvel0) {


  double recip_volume, energy_change, min_cell_volume;
  double right_flux, left_flux, top_flux, bottom_flux, back_flux, front_flux, total_flux;

  left_flux = ( xarea[OPS_ACC0(0,0,0)] * ( xvel0[OPS_ACC1(0,0,0)] + xvel0[OPS_ACC1(0,1,0)] +
                                           xvel0[OPS_ACC1(0,0,1)] + xvel0[OPS_ACC1(0,1,1)] +
                                           xvel0[OPS_ACC1(0,0,0)] + xvel0[OPS_ACC1(0,1,0)] +
                                           xvel0[OPS_ACC1(0,0,1)] + xvel0[OPS_ACC1(0,1,1)] ) ) * 0.125 * dt * 0.5;
  right_flux = ( xarea[OPS_ACC0(1,0,0)] * ( xvel0[OPS_ACC1(1,0,0)] + xvel0[OPS_ACC1(1,1,0)] +
                                            xvel0[OPS_ACC1(1,0,1)] + xvel0[OPS_ACC1(1,1,1)] +
                                            xvel0[OPS_ACC1(1,0,0)] + xvel0[OPS_ACC1(1,1,0)] +
                                            xvel0[OPS_ACC1(1,0,1)] + xvel0[OPS_ACC1(1,1,1)] ) ) * 0.125 * dt * 0.5;

  bottom_flux = ( yarea[OPS_ACC2(0,0,0)] * ( yvel0[OPS_ACC3(0,0,0)] + yvel0[OPS_ACC3(1,0,0)] +
                                             yvel0[OPS_ACC3(0,0,1)] + yvel0[OPS_ACC3(1,0,1)] +
                                             yvel0[OPS_ACC3(0,0,0)] + yvel0[OPS_ACC3(1,0,0)] +
                                             yvel0[OPS_ACC3(0,0,1)] + yvel0[OPS_ACC3(1,0,1)] ) ) * 0.125* dt * 0.5;
  top_flux = ( yarea[OPS_ACC2(0,1,0)] * ( yvel0[OPS_ACC3(0,1,0)] + yvel0[OPS_ACC3(1,1,0)] +
                                          yvel0[OPS_ACC3(0,1,1)] + yvel0[OPS_ACC3(1,1,1)] +
                                          yvel0[OPS_ACC3(0,1,0)] + yvel0[OPS_ACC3(1,1,0)] +
                                          yvel0[OPS_ACC3(0,1,1)] + yvel0[OPS_ACC3(1,1,1)] ) ) * 0.125 * dt * 0.5;

  back_flux = ( zarea[OPS_ACC12(0,0,0)] * ( zvel0[OPS_ACC13(0,0,0)] + zvel0[OPS_ACC13(1,0,0)] +
                                            zvel0[OPS_ACC13(0,1,0)] + zvel0[OPS_ACC13(1,1,0)] +
                                            zvel0[OPS_ACC13(0,0,0)] + zvel0[OPS_ACC13(1,0,0)] +
                                            zvel0[OPS_ACC13(0,1,0)] + zvel0[OPS_ACC13(1,1,0)] ) ) * 0.125* dt * 0.5;
  front_flux = ( zarea[OPS_ACC12(0,0,1)] * ( zvel0[OPS_ACC13(0,0,1)] + zvel0[OPS_ACC13(1,0,1)] +
                                             zvel0[OPS_ACC13(0,1,1)] + zvel0[OPS_ACC13(1,1,1)] +
                                             zvel0[OPS_ACC13(0,0,1)] + zvel0[OPS_ACC13(1,0,1)] +
                                             zvel0[OPS_ACC13(0,1,1)] + zvel0[OPS_ACC13(1,1,1)] ) ) * 0.125 * dt * 0.5;

  total_flux = right_flux - left_flux + top_flux - bottom_flux + front_flux - back_flux;

  volume_change[OPS_ACC4(0,0,0)] = (volume[OPS_ACC5(0,0,0)])/(volume[OPS_ACC5(0,0,0)] + total_flux);

  min_cell_volume = MIN( volume[OPS_ACC5(0,0,0)] + right_flux - left_flux + top_flux - bottom_flux + front_flux - back_flux,
                    MIN( volume[OPS_ACC5(0,0,0)] + right_flux - left_flux + top_flux - bottom_flux ,
                    MIN( volume[OPS_ACC5(0,0,0)] + right_flux - left_flux,
                         volume[OPS_ACC5(0,0,0)] + top_flux - bottom_flux) ));

  recip_volume = 1.0/volume[OPS_ACC5(0,0,0)];

  energy_change = ( pressure[OPS_ACC6(0,0,0)]/density0[OPS_ACC7(0,0,0)] +
                    viscosity[OPS_ACC9(0,0,0)]/density0[OPS_ACC7(0,0,0)] ) * total_flux * recip_volume;
  energy1[OPS_ACC11(0,0,0)] = energy0[OPS_ACC10(0,0,0)] - energy_change;
  density1[OPS_ACC8(0,0,0)] = density0[OPS_ACC7(0,0,0)] * volume_change[OPS_ACC4(0,0,0)];

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
#undef OPS_ACC12
#undef OPS_ACC13


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
const double* __restrict arg12,
const double* __restrict arg13,
int size0,
int size1,
int size2 ){


  int idx_z = blockDim.z * blockIdx.z + threadIdx.z;
  int idx_y = blockDim.y * blockIdx.y + threadIdx.y;
  int idx_x = blockDim.x * blockIdx.x + threadIdx.x;

  arg0 += idx_x * 1*1 + idx_y * 1*1 * xdim0_PdV_kernel_predict + idx_z * 1*1 * xdim0_PdV_kernel_predict * ydim0_PdV_kernel_predict;
  arg1 += idx_x * 1*1 + idx_y * 1*1 * xdim1_PdV_kernel_predict + idx_z * 1*1 * xdim1_PdV_kernel_predict * ydim1_PdV_kernel_predict;
  arg2 += idx_x * 1*1 + idx_y * 1*1 * xdim2_PdV_kernel_predict + idx_z * 1*1 * xdim2_PdV_kernel_predict * ydim2_PdV_kernel_predict;
  arg3 += idx_x * 1*1 + idx_y * 1*1 * xdim3_PdV_kernel_predict + idx_z * 1*1 * xdim3_PdV_kernel_predict * ydim3_PdV_kernel_predict;
  arg4 += idx_x * 1*1 + idx_y * 1*1 * xdim4_PdV_kernel_predict + idx_z * 1*1 * xdim4_PdV_kernel_predict * ydim4_PdV_kernel_predict;
  arg5 += idx_x * 1*1 + idx_y * 1*1 * xdim5_PdV_kernel_predict + idx_z * 1*1 * xdim5_PdV_kernel_predict * ydim5_PdV_kernel_predict;
  arg6 += idx_x * 1*1 + idx_y * 1*1 * xdim6_PdV_kernel_predict + idx_z * 1*1 * xdim6_PdV_kernel_predict * ydim6_PdV_kernel_predict;
  arg7 += idx_x * 1*1 + idx_y * 1*1 * xdim7_PdV_kernel_predict + idx_z * 1*1 * xdim7_PdV_kernel_predict * ydim7_PdV_kernel_predict;
  arg8 += idx_x * 1*1 + idx_y * 1*1 * xdim8_PdV_kernel_predict + idx_z * 1*1 * xdim8_PdV_kernel_predict * ydim8_PdV_kernel_predict;
  arg9 += idx_x * 1*1 + idx_y * 1*1 * xdim9_PdV_kernel_predict + idx_z * 1*1 * xdim9_PdV_kernel_predict * ydim9_PdV_kernel_predict;
  arg10 += idx_x * 1*1 + idx_y * 1*1 * xdim10_PdV_kernel_predict + idx_z * 1*1 * xdim10_PdV_kernel_predict * ydim10_PdV_kernel_predict;
  arg11 += idx_x * 1*1 + idx_y * 1*1 * xdim11_PdV_kernel_predict + idx_z * 1*1 * xdim11_PdV_kernel_predict * ydim11_PdV_kernel_predict;
  arg12 += idx_x * 1*1 + idx_y * 1*1 * xdim12_PdV_kernel_predict + idx_z * 1*1 * xdim12_PdV_kernel_predict * ydim12_PdV_kernel_predict;
  arg13 += idx_x * 1*1 + idx_y * 1*1 * xdim13_PdV_kernel_predict + idx_z * 1*1 * xdim13_PdV_kernel_predict * ydim13_PdV_kernel_predict;

  if (idx_x < size0 && idx_y < size1 && idx_z < size2) {
    PdV_kernel_predict(arg0, arg1, arg2, arg3,
                   arg4, arg5, arg6, arg7, arg8,
                   arg9, arg10, arg11, arg12, arg13);
  }

}

// host stub function
void ops_par_loop_PdV_kernel_predict(char const *name, ops_block block, int dim, int* range,
 ops_arg arg0, ops_arg arg1, ops_arg arg2, ops_arg arg3,
 ops_arg arg4, ops_arg arg5, ops_arg arg6, ops_arg arg7, ops_arg arg8,
 ops_arg arg9, ops_arg arg10, ops_arg arg11, ops_arg arg12, ops_arg arg13) {

  ops_arg args[14] = { arg0, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9, arg10, arg11, arg12, arg13};


  #ifdef CHECKPOINTING
  if (!ops_checkpointing_before(args,14,range,4)) return;
  #endif

  ops_timing_realloc(4,"PdV_kernel_predict");
  OPS_kernels[4].count++;

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

  int x_size = MAX(0,end[0]-start[0]);
  int y_size = MAX(0,end[1]-start[1]);
  int z_size = MAX(0,end[2]-start[2]);

  int xdim0 = args[0].dat->size[0];
  int ydim0 = args[0].dat->size[1];
  int xdim1 = args[1].dat->size[0];
  int ydim1 = args[1].dat->size[1];
  int xdim2 = args[2].dat->size[0];
  int ydim2 = args[2].dat->size[1];
  int xdim3 = args[3].dat->size[0];
  int ydim3 = args[3].dat->size[1];
  int xdim4 = args[4].dat->size[0];
  int ydim4 = args[4].dat->size[1];
  int xdim5 = args[5].dat->size[0];
  int ydim5 = args[5].dat->size[1];
  int xdim6 = args[6].dat->size[0];
  int ydim6 = args[6].dat->size[1];
  int xdim7 = args[7].dat->size[0];
  int ydim7 = args[7].dat->size[1];
  int xdim8 = args[8].dat->size[0];
  int ydim8 = args[8].dat->size[1];
  int xdim9 = args[9].dat->size[0];
  int ydim9 = args[9].dat->size[1];
  int xdim10 = args[10].dat->size[0];
  int ydim10 = args[10].dat->size[1];
  int xdim11 = args[11].dat->size[0];
  int ydim11 = args[11].dat->size[1];
  int xdim12 = args[12].dat->size[0];
  int ydim12 = args[12].dat->size[1];
  int xdim13 = args[13].dat->size[0];
  int ydim13 = args[13].dat->size[1];


  //Timing
  double t1,t2,c1,c2;
  ops_timers_core(&c2,&t2);

  if (xdim0 != xdim0_PdV_kernel_predict_h || ydim0 != ydim0_PdV_kernel_predict_h || xdim1 != xdim1_PdV_kernel_predict_h || ydim1 != ydim1_PdV_kernel_predict_h || xdim2 != xdim2_PdV_kernel_predict_h || ydim2 != ydim2_PdV_kernel_predict_h || xdim3 != xdim3_PdV_kernel_predict_h || ydim3 != ydim3_PdV_kernel_predict_h || xdim4 != xdim4_PdV_kernel_predict_h || ydim4 != ydim4_PdV_kernel_predict_h || xdim5 != xdim5_PdV_kernel_predict_h || ydim5 != ydim5_PdV_kernel_predict_h || xdim6 != xdim6_PdV_kernel_predict_h || ydim6 != ydim6_PdV_kernel_predict_h || xdim7 != xdim7_PdV_kernel_predict_h || ydim7 != ydim7_PdV_kernel_predict_h || xdim8 != xdim8_PdV_kernel_predict_h || ydim8 != ydim8_PdV_kernel_predict_h || xdim9 != xdim9_PdV_kernel_predict_h || ydim9 != ydim9_PdV_kernel_predict_h || xdim10 != xdim10_PdV_kernel_predict_h || ydim10 != ydim10_PdV_kernel_predict_h || xdim11 != xdim11_PdV_kernel_predict_h || ydim11 != ydim11_PdV_kernel_predict_h || xdim12 != xdim12_PdV_kernel_predict_h || ydim12 != ydim12_PdV_kernel_predict_h || xdim13 != xdim13_PdV_kernel_predict_h || ydim13 != ydim13_PdV_kernel_predict_h) {
    cudaMemcpyToSymbol( xdim0_PdV_kernel_predict, &xdim0, sizeof(int) );
    xdim0_PdV_kernel_predict_h = xdim0;
    cudaMemcpyToSymbol( ydim0_PdV_kernel_predict, &ydim0, sizeof(int) );
    ydim0_PdV_kernel_predict_h = ydim0;
    cudaMemcpyToSymbol( xdim1_PdV_kernel_predict, &xdim1, sizeof(int) );
    xdim1_PdV_kernel_predict_h = xdim1;
    cudaMemcpyToSymbol( ydim1_PdV_kernel_predict, &ydim1, sizeof(int) );
    ydim1_PdV_kernel_predict_h = ydim1;
    cudaMemcpyToSymbol( xdim2_PdV_kernel_predict, &xdim2, sizeof(int) );
    xdim2_PdV_kernel_predict_h = xdim2;
    cudaMemcpyToSymbol( ydim2_PdV_kernel_predict, &ydim2, sizeof(int) );
    ydim2_PdV_kernel_predict_h = ydim2;
    cudaMemcpyToSymbol( xdim3_PdV_kernel_predict, &xdim3, sizeof(int) );
    xdim3_PdV_kernel_predict_h = xdim3;
    cudaMemcpyToSymbol( ydim3_PdV_kernel_predict, &ydim3, sizeof(int) );
    ydim3_PdV_kernel_predict_h = ydim3;
    cudaMemcpyToSymbol( xdim4_PdV_kernel_predict, &xdim4, sizeof(int) );
    xdim4_PdV_kernel_predict_h = xdim4;
    cudaMemcpyToSymbol( ydim4_PdV_kernel_predict, &ydim4, sizeof(int) );
    ydim4_PdV_kernel_predict_h = ydim4;
    cudaMemcpyToSymbol( xdim5_PdV_kernel_predict, &xdim5, sizeof(int) );
    xdim5_PdV_kernel_predict_h = xdim5;
    cudaMemcpyToSymbol( ydim5_PdV_kernel_predict, &ydim5, sizeof(int) );
    ydim5_PdV_kernel_predict_h = ydim5;
    cudaMemcpyToSymbol( xdim6_PdV_kernel_predict, &xdim6, sizeof(int) );
    xdim6_PdV_kernel_predict_h = xdim6;
    cudaMemcpyToSymbol( ydim6_PdV_kernel_predict, &ydim6, sizeof(int) );
    ydim6_PdV_kernel_predict_h = ydim6;
    cudaMemcpyToSymbol( xdim7_PdV_kernel_predict, &xdim7, sizeof(int) );
    xdim7_PdV_kernel_predict_h = xdim7;
    cudaMemcpyToSymbol( ydim7_PdV_kernel_predict, &ydim7, sizeof(int) );
    ydim7_PdV_kernel_predict_h = ydim7;
    cudaMemcpyToSymbol( xdim8_PdV_kernel_predict, &xdim8, sizeof(int) );
    xdim8_PdV_kernel_predict_h = xdim8;
    cudaMemcpyToSymbol( ydim8_PdV_kernel_predict, &ydim8, sizeof(int) );
    ydim8_PdV_kernel_predict_h = ydim8;
    cudaMemcpyToSymbol( xdim9_PdV_kernel_predict, &xdim9, sizeof(int) );
    xdim9_PdV_kernel_predict_h = xdim9;
    cudaMemcpyToSymbol( ydim9_PdV_kernel_predict, &ydim9, sizeof(int) );
    ydim9_PdV_kernel_predict_h = ydim9;
    cudaMemcpyToSymbol( xdim10_PdV_kernel_predict, &xdim10, sizeof(int) );
    xdim10_PdV_kernel_predict_h = xdim10;
    cudaMemcpyToSymbol( ydim10_PdV_kernel_predict, &ydim10, sizeof(int) );
    ydim10_PdV_kernel_predict_h = ydim10;
    cudaMemcpyToSymbol( xdim11_PdV_kernel_predict, &xdim11, sizeof(int) );
    xdim11_PdV_kernel_predict_h = xdim11;
    cudaMemcpyToSymbol( ydim11_PdV_kernel_predict, &ydim11, sizeof(int) );
    ydim11_PdV_kernel_predict_h = ydim11;
    cudaMemcpyToSymbol( xdim12_PdV_kernel_predict, &xdim12, sizeof(int) );
    xdim12_PdV_kernel_predict_h = xdim12;
    cudaMemcpyToSymbol( ydim12_PdV_kernel_predict, &ydim12, sizeof(int) );
    ydim12_PdV_kernel_predict_h = ydim12;
    cudaMemcpyToSymbol( xdim13_PdV_kernel_predict, &xdim13, sizeof(int) );
    xdim13_PdV_kernel_predict_h = xdim13;
    cudaMemcpyToSymbol( ydim13_PdV_kernel_predict, &ydim13, sizeof(int) );
    ydim13_PdV_kernel_predict_h = ydim13;
  }



  dim3 grid( (x_size-1)/OPS_block_size_x+ 1, (y_size-1)/OPS_block_size_y + 1, z_size);
  dim3 tblock(OPS_block_size_x,OPS_block_size_y,1);



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
  int dat11 = args[11].dat->elem_size;
  int dat12 = args[12].dat->elem_size;
  int dat13 = args[13].dat->elem_size;

  char *p_a[14];

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
  p_a[0] = (char *)args[0].data_d + base0;

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
  p_a[1] = (char *)args[1].data_d + base1;

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
  p_a[2] = (char *)args[2].data_d + base2;

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
  p_a[3] = (char *)args[3].data_d + base3;

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
  p_a[4] = (char *)args[4].data_d + base4;

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
  p_a[5] = (char *)args[5].data_d + base5;

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
  base6 = base6+ dat6 *
    args[6].dat->size[0] *
    args[6].dat->size[1] *
    (start[2] * args[6].stencil->stride[2] - args[6].dat->base[2] - d_m[2]);
  p_a[6] = (char *)args[6].data_d + base6;

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
  base7 = base7+ dat7 *
    args[7].dat->size[0] *
    args[7].dat->size[1] *
    (start[2] * args[7].stencil->stride[2] - args[7].dat->base[2] - d_m[2]);
  p_a[7] = (char *)args[7].data_d + base7;

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
  base8 = base8+ dat8 *
    args[8].dat->size[0] *
    args[8].dat->size[1] *
    (start[2] * args[8].stencil->stride[2] - args[8].dat->base[2] - d_m[2]);
  p_a[8] = (char *)args[8].data_d + base8;

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
  base9 = base9+ dat9 *
    args[9].dat->size[0] *
    args[9].dat->size[1] *
    (start[2] * args[9].stencil->stride[2] - args[9].dat->base[2] - d_m[2]);
  p_a[9] = (char *)args[9].data_d + base9;

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
  base10 = base10+ dat10 *
    args[10].dat->size[0] *
    args[10].dat->size[1] *
    (start[2] * args[10].stencil->stride[2] - args[10].dat->base[2] - d_m[2]);
  p_a[10] = (char *)args[10].data_d + base10;

  #ifdef OPS_MPI
  for (int d = 0; d < dim; d++) d_m[d] = args[11].dat->d_m[d] + OPS_sub_dat_list[args[11].dat->index]->d_im[d];
  #else //OPS_MPI
  for (int d = 0; d < dim; d++) d_m[d] = args[11].dat->d_m[d];
  #endif //OPS_MPI
  int base11 = dat11 * 1 *
  (start[0] * args[11].stencil->stride[0] - args[11].dat->base[0] - d_m[0]);
  base11 = base11+ dat11 *
    args[11].dat->size[0] *
    (start[1] * args[11].stencil->stride[1] - args[11].dat->base[1] - d_m[1]);
  base11 = base11+ dat11 *
    args[11].dat->size[0] *
    args[11].dat->size[1] *
    (start[2] * args[11].stencil->stride[2] - args[11].dat->base[2] - d_m[2]);
  p_a[11] = (char *)args[11].data_d + base11;

  #ifdef OPS_MPI
  for (int d = 0; d < dim; d++) d_m[d] = args[12].dat->d_m[d] + OPS_sub_dat_list[args[12].dat->index]->d_im[d];
  #else //OPS_MPI
  for (int d = 0; d < dim; d++) d_m[d] = args[12].dat->d_m[d];
  #endif //OPS_MPI
  int base12 = dat12 * 1 *
  (start[0] * args[12].stencil->stride[0] - args[12].dat->base[0] - d_m[0]);
  base12 = base12+ dat12 *
    args[12].dat->size[0] *
    (start[1] * args[12].stencil->stride[1] - args[12].dat->base[1] - d_m[1]);
  base12 = base12+ dat12 *
    args[12].dat->size[0] *
    args[12].dat->size[1] *
    (start[2] * args[12].stencil->stride[2] - args[12].dat->base[2] - d_m[2]);
  p_a[12] = (char *)args[12].data_d + base12;

  #ifdef OPS_MPI
  for (int d = 0; d < dim; d++) d_m[d] = args[13].dat->d_m[d] + OPS_sub_dat_list[args[13].dat->index]->d_im[d];
  #else //OPS_MPI
  for (int d = 0; d < dim; d++) d_m[d] = args[13].dat->d_m[d];
  #endif //OPS_MPI
  int base13 = dat13 * 1 *
  (start[0] * args[13].stencil->stride[0] - args[13].dat->base[0] - d_m[0]);
  base13 = base13+ dat13 *
    args[13].dat->size[0] *
    (start[1] * args[13].stencil->stride[1] - args[13].dat->base[1] - d_m[1]);
  base13 = base13+ dat13 *
    args[13].dat->size[0] *
    args[13].dat->size[1] *
    (start[2] * args[13].stencil->stride[2] - args[13].dat->base[2] - d_m[2]);
  p_a[13] = (char *)args[13].data_d + base13;


  ops_H_D_exchanges_device(args, 14);
  ops_halo_exchanges(args,14,range);

  ops_timers_core(&c1,&t1);
  OPS_kernels[4].mpi_time += t1-t2;


  //call kernel wrapper function, passing in pointers to data
  ops_PdV_kernel_predict<<<grid, tblock >>> (  (double *)p_a[0], (double *)p_a[1],
           (double *)p_a[2], (double *)p_a[3],
           (double *)p_a[4], (double *)p_a[5],
           (double *)p_a[6], (double *)p_a[7],
           (double *)p_a[8], (double *)p_a[9],
           (double *)p_a[10], (double *)p_a[11],
           (double *)p_a[12], (double *)p_a[13],x_size, y_size, z_size);

  if (OPS_diags>1) {
    cutilSafeCall(cudaDeviceSynchronize());
  }
  ops_timers_core(&c2,&t2);
  OPS_kernels[4].time += t2-t1;
  ops_set_dirtybit_device(args, 14);
  ops_set_halo_dirtybit3(&args[4],range);
  ops_set_halo_dirtybit3(&args[8],range);
  ops_set_halo_dirtybit3(&args[11],range);

  //Update kernel record
  OPS_kernels[4].transfer += ops_compute_transfer(dim, range, &arg0);
  OPS_kernels[4].transfer += ops_compute_transfer(dim, range, &arg1);
  OPS_kernels[4].transfer += ops_compute_transfer(dim, range, &arg2);
  OPS_kernels[4].transfer += ops_compute_transfer(dim, range, &arg3);
  OPS_kernels[4].transfer += ops_compute_transfer(dim, range, &arg4);
  OPS_kernels[4].transfer += ops_compute_transfer(dim, range, &arg5);
  OPS_kernels[4].transfer += ops_compute_transfer(dim, range, &arg6);
  OPS_kernels[4].transfer += ops_compute_transfer(dim, range, &arg7);
  OPS_kernels[4].transfer += ops_compute_transfer(dim, range, &arg8);
  OPS_kernels[4].transfer += ops_compute_transfer(dim, range, &arg9);
  OPS_kernels[4].transfer += ops_compute_transfer(dim, range, &arg10);
  OPS_kernels[4].transfer += ops_compute_transfer(dim, range, &arg11);
  OPS_kernels[4].transfer += ops_compute_transfer(dim, range, &arg12);
  OPS_kernels[4].transfer += ops_compute_transfer(dim, range, &arg13);
}
