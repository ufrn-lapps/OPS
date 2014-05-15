//
// auto-generated by ops.py on 2014-05-15 16:56
//

#include "user_types.h"

#ifndef MIN
#define MIN(a,b) ((a<b) ? (a) : (b))
#endif
#ifndef MAX
#define MAX(a,b) ((a>b) ? (a) : (b))
#endif
#ifndef SIGN
#define SIGN(a,b) ((b<0.0) ? (a*(-1)) : (a))
#endif

#pragma OPENCL EXTENSION cl_khr_fp64:enable

#define OPS_ACC0(x,y) (x+xdim0_advec_mom_kernel_mass_flux_y*(y))
#define OPS_ACC1(x,y) (x+xdim1_advec_mom_kernel_mass_flux_y*(y))


//user function

inline void advec_mom_kernel_mass_flux_y( __global double *node_flux,  __global double *mass_flux_y,
  int xdim0_advec_mom_kernel_mass_flux_y,
  int xdim1_advec_mom_kernel_mass_flux_y)
  {


  node_flux[OPS_ACC0(0,0)] = 0.25 * ( mass_flux_y[OPS_ACC1(-1,0)] + mass_flux_y[OPS_ACC1(0,0)] +
      mass_flux_y[OPS_ACC1(-1,1)] + mass_flux_y[OPS_ACC1(0,1)] );
}



 #undef OPS_ACC0
 #undef OPS_ACC1


 __kernel void ops_advec_mom_kernel_mass_flux_y(
 __global double* arg0,
 __global double* arg1,
 int xdim0_advec_mom_kernel_mass_flux_y,
 int xdim1_advec_mom_kernel_mass_flux_y,
 const int base0,
 const int base1,
 int size0,
 int size1 ){


   int idx_y = get_global_id(1);
   int idx_x = get_global_id(0);

   if (idx_x < size0 && idx_y < size1) {
     advec_mom_kernel_mass_flux_y(&arg0[base0 + idx_x * 1 + idx_y * 1 * xdim0_advec_mom_kernel_mass_flux_y],
                      &arg1[base1 + idx_x * 1 + idx_y * 1 * xdim1_advec_mom_kernel_mass_flux_y],
                      
                      xdim0_advec_mom_kernel_mass_flux_y,
                      xdim1_advec_mom_kernel_mass_flux_y);
   }

 }
