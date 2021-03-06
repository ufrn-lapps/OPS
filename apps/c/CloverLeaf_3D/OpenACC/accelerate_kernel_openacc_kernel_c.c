//
// auto-generated by ops.py
//

#define OPS_GPU

int xdim0_accelerate_kernel;
int ydim0_accelerate_kernel;
int xdim1_accelerate_kernel;
int ydim1_accelerate_kernel;
int xdim2_accelerate_kernel;
int ydim2_accelerate_kernel;
int xdim3_accelerate_kernel;
int ydim3_accelerate_kernel;
int xdim4_accelerate_kernel;
int ydim4_accelerate_kernel;
int xdim5_accelerate_kernel;
int ydim5_accelerate_kernel;
int xdim6_accelerate_kernel;
int ydim6_accelerate_kernel;
int xdim7_accelerate_kernel;
int ydim7_accelerate_kernel;
int xdim8_accelerate_kernel;
int ydim8_accelerate_kernel;
int xdim9_accelerate_kernel;
int ydim9_accelerate_kernel;
int xdim10_accelerate_kernel;
int ydim10_accelerate_kernel;
int xdim11_accelerate_kernel;
int ydim11_accelerate_kernel;
int xdim12_accelerate_kernel;
int ydim12_accelerate_kernel;
int xdim13_accelerate_kernel;
int ydim13_accelerate_kernel;

