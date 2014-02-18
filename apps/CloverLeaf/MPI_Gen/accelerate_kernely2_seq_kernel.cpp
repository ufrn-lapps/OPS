//
// auto-generated by ops.py on 2014-02-17 17:42
//

#include "ops_mpi_core.h"
#include "lib.h"
//user function
#include "accelerate_kernel.h"

// host stub function
void ops_par_loop_accelerate_kernely2(char const *name, ops_block block, int dim, int* range,
 ops_arg arg0, ops_arg arg1, ops_arg arg2, ops_arg arg3) {

  char *p_a[4];
  int  offs[4][2];

  ops_arg args[4] = { arg0, arg1, arg2, arg3};

  sub_block_list sb = OPS_sub_block_list[block->index];


  //compute localy allocated range for the sub-block
  int ndim = sb->ndim;
  int* start = (int*) xmalloc(sizeof(int)*ndim*4);
  int* end = (int*) xmalloc(sizeof(int)*ndim*4);

  int s[ndim];
  int e[ndim];

  for (int n=0; n<ndim; n++) {
    s[n] = sb->istart[n];e[n] = sb->iend[n]+1;
    if (s[n] >= range[2*n]) s[n] = 0;
    else s[n] = range[2*n] - s[n];
    if (e[n] >= range[2*n+1]) e[n] = range[2*n+1] - sb->istart[n];
    else e[n] = sb->sizes[n];
  }
  for(int i = 0; i<4; i++) {
    for(int n=0; n<ndim; n++) {
      start[i*ndim+n] = s[n];
      end[i*ndim+n]   = e[n];
    }
  }

  #ifdef OPS_DEBUG
  ops_register_args(args, name);
  #endif

  for (int i = 0; i<4;i++) {
    if(args[i].stencil!=NULL) {
      offs[i][0] = args[i].stencil->stride[0]*1;  //unit step in x dimension
      for(int n=1; n<ndim; n++) {
        offs[i][n] = off2(ndim, n, &start[i*ndim], &end[i*ndim],
                         args[i].dat->block_size, args[i].stencil->stride);
      }
    }
  }

  //set up initial pointers
  for (int i = 0; i < 4; i++) {
    if (args[i].argtype == OPS_ARG_DAT) {
      p_a[i] = (char *)args[i].data //base of 2D array
      + address2(ndim, args[i].dat->size, &start[i*ndim],
        args[i].dat->block_size, args[i].stencil->stride, args[i].dat->offset);
    }
    else if (args[i].argtype == OPS_ARG_GBL)
      p_a[i] = (char *)args[i].data;
  }

  free(start);free(end);

  if (args[0].argtype == OPS_ARG_DAT)  xdim0 = args[0].dat->block_size[0];
  if (args[1].argtype == OPS_ARG_DAT)  xdim1 = args[1].dat->block_size[0];
  if (args[2].argtype == OPS_ARG_DAT)  xdim2 = args[2].dat->block_size[0];
  if (args[3].argtype == OPS_ARG_DAT)  xdim3 = args[3].dat->block_size[0];


  for (int i = 0; i < 4; i++) {
    if(args[i].argtype == OPS_ARG_DAT)
      ops_exchange_halo(&args[i],2);
  }

  int off0_1 = offs[0][0];
  int off0_2 = offs[0][1];
  int dat0 = args[0].dat->size;
  int off1_1 = offs[1][0];
  int off1_2 = offs[1][1];
  int dat1 = args[1].dat->size;
  int off2_1 = offs[2][0];
  int off2_2 = offs[2][1];
  int dat2 = args[2].dat->size;
  int off3_1 = offs[3][0];
  int off3_2 = offs[3][1];
  int dat3 = args[3].dat->size;

  for ( int n_y=s[1]; n_y<e[1]; n_y++ ){
    for ( int n_x=s[0]; n_x<s[0]+(e[0]-s[0])/4; n_x++ ){
      //call kernel function, passing in pointers to data -vectorised
      #pragma simd
      for ( int i=0; i<4; i++ ){
        accelerate_kernely2(  (double *)p_a[0]+ i*1, (double *)p_a[1]+ i*1, (double *)p_a[2]+ i*1,
          (double *)p_a[3]+ i*1);

      }

      //shift pointers to data x direction
      p_a[0]= p_a[0] + (dat0 * off0_1)*4;
      p_a[1]= p_a[1] + (dat1 * off1_1)*4;
      p_a[2]= p_a[2] + (dat2 * off2_1)*4;
      p_a[3]= p_a[3] + (dat3 * off3_1)*4;

    }

    for ( int n_x=s[0]+((e[0]-s[0])/4)*4; n_x<e[0]; n_x++ ){
      //call kernel function, passing in pointers to data - remainder
      accelerate_kernely2(  (double *)p_a[0], (double *)p_a[1], (double *)p_a[2],
        (double *)p_a[3]);

      //shift pointers to data x direction
      p_a[0]= p_a[0] + (dat0 * off0_1);
      p_a[1]= p_a[1] + (dat1 * off1_1);
      p_a[2]= p_a[2] + (dat2 * off2_1);
      p_a[3]= p_a[3] + (dat3 * off3_1);
    }

    //shift pointers to data y direction
    p_a[0]= p_a[0] + (dat0 * off0_2);
    p_a[1]= p_a[1] + (dat1 * off1_2);
    p_a[2]= p_a[2] + (dat2 * off2_2);
    p_a[3]= p_a[3] + (dat3 * off3_2);
  }

  ops_mpi_reduce(&arg0,(double *)p_a[0]);
  ops_mpi_reduce(&arg1,(double *)p_a[1]);
  ops_mpi_reduce(&arg2,(double *)p_a[2]);
  ops_mpi_reduce(&arg3,(double *)p_a[3]);

}
