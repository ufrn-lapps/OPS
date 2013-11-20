//
// auto-generated by ops.py on 2013-11-20 16:07
//

__constant__ int xdim0_viscosity_kernel;
__constant__ int xdim1_viscosity_kernel;
__constant__ int xdim2_viscosity_kernel;
__constant__ int xdim3_viscosity_kernel;
__constant__ int xdim4_viscosity_kernel;
__constant__ int xdim5_viscosity_kernel;
__constant__ int xdim6_viscosity_kernel;

#define OPS_ACC0(x,y) (x+xdim0_viscosity_kernel*(y))
#define OPS_ACC1(x,y) (x+xdim1_viscosity_kernel*(y))
#define OPS_ACC2(x,y) (x+xdim2_viscosity_kernel*(y))
#define OPS_ACC3(x,y) (x+xdim3_viscosity_kernel*(y))
#define OPS_ACC4(x,y) (x+xdim4_viscosity_kernel*(y))
#define OPS_ACC5(x,y) (x+xdim5_viscosity_kernel*(y))
#define OPS_ACC6(x,y) (x+xdim6_viscosity_kernel*(y))

//user function
__device__

inline void viscosity_kernel(const double *xvel0, const double *yvel0,
                       const double *celldx, const double *celldy,
                       const double *pressure, const double *density0,
                       double *viscosity) {

  double ugrad, vgrad,
         grad2,
         pgradx,pgrady,
         pgradx2,pgrady2,
         grad,
         ygrad, xgrad,
         div,
         strain2,
         limiter,
         pgrad;


  ugrad = (xvel0[OPS_ACC0(1,0)] + xvel0[OPS_ACC0(1,1)]) - (xvel0[OPS_ACC0(0,0)] + xvel0[OPS_ACC0(0,1)]);
  vgrad = (yvel0[OPS_ACC1(0,1)] + yvel0[OPS_ACC1(1,1)]) - (yvel0[OPS_ACC1(0,0)] + yvel0[OPS_ACC1(1,0)]);

  div = (celldx[0,0])*(ugrad) + (celldy[0,0])*(vgrad);

  strain2 = 0.5*(xvel0[OPS_ACC0(0,1)] + xvel0[OPS_ACC0(1,1)] - xvel0[OPS_ACC0(0,0)] - xvel0[OPS_ACC0(1,0)])/(celldy[OPS_ACC3(0,0)]) +
            0.5*(yvel0[OPS_ACC1(1,0)] + yvel0[OPS_ACC1(1,1)] - yvel0[OPS_ACC1(0,0)] - yvel0[OPS_ACC1(0,1)])/(celldx[OPS_ACC2(0,0)]);


  pgradx  = (pressure[OPS_ACC4(1,0)] - pressure[OPS_ACC4(-1,0)])/(celldx[OPS_ACC2(0,0)]+ celldx[OPS_ACC2(1,0)]);
  pgrady = (pressure[OPS_ACC4(0,1)] - pressure[OPS_ACC4(0,-1)])/(celldy[OPS_ACC3(0,0)]+ celldy[OPS_ACC3(0,1)]);

  pgradx2 = pgradx * pgradx;
  pgrady2 = pgrady * pgrady;

  limiter = ((0.5*(ugrad)/celldx[OPS_ACC2(0,0)]) * pgradx2 +
             (0.5*(vgrad)/celldy[OPS_ACC3(0,0)]) * pgrady2 +
              strain2 * pgradx * pgrady)/ MAX(pgradx2 + pgrady2 , 1.0e-16);

  if( (limiter > 0.0) || (div >= 0.0)) {
        viscosity[OPS_ACC6(0,0)] = 0.0;
  }
  else {
    pgradx = SIGN( MAX(1.0e-16, fabs(pgradx)), pgradx);
    pgrady = SIGN( MAX(1.0e-16, fabs(pgrady)), pgrady);
    pgrad = sqrt(pgradx*pgradx + pgrady*pgrady);
    xgrad = fabs(celldx[OPS_ACC2(0,0)] * pgrad/pgradx);
    ygrad = fabs(celldy[OPS_ACC3(0,0)] * pgrad/pgrady);
    grad  = MIN(xgrad,ygrad);
    grad2 = grad*grad;

    viscosity[OPS_ACC6(0,0)] = 2.0 * (density0[OPS_ACC5(0,0)]) * grad2 * limiter * limiter;
  }
}



#undef OPS_ACC0
#undef OPS_ACC1
#undef OPS_ACC2
#undef OPS_ACC3
#undef OPS_ACC4
#undef OPS_ACC5
#undef OPS_ACC6