//user function
inline 
void accelerate_kernel(const ptr_double density0,
  const ptr_double volume,
  ptr_double stepbymass,
  const ptr_double xvel0,
  ptr_double xvel1,
  const ptr_double xarea,
  const ptr_double pressure,
  const ptr_double yvel0,
  ptr_double yvel1,
  const ptr_double yarea,
  const ptr_double viscosity,
  const ptr_double zvel0,
  ptr_double zvel1,
  const ptr_double zarea) {

  double nodal_mass = 0.0;
  nodal_mass =(OPS_ACC(density0, -1,-1, 0) * OPS_ACC(volume, -1,-1, 0) +
               OPS_ACC(density0,  0,-1, 0) * OPS_ACC(volume,  0,-1, 0) +
               OPS_ACC(density0,  0, 0, 0) * OPS_ACC(volume,  0, 0, 0) +
               OPS_ACC(density0, -1, 0, 0) * OPS_ACC(volume, -1, 0, 0) +
               OPS_ACC(density0, -1,-1,-1) * OPS_ACC(volume, -1,-1,-1) +
               OPS_ACC(density0,  0,-1,-1) * OPS_ACC(volume,  0,-1,-1) +
               OPS_ACC(density0,  0, 0,-1) * OPS_ACC(volume,  0, 0,-1) +
               OPS_ACC(density0, -1, 0,-1) * OPS_ACC(volume, -1, 0,-1)) * 0.125;

  OPS_ACC(stepbymass, 0,0,0) = 0.25*dt / nodal_mass;

  OPS_ACC(xvel1, 0,0,0) = OPS_ACC(xvel0, 0,0,0) - OPS_ACC(stepbymass, 0,0,0) *
            ( OPS_ACC(xarea, 0,0,0)  * ( OPS_ACC(pressure, 0,0,0) - OPS_ACC(pressure, -1,0,0) ) +
              OPS_ACC(xarea, 0,-1,0) * ( OPS_ACC(pressure, 0,-1,0) - OPS_ACC(pressure, -1,-1,0) ) +
              OPS_ACC(xarea, 0,0,-1) * ( OPS_ACC(pressure, 0,0,-1) - OPS_ACC(pressure, -1,0,-1) ) +
              OPS_ACC(xarea, 0,-1,-1) * ( OPS_ACC(pressure, 0,-1,-1) - OPS_ACC(pressure, -1,-1,-1) ) );

  OPS_ACC(yvel1, 0,0,0) = OPS_ACC(yvel0, 0,0,0) - OPS_ACC(stepbymass, 0,0,0) *
            ( OPS_ACC(yarea, 0,0,0)  * ( OPS_ACC(pressure, 0,0,0) - OPS_ACC(pressure, 0,-1,0) ) +
              OPS_ACC(yarea, -1,0,0) * ( OPS_ACC(pressure, -1,0,0) - OPS_ACC(pressure, -1,-1,0) ) +
              OPS_ACC(yarea, 0,0,-1) * ( OPS_ACC(pressure, 0,0,-1) - OPS_ACC(pressure, 0,-1,-1) ) +
              OPS_ACC(yarea, -1,0,-1)* ( OPS_ACC(pressure, -1,0,-1) - OPS_ACC(pressure, -1,-1,-1) ) );

  OPS_ACC(zvel1, 0,0,0) = OPS_ACC(zvel0, 0,0,0) - OPS_ACC(stepbymass, 0,0,0) *
            ( OPS_ACC(zarea, 0,0,0)  * ( OPS_ACC(pressure, 0,0,0) - OPS_ACC(pressure, 0,0,-1) ) +
              OPS_ACC(zarea, 0,-1,0) * ( OPS_ACC(pressure, 0,-1,0) - OPS_ACC(pressure, 0,-1,-1) ) +
              OPS_ACC(zarea, -1,0,0) * ( OPS_ACC(pressure, -1,0,0) - OPS_ACC(pressure, -1,0,-1) ) +
              OPS_ACC(zarea, -1,-1,0)* ( OPS_ACC(pressure, -1,-1,0) - OPS_ACC(pressure, -1,-1,-1) ) );

  OPS_ACC(xvel1, 0,0,0) = OPS_ACC(xvel1, 0,0,0) - OPS_ACC(stepbymass, 0,0,0) *
            ( OPS_ACC(xarea, 0,0,0)  * ( OPS_ACC(viscosity, 0,0,0) - OPS_ACC(viscosity, -1,0,0) ) +
              OPS_ACC(xarea, 0,-1,0) * ( OPS_ACC(viscosity, 0,-1,0) - OPS_ACC(viscosity, -1,-1,0) ) +
              OPS_ACC(xarea, 0,0,-1) * ( OPS_ACC(viscosity, 0,0,-1) - OPS_ACC(viscosity, -1,0,-1) ) +
              OPS_ACC(xarea, 0,-1,-1)* ( OPS_ACC(viscosity, 0,-1,-1) - OPS_ACC(viscosity, -1,-1,-1) ) );

  OPS_ACC(yvel1, 0,0,0) = OPS_ACC(yvel1, 0,0,0) - OPS_ACC(stepbymass, 0,0,0) *
            ( OPS_ACC(yarea, 0,0,0)  * ( OPS_ACC(viscosity, 0,0,0)  - OPS_ACC(viscosity, 0,-1,0) ) +
              OPS_ACC(yarea, -1,0,0) * ( OPS_ACC(viscosity, -1,0,0) - OPS_ACC(viscosity, -1,-1,0) ) +
              OPS_ACC(yarea, 0,0,-1) * ( OPS_ACC(viscosity, 0,0,-1) - OPS_ACC(viscosity, 0,-1,-1) ) +
              OPS_ACC(yarea, -1,0,-1)* ( OPS_ACC(viscosity, -1,0,-1)- OPS_ACC(viscosity, -1,-1,-1) ) );

  OPS_ACC(zvel1, 0,0,0) = OPS_ACC(zvel1, 0,0,0) - OPS_ACC(stepbymass, 0,0,0) *
            ( OPS_ACC(zarea, 0,0,0)  * ( OPS_ACC(viscosity, 0,0,0)  - OPS_ACC(viscosity, 0,0,-1) ) +
              OPS_ACC(zarea, 0,-1,0) * ( OPS_ACC(viscosity, 0,-1,0) - OPS_ACC(viscosity, 0,-1,-1) ) +
              OPS_ACC(zarea, -1,0,0) * ( OPS_ACC(viscosity, -1,0,0) - OPS_ACC(viscosity, -1,0,-1) ) +
              OPS_ACC(zarea, -1,-1,0)* ( OPS_ACC(viscosity, -1,-1,0)- OPS_ACC(viscosity, -1,-1,-1) ) );

}


