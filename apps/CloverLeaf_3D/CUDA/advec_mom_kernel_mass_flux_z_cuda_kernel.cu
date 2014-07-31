//
// auto-generated by ops.py on 2014-07-31 12:24
//

__constant__ int xdim0_advec_mom_kernel_mass_flux_z;
__constant__ int ydim0_advec_mom_kernel_mass_flux_z;
__constant__ int xdim1_advec_mom_kernel_mass_flux_z;
__constant__ int ydim1_advec_mom_kernel_mass_flux_z;

#define OPS_ACC0(x,y,z) (x+xdim0_advec_mom_kernel_mass_flux_z*(y)+xdim0_advec_mom_kernel_mass_flux_z*ydim0_advec_mom_kernel_mass_flux_z*(z))
#define OPS_ACC1(x,y,z) (x+xdim1_advec_mom_kernel_mass_flux_z*(y)+xdim1_advec_mom_kernel_mass_flux_z*ydim1_advec_mom_kernel_mass_flux_z*(z))

//user function
__device__

inline void advec_mom_kernel_mass_flux_z( double *node_flux, const double *mass_flux_z) {


  node_flux[OPS_ACC0(0,0,0)] = 0.125 * ( mass_flux_z[OPS_ACC1(-1,0,0)] + mass_flux_z[OPS_ACC1(0,0,0)] +
                                         mass_flux_z[OPS_ACC1(-1,0,1)] + mass_flux_z[OPS_ACC1(0,0,1)] +
                                         mass_flux_z[OPS_ACC1(-1,-1,0)] + mass_flux_z[OPS_ACC1(0,-1,0)] +
                                         mass_flux_z[OPS_ACC1(-1,-1,1)] + mass_flux_z[OPS_ACC1(0,-1,1)] );
}



#undef OPS_ACC0
#undef OPS_ACC1


__global__ void ops_advec_mom_kernel_mass_flux_z(
double* __restrict arg0,
const double* __restrict arg1,
int size0,
int size1,
int size2 ){


  int idx_z = blockDim.z * blockIdx.z + threadIdx.z;
  int idx_y = blockDim.y * blockIdx.y + threadIdx.y;
  int idx_x = blockDim.x * blockIdx.x + threadIdx.x;

  arg0 += idx_x * 1 + idx_y * 1 * xdim0_advec_mom_kernel_mass_flux_z + idx_z * 1 * xdim0_advec_mom_kernel_mass_flux_z * ydim0_advec_mom_kernel_mass_flux_z;
  arg1 += idx_x * 1 + idx_y * 1 * xdim1_advec_mom_kernel_mass_flux_z + idx_z * 1 * xdim1_advec_mom_kernel_mass_flux_z * ydim1_advec_mom_kernel_mass_flux_z;

  if (idx_x < size0 && idx_y < size1 && idx_z < size2) {
    advec_mom_kernel_mass_flux_z(arg0, arg1);
  }

}

// host stub function
void ops_par_loop_advec_mom_kernel_mass_flux_z(char const *name, ops_block Block, int dim, int* range,
 ops_arg arg0, ops_arg arg1) {

  ops_arg args[2] = { arg0, arg1};

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
  ops_timing_realloc(25,"advec_mom_kernel_mass_flux_z");
  ops_timers_core(&c2,&t2);

  if (OPS_kernels[25].count == 0) {
    cudaMemcpyToSymbol( xdim0_advec_mom_kernel_mass_flux_z, &xdim0, sizeof(int) );
    cudaMemcpyToSymbol( ydim0_advec_mom_kernel_mass_flux_z, &ydim0, sizeof(int) );
    cudaMemcpyToSymbol( xdim1_advec_mom_kernel_mass_flux_z, &xdim1, sizeof(int) );
    cudaMemcpyToSymbol( ydim1_advec_mom_kernel_mass_flux_z, &ydim1, sizeof(int) );
  }



  dim3 grid( (x_size-1)/OPS_block_size_x+ 1, (y_size-1)/OPS_block_size_y + 1, z_size);
  dim3 block(OPS_block_size_x,OPS_block_size_y,1);



  int dat0 = args[0].dat->size;
  int dat1 = args[1].dat->size;

  char *p_a[2];

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


  ops_H_D_exchanges_cuda(args, 2);
  ops_halo_exchanges(args,2,range);

  ops_timers_core(&c1,&t1);
  OPS_kernels[25].mpi_time += t1-t2;


  //call kernel wrapper function, passing in pointers to data
  ops_advec_mom_kernel_mass_flux_z<<<grid, block >>> (  (double *)p_a[0], (double *)p_a[1],x_size, y_size, z_size);

  if (OPS_diags>1) {
    cutilSafeCall(cudaDeviceSynchronize());
  }
  ops_timers_core(&c2,&t2);
  OPS_kernels[25].time += t2-t1;
  ops_set_dirtybit_cuda(args, 2);
  ops_set_halo_dirtybit3(&args[0],range);

  //Update kernel record
  OPS_kernels[25].count++;
  OPS_kernels[25].transfer += ops_compute_transfer(dim, range, &arg0);
  OPS_kernels[25].transfer += ops_compute_transfer(dim, range, &arg1);
}
