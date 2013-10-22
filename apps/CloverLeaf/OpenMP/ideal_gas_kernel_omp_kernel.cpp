//
// auto-generated by ops.py on 2013-10-22 15:45
//

#include "lib.h"
#ifdef _OPENMP
#include <omp.h>
#endif
//user function
#include "ideal_gas_kernel.h"

// host stub function
void ops_par_loop_ideal_gas_kernel(char const *name, int dim, int* range,
 ops_arg arg0, ops_arg arg1, ops_arg arg2, ops_arg arg3) {

  ops_arg args[4] = { arg0, arg1, arg2, arg3};


  //setup offsets
  int  offs[4][2];

  for ( int i=0; i<4; i++ ){
    if (args[i].stencil!=NULL) {
      offs[i][0] = 1;  //unit step in x dimension
      offs[i][1] = ops_offs_set(range[0],range[2]+1, args[i]) - ops_offs_set(range[1],range[2], args[i]);
      //stride in y as x stride is 0
      if (args[i].stencil->stride[0] == 0) {
        offs[i][0] = 0;
        offs[i][1] = args[i].dat->block_size[0];
      }
      //stride in x as y stride is 0
      else if (args[i].stencil->stride[1] == 0) {
        offs[i][0] = 1;
        offs[i][1] = -( range[1] - range[0] );
      }
    }
  }

  #ifdef _OPENMP
  int nthreads = omp_get_max_threads( );
  #else
  int nthreads = 1;
  #endif


  int y_size = range[3]-range[2];

  #pragma omp parallel for
  for ( int thr=0; thr<nthreads; thr++ ){

    char **p_a[4];

    //store index of non_gbl args
    int non_gbl[4] = {0, 0, 0, 0};

    int g = 0;
    for ( int i=0; i<4; i++ ){
      if (args[i].argtype == OPS_ARG_DAT) {
        non_gbl[g++] = i;
      }
    }
    p_a[0] = (char **)malloc(args[0].stencil->points * sizeof(char *));
    p_a[1] = (char **)malloc(args[1].stencil->points * sizeof(char *));
    p_a[2] = (char **)malloc(args[2].stencil->points * sizeof(char *));
    p_a[3] = (char **)malloc(args[3].stencil->points * sizeof(char *));

    int start = range[2] + ((y_size-1)/nthreads+1)*thr;
    int finish = range[2] +  MIN(((y_size-1)/nthreads+1)*(thr+1),y_size);

    //set up initial pointers
    ops_arg_set(range[0], start, args[0], p_a[0]);
    ops_arg_set(range[0], start, args[1], p_a[1]);
    ops_arg_set(range[0], start, args[2], p_a[2]);
    ops_arg_set(range[0], start, args[3], p_a[3]);

    for ( int n_y=start; n_y<finish; n_y++ ){
      for ( int n_x=range[0]; n_x<range[1]; n_x++ ){
        //call kernel function, passing in pointers to data

        ideal_gas_kernel(  (double **)p_a[0], (double **)p_a[1],
           (double **)p_a[2], (double **)p_a[3] );

        int a = 0;
        //shift pointers to data x direction
        for ( int i=0; i<g; i++ ){
          a = non_gbl[i];
          for ( int np=0; np<args[a].stencil->points; np++ ){
            p_a[a][np] = p_a[a][np] + (args[a].dat->size * offs[a][0]);
          }
        }
      }

      int a = 0;
      //shift pointers to data y direction
      for ( int i=0; i<g; i++ ){
        a = non_gbl[i];
        for ( int np=0; np<args[a].stencil->points; np++ ){
          p_a[a][np] = p_a[a][np] + (args[a].dat->size * offs[a][1]);
        }
      }
    }

    free(p_a[0]);
    free(p_a[1]);
    free(p_a[2]);
    free(p_a[3]);
  }
}
