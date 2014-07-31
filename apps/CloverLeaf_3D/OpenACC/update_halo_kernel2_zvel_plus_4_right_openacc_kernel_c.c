//
// auto-generated by ops.py on 2014-07-31 12:24
//

#include "./OpenACC/clover_leaf_common.h"

#define OPS_GPU

int xdim0_update_halo_kernel2_zvel_plus_4_right;
int ydim0_update_halo_kernel2_zvel_plus_4_right;
int xdim1_update_halo_kernel2_zvel_plus_4_right;
int ydim1_update_halo_kernel2_zvel_plus_4_right;

#define OPS_ACC0(x,y,z) (x+xdim0_update_halo_kernel2_zvel_plus_4_right*(y)+xdim0_update_halo_kernel2_zvel_plus_4_right*ydim0_update_halo_kernel2_zvel_plus_4_right*(z))
#define OPS_ACC1(x,y,z) (x+xdim1_update_halo_kernel2_zvel_plus_4_right*(y)+xdim1_update_halo_kernel2_zvel_plus_4_right*ydim1_update_halo_kernel2_zvel_plus_4_right*(z))

//user function

inline void update_halo_kernel2_zvel_plus_4_right(double *zvel0, double *zvel1, const int* fields)
{
  if(fields[FIELD_ZVEL0] == 1) zvel0[OPS_ACC0(0,0,0)] = zvel0[OPS_ACC0(-4,0,0)];
  if(fields[FIELD_ZVEL1] == 1) zvel1[OPS_ACC1(0,0,0)] = zvel1[OPS_ACC1(-4,0,0)];
}



#undef OPS_ACC0
#undef OPS_ACC1


void update_halo_kernel2_zvel_plus_4_right_c_wrapper(
  double *p_a0,
  double *p_a1,
  int *p_a2,
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
        update_halo_kernel2_zvel_plus_4_right(  p_a0 + n_x*1 + n_y*xdim0_update_halo_kernel2_zvel_plus_4_right*1 + n_z*xdim0_update_halo_kernel2_zvel_plus_4_right*ydim0_update_halo_kernel2_zvel_plus_4_right*1,
           p_a1 + n_x*1 + n_y*xdim1_update_halo_kernel2_zvel_plus_4_right*1 + n_z*xdim1_update_halo_kernel2_zvel_plus_4_right*ydim1_update_halo_kernel2_zvel_plus_4_right*1,
           p_a2 );

      }
    }
  }
}
