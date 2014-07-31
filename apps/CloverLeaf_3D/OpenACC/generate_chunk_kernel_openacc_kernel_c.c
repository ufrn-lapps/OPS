//
// auto-generated by ops.py on 2014-07-31 12:24
//

#include "./OpenACC/clover_leaf_common.h"

int xdim0_generate_chunk_kernel;
int ydim0_generate_chunk_kernel;
int xdim1_generate_chunk_kernel;
int ydim1_generate_chunk_kernel;
int xdim2_generate_chunk_kernel;
int ydim2_generate_chunk_kernel;
int xdim3_generate_chunk_kernel;
int ydim3_generate_chunk_kernel;
int xdim4_generate_chunk_kernel;
int ydim4_generate_chunk_kernel;
int xdim5_generate_chunk_kernel;
int ydim5_generate_chunk_kernel;
int xdim6_generate_chunk_kernel;
int ydim6_generate_chunk_kernel;
int xdim7_generate_chunk_kernel;
int ydim7_generate_chunk_kernel;
int xdim8_generate_chunk_kernel;
int ydim8_generate_chunk_kernel;
int xdim9_generate_chunk_kernel;
int ydim9_generate_chunk_kernel;
int xdim10_generate_chunk_kernel;
int ydim10_generate_chunk_kernel;

#define OPS_ACC0(x,y,z) (x+xdim0_generate_chunk_kernel*(y)+xdim0_generate_chunk_kernel*ydim0_generate_chunk_kernel*(z))
#define OPS_ACC1(x,y,z) (x+xdim1_generate_chunk_kernel*(y)+xdim1_generate_chunk_kernel*ydim1_generate_chunk_kernel*(z))
#define OPS_ACC2(x,y,z) (x+xdim2_generate_chunk_kernel*(y)+xdim2_generate_chunk_kernel*ydim2_generate_chunk_kernel*(z))
#define OPS_ACC3(x,y,z) (x+xdim3_generate_chunk_kernel*(y)+xdim3_generate_chunk_kernel*ydim3_generate_chunk_kernel*(z))
#define OPS_ACC4(x,y,z) (x+xdim4_generate_chunk_kernel*(y)+xdim4_generate_chunk_kernel*ydim4_generate_chunk_kernel*(z))
#define OPS_ACC5(x,y,z) (x+xdim5_generate_chunk_kernel*(y)+xdim5_generate_chunk_kernel*ydim5_generate_chunk_kernel*(z))
#define OPS_ACC6(x,y,z) (x+xdim6_generate_chunk_kernel*(y)+xdim6_generate_chunk_kernel*ydim6_generate_chunk_kernel*(z))
#define OPS_ACC7(x,y,z) (x+xdim7_generate_chunk_kernel*(y)+xdim7_generate_chunk_kernel*ydim7_generate_chunk_kernel*(z))
#define OPS_ACC8(x,y,z) (x+xdim8_generate_chunk_kernel*(y)+xdim8_generate_chunk_kernel*ydim8_generate_chunk_kernel*(z))
#define OPS_ACC9(x,y,z) (x+xdim9_generate_chunk_kernel*(y)+xdim9_generate_chunk_kernel*ydim9_generate_chunk_kernel*(z))
#define OPS_ACC10(x,y,z) (x+xdim10_generate_chunk_kernel*(y)+xdim10_generate_chunk_kernel*ydim10_generate_chunk_kernel*(z))

