//
// auto-generated by ops.py on 2014-03-17 16:31
//



#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <math.h>


#include  "ops_lib_cpp.h"

//
// ops_par_loop declarations
//

void ops_par_loop_PdV_kernel_predict(char const *, ops_block, int , int*,
  ops_arg,
  ops_arg,
  ops_arg,
  ops_arg,
  ops_arg,
  ops_arg,
  ops_arg,
  ops_arg,
  ops_arg,
  ops_arg,
  ops_arg,
  ops_arg );

void ops_par_loop_PdV_kernel_nopredict(char const *, ops_block, int , int*,
  ops_arg,
  ops_arg,
  ops_arg,
  ops_arg,
  ops_arg,
  ops_arg,
  ops_arg,
  ops_arg,
  ops_arg,
  ops_arg,
  ops_arg,
  ops_arg,
  ops_arg,
  ops_arg );



#include "data.h"
#include "definitions.h"

//#include "PdV_kernel.h"

void ideal_gas(int predict);
void update_halo(int* fields, int depth);
void revert();

void PdV(int predict)
{
  error_condition = 0;

  int x_cells = grid->x_cells;
  int y_cells = grid->y_cells;
  int x_min = field->x_min;
  int x_max = field->x_max;
  int y_min = field->y_min;
  int y_max = field->y_max;

  int rangexy_inner[] = {x_min,x_max,y_min,y_max};

  if(predict == TRUE) {
  ops_par_loop_PdV_kernel_predict("PdV_kernel_predict", clover_grid, 2, rangexy_inner,
               ops_arg_dat(xarea, S2D_00_P10_0P1_P1P1, "double", OPS_READ),
               ops_arg_dat(xvel0, S2D_00_P10_0P1_P1P1, "double", OPS_READ),
               ops_arg_dat(yarea, S2D_00_P10_0P1_P1P1, "double", OPS_READ),
               ops_arg_dat(yvel0, S2D_00_P10_0P1_P1P1, "double", OPS_READ),
               ops_arg_dat(work_array1, S2D_00, "double", OPS_WRITE),
               ops_arg_dat(volume, S2D_00, "double", OPS_READ),
               ops_arg_dat(pressure, S2D_00, "double", OPS_READ),
               ops_arg_dat(density0, S2D_00, "double", OPS_READ),
               ops_arg_dat(density1, S2D_00, "double", OPS_WRITE),
               ops_arg_dat(viscosity, S2D_00, "double", OPS_READ),
               ops_arg_dat(energy0, S2D_00, "double", OPS_READ),
               ops_arg_dat(energy1, S2D_00, "double", OPS_WRITE));
  }
  else {
  ops_par_loop_PdV_kernel_nopredict("PdV_kernel_nopredict", clover_grid, 2, rangexy_inner,
               ops_arg_dat(xarea, S2D_00_P10_0P1_P1P1, "double", OPS_READ),
               ops_arg_dat(xvel0, S2D_00_P10_0P1_P1P1, "double", OPS_READ),
               ops_arg_dat(xvel1, S2D_00_P10_0P1_P1P1, "double", OPS_READ),
               ops_arg_dat(yarea, S2D_00_P10_0P1_P1P1, "double", OPS_READ),
               ops_arg_dat(yvel0, S2D_00_P10_0P1_P1P1, "double", OPS_READ),
               ops_arg_dat(yvel1, S2D_00_P10_0P1_P1P1, "double", OPS_READ),
               ops_arg_dat(work_array1, S2D_00, "double", OPS_WRITE),
               ops_arg_dat(volume, S2D_00, "double", OPS_READ),
               ops_arg_dat(pressure, S2D_00, "double", OPS_READ),
               ops_arg_dat(density0, S2D_00, "double", OPS_READ),
               ops_arg_dat(density1, S2D_00, "double", OPS_WRITE),
               ops_arg_dat(viscosity, S2D_00, "double", OPS_READ),
               ops_arg_dat(energy0, S2D_00, "double", OPS_READ),
               ops_arg_dat(energy1, S2D_00, "double", OPS_WRITE));
  }

  if(error_condition == 1) {
    ops_printf("PdV: error in PdV\n");
    exit(-2);
  }

  if(predict == TRUE) {
    ideal_gas(TRUE);

    fields[FIELD_DENSITY0]  = 0;
    fields[FIELD_ENERGY0]   = 0;
    fields[FIELD_PRESSURE]  = 1;
    fields[FIELD_VISCOSITY] = 0;
    fields[FIELD_DENSITY1]  = 0;
    fields[FIELD_ENERGY1]   = 0;
    fields[FIELD_XVEL0]     = 0;
    fields[FIELD_YVEL0]     = 0;
    fields[FIELD_XVEL1]     = 0;
    fields[FIELD_YVEL1]     = 0;
    fields[FIELD_VOL_FLUX_X] = 0;
    fields[FIELD_VOL_FLUX_Y] = 0;
    fields[FIELD_MASS_FLUX_X] = 0;
    fields[FIELD_MASS_FLUX_Y] = 0;
    update_halo(fields,1);

  }

  if(predict == TRUE) {
    revert();
  }

}
