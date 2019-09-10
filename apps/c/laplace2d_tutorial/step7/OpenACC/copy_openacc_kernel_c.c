//
// auto-generated by ops.py
//

#define OPS_GPU

int xdim0_copy;
int xdim1_copy;

//user function
inline 
void copy(ptr_double A, const ptr_double Anew) {
  OPS_ACC(A, 0,0) = OPS_ACC(Anew, 0,0);
}


void copy_c_wrapper(
  double *p_a0,
  double *p_a1,
  int x_size, int y_size) {
  #ifdef OPS_GPU
  #pragma acc parallel deviceptr(p_a0,p_a1)
  #pragma acc loop
  #endif
  for ( int n_y=0; n_y<y_size; n_y++ ){
    #ifdef OPS_GPU
    #pragma acc loop
    #endif
    for ( int n_x=0; n_x<x_size; n_x++ ){
      ptr_double ptr0 = {  p_a0 + n_x*1*1 + n_y*xdim0_copy*1*1, xdim0_copy};
      const ptr_double ptr1 = {  p_a1 + n_x*1*1 + n_y*xdim1_copy*1*1, xdim1_copy};
      copy( ptr0,
          ptr1 );

    }
  }
}