//user function
inline 
void generate_chunk_kernel( const double *vertexx,
                     const double *vertexy, const double *vertexz,
                     double *energy0, double *density0,
                     double *xvel0,  double *yvel0, double *zvel0,
                     const double *cellx, const double *celly, const double *cellz) {

  double radius, x_cent, y_cent, z_cent;


  energy0[OPS_ACC3(0,0,0)]= states[0].energy;
  density0[OPS_ACC4(0,0,0)]= states[0].density;
  xvel0[OPS_ACC5(0,0,0)]=states[0].xvel;
  yvel0[OPS_ACC6(0,0,0)]=states[0].yvel;
  zvel0[OPS_ACC7(0,0,0)]=states[0].zvel;

  for(int i = 1; i<number_of_states; i++) {

    x_cent=states[i].xmin;
    y_cent=states[i].ymin;
    z_cent=states[i].zmin;

    if (states[i].geometry == g_cube) {
      if(vertexx[OPS_ACC0(1,0,0)] >= states[i].xmin  && vertexx[OPS_ACC0(0,0,0)] < states[i].xmax) {
        if(vertexy[OPS_ACC1(0,1,0)] >= states[i].ymin && vertexy[OPS_ACC1(0,0,0)] < states[i].ymax) {
          if(vertexz[OPS_ACC2(0,0,1)] >= states[i].zmin && vertexz[OPS_ACC2(0,0,0)] < states[i].zmax) {

            energy0[OPS_ACC3(0,0,0)] = states[i].energy;
            density0[OPS_ACC4(0,0,0)] = states[i].density;

            for (int ix=0;ix<2;ix++){
              for (int iy=0;iy<2;iy++){
                for (int iz=0;iz<2;iz++){
                  xvel0[OPS_ACC5(ix,iy,iz)] = states[i].xvel;
                  yvel0[OPS_ACC6(ix,iy,iz)] = states[i].yvel;
                  zvel0[OPS_ACC7(ix,iy,iz)] = states[i].zvel;
                }
              }
            }
          }
        }
      }
    }
    else if(states[i].geometry == g_sphe) {
      radius = sqrt ((cellx[OPS_ACC8(0,0,0)] - x_cent) * (cellx[OPS_ACC8(0,0,0)] - x_cent) +
                     (celly[OPS_ACC9(0,0,0)] - y_cent) * (celly[OPS_ACC9(0,0,0)] - y_cent) +
                     (cellz[OPS_ACC10(0,0,0)] - z_cent) * (cellz[OPS_ACC10(0,0,0)] - z_cent));
      if(radius <= states[i].radius) {
        energy0[OPS_ACC3(0,0,0)] = states[i].energy;
        density0[OPS_ACC4(0,0,0)] = states[i].density;

        for (int ix=0;ix<2;ix++){
          for (int iy=0;iy<2;iy++){
            for (int iz=0;iz<2;iz++){
              xvel0[OPS_ACC5(ix,iy,iz)] = states[i].xvel;
              yvel0[OPS_ACC6(ix,iy,iz)] = states[i].yvel;
              zvel0[OPS_ACC7(ix,iy,iz)] = states[i].zvel;
            }
          }
        }
      }
    }
    else if(states[i].geometry == g_point) {
      if(vertexx[OPS_ACC0(0,0,0)] == x_cent && vertexy[OPS_ACC1(0,0,0)] == y_cent && vertexz[OPS_ACC2(0,0,0)] == z_cent) {
        energy0[OPS_ACC3(0,0,0)] = states[i].energy;
        density0[OPS_ACC4(0,0,0)] = states[i].density;

        for (int ix=0;ix<2;ix++){
          for (int iy=0;iy<2;iy++){
            for (int iz=0;iz<2;iz++){
              xvel0[OPS_ACC5(ix,iy,iz)] = states[i].xvel;
              yvel0[OPS_ACC6(ix,iy,iz)] = states[i].yvel;
              zvel0[OPS_ACC7(ix,iy,iz)] = states[i].zvel;
            }
          }
        }
      }
    }
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


void generate_chunk_kernel_c_wrapper(
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
  int x_size, int y_size, int z_size) {
  #ifdef OPS_GPU
  #pragma acc parallel deviceptr(p_a0,p_a1,p_a2,p_a3,p_a4,p_a5,p_a6,p_a7,p_a8,p_a9,p_a10)
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
        generate_chunk_kernel(  p_a0 + n_x*1 + n_y*xdim0_generate_chunk_kernel*0 + n_z*xdim0_generate_chunk_kernel*ydim0_generate_chunk_kernel*0,
           p_a1 + n_x*0 + n_y*xdim1_generate_chunk_kernel*1 + n_z*xdim1_generate_chunk_kernel*ydim1_generate_chunk_kernel*0,
           p_a2 + n_x*0 + n_y*xdim2_generate_chunk_kernel*0 + n_z*xdim2_generate_chunk_kernel*ydim2_generate_chunk_kernel*1,
           p_a3 + n_x*1 + n_y*xdim3_generate_chunk_kernel*1 + n_z*xdim3_generate_chunk_kernel*ydim3_generate_chunk_kernel*1,
           p_a4 + n_x*1 + n_y*xdim4_generate_chunk_kernel*1 + n_z*xdim4_generate_chunk_kernel*ydim4_generate_chunk_kernel*1,
           p_a5 + n_x*1 + n_y*xdim5_generate_chunk_kernel*1 + n_z*xdim5_generate_chunk_kernel*ydim5_generate_chunk_kernel*1,
           p_a6 + n_x*1 + n_y*xdim6_generate_chunk_kernel*1 + n_z*xdim6_generate_chunk_kernel*ydim6_generate_chunk_kernel*1,
           p_a7 + n_x*1 + n_y*xdim7_generate_chunk_kernel*1 + n_z*xdim7_generate_chunk_kernel*ydim7_generate_chunk_kernel*1,
           p_a8 + n_x*1 + n_y*xdim8_generate_chunk_kernel*0 + n_z*xdim8_generate_chunk_kernel*ydim8_generate_chunk_kernel*0,
           p_a9 + n_x*0 + n_y*xdim9_generate_chunk_kernel*1 + n_z*xdim9_generate_chunk_kernel*ydim9_generate_chunk_kernel*0,
           p_a10 + n_x*0 + n_y*xdim10_generate_chunk_kernel*0 + n_z*xdim10_generate_chunk_kernel*ydim10_generate_chunk_kernel*1 );

      }
    }
  }
}
