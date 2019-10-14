//
// auto-generated by ops.py
//

int xdim0_advec_cell_kernel4_ydir;
int ydim0_advec_cell_kernel4_ydir;
int xdim1_advec_cell_kernel4_ydir;
int ydim1_advec_cell_kernel4_ydir;
int xdim2_advec_cell_kernel4_ydir;
int ydim2_advec_cell_kernel4_ydir;
int xdim3_advec_cell_kernel4_ydir;
int ydim3_advec_cell_kernel4_ydir;
int xdim4_advec_cell_kernel4_ydir;
int ydim4_advec_cell_kernel4_ydir;
int xdim5_advec_cell_kernel4_ydir;
int ydim5_advec_cell_kernel4_ydir;
int xdim6_advec_cell_kernel4_ydir;
int ydim6_advec_cell_kernel4_ydir;
int xdim7_advec_cell_kernel4_ydir;
int ydim7_advec_cell_kernel4_ydir;
int xdim8_advec_cell_kernel4_ydir;
int ydim8_advec_cell_kernel4_ydir;
int xdim9_advec_cell_kernel4_ydir;
int ydim9_advec_cell_kernel4_ydir;
int xdim10_advec_cell_kernel4_ydir;
int ydim10_advec_cell_kernel4_ydir;


//user function



void advec_cell_kernel4_ydir_c_wrapper(
  double * restrict density1_p,
  double * restrict energy1_p,
  double * restrict mass_flux_y_p,
  double * restrict vol_flux_y_p,
  double * restrict pre_vol_p,
  double * restrict post_vol_p,
  double * restrict pre_mass_p,
  double * restrict post_mass_p,
  double * restrict advec_vol_p,
  double * restrict post_ener_p,
  double * restrict ener_flux_p,
  int x_size, int y_size, int z_size) {
  #pragma omp parallel for
  for ( int n_z=0; n_z<z_size; n_z++ ){
    for ( int n_y=0; n_y<y_size; n_y++ ){
      for ( int n_x=0; n_x<x_size; n_x++ ){
        ptr_double density1 = { density1_p + n_x*1 + n_y * xdim0_advec_cell_kernel4_ydir*1 + n_z * xdim0_advec_cell_kernel4_ydir * ydim0_advec_cell_kernel4_ydir*1, xdim0_advec_cell_kernel4_ydir, ydim0_advec_cell_kernel4_ydir};
        ptr_double energy1 = { energy1_p + n_x*1 + n_y * xdim1_advec_cell_kernel4_ydir*1 + n_z * xdim1_advec_cell_kernel4_ydir * ydim1_advec_cell_kernel4_ydir*1, xdim1_advec_cell_kernel4_ydir, ydim1_advec_cell_kernel4_ydir};
        const ptr_double mass_flux_y = { mass_flux_y_p + n_x*1 + n_y * xdim2_advec_cell_kernel4_ydir*1 + n_z * xdim2_advec_cell_kernel4_ydir * ydim2_advec_cell_kernel4_ydir*1, xdim2_advec_cell_kernel4_ydir, ydim2_advec_cell_kernel4_ydir};
        const ptr_double vol_flux_y = { vol_flux_y_p + n_x*1 + n_y * xdim3_advec_cell_kernel4_ydir*1 + n_z * xdim3_advec_cell_kernel4_ydir * ydim3_advec_cell_kernel4_ydir*1, xdim3_advec_cell_kernel4_ydir, ydim3_advec_cell_kernel4_ydir};
        const ptr_double pre_vol = { pre_vol_p + n_x*1 + n_y * xdim4_advec_cell_kernel4_ydir*1 + n_z * xdim4_advec_cell_kernel4_ydir * ydim4_advec_cell_kernel4_ydir*1, xdim4_advec_cell_kernel4_ydir, ydim4_advec_cell_kernel4_ydir};
        const ptr_double post_vol = { post_vol_p + n_x*1 + n_y * xdim5_advec_cell_kernel4_ydir*1 + n_z * xdim5_advec_cell_kernel4_ydir * ydim5_advec_cell_kernel4_ydir*1, xdim5_advec_cell_kernel4_ydir, ydim5_advec_cell_kernel4_ydir};
        ptr_double pre_mass = { pre_mass_p + n_x*1 + n_y * xdim6_advec_cell_kernel4_ydir*1 + n_z * xdim6_advec_cell_kernel4_ydir * ydim6_advec_cell_kernel4_ydir*1, xdim6_advec_cell_kernel4_ydir, ydim6_advec_cell_kernel4_ydir};
        ptr_double post_mass = { post_mass_p + n_x*1 + n_y * xdim7_advec_cell_kernel4_ydir*1 + n_z * xdim7_advec_cell_kernel4_ydir * ydim7_advec_cell_kernel4_ydir*1, xdim7_advec_cell_kernel4_ydir, ydim7_advec_cell_kernel4_ydir};
        ptr_double advec_vol = { advec_vol_p + n_x*1 + n_y * xdim8_advec_cell_kernel4_ydir*1 + n_z * xdim8_advec_cell_kernel4_ydir * ydim8_advec_cell_kernel4_ydir*1, xdim8_advec_cell_kernel4_ydir, ydim8_advec_cell_kernel4_ydir};
        ptr_double post_ener = { post_ener_p + n_x*1 + n_y * xdim9_advec_cell_kernel4_ydir*1 + n_z * xdim9_advec_cell_kernel4_ydir * ydim9_advec_cell_kernel4_ydir*1, xdim9_advec_cell_kernel4_ydir, ydim9_advec_cell_kernel4_ydir};
        const ptr_double ener_flux = { ener_flux_p + n_x*1 + n_y * xdim10_advec_cell_kernel4_ydir*1 + n_z * xdim10_advec_cell_kernel4_ydir * ydim10_advec_cell_kernel4_ydir*1, xdim10_advec_cell_kernel4_ydir, ydim10_advec_cell_kernel4_ydir};
        

  OPS_ACC(pre_mass, 0,0,0) = OPS_ACC(density1, 0,0,0) * OPS_ACC(pre_vol, 0,0,0);
  OPS_ACC(post_mass, 0,0,0) = OPS_ACC(pre_mass, 0,0,0) + OPS_ACC(mass_flux_y, 0,0,0) - OPS_ACC(mass_flux_y, 0,1,0);
  OPS_ACC(post_ener, 0,0,0) = ( OPS_ACC(energy1, 0,0,0) * OPS_ACC(pre_mass, 0,0,0) + OPS_ACC(ener_flux, 0,0,0) - OPS_ACC(ener_flux, 0,1,0))/OPS_ACC(post_mass, 0,0,0);
  OPS_ACC(advec_vol, 0,0,0) = OPS_ACC(pre_vol, 0,0,0) + OPS_ACC(vol_flux_y, 0,0,0) - OPS_ACC(vol_flux_y, 0,1,0);
  OPS_ACC(density1, 0,0,0) = OPS_ACC(post_mass, 0,0,0)/OPS_ACC(advec_vol, 0,0,0);
  OPS_ACC(energy1, 0,0,0) = OPS_ACC(post_ener, 0,0,0);


      }
    }
  }
}
