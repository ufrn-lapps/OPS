//
// auto-generated by ops.py on 2014-07-31 12:24
//

__constant__ int xdim0_accelerate_kernel;
__constant__ int ydim0_accelerate_kernel;
__constant__ int xdim1_accelerate_kernel;
__constant__ int ydim1_accelerate_kernel;
__constant__ int xdim2_accelerate_kernel;
__constant__ int ydim2_accelerate_kernel;
__constant__ int xdim3_accelerate_kernel;
__constant__ int ydim3_accelerate_kernel;
__constant__ int xdim4_accelerate_kernel;
__constant__ int ydim4_accelerate_kernel;
__constant__ int xdim5_accelerate_kernel;
__constant__ int ydim5_accelerate_kernel;
__constant__ int xdim6_accelerate_kernel;
__constant__ int ydim6_accelerate_kernel;
__constant__ int xdim7_accelerate_kernel;
__constant__ int ydim7_accelerate_kernel;
__constant__ int xdim8_accelerate_kernel;
__constant__ int ydim8_accelerate_kernel;
__constant__ int xdim9_accelerate_kernel;
__constant__ int ydim9_accelerate_kernel;
__constant__ int xdim10_accelerate_kernel;
__constant__ int ydim10_accelerate_kernel;
__constant__ int xdim11_accelerate_kernel;
__constant__ int ydim11_accelerate_kernel;
__constant__ int xdim12_accelerate_kernel;
__constant__ int ydim12_accelerate_kernel;
__constant__ int xdim13_accelerate_kernel;
__constant__ int ydim13_accelerate_kernel;

#define OPS_ACC0(x,y,z) (x+xdim0_accelerate_kernel*(y)+xdim0_accelerate_kernel*ydim0_accelerate_kernel*(z))
#define OPS_ACC1(x,y,z) (x+xdim1_accelerate_kernel*(y)+xdim1_accelerate_kernel*ydim1_accelerate_kernel*(z))
#define OPS_ACC2(x,y,z) (x+xdim2_accelerate_kernel*(y)+xdim2_accelerate_kernel*ydim2_accelerate_kernel*(z))
#define OPS_ACC3(x,y,z) (x+xdim3_accelerate_kernel*(y)+xdim3_accelerate_kernel*ydim3_accelerate_kernel*(z))
#define OPS_ACC4(x,y,z) (x+xdim4_accelerate_kernel*(y)+xdim4_accelerate_kernel*ydim4_accelerate_kernel*(z))
#define OPS_ACC5(x,y,z) (x+xdim5_accelerate_kernel*(y)+xdim5_accelerate_kernel*ydim5_accelerate_kernel*(z))
#define OPS_ACC6(x,y,z) (x+xdim6_accelerate_kernel*(y)+xdim6_accelerate_kernel*ydim6_accelerate_kernel*(z))
#define OPS_ACC7(x,y,z) (x+xdim7_accelerate_kernel*(y)+xdim7_accelerate_kernel*ydim7_accelerate_kernel*(z))
#define OPS_ACC8(x,y,z) (x+xdim8_accelerate_kernel*(y)+xdim8_accelerate_kernel*ydim8_accelerate_kernel*(z))
#define OPS_ACC9(x,y,z) (x+xdim9_accelerate_kernel*(y)+xdim9_accelerate_kernel*ydim9_accelerate_kernel*(z))
#define OPS_ACC10(x,y,z) (x+xdim10_accelerate_kernel*(y)+xdim10_accelerate_kernel*ydim10_accelerate_kernel*(z))
#define OPS_ACC11(x,y,z) (x+xdim11_accelerate_kernel*(y)+xdim11_accelerate_kernel*ydim11_accelerate_kernel*(z))
#define OPS_ACC12(x,y,z) (x+xdim12_accelerate_kernel*(y)+xdim12_accelerate_kernel*ydim12_accelerate_kernel*(z))
#define OPS_ACC13(x,y,z) (x+xdim13_accelerate_kernel*(y)+xdim13_accelerate_kernel*ydim13_accelerate_kernel*(z))

//user function
__device__

