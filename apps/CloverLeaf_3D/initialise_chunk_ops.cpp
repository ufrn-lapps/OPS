//
// auto-generated by ops.py on 2014-07-31 12:24
//



#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <math.h>

#define OPS_3D
#include  "ops_lib_cpp.h"

//
// ops_par_loop declarations
//

void ops_par_loop_initialise_chunk_kernel_x(char const *, ops_block, int , int*,
  ops_arg,
  ops_arg,
  ops_arg );

void ops_par_loop_initialise_chunk_kernel_y(char const *, ops_block, int , int*,
  ops_arg,
  ops_arg,
  ops_arg );

void ops_par_loop_initialise_chunk_kernel_z(char const *, ops_block, int , int*,
  ops_arg,
  ops_arg,
  ops_arg );

void ops_par_loop_initialise_chunk_kernel_cellx(char const *, ops_block, int , int*,
  ops_arg,
  ops_arg,
  ops_arg );

void ops_par_loop_initialise_chunk_kernel_celly(char const *, ops_block, int , int*,
  ops_arg,
  ops_arg,
  ops_arg );

void ops_par_loop_initialise_chunk_kernel_cellz(char const *, ops_block, int , int*,
  ops_arg,
  ops_arg,
  ops_arg );

void ops_par_loop_initialise_chunk_kernel_volume(char const *, ops_block, int , int*,
  ops_arg,
  ops_arg,
  ops_arg,
  ops_arg,
  ops_arg,
  ops_arg,
  ops_arg );



#include "data.h"
#include "definitions.h"

//#include "initialise_chunk_kernel.h"

void initialise_chunk()
{

  int x_min = field.x_min;
  int x_max = field.x_max;
  int y_min = field.y_min;
  int y_max = field.y_max;
  int z_min = field.z_min;
  int z_max = field.z_max;

  int rangex[] = {x_min-2, x_max+3, y_min-2, y_max+3, z_min-2, z_max+3};
  int rangey[] = {x_min-2, x_max+3, y_min-2, y_max+3, z_min-2, z_max+3};
  int rangez[] = {x_min-2, x_max+3, y_min-2, y_max+3, z_min-2, z_max+3};


  ops_par_loop_initialise_chunk_kernel_x("initialise_chunk_kernel_x", clover_grid, 3, rangex,
               ops_arg_dat(vertexx, S3D_000_STRID3D_X, "double", OPS_WRITE),
               ops_arg_dat(xx, S3D_000_STRID3D_X, "int", OPS_READ),
               ops_arg_dat(vertexdx, S3D_000_STRID3D_X, "double", OPS_WRITE));

  ops_par_loop_initialise_chunk_kernel_y("initialise_chunk_kernel_y", clover_grid, 3, rangey,
               ops_arg_dat(vertexy, S3D_000_STRID3D_Y, "double", OPS_WRITE),
               ops_arg_dat(yy, S3D_000_STRID3D_Y, "int", OPS_READ),
               ops_arg_dat(vertexdy, S3D_000_STRID3D_Y, "double", OPS_WRITE));

  ops_par_loop_initialise_chunk_kernel_z("initialise_chunk_kernel_z", clover_grid, 3, rangez,
               ops_arg_dat(vertexz, S3D_000_STRID3D_Z, "double", OPS_WRITE),
               ops_arg_dat(zz, S3D_000_STRID3D_Z, "int", OPS_READ),
               ops_arg_dat(vertexdz, S3D_000_STRID3D_Z, "double", OPS_WRITE));

  rangex[0] = x_min-2; rangex[1] = x_max+2;
  ops_par_loop_initialise_chunk_kernel_cellx("initialise_chunk_kernel_cellx", clover_grid, 3, rangex,
               ops_arg_dat(vertexx, S3D_000_P100_STRID3D_X, "double", OPS_READ),
               ops_arg_dat(cellx, S3D_000_STRID3D_X, "double", OPS_WRITE),
               ops_arg_dat(celldx, S3D_000_STRID3D_X, "double", OPS_WRITE));

  rangey[2] = y_min-2; rangey[3] = y_max+2;
  ops_par_loop_initialise_chunk_kernel_celly("initialise_chunk_kernel_celly", clover_grid, 3, rangey,
               ops_arg_dat(vertexy, S3D_000_0P10_STRID3D_Y, "double", OPS_READ),
               ops_arg_dat(celly, S3D_000_STRID3D_Y, "double", OPS_WRITE),
               ops_arg_dat(celldy, S3D_000_STRID3D_Y, "double", OPS_WRITE));

  rangez[4] = z_min-2; rangez[5] = z_max+2;
  ops_par_loop_initialise_chunk_kernel_cellz("initialise_chunk_kernel_cellz", clover_grid, 3, rangez,
               ops_arg_dat(vertexz, S3D_000_00P1_STRID3D_Z, "double", OPS_READ),
               ops_arg_dat(cellz, S3D_000_STRID3D_Z, "double", OPS_WRITE),
               ops_arg_dat(celldz, S3D_000_STRID3D_Z, "double", OPS_WRITE));

  int rangexyz[] = {x_min-2,x_max+2,y_min-2,y_max+2,z_min-2,z_max+2};
  ops_par_loop_initialise_chunk_kernel_volume("initialise_chunk_kernel_volume", clover_grid, 3, rangexyz,
               ops_arg_dat(volume, S3D_000, "double", OPS_WRITE),
               ops_arg_dat(celldy, S3D_000_STRID3D_Y, "double", OPS_READ),
               ops_arg_dat(xarea, S3D_000, "double", OPS_WRITE),
               ops_arg_dat(celldx, S3D_000_STRID3D_X, "double", OPS_READ),
               ops_arg_dat(yarea, S3D_000, "double", OPS_WRITE),
               ops_arg_dat(celldz, S3D_000_STRID3D_Z, "double", OPS_READ),
               ops_arg_dat(zarea, S3D_000, "double", OPS_WRITE));
}
