//
// auto-generated by ops.py
//

int xdim0_initialise_chunk_kernel_cellx;
int xdim1_initialise_chunk_kernel_cellx;
int xdim2_initialise_chunk_kernel_cellx;


//user function



void initialise_chunk_kernel_cellx_c_wrapper(
  double * restrict vertexx_p,
  double * restrict cellx_p,
  double * restrict celldx_p,
  int x_size, int y_size) {
  #pragma omp parallel for
  for ( int n_y=0; n_y<y_size; n_y++ ){
    for ( int n_x=0; n_x<x_size; n_x++ ){
      const ptr_double vertexx = { vertexx_p + n_x*1 + n_y * xdim0_initialise_chunk_kernel_cellx*0, xdim0_initialise_chunk_kernel_cellx};
      ptr_double cellx = { cellx_p + n_x*1 + n_y * xdim1_initialise_chunk_kernel_cellx*0, xdim1_initialise_chunk_kernel_cellx};
      ptr_double celldx = { celldx_p + n_x*1 + n_y * xdim2_initialise_chunk_kernel_cellx*0, xdim2_initialise_chunk_kernel_cellx};

      double d_x;
      d_x = (grid.xmax - grid.xmin) / (double)grid.x_cells;

      OPS_ACC(cellx, 0, 0) =
          0.5 * (OPS_ACC(vertexx, 0, 0) + OPS_ACC(vertexx, 1, 0));
      OPS_ACC(celldx, 0, 0) = d_x;
    }
  }
}