void accelerate_kernel( const double *density0, const double *volume,
                double *stepbymass, const double *xvel0, double *xvel1,
                const double *xarea, const double *pressure,
                const double *yvel0, double *yvel1,
                const double *yarea, const double *viscosity,
                const double *zvel0, double *zvel1,
                const double *zarea) {

  double nodal_mass = 0.0;
  nodal_mass =(density0[OPS_ACC0(-1,-1, 0)] * volume[OPS_ACC1(-1,-1, 0)] +
               density0[OPS_ACC0( 0,-1, 0)] * volume[OPS_ACC1( 0,-1, 0)] +
               density0[OPS_ACC0( 0, 0, 0)] * volume[OPS_ACC1( 0, 0, 0)] +
               density0[OPS_ACC0(-1, 0, 0)] * volume[OPS_ACC1(-1, 0, 0)] +
               density0[OPS_ACC0(-1,-1,-1)] * volume[OPS_ACC1(-1,-1,-1)] +
               density0[OPS_ACC0( 0,-1,-1)] * volume[OPS_ACC1( 0,-1,-1)] +
               density0[OPS_ACC0( 0, 0,-1)] * volume[OPS_ACC1( 0, 0,-1)] +
               density0[OPS_ACC0(-1, 0,-1)] * volume[OPS_ACC1(-1, 0,-1)]) * 0.125;

  stepbymass[OPS_ACC2(0,0,0)] = 0.25*dt / nodal_mass;

  xvel1[OPS_ACC4(0,0,0)] = xvel0[OPS_ACC3(0,0,0)] - stepbymass[OPS_ACC2(0,0,0)] *
            ( xarea[OPS_ACC5(0,0,0)]  * ( pressure[OPS_ACC6(0,0,0)] - pressure[OPS_ACC6(-1,0,0)] ) +
              xarea[OPS_ACC5(0,-1,0)] * ( pressure[OPS_ACC6(0,-1,0)] - pressure[OPS_ACC6(-1,-1,0)] ) +
              xarea[OPS_ACC5(0,0,-1)] * ( pressure[OPS_ACC6(0,0,-1)] - pressure[OPS_ACC6(-1,0,-1)] ) +
              xarea[OPS_ACC5(0,-1,-1)] * ( pressure[OPS_ACC6(0,-1,-1)] - pressure[OPS_ACC6(-1,-1,-1)] ) );

  yvel1[OPS_ACC8(0,0,0)] = yvel0[OPS_ACC7(0,0,0)] - stepbymass[OPS_ACC2(0,0,0)] *
            ( yarea[OPS_ACC9(0,0,0)]  * ( pressure[OPS_ACC6(0,0,0)] - pressure[OPS_ACC6(0,-1,0)] ) +
              yarea[OPS_ACC9(-1,0,0)] * ( pressure[OPS_ACC6(-1,0,0)] - pressure[OPS_ACC6(-1,-1,0)] ) +
              yarea[OPS_ACC9(0,0,-1)] * ( pressure[OPS_ACC6(0,0,-1)] - pressure[OPS_ACC6(0,-1,-1)] ) +
              yarea[OPS_ACC9(-1,0,-1)]* ( pressure[OPS_ACC6(-1,0,-1)] - pressure[OPS_ACC6(-1,-1,-1)] ) );

  zvel1[OPS_ACC12(0,0,0)] = zvel0[OPS_ACC11(0,0,0)] - stepbymass[OPS_ACC2(0,0,0)] *
            ( zarea[OPS_ACC13(0,0,0)]  * ( pressure[OPS_ACC6(0,0,0)] - pressure[OPS_ACC6(0,0,-1)] ) +
              zarea[OPS_ACC13(0,-1,0)] * ( pressure[OPS_ACC6(0,-1,0)] - pressure[OPS_ACC6(0,-1,-1)] ) +
              zarea[OPS_ACC13(-1,0,0)] * ( pressure[OPS_ACC6(-1,0,0)] - pressure[OPS_ACC6(-1,0,-1)] ) +
              zarea[OPS_ACC13(-1,-1,0)]* ( pressure[OPS_ACC6(-1,-1,0)] - pressure[OPS_ACC6(-1,-1,-1)] ) );

  xvel1[OPS_ACC4(0,0,0)] = xvel1[OPS_ACC4(0,0,0)] - stepbymass[OPS_ACC2(0,0,0)] *
            ( xarea[OPS_ACC5(0,0,0)]  * ( viscosity[OPS_ACC10(0,0,0)] - viscosity[OPS_ACC10(-1,0,0)] ) +
              xarea[OPS_ACC5(0,-1,0)] * ( viscosity[OPS_ACC10(0,-1,0)] - viscosity[OPS_ACC10(-1,-1,0)] ) +
              xarea[OPS_ACC5(0,0,-1)] * ( viscosity[OPS_ACC10(0,0,-1)] - viscosity[OPS_ACC10(-1,0,-1)] ) +
              xarea[OPS_ACC5(0,-1,-1)]* ( viscosity[OPS_ACC10(0,-1,-1)] - viscosity[OPS_ACC10(-1,-1,-1)] ) );

  yvel1[OPS_ACC8(0,0,0)] = yvel1[OPS_ACC8(0,0,0)] - stepbymass[OPS_ACC2(0,0,0)] *
            ( yarea[OPS_ACC9(0,0,0)]  * ( viscosity[OPS_ACC10(0,0,0)]  - viscosity[OPS_ACC10(0,-1,0)] ) +
              yarea[OPS_ACC9(-1,0,0)] * ( viscosity[OPS_ACC10(-1,0,0)] - viscosity[OPS_ACC10(-1,-1,0)] ) +
              yarea[OPS_ACC9(0,0,-1)] * ( viscosity[OPS_ACC10(0,0,-1)] - viscosity[OPS_ACC10(0,-1,-1)] ) +
              yarea[OPS_ACC9(-1,0,-1)]* ( viscosity[OPS_ACC10(-1,0,-1)]- viscosity[OPS_ACC10(-1,-1,-1)] ) );

  zvel1[OPS_ACC12(0,0,0)] = zvel1[OPS_ACC12(0,0,0)] - stepbymass[OPS_ACC2(0,0,0)] *
            ( zarea[OPS_ACC13(0,0,0)]  * ( viscosity[OPS_ACC10(0,0,0)]  - viscosity[OPS_ACC10(0,0,-1)] ) +
              zarea[OPS_ACC13(0,-1,0)] * ( viscosity[OPS_ACC10(0,-1,0)] - viscosity[OPS_ACC10(0,-1,-1)] ) +
              zarea[OPS_ACC13(-1,0,0)] * ( viscosity[OPS_ACC10(-1,0,0)] - viscosity[OPS_ACC10(-1,0,-1)] ) +
              zarea[OPS_ACC13(-1,-1,0)]* ( viscosity[OPS_ACC10(-1,-1,0)]- viscosity[OPS_ACC10(-1,-1,-1)] ) );

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


__global__ void ops_accelerate_kernel(
const double* __restrict arg0,
const double* __restrict arg1,
double* __restrict arg2,
const double* __restrict arg3,
double* __restrict arg4,
const double* __restrict arg5,
const double* __restrict arg6,
const double* __restrict arg7,
double* __restrict arg8,
const double* __restrict arg9,
const double* __restrict arg10,
const double* __restrict arg11,
double* __restrict arg12,
const double* __restrict arg13,
int size0,
int size1,
int size2 ){


  int idx_z = blockDim.z * blockIdx.z + threadIdx.z;
  int idx_y = blockDim.y * blockIdx.y + threadIdx.y;
  int idx_x = blockDim.x * blockIdx.x + threadIdx.x;

  arg0 += idx_x * 1 + idx_y * 1 * xdim0_accelerate_kernel + idx_z * 1 * xdim0_accelerate_kernel * ydim0_accelerate_kernel;
  arg1 += idx_x * 1 + idx_y * 1 * xdim1_accelerate_kernel + idx_z * 1 * xdim1_accelerate_kernel * ydim1_accelerate_kernel;
  arg2 += idx_x * 1 + idx_y * 1 * xdim2_accelerate_kernel + idx_z * 1 * xdim2_accelerate_kernel * ydim2_accelerate_kernel;
  arg3 += idx_x * 1 + idx_y * 1 * xdim3_accelerate_kernel + idx_z * 1 * xdim3_accelerate_kernel * ydim3_accelerate_kernel;
  arg4 += idx_x * 1 + idx_y * 1 * xdim4_accelerate_kernel + idx_z * 1 * xdim4_accelerate_kernel * ydim4_accelerate_kernel;
  arg5 += idx_x * 1 + idx_y * 1 * xdim5_accelerate_kernel + idx_z * 1 * xdim5_accelerate_kernel * ydim5_accelerate_kernel;
  arg6 += idx_x * 1 + idx_y * 1 * xdim6_accelerate_kernel + idx_z * 1 * xdim6_accelerate_kernel * ydim6_accelerate_kernel;
  arg7 += idx_x * 1 + idx_y * 1 * xdim7_accelerate_kernel + idx_z * 1 * xdim7_accelerate_kernel * ydim7_accelerate_kernel;
  arg8 += idx_x * 1 + idx_y * 1 * xdim8_accelerate_kernel + idx_z * 1 * xdim8_accelerate_kernel * ydim8_accelerate_kernel;
  arg9 += idx_x * 1 + idx_y * 1 * xdim9_accelerate_kernel + idx_z * 1 * xdim9_accelerate_kernel * ydim9_accelerate_kernel;
  arg10 += idx_x * 1 + idx_y * 1 * xdim10_accelerate_kernel + idx_z * 1 * xdim10_accelerate_kernel * ydim10_accelerate_kernel;
  arg11 += idx_x * 1 + idx_y * 1 * xdim11_accelerate_kernel + idx_z * 1 * xdim11_accelerate_kernel * ydim11_accelerate_kernel;
  arg12 += idx_x * 1 + idx_y * 1 * xdim12_accelerate_kernel + idx_z * 1 * xdim12_accelerate_kernel * ydim12_accelerate_kernel;
  arg13 += idx_x * 1 + idx_y * 1 * xdim13_accelerate_kernel + idx_z * 1 * xdim13_accelerate_kernel * ydim13_accelerate_kernel;

  if (idx_x < size0 && idx_y < size1 && idx_z < size2) {
    accelerate_kernel(arg0, arg1, arg2, arg3,
                   arg4, arg5, arg6, arg7, arg8,
                   arg9, arg10, arg11, arg12, arg13);
  }

}

// host stub function
void ops_par_loop_accelerate_kernel(char const *name, ops_block Block, int dim, int* range,
 ops_arg arg0, ops_arg arg1, ops_arg arg2, ops_arg arg3,
 ops_arg arg4, ops_arg arg5, ops_arg arg6, ops_arg arg7, ops_arg arg8,
 ops_arg arg9, ops_arg arg10, ops_arg arg11, ops_arg arg12, ops_arg arg13) {

  ops_arg args[14] = { arg0, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9, arg10, arg11, arg12, arg13};

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
  int xdim7 = args[7].dat->block_size[0]*args[7].dat->dim;
  int ydim7 = args[7].dat->block_size[1];
  int xdim8 = args[8].dat->block_size[0]*args[8].dat->dim;
  int ydim8 = args[8].dat->block_size[1];
  int xdim9 = args[9].dat->block_size[0]*args[9].dat->dim;
  int ydim9 = args[9].dat->block_size[1];
  int xdim10 = args[10].dat->block_size[0]*args[10].dat->dim;
  int ydim10 = args[10].dat->block_size[1];
  int xdim11 = args[11].dat->block_size[0]*args[11].dat->dim;
  int ydim11 = args[11].dat->block_size[1];
  int xdim12 = args[12].dat->block_size[0]*args[12].dat->dim;
  int ydim12 = args[12].dat->block_size[1];
  int xdim13 = args[13].dat->block_size[0]*args[13].dat->dim;
  int ydim13 = args[13].dat->block_size[1];


  //Timing
  double t1,t2,c1,c2;
  ops_timing_realloc(1,"accelerate_kernel");
  ops_timers_core(&c2,&t2);

  if (OPS_kernels[1].count == 0) {
    cudaMemcpyToSymbol( xdim0_accelerate_kernel, &xdim0, sizeof(int) );
    cudaMemcpyToSymbol( ydim0_accelerate_kernel, &ydim0, sizeof(int) );
    cudaMemcpyToSymbol( xdim1_accelerate_kernel, &xdim1, sizeof(int) );
    cudaMemcpyToSymbol( ydim1_accelerate_kernel, &ydim1, sizeof(int) );
    cudaMemcpyToSymbol( xdim2_accelerate_kernel, &xdim2, sizeof(int) );
    cudaMemcpyToSymbol( ydim2_accelerate_kernel, &ydim2, sizeof(int) );
    cudaMemcpyToSymbol( xdim3_accelerate_kernel, &xdim3, sizeof(int) );
    cudaMemcpyToSymbol( ydim3_accelerate_kernel, &ydim3, sizeof(int) );
    cudaMemcpyToSymbol( xdim4_accelerate_kernel, &xdim4, sizeof(int) );
    cudaMemcpyToSymbol( ydim4_accelerate_kernel, &ydim4, sizeof(int) );
    cudaMemcpyToSymbol( xdim5_accelerate_kernel, &xdim5, sizeof(int) );
    cudaMemcpyToSymbol( ydim5_accelerate_kernel, &ydim5, sizeof(int) );
    cudaMemcpyToSymbol( xdim6_accelerate_kernel, &xdim6, sizeof(int) );
    cudaMemcpyToSymbol( ydim6_accelerate_kernel, &ydim6, sizeof(int) );
    cudaMemcpyToSymbol( xdim7_accelerate_kernel, &xdim7, sizeof(int) );
    cudaMemcpyToSymbol( ydim7_accelerate_kernel, &ydim7, sizeof(int) );
    cudaMemcpyToSymbol( xdim8_accelerate_kernel, &xdim8, sizeof(int) );
    cudaMemcpyToSymbol( ydim8_accelerate_kernel, &ydim8, sizeof(int) );
    cudaMemcpyToSymbol( xdim9_accelerate_kernel, &xdim9, sizeof(int) );
    cudaMemcpyToSymbol( ydim9_accelerate_kernel, &ydim9, sizeof(int) );
    cudaMemcpyToSymbol( xdim10_accelerate_kernel, &xdim10, sizeof(int) );
    cudaMemcpyToSymbol( ydim10_accelerate_kernel, &ydim10, sizeof(int) );
    cudaMemcpyToSymbol( xdim11_accelerate_kernel, &xdim11, sizeof(int) );
    cudaMemcpyToSymbol( ydim11_accelerate_kernel, &ydim11, sizeof(int) );
    cudaMemcpyToSymbol( xdim12_accelerate_kernel, &xdim12, sizeof(int) );
    cudaMemcpyToSymbol( ydim12_accelerate_kernel, &ydim12, sizeof(int) );
    cudaMemcpyToSymbol( xdim13_accelerate_kernel, &xdim13, sizeof(int) );
    cudaMemcpyToSymbol( ydim13_accelerate_kernel, &ydim13, sizeof(int) );
  }



  dim3 grid( (x_size-1)/OPS_block_size_x+ 1, (y_size-1)/OPS_block_size_y + 1, z_size);
  dim3 block(OPS_block_size_x,OPS_block_size_y,1);



  int dat0 = args[0].dat->size;
  int dat1 = args[1].dat->size;
  int dat2 = args[2].dat->size;
  int dat3 = args[3].dat->size;
  int dat4 = args[4].dat->size;
  int dat5 = args[5].dat->size;
  int dat6 = args[6].dat->size;
  int dat7 = args[7].dat->size;
  int dat8 = args[8].dat->size;
  int dat9 = args[9].dat->size;
  int dat10 = args[10].dat->size;
  int dat11 = args[11].dat->size;
  int dat12 = args[12].dat->size;
  int dat13 = args[13].dat->size;

  char *p_a[14];

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

  int base7 = dat7 * 1 * 
  (start_add[0] * args[7].stencil->stride[0] - args[7].dat->offset[0]);
  base7 = base7+ dat7 *
    args[7].dat->block_size[0] *
    (start_add[1] * args[7].stencil->stride[1] - args[7].dat->offset[1]);
  base7 = base7+ dat7 *
    args[7].dat->block_size[0] *
    args[7].dat->block_size[1] *
    (start_add[2] * args[7].stencil->stride[2] - args[7].dat->offset[2]);
  p_a[7] = (char *)args[7].data_d + base7;

  int base8 = dat8 * 1 * 
  (start_add[0] * args[8].stencil->stride[0] - args[8].dat->offset[0]);
  base8 = base8+ dat8 *
    args[8].dat->block_size[0] *
    (start_add[1] * args[8].stencil->stride[1] - args[8].dat->offset[1]);
  base8 = base8+ dat8 *
    args[8].dat->block_size[0] *
    args[8].dat->block_size[1] *
    (start_add[2] * args[8].stencil->stride[2] - args[8].dat->offset[2]);
  p_a[8] = (char *)args[8].data_d + base8;

  int base9 = dat9 * 1 * 
  (start_add[0] * args[9].stencil->stride[0] - args[9].dat->offset[0]);
  base9 = base9+ dat9 *
    args[9].dat->block_size[0] *
    (start_add[1] * args[9].stencil->stride[1] - args[9].dat->offset[1]);
  base9 = base9+ dat9 *
    args[9].dat->block_size[0] *
    args[9].dat->block_size[1] *
    (start_add[2] * args[9].stencil->stride[2] - args[9].dat->offset[2]);
  p_a[9] = (char *)args[9].data_d + base9;

  int base10 = dat10 * 1 * 
  (start_add[0] * args[10].stencil->stride[0] - args[10].dat->offset[0]);
  base10 = base10+ dat10 *
    args[10].dat->block_size[0] *
    (start_add[1] * args[10].stencil->stride[1] - args[10].dat->offset[1]);
  base10 = base10+ dat10 *
    args[10].dat->block_size[0] *
    args[10].dat->block_size[1] *
    (start_add[2] * args[10].stencil->stride[2] - args[10].dat->offset[2]);
  p_a[10] = (char *)args[10].data_d + base10;

  int base11 = dat11 * 1 * 
  (start_add[0] * args[11].stencil->stride[0] - args[11].dat->offset[0]);
  base11 = base11+ dat11 *
    args[11].dat->block_size[0] *
    (start_add[1] * args[11].stencil->stride[1] - args[11].dat->offset[1]);
  base11 = base11+ dat11 *
    args[11].dat->block_size[0] *
    args[11].dat->block_size[1] *
    (start_add[2] * args[11].stencil->stride[2] - args[11].dat->offset[2]);
  p_a[11] = (char *)args[11].data_d + base11;

  int base12 = dat12 * 1 * 
  (start_add[0] * args[12].stencil->stride[0] - args[12].dat->offset[0]);
  base12 = base12+ dat12 *
    args[12].dat->block_size[0] *
    (start_add[1] * args[12].stencil->stride[1] - args[12].dat->offset[1]);
  base12 = base12+ dat12 *
    args[12].dat->block_size[0] *
    args[12].dat->block_size[1] *
    (start_add[2] * args[12].stencil->stride[2] - args[12].dat->offset[2]);
  p_a[12] = (char *)args[12].data_d + base12;

  int base13 = dat13 * 1 * 
  (start_add[0] * args[13].stencil->stride[0] - args[13].dat->offset[0]);
  base13 = base13+ dat13 *
    args[13].dat->block_size[0] *
    (start_add[1] * args[13].stencil->stride[1] - args[13].dat->offset[1]);
  base13 = base13+ dat13 *
    args[13].dat->block_size[0] *
    args[13].dat->block_size[1] *
    (start_add[2] * args[13].stencil->stride[2] - args[13].dat->offset[2]);
  p_a[13] = (char *)args[13].data_d + base13;


  ops_H_D_exchanges_cuda(args, 14);
  ops_halo_exchanges(args,14,range);

  ops_timers_core(&c1,&t1);
  OPS_kernels[1].mpi_time += t1-t2;


  //call kernel wrapper function, passing in pointers to data
  ops_accelerate_kernel<<<grid, block >>> (  (double *)p_a[0], (double *)p_a[1],
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
  OPS_kernels[1].time += t2-t1;
  ops_set_dirtybit_cuda(args, 14);
  ops_set_halo_dirtybit3(&args[2],range);
  ops_set_halo_dirtybit3(&args[4],range);
  ops_set_halo_dirtybit3(&args[8],range);
  ops_set_halo_dirtybit3(&args[12],range);

  //Update kernel record
  OPS_kernels[1].count++;
  OPS_kernels[1].transfer += ops_compute_transfer(dim, range, &arg0);
  OPS_kernels[1].transfer += ops_compute_transfer(dim, range, &arg1);
  OPS_kernels[1].transfer += ops_compute_transfer(dim, range, &arg2);
  OPS_kernels[1].transfer += ops_compute_transfer(dim, range, &arg3);
  OPS_kernels[1].transfer += ops_compute_transfer(dim, range, &arg4);
  OPS_kernels[1].transfer += ops_compute_transfer(dim, range, &arg5);
  OPS_kernels[1].transfer += ops_compute_transfer(dim, range, &arg6);
  OPS_kernels[1].transfer += ops_compute_transfer(dim, range, &arg7);
  OPS_kernels[1].transfer += ops_compute_transfer(dim, range, &arg8);
  OPS_kernels[1].transfer += ops_compute_transfer(dim, range, &arg9);
  OPS_kernels[1].transfer += ops_compute_transfer(dim, range, &arg10);
  OPS_kernels[1].transfer += ops_compute_transfer(dim, range, &arg11);
  OPS_kernels[1].transfer += ops_compute_transfer(dim, range, &arg12);
  OPS_kernels[1].transfer += ops_compute_transfer(dim, range, &arg13);
}
