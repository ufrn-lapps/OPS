//
// auto-generated by ops.py on 2014-06-17 16:47
//

#include "./OpenACC/clover_leaf_common.h"

#define OPS_GPU

int xdim0_update_halo_kernel4_minus_2_a;
int xdim1_update_halo_kernel4_minus_2_a;

#define OPS_ACC0(x,y) (x+xdim0_update_halo_kernel4_minus_2_a*(y))
#define OPS_ACC1(x,y) (x+xdim1_update_halo_kernel4_minus_2_a*(y))

//user function

inline void update_halo_kernel4_minus_2_a(double *vol_flux_y, double *mass_flux_y, const int* fields) {
  if(fields[FIELD_VOL_FLUX_Y] == 1) vol_flux_y[OPS_ACC0(0,0)] = -(vol_flux_y[OPS_ACC0(0,2)]);
  if(fields[FIELD_MASS_FLUX_Y] == 1) mass_flux_y[OPS_ACC1(0,0)] = -(mass_flux_y[OPS_ACC1(0,2)]);
}



#undef OPS_ACC0
#undef OPS_ACC1


void update_halo_kernel4_minus_2_a_c_wrapper(
  double *p_a0,
  double *p_a1,
  int *p_a2,
  int x_size, int y_size) {
  #ifdef OPS_GPU
  #pragma acc parallel deviceptr(p_a0,p_a1,p_a2)
  #pragma acc loop
  #endif
  for ( int n_y=0; n_y<y_size; n_y++ ){
    #ifdef OPS_GPU
    #pragma acc loop
    #endif
    for ( int n_x=0; n_x<x_size; n_x++ ){
      update_halo_kernel4_minus_2_a(  p_a0 + n_x*1 + n_y*xdim0_update_halo_kernel4_minus_2_a*1,
           p_a1 + n_x*1 + n_y*xdim1_update_halo_kernel4_minus_2_a*1, p_a2 );

    }
  }
}
