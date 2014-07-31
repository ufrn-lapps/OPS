//
// auto-generated by ops.py on 2014-07-31 12:24
//


#pragma OPENCL EXTENSION cl_khr_fp64:enable

#include "user_types.h"
#include "ops_opencl_reduction.h"

#ifndef MIN
#define MIN(a,b) ((a<b) ? (a) : (b))
#endif
#ifndef MAX
#define MAX(a,b) ((a>b) ? (a) : (b))
#endif
#ifndef SIGN
#define SIGN(a,b) ((b<0.0) ? (a*(-1)) : (a))
#endif
#define OPS_READ 0
#define OPS_WRITE 1
#define OPS_RW 2
#define OPS_INC 3
#define OPS_MIN 4
#define OPS_MAX 5
#define ZERO_double 0.0;
#define INFINITY_double INFINITY;
#define ZERO_float 0.0f;
#define INFINITY_float INFINITY;
#define ZERO_int 0;
#define INFINITY_int INFINITY;
#define ZERO_uint 0;
#define INFINITY_uint INFINITY;
#define ZERO_ll 0;
#define INFINITY_ll INFINITY;
#define ZERO_ull 0;
#define INFINITY_ull INFINITY;
#define ZERO_bool 0;
#define OPS_ACC0(x,y,z) (x+xdim0_viscosity_kernel*(y)+xdim0_viscosity_kernel*ydim0_viscosity_kernel*(z))
#define OPS_ACC1(x,y,z) (x+xdim1_viscosity_kernel*(y)+xdim1_viscosity_kernel*ydim1_viscosity_kernel*(z))
#define OPS_ACC2(x,y,z) (x+xdim2_viscosity_kernel*(y)+xdim2_viscosity_kernel*ydim2_viscosity_kernel*(z))
#define OPS_ACC3(x,y,z) (x+xdim3_viscosity_kernel*(y)+xdim3_viscosity_kernel*ydim3_viscosity_kernel*(z))
#define OPS_ACC4(x,y,z) (x+xdim4_viscosity_kernel*(y)+xdim4_viscosity_kernel*ydim4_viscosity_kernel*(z))
#define OPS_ACC5(x,y,z) (x+xdim5_viscosity_kernel*(y)+xdim5_viscosity_kernel*ydim5_viscosity_kernel*(z))
#define OPS_ACC6(x,y,z) (x+xdim6_viscosity_kernel*(y)+xdim6_viscosity_kernel*ydim6_viscosity_kernel*(z))
#define OPS_ACC7(x,y,z) (x+xdim7_viscosity_kernel*(y)+xdim7_viscosity_kernel*ydim7_viscosity_kernel*(z))
#define OPS_ACC8(x,y,z) (x+xdim8_viscosity_kernel*(y)+xdim8_viscosity_kernel*ydim8_viscosity_kernel*(z))
#define OPS_ACC9(x,y,z) (x+xdim9_viscosity_kernel*(y)+xdim9_viscosity_kernel*ydim9_viscosity_kernel*(z))
#define OPS_ACC10(x,y,z) (x+xdim10_viscosity_kernel*(y)+xdim10_viscosity_kernel*ydim10_viscosity_kernel*(z))
#define OPS_ACC11(x,y,z) (x+xdim11_viscosity_kernel*(y)+xdim11_viscosity_kernel*ydim11_viscosity_kernel*(z))