void accelerate_kernel_c_wrapper(
  double *p_a0,
  double *p_a1,
  double *p_a2,
  double *p_a3,
  double *p_a4,
  double *p_a5,
  double *p_a6,
  double *p_a7,
  double *p_a8,
  double *p_a9,
  double *p_a10,
  double *p_a11,
  double *p_a12,
  double *p_a13,
  int x_size, int y_size, int z_size) {
  #ifdef OPS_GPU
  #pragma acc parallel deviceptr(p_a0,p_a1,p_a2,p_a3,p_a4,p_a5,p_a6,p_a7,p_a8,p_a9,p_a10,p_a11,p_a12,p_a13)
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
        const ptr_double ptr0 = {  p_a0 + n_x*1*1 + n_y*xdim0_accelerate_kernel*1*1 + n_z*xdim0_accelerate_kernel*ydim0_accelerate_kernel*1*1, xdim0_accelerate_kernel, ydim0_accelerate_kernel};
        const ptr_double ptr1 = {  p_a1 + n_x*1*1 + n_y*xdim1_accelerate_kernel*1*1 + n_z*xdim1_accelerate_kernel*ydim1_accelerate_kernel*1*1, xdim1_accelerate_kernel, ydim1_accelerate_kernel};
        ptr_double ptr2 = {  p_a2 + n_x*1*1 + n_y*xdim2_accelerate_kernel*1*1 + n_z*xdim2_accelerate_kernel*ydim2_accelerate_kernel*1*1, xdim2_accelerate_kernel, ydim2_accelerate_kernel};
        const ptr_double ptr3 = {  p_a3 + n_x*1*1 + n_y*xdim3_accelerate_kernel*1*1 + n_z*xdim3_accelerate_kernel*ydim3_accelerate_kernel*1*1, xdim3_accelerate_kernel, ydim3_accelerate_kernel};
        ptr_double ptr4 = {  p_a4 + n_x*1*1 + n_y*xdim4_accelerate_kernel*1*1 + n_z*xdim4_accelerate_kernel*ydim4_accelerate_kernel*1*1, xdim4_accelerate_kernel, ydim4_accelerate_kernel};
        const ptr_double ptr5 = {  p_a5 + n_x*1*1 + n_y*xdim5_accelerate_kernel*1*1 + n_z*xdim5_accelerate_kernel*ydim5_accelerate_kernel*1*1, xdim5_accelerate_kernel, ydim5_accelerate_kernel};
        const ptr_double ptr6 = {  p_a6 + n_x*1*1 + n_y*xdim6_accelerate_kernel*1*1 + n_z*xdim6_accelerate_kernel*ydim6_accelerate_kernel*1*1, xdim6_accelerate_kernel, ydim6_accelerate_kernel};
        const ptr_double ptr7 = {  p_a7 + n_x*1*1 + n_y*xdim7_accelerate_kernel*1*1 + n_z*xdim7_accelerate_kernel*ydim7_accelerate_kernel*1*1, xdim7_accelerate_kernel, ydim7_accelerate_kernel};
        ptr_double ptr8 = {  p_a8 + n_x*1*1 + n_y*xdim8_accelerate_kernel*1*1 + n_z*xdim8_accelerate_kernel*ydim8_accelerate_kernel*1*1, xdim8_accelerate_kernel, ydim8_accelerate_kernel};
        const ptr_double ptr9 = {  p_a9 + n_x*1*1 + n_y*xdim9_accelerate_kernel*1*1 + n_z*xdim9_accelerate_kernel*ydim9_accelerate_kernel*1*1, xdim9_accelerate_kernel, ydim9_accelerate_kernel};
        const ptr_double ptr10 = {  p_a10 + n_x*1*1 + n_y*xdim10_accelerate_kernel*1*1 + n_z*xdim10_accelerate_kernel*ydim10_accelerate_kernel*1*1, xdim10_accelerate_kernel, ydim10_accelerate_kernel};
        const ptr_double ptr11 = {  p_a11 + n_x*1*1 + n_y*xdim11_accelerate_kernel*1*1 + n_z*xdim11_accelerate_kernel*ydim11_accelerate_kernel*1*1, xdim11_accelerate_kernel, ydim11_accelerate_kernel};
        ptr_double ptr12 = {  p_a12 + n_x*1*1 + n_y*xdim12_accelerate_kernel*1*1 + n_z*xdim12_accelerate_kernel*ydim12_accelerate_kernel*1*1, xdim12_accelerate_kernel, ydim12_accelerate_kernel};
        const ptr_double ptr13 = {  p_a13 + n_x*1*1 + n_y*xdim13_accelerate_kernel*1*1 + n_z*xdim13_accelerate_kernel*ydim13_accelerate_kernel*1*1, xdim13_accelerate_kernel, ydim13_accelerate_kernel};
        accelerate_kernel( ptr0,
          ptr1,
          ptr2,
          ptr3,
          ptr4,
          ptr5,
          ptr6,
          ptr7,
          ptr8,
          ptr9,
          ptr10,
          ptr11,
          ptr12,
          ptr13 );

      }
    }
  }
}
