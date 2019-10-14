//
// auto-generated by ops.py
//

#define OPS_GPU

int xdim0_update_halo_kernel1_r2;
int ydim0_update_halo_kernel1_r2;
int xdim1_update_halo_kernel1_r2;
int ydim1_update_halo_kernel1_r2;
int xdim2_update_halo_kernel1_r2;
int ydim2_update_halo_kernel1_r2;
int xdim3_update_halo_kernel1_r2;
int ydim3_update_halo_kernel1_r2;
int xdim4_update_halo_kernel1_r2;
int ydim4_update_halo_kernel1_r2;
int xdim5_update_halo_kernel1_r2;
int ydim5_update_halo_kernel1_r2;
int xdim6_update_halo_kernel1_r2;
int ydim6_update_halo_kernel1_r2;

//user function

inline void update_halo_kernel1_r2(ptr_double density0, ptr_double density1,
                                   ptr_double energy0, ptr_double energy1,
                                   ptr_double pressure, ptr_double viscosity,
                                   ptr_double soundspeed, const int *fields) {
  if (fields[FIELD_DENSITY0] == 1)
    OPS_ACC(density0, 0, 0, 0) = OPS_ACC(density0, -3, 0, 0);
  if (fields[FIELD_DENSITY1] == 1)
    OPS_ACC(density1, 0, 0, 0) = OPS_ACC(density1, -3, 0, 0);
  if (fields[FIELD_ENERGY0] == 1)
    OPS_ACC(energy0, 0, 0, 0) = OPS_ACC(energy0, -3, 0, 0);
  if (fields[FIELD_ENERGY1] == 1)
    OPS_ACC(energy1, 0, 0, 0) = OPS_ACC(energy1, -3, 0, 0);
  if (fields[FIELD_PRESSURE] == 1)
    OPS_ACC(pressure, 0, 0, 0) = OPS_ACC(pressure, -3, 0, 0);
  if (fields[FIELD_VISCOSITY] == 1)
    OPS_ACC(viscosity, 0, 0, 0) = OPS_ACC(viscosity, -3, 0, 0);
  if (fields[FIELD_SOUNDSPEED] == 1)
    OPS_ACC(soundspeed, 0, 0, 0) = OPS_ACC(soundspeed, -3, 0, 0);
}


void update_halo_kernel1_r2_c_wrapper(
  double *p_a0,
  double *p_a1,
  double *p_a2,
  double *p_a3,
  double *p_a4,
  double *p_a5,
  double *p_a6,
  int *p_a7,
  int x_size, int y_size, int z_size) {
  #ifdef OPS_GPU
  #pragma acc parallel deviceptr(p_a0,p_a1,p_a2,p_a3,p_a4,p_a5,p_a6,p_a7)
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
        ptr_double ptr0 = {
            p_a0 + n_x * 1 * 1 + n_y * xdim0_update_halo_kernel1_r2 * 1 * 1 +
                n_z * xdim0_update_halo_kernel1_r2 *
                    ydim0_update_halo_kernel1_r2 * 1 * 1,
            xdim0_update_halo_kernel1_r2, ydim0_update_halo_kernel1_r2};
        ptr_double ptr1 = {
            p_a1 + n_x * 1 * 1 + n_y * xdim1_update_halo_kernel1_r2 * 1 * 1 +
                n_z * xdim1_update_halo_kernel1_r2 *
                    ydim1_update_halo_kernel1_r2 * 1 * 1,
            xdim1_update_halo_kernel1_r2, ydim1_update_halo_kernel1_r2};
        ptr_double ptr2 = {
            p_a2 + n_x * 1 * 1 + n_y * xdim2_update_halo_kernel1_r2 * 1 * 1 +
                n_z * xdim2_update_halo_kernel1_r2 *
                    ydim2_update_halo_kernel1_r2 * 1 * 1,
            xdim2_update_halo_kernel1_r2, ydim2_update_halo_kernel1_r2};
        ptr_double ptr3 = {
            p_a3 + n_x * 1 * 1 + n_y * xdim3_update_halo_kernel1_r2 * 1 * 1 +
                n_z * xdim3_update_halo_kernel1_r2 *
                    ydim3_update_halo_kernel1_r2 * 1 * 1,
            xdim3_update_halo_kernel1_r2, ydim3_update_halo_kernel1_r2};
        ptr_double ptr4 = {
            p_a4 + n_x * 1 * 1 + n_y * xdim4_update_halo_kernel1_r2 * 1 * 1 +
                n_z * xdim4_update_halo_kernel1_r2 *
                    ydim4_update_halo_kernel1_r2 * 1 * 1,
            xdim4_update_halo_kernel1_r2, ydim4_update_halo_kernel1_r2};
        ptr_double ptr5 = {
            p_a5 + n_x * 1 * 1 + n_y * xdim5_update_halo_kernel1_r2 * 1 * 1 +
                n_z * xdim5_update_halo_kernel1_r2 *
                    ydim5_update_halo_kernel1_r2 * 1 * 1,
            xdim5_update_halo_kernel1_r2, ydim5_update_halo_kernel1_r2};
        ptr_double ptr6 = {
            p_a6 + n_x * 1 * 1 + n_y * xdim6_update_halo_kernel1_r2 * 1 * 1 +
                n_z * xdim6_update_halo_kernel1_r2 *
                    ydim6_update_halo_kernel1_r2 * 1 * 1,
            xdim6_update_halo_kernel1_r2, ydim6_update_halo_kernel1_r2};
        update_halo_kernel1_r2(ptr0, ptr1, ptr2, ptr3, ptr4, ptr5, ptr6, p_a7);
      }
    }
  }
}