__global__ void ops_viscosity_kernel(
const double* __restrict arg0,
const double* __restrict arg1,
const double* __restrict arg2,
const double* __restrict arg3,
const double* __restrict arg4,
const double* __restrict arg5,
double* __restrict arg6,
int size0,
int size1 ){


  int idx_y = blockDim.y * blockIdx.y + threadIdx.y;
  int idx_x = blockDim.x * blockIdx.x + threadIdx.x;

  arg0 += idx_x * 1 + idx_y * 1 * xdim0_viscosity_kernel;
  arg1 += idx_x * 1 + idx_y * 1 * xdim1_viscosity_kernel;
  arg2 += idx_x * 1 + idx_y * 0 * xdim2_viscosity_kernel;
  arg3 += idx_x * 0 + idx_y * 1 * xdim3_viscosity_kernel;
  arg4 += idx_x * 1 + idx_y * 1 * xdim4_viscosity_kernel;
  arg5 += idx_x * 1 + idx_y * 1 * xdim5_viscosity_kernel;
  arg6 += idx_x * 1 + idx_y * 1 * xdim6_viscosity_kernel;

  if (idx_x < size0 && idx_y < size1) {
    viscosity_kernel(arg0, arg1, arg2, arg3,
                   arg4, arg5, arg6);
  }

}

// host stub function
void ops_par_loop_viscosity_kernel(char const *name, int dim, int* range,
 ops_arg arg0, ops_arg arg1, ops_arg arg2, ops_arg arg3,
 ops_arg arg4, ops_arg arg5, ops_arg arg6) {

  ops_arg args[7] = { arg0, arg1, arg2, arg3, arg4, arg5, arg6};


  int x_size = range[1]-range[0];
  int y_size = range[3]-range[2];

  int xdim0 = args[0].dat->block_size[0];
  int xdim1 = args[1].dat->block_size[0];
  int xdim2 = args[2].dat->block_size[0];
  int xdim3 = args[3].dat->block_size[0];
  int xdim4 = args[4].dat->block_size[0];
  int xdim5 = args[5].dat->block_size[0];
  int xdim6 = args[6].dat->block_size[0];

  ops_timing_realloc(27);
  if (OPS_kernels[27].count == 0) {
    cudaMemcpyToSymbol( xdim0_viscosity_kernel, &xdim0, sizeof(int) );
    cudaMemcpyToSymbol( xdim1_viscosity_kernel, &xdim1, sizeof(int) );
    cudaMemcpyToSymbol( xdim2_viscosity_kernel, &xdim2, sizeof(int) );
    cudaMemcpyToSymbol( xdim3_viscosity_kernel, &xdim3, sizeof(int) );
    cudaMemcpyToSymbol( xdim4_viscosity_kernel, &xdim4, sizeof(int) );
    cudaMemcpyToSymbol( xdim5_viscosity_kernel, &xdim5, sizeof(int) );
    cudaMemcpyToSymbol( xdim6_viscosity_kernel, &xdim6, sizeof(int) );
  }



  dim3 grid( (x_size-1)/OPS_block_size_x+ 1, (y_size-1)/OPS_block_size_y + 1, 1);
  dim3 block(OPS_block_size_x,OPS_block_size_y,1);




  char *p_a[7];


  //set up initial pointers
  p_a[0] = &args[0].data_d[
  + args[0].dat->size * args[0].dat->block_size[0] * ( range[2] * 1 - args[0].dat->offset[1] )
  + args[0].dat->size * ( range[0] * 1 - args[0].dat->offset[0] ) ];

  p_a[1] = &args[1].data_d[
  + args[1].dat->size * args[1].dat->block_size[0] * ( range[2] * 1 - args[1].dat->offset[1] )
  + args[1].dat->size * ( range[0] * 1 - args[1].dat->offset[0] ) ];

  p_a[2] = &args[2].data_d[
  + args[2].dat->size * args[2].dat->block_size[0] * ( range[2] * 0 - args[2].dat->offset[1] )
  + args[2].dat->size * ( range[0] * 1 - args[2].dat->offset[0] ) ];

  p_a[3] = &args[3].data_d[
  + args[3].dat->size * args[3].dat->block_size[0] * ( range[2] * 1 - args[3].dat->offset[1] )
  + args[3].dat->size * ( range[0] * 0 - args[3].dat->offset[0] ) ];

  p_a[4] = &args[4].data_d[
  + args[4].dat->size * args[4].dat->block_size[0] * ( range[2] * 1 - args[4].dat->offset[1] )
  + args[4].dat->size * ( range[0] * 1 - args[4].dat->offset[0] ) ];

  p_a[5] = &args[5].data_d[
  + args[5].dat->size * args[5].dat->block_size[0] * ( range[2] * 1 - args[5].dat->offset[1] )
  + args[5].dat->size * ( range[0] * 1 - args[5].dat->offset[0] ) ];

  p_a[6] = &args[6].data_d[
  + args[6].dat->size * args[6].dat->block_size[0] * ( range[2] * 1 - args[6].dat->offset[1] )
  + args[6].dat->size * ( range[0] * 1 - args[6].dat->offset[0] ) ];


  ops_halo_exchanges_cuda(args, 7);


  //call kernel wrapper function, passing in pointers to data
  ops_viscosity_kernel<<<grid, block >>> (  (double *)p_a[0], (double *)p_a[1],
           (double *)p_a[2], (double *)p_a[3],
           (double *)p_a[4], (double *)p_a[5],
           (double *)p_a[6],x_size, y_size);

  ops_set_dirtybit_cuda(args, 7);
  OPS_kernels[27].count++;
}