//user function
void viscosity_kernel( const __global double * restrict xvel0, const __global double * restrict yvel0, const __global double * restrict celldx, 
const __global double * restrict celldy, const __global double * restrict pressure, const __global double * restrict density0, __global double * restrict viscosity, 
const __global double * restrict zvel0, const __global double * restrict celldz, const __global double * restrict xarea, const __global double * restrict yarea, 
const __global double * restrict zarea)

  {

  double grad2,
         pgradx,pgrady,pgradz,
         pgradx2,pgrady2,pgradz2,
         grad,
         ygrad, xgrad, zgrad,
         div,
         strain2,
         limiter,
         pgrad;

  double ugradx1=xvel0[OPS_ACC0(0,0,0)]+xvel0[OPS_ACC0(0,1,0)]+xvel0[OPS_ACC0(0,0,1)]+xvel0[OPS_ACC0(0,1,1)];
  double ugradx2=xvel0[OPS_ACC0(1,0,0)]+xvel0[OPS_ACC0(1,1,0)]+xvel0[OPS_ACC0(1,0,1)]+xvel0[OPS_ACC0(1,1,1)];
  double ugrady1=xvel0[OPS_ACC0(0,0,0)]+xvel0[OPS_ACC0(1,0,0)]+xvel0[OPS_ACC0(0,0,1)]+xvel0[OPS_ACC0(1,0,1)];
  double ugrady2=xvel0[OPS_ACC0(0,1,0)]+xvel0[OPS_ACC0(1,1,0)]+xvel0[OPS_ACC0(0,1,1)]+xvel0[OPS_ACC0(1,1,1)];
  double ugradz1=xvel0[OPS_ACC0(0,0,0)]+xvel0[OPS_ACC0(1,0,0)]+xvel0[OPS_ACC0(0,1,0)]+xvel0[OPS_ACC0(1,1,0)];
  double ugradz2=xvel0[OPS_ACC0(0,0,1)]+xvel0[OPS_ACC0(1,0,1)]+xvel0[OPS_ACC0(0,1,1)]+xvel0[OPS_ACC0(1,1,1)];

  double vgradx1=yvel0[OPS_ACC1(0,0,0)]+yvel0[OPS_ACC1(0,1,0)]+yvel0[OPS_ACC1(0,0,1)]+yvel0[OPS_ACC1(0,1,1)];
  double vgradx2=yvel0[OPS_ACC1(1,0,0)]+yvel0[OPS_ACC1(1,1,0)]+yvel0[OPS_ACC1(1,0,1)]+yvel0[OPS_ACC1(1,1,1)];
  double vgrady1=yvel0[OPS_ACC1(0,0,0)]+yvel0[OPS_ACC1(1,0,0)]+yvel0[OPS_ACC1(0,0,1)]+yvel0[OPS_ACC1(1,0,1)];
  double vgrady2=yvel0[OPS_ACC1(0,1,0)]+yvel0[OPS_ACC1(1,1,0)]+yvel0[OPS_ACC1(0,1,1)]+yvel0[OPS_ACC1(1,1,1)];
  double vgradz1=yvel0[OPS_ACC1(0,0,0)]+yvel0[OPS_ACC1(1,0,0)]+yvel0[OPS_ACC1(0,1,0)]+yvel0[OPS_ACC1(1,1,0)];
  double vgradz2=yvel0[OPS_ACC1(0,0,1)]+yvel0[OPS_ACC1(1,0,1)]+yvel0[OPS_ACC1(0,1,1)]+yvel0[OPS_ACC1(1,1,1)];

  double wgradx1=zvel0[OPS_ACC7(0,0,0)]+zvel0[OPS_ACC7(0,1,0)]+zvel0[OPS_ACC7(0,0,1)]+zvel0[OPS_ACC7(0,1,1)];
  double wgradx2=zvel0[OPS_ACC7(1,0,0)]+zvel0[OPS_ACC7(1,1,0)]+zvel0[OPS_ACC7(1,0,1)]+zvel0[OPS_ACC7(1,1,1)];
  double wgrady1=zvel0[OPS_ACC7(0,0,0)]+zvel0[OPS_ACC7(1,0,0)]+zvel0[OPS_ACC7(0,0,1)]+zvel0[OPS_ACC7(1,0,1)];
  double wgrady2=zvel0[OPS_ACC7(0,1,0)]+zvel0[OPS_ACC7(1,1,0)]+zvel0[OPS_ACC7(0,1,1)]+zvel0[OPS_ACC7(1,1,1)];
  double wgradz1=zvel0[OPS_ACC7(0,0,0)]+zvel0[OPS_ACC7(1,0,0)]+zvel0[OPS_ACC7(0,1,0)]+zvel0[OPS_ACC7(1,1,0)];
  double wgradz2=zvel0[OPS_ACC7(0,0,1)]+zvel0[OPS_ACC7(1,0,1)]+zvel0[OPS_ACC7(0,1,1)]+zvel0[OPS_ACC7(1,1,1)];

  div = xarea[OPS_ACC9(0,0,0)]*(ugradx2-ugradx1) + yarea[OPS_ACC10(0,0,0)]*(vgrady2-vgrady1) + zarea[OPS_ACC11(0,0,0)]*(wgradz2-wgradz1);

  double xx = 0.25*(ugradx2-ugradx1)/(celldx[OPS_ACC2(0,0,0)]);
  double yy = 0.25*(vgrady2-vgrady1)/(celldy[OPS_ACC3(0,0,0)]);
  double zz = 0.25*(wgradz2-wgradz1)/(celldz[OPS_ACC8(0,0,0)]);
  double xy = 0.25*(ugrady2-ugrady1)/(celldy[OPS_ACC3(0,0,0)])+0.25*(vgradx2-vgradx1)/(celldx[OPS_ACC2(0,0,0)]);
  double xz = 0.25*(ugradz2-ugradz1)/(celldz[OPS_ACC8(0,0,0)])+0.25*(wgradx2-wgradx1)/(celldx[OPS_ACC2(0,0,0)]);
  double yz = 0.25*(vgradz2-vgradz1)/(celldz[OPS_ACC8(0,0,0)])+0.25*(wgrady2-wgrady1)/(celldy[OPS_ACC3(0,0,0)]);


  pgradx = (pressure[OPS_ACC4(1,0,0)] - pressure[OPS_ACC4(-1,0,0)])/(celldx[OPS_ACC2(0,0,0)]+ celldx[OPS_ACC2(1,0,0)]);
  pgrady = (pressure[OPS_ACC4(0,1,0)] - pressure[OPS_ACC4(0,-1,0)])/(celldy[OPS_ACC3(0,0,0)]+ celldy[OPS_ACC3(0,1,0)]);
  pgradz = (pressure[OPS_ACC4(0,0,1)] - pressure[OPS_ACC4(0,0,-1)])/(celldz[OPS_ACC8(0,0,0)]+ celldz[OPS_ACC8(0,0,1)]);

  pgradx2 = pgradx * pgradx;
  pgrady2 = pgrady * pgrady;
  pgradz2 = pgradz * pgradz;
  limiter = (xx*pgradx2+yy*pgrady2+zz*pgradz2
          +  xy*pgradx*pgrady+xz*pgradx*pgradz+yz*pgrady*pgradz)
                / MAX(pgradx2+pgrady2+pgradz2,1.0e-16);

  if( (limiter > 0.0) || (div >= 0.0)) {
        viscosity[OPS_ACC6(0,0,0)] = 0.0;
  }
  else {
    pgradx = SIGN( MAX(1.0e-16, fabs(pgradx)), pgradx);
    pgrady = SIGN( MAX(1.0e-16, fabs(pgrady)), pgrady);
    pgradz = SIGN( MAX(1.0e-16, fabs(pgradz)), pgradz);
    pgrad = sqrt(pgradx*pgradx + pgrady*pgrady + pgradz*pgradz);
    xgrad = fabs(celldx[OPS_ACC2(0,0,0)] * pgrad/pgradx);
    ygrad = fabs(celldy[OPS_ACC3(0,0,0)] * pgrad/pgrady);
    zgrad = fabs(celldz[OPS_ACC8(0,0,0)] * pgrad/pgradz);
    grad  = MIN(xgrad,MIN(ygrad,zgrad));
    grad2 = grad*grad;

    viscosity[OPS_ACC6(0,0,0)] = 2.0 * (density0[OPS_ACC5(0,0,0)]) * grad2 * limiter * limiter;
  }
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


 __kernel void ops_viscosity_kernel(
 __global const double* restrict arg0,
 __global const double* restrict arg1,
 __global const double* restrict arg2,
 __global const double* restrict arg3,
 __global const double* restrict arg4,
 __global const double* restrict arg5,
 __global double* restrict arg6,
 __global const double* restrict arg7,
 __global const double* restrict arg8,
 __global const double* restrict arg9,
 __global const double* restrict arg10,
 __global const double* restrict arg11,
 const int base0,
 const int base1,
 const int base2,
 const int base3,
 const int base4,
 const int base5,
 const int base6,
 const int base7,
 const int base8,
 const int base9,
 const int base10,
 const int base11,
 const int size0,
 const int size1,
 const int size2 ){


   int idx_z = get_global_id(2);
   int idx_y = get_global_id(1);
   int idx_x = get_global_id(0);

   if (idx_x < size0 && idx_y < size1 && idx_z < size2) {
     viscosity_kernel(&arg0[base0 + idx_x * 1 + idx_y * 1 * xdim0_viscosity_kernel + idx_z * 1 * xdim0_viscosity_kernel * ydim0_viscosity_kernel],
                      &arg1[base1 + idx_x * 1 + idx_y * 1 * xdim1_viscosity_kernel + idx_z * 1 * xdim1_viscosity_kernel * ydim1_viscosity_kernel],
                      &arg2[base2 + idx_x * 1 + idx_y * 0 * xdim2_viscosity_kernel + idx_z * 0 * xdim2_viscosity_kernel * ydim2_viscosity_kernel],
                      &arg3[base3 + idx_x * 0 + idx_y * 1 * xdim3_viscosity_kernel + idx_z * 0 * xdim3_viscosity_kernel * ydim3_viscosity_kernel],
                      &arg4[base4 + idx_x * 1 + idx_y * 1 * xdim4_viscosity_kernel + idx_z * 1 * xdim4_viscosity_kernel * ydim4_viscosity_kernel],
                      &arg5[base5 + idx_x * 1 + idx_y * 1 * xdim5_viscosity_kernel + idx_z * 1 * xdim5_viscosity_kernel * ydim5_viscosity_kernel],
                      &arg6[base6 + idx_x * 1 + idx_y * 1 * xdim6_viscosity_kernel + idx_z * 1 * xdim6_viscosity_kernel * ydim6_viscosity_kernel],
                      &arg7[base7 + idx_x * 1 + idx_y * 1 * xdim7_viscosity_kernel + idx_z * 1 * xdim7_viscosity_kernel * ydim7_viscosity_kernel],
                      &arg8[base8 + idx_x * 0 + idx_y * 0 * xdim8_viscosity_kernel + idx_z * 1 * xdim8_viscosity_kernel * ydim8_viscosity_kernel],
                      &arg9[base9 + idx_x * 1 + idx_y * 1 * xdim9_viscosity_kernel + idx_z * 1 * xdim9_viscosity_kernel * ydim9_viscosity_kernel],
                      &arg10[base10 + idx_x * 1 + idx_y * 1 * xdim10_viscosity_kernel + idx_z * 1 * xdim10_viscosity_kernel * ydim10_viscosity_kernel],
                      &arg11[base11 + idx_x * 1 + idx_y * 1 * xdim11_viscosity_kernel + idx_z * 1 * xdim11_viscosity_kernel * ydim11_viscosity_kernel]);
   }

 }
