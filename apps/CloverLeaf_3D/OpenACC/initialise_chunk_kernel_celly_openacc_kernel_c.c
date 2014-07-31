//
// auto-generated by ops.py on 2014-07-31 12:24
//

#include "./OpenACC/clover_leaf_common.h"

#define OPS_GPU

int xdim0_initialise_chunk_kernel_celly;
int ydim0_initialise_chunk_kernel_celly;
int xdim1_initialise_chunk_kernel_celly;
int ydim1_initialise_chunk_kernel_celly;
int xdim2_initialise_chunk_kernel_celly;
int ydim2_initialise_chunk_kernel_celly;

#define OPS_ACC0(x,y,z) (x+xdim0_initialise_chunk_kernel_celly*(y)+xdim0_initialise_chunk_kernel_celly*ydim0_initialise_chunk_kernel_celly*(z))
#define OPS_ACC1(x,y,z) (x+xdim1_initialise_chunk_kernel_celly*(y)+xdim1_initialise_chunk_kernel_celly*ydim1_initialise_chunk_kernel_celly*(z))
#define OPS_ACC2(x,y,z) (x+xdim2_initialise_chunk_kernel_celly*(y)+xdim2_initialise_chunk_kernel_celly*ydim2_initialise_chunk_kernel_celly*(z))

//user function
inline 
void initialise_chunk_kernel_celly(const double *vertexy, double* celly, double *celldy) {
  double d_y = (grid.ymax - grid.ymin)/(double)grid.y_cells;
  celly[OPS_ACC1(0,0,0)]  = 0.5*( vertexy[OPS_ACC0(0,0,0)] + vertexy[OPS_ACC0(0,1,0)] );
  celldy[OPS_ACC2(0,0,0)]  = d_y;
  if(celldy[OPS_ACC2(0,0,0)] < 0) {


  }
}



#undef OPS_ACC0
#undef OPS_ACC1
#undef OPS_ACC2


void initialise_chunk_kernel_celly_c_wrapper(
  double *p_a0,
  double *p_a1,
  double *p_a2,
  int x_size, int y_size, int z_size) {
  #ifdef OPS_GPU
  #pragma acc parallel deviceptr(p_a0,p_a1,p_a2)
  #pragma acc loop
  #endif
  for ( int n_z=0; n_z<z_size; n_z++ ){
    #ifdef OPS_GPU
    #pragma acc loop
    #endif
    for ( int n_y=0; n_y<y_size; n_y++ ){
      #ifdef OPS_GPU
      #pragma acc loop
      #endif
      for ( int n_x=0; n_x<x_size; n_x++ ){
        initialise_chunk_kernel_celly(  p_a0 + n_x*0 + n_y*xdim0_initialise_chunk_kernel_celly*1 + n_z*xdim0_initialise_chunk_kernel_celly*ydim0_initialise_chunk_kernel_celly*0,
           p_a1 + n_x*0 + n_y*xdim1_initialise_chunk_kernel_celly*1 + n_z*xdim1_initialise_chunk_kernel_celly*ydim1_initialise_chunk_kernel_celly*0,
           p_a2 + n_x*0 + n_y*xdim2_initialise_chunk_kernel_celly*1 + n_z*xdim2_initialise_chunk_kernel_celly*ydim2_initialise_chunk_kernel_celly*0 );

      }
    }
  }
}
