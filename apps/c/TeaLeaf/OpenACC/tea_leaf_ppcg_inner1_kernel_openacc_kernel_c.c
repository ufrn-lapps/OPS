//
// auto-generated by ops.py
//

#define OPS_GPU

int xdim0_tea_leaf_ppcg_inner1_kernel;
int xdim1_tea_leaf_ppcg_inner1_kernel;
int xdim2_tea_leaf_ppcg_inner1_kernel;
int xdim3_tea_leaf_ppcg_inner1_kernel;

//user function
inline void tea_leaf_ppcg_inner1_kernel(ptr_double rtemp, const ptr_double Kx,
                                        const ptr_double Ky,
                                        const ptr_double sd, const double *rx,
                                        const double *ry) {
  double smvp = 0.0;
  smvp = (1.0 + (*ry) * (OPS_ACC(Ky, 0, 1) + OPS_ACC(Ky, 0, 0)) +
          (*rx) * (OPS_ACC(Kx, 1, 0) + OPS_ACC(Kx, 0, 0))) *
             OPS_ACC(sd, 0, 0) -
         (*ry) * (OPS_ACC(Ky, 0, 1) * OPS_ACC(sd, 0, 1) +
                  OPS_ACC(Ky, 0, 0) * OPS_ACC(sd, 0, -1)) -
         (*rx) * (OPS_ACC(Kx, 1, 0) * OPS_ACC(sd, 1, 0) +
                  OPS_ACC(Kx, 0, 0) * OPS_ACC(sd, -1, 0));
  OPS_ACC(rtemp, 0, 0) = OPS_ACC(rtemp, 0, 0) - smvp;
}


void tea_leaf_ppcg_inner1_kernel_c_wrapper(
  double *p_a0,
  double *p_a1,
  double *p_a2,
  double *p_a3,
  double p_a4,
  double p_a5,
  int x_size, int y_size) {
  #ifdef OPS_GPU
  #pragma acc parallel deviceptr(p_a0,p_a1,p_a2,p_a3)
  #pragma acc loop
  #endif
  for ( int n_y=0; n_y<y_size; n_y++ ){
    #ifdef OPS_GPU
    #pragma acc loop
    #endif
    for ( int n_x=0; n_x<x_size; n_x++ ){
      ptr_double ptr0 = {p_a0 + n_x * 1 * 1 +
                             n_y * xdim0_tea_leaf_ppcg_inner1_kernel * 1 * 1,
                         xdim0_tea_leaf_ppcg_inner1_kernel};
      const ptr_double ptr1 = {
          p_a1 + n_x * 1 * 1 + n_y * xdim1_tea_leaf_ppcg_inner1_kernel * 1 * 1,
          xdim1_tea_leaf_ppcg_inner1_kernel};
      const ptr_double ptr2 = {
          p_a2 + n_x * 1 * 1 + n_y * xdim2_tea_leaf_ppcg_inner1_kernel * 1 * 1,
          xdim2_tea_leaf_ppcg_inner1_kernel};
      const ptr_double ptr3 = {
          p_a3 + n_x * 1 * 1 + n_y * xdim3_tea_leaf_ppcg_inner1_kernel * 1 * 1,
          xdim3_tea_leaf_ppcg_inner1_kernel};
      tea_leaf_ppcg_inner1_kernel(ptr0, ptr1, ptr2, ptr3, &p_a4, &p_a5);
    }
  }
}
