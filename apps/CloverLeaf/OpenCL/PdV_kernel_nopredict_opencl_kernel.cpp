//
// auto-generated by ops.py on 2014-07-28 13:08
//


static bool isbuilt_PdV_kernel_nopredict = false;

void buildOpenCLKernels_PdV_kernel_nopredict(int xdim0,
 int xdim1,
 int xdim2,
 int xdim3,
 int xdim4,
 int xdim5,
 int xdim6,
 int xdim7,
 int xdim8,
 int xdim9,
 int xdim10,
 int xdim11,
 int xdim12,
 int xdim13) {
  
  if(!isbuilt_PdV_kernel_nopredict) {
    buildOpenCLKernels();
    //clSafeCall( clUnloadCompiler() );       
    cl_int ret;
    char* source_filename[1] = {"./OpenCL/PdV_kernel_nopredict.cl"};

    // Load the kernel source code into the array source_str
    FILE *fid;
    char *source_str[1];
    size_t source_size[1];

    for(int i=0; i<1; i++) {
      fid = fopen(source_filename[i], "r");
      if (!fid) {
        fprintf(stderr, "Can't open the kernel source file!\n");
        exit(1);
      }
      
      source_str[i] = (char*)malloc(4*0x1000000);
      source_size[i] = fread(source_str[i], 1, 4*0x1000000, fid);
      if(source_size[i] != 4*0x1000000) {
        if (ferror(fid)) {
          printf ("Error while reading kernel source file %s\n", source_filename[i]);
          exit(-1);
        }
        if (feof(fid))
          printf ("Kernel source file %s succesfuly read.\n", source_filename[i]);
          //printf("%s\n",source_str[i]);
      }
      fclose(fid);
    }
    
    printf("Compiling PdV_kernel_nopredict source -- start \n");

      // Create a program from the source
      OPS_opencl_core.program = clCreateProgramWithSource(OPS_opencl_core.context, 1, (const char **) &source_str, (const size_t *) &source_size, &ret);
      clSafeCall( ret );

      // Build the program
      char buildOpts[255*14];
      char* pPath = NULL;
      pPath = getenv ("OPS_INSTALL_PATH");
      if (pPath!=NULL)
        sprintf(buildOpts,"-cl-mad-enable -I%s/include -DOPS_WARPSIZE=%d  -Dxdim0_PdV_kernel_nopredict=%d -Dxdim1_PdV_kernel_nopredict=%d -Dxdim2_PdV_kernel_nopredict=%d -Dxdim3_PdV_kernel_nopredict=%d -Dxdim4_PdV_kernel_nopredict=%d -Dxdim5_PdV_kernel_nopredict=%d -Dxdim6_PdV_kernel_nopredict=%d -Dxdim7_PdV_kernel_nopredict=%d -Dxdim8_PdV_kernel_nopredict=%d -Dxdim9_PdV_kernel_nopredict=%d -Dxdim10_PdV_kernel_nopredict=%d -Dxdim11_PdV_kernel_nopredict=%d -Dxdim12_PdV_kernel_nopredict=%d -Dxdim13_PdV_kernel_nopredict=%d", pPath, 32,xdim0,xdim1,xdim2,xdim3,xdim4,xdim5,xdim6,xdim7,xdim8,xdim9,xdim10,xdim11,xdim12,xdim13);
      else {
        sprintf("Incorrect OPS_INSTALL_PATH %s\n",pPath);
        exit(EXIT_FAILURE);
      }
      
      ret = clBuildProgram(OPS_opencl_core.program, 1, &OPS_opencl_core.device_id, buildOpts, NULL, NULL);

      if(ret != CL_SUCCESS) {
        char* build_log;
        size_t log_size;
        clSafeCall( clGetProgramBuildInfo(OPS_opencl_core.program, OPS_opencl_core.device_id, CL_PROGRAM_BUILD_LOG, 0, NULL, &log_size) );
        build_log = (char*) malloc(log_size+1);
        clSafeCall( clGetProgramBuildInfo(OPS_opencl_core.program, OPS_opencl_core.device_id, CL_PROGRAM_BUILD_LOG, log_size, build_log, NULL) );
        build_log[log_size] = '\0';
        fprintf(stderr, "=============== OpenCL Program Build Info ================\n\n%s", build_log);
        fprintf(stderr, "\n========================================================= \n");
        free(build_log);
        exit(EXIT_FAILURE);
      }
      printf("compiling PdV_kernel_nopredict -- done\n");

    // Create the OpenCL kernel
    OPS_opencl_core.kernel[6] = clCreateKernel(OPS_opencl_core.program, "ops_PdV_kernel_nopredict", &ret);
    clSafeCall( ret );
      
    isbuilt_PdV_kernel_nopredict = true;
  }
  
}  


// host stub function
void ops_par_loop_PdV_kernel_nopredict(char const *name, ops_block Block, int dim, int* range,
 ops_arg arg0, ops_arg arg1, ops_arg arg2, ops_arg arg3,
 ops_arg arg4, ops_arg arg5, ops_arg arg6, ops_arg arg7, ops_arg arg8,
 ops_arg arg9, ops_arg arg10, ops_arg arg11, ops_arg arg12, ops_arg arg13) {
  ops_arg args[14] = { arg0, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9, arg10, arg11, arg12, arg13};

  sub_block_list sb = OPS_sub_block_list[Block->index];
  //compute localy allocated range for the sub-block
  int start_add[2];
  int end_add[2];
  for ( int n=0; n<2; n++ ){
    start_add[n] = sb->istart[n];end_add[n] = sb->iend[n]+1;
    if (start_add[n] >= range[2*n]) {
      start_add[n] = 0;
    }
    else {
      start_add[n] = range[2*n] - start_add[n];
    }
    if (end_add[n] >= range[2*n+1]) {
      end_add[n] = range[2*n+1] - sb->istart[n];
    }
    else {
      end_add[n] = sb->sizes[n];
    }
  }


  int x_size = end_add[0]-start_add[0];
  int y_size = end_add[1]-start_add[1];

  int xdim0 = args[0].dat->block_size[0]*args[0].dat->dim;
  int xdim1 = args[1].dat->block_size[0]*args[1].dat->dim;
  int xdim2 = args[2].dat->block_size[0]*args[2].dat->dim;
  int xdim3 = args[3].dat->block_size[0]*args[3].dat->dim;
  int xdim4 = args[4].dat->block_size[0]*args[4].dat->dim;
  int xdim5 = args[5].dat->block_size[0]*args[5].dat->dim;
  int xdim6 = args[6].dat->block_size[0]*args[6].dat->dim;
  int xdim7 = args[7].dat->block_size[0]*args[7].dat->dim;
  int xdim8 = args[8].dat->block_size[0]*args[8].dat->dim;
  int xdim9 = args[9].dat->block_size[0]*args[9].dat->dim;
  int xdim10 = args[10].dat->block_size[0]*args[10].dat->dim;
  int xdim11 = args[11].dat->block_size[0]*args[11].dat->dim;
  int xdim12 = args[12].dat->block_size[0]*args[12].dat->dim;
  int xdim13 = args[13].dat->block_size[0]*args[13].dat->dim;

  //build opencl kernel if not already built

  buildOpenCLKernels_PdV_kernel_nopredict(
  xdim0,
  xdim1,
  xdim2,
  xdim3,
  xdim4,
  xdim5,
  xdim6,
  xdim7,
  xdim8,
  xdim9,
  xdim10,
  xdim11,
  xdim12,
  xdim13);

  //Timing
  double t1,t2,c1,c2;
  ops_timing_realloc(6,"PdV_kernel_nopredict");
  ops_timers_core(&c2,&t2);

  //set up OpenCL thread blocks
  size_t globalWorkSize[3] = {((x_size-1)/OPS_block_size_x+ 1)*OPS_block_size_x, ((y_size-1)/OPS_block_size_y + 1)*OPS_block_size_y, 1};
  size_t localWorkSize[3] =  {OPS_block_size_x,OPS_block_size_y,1};




  int dat0 = args[0].dat->size;
  int dat1 = args[1].dat->size;
  int dat2 = args[2].dat->size;
  int dat3 = args[3].dat->size;
  int dat4 = args[4].dat->size;
  int dat5 = args[5].dat->size;
  int dat6 = args[6].dat->size;
  int dat7 = args[7].dat->size;
  int dat8 = args[8].dat->size;
  int dat9 = args[9].dat->size;
  int dat10 = args[10].dat->size;
  int dat11 = args[11].dat->size;
  int dat12 = args[12].dat->size;
  int dat13 = args[13].dat->size;

  //set up initial pointers
  int base0 = 1 * 
  (start_add[0] * args[0].stencil->stride[0] - args[0].dat->offset[0]);
  base0 = base0 + args[0].dat->block_size[0] * 
  (start_add[1] * args[0].stencil->stride[1] - args[0].dat->offset[1]);

  //set up initial pointers
  int base1 = 1 * 
  (start_add[0] * args[1].stencil->stride[0] - args[1].dat->offset[0]);
  base1 = base1 + args[1].dat->block_size[0] * 
  (start_add[1] * args[1].stencil->stride[1] - args[1].dat->offset[1]);

  //set up initial pointers
  int base2 = 1 * 
  (start_add[0] * args[2].stencil->stride[0] - args[2].dat->offset[0]);
  base2 = base2 + args[2].dat->block_size[0] * 
  (start_add[1] * args[2].stencil->stride[1] - args[2].dat->offset[1]);

  //set up initial pointers
  int base3 = 1 * 
  (start_add[0] * args[3].stencil->stride[0] - args[3].dat->offset[0]);
  base3 = base3 + args[3].dat->block_size[0] * 
  (start_add[1] * args[3].stencil->stride[1] - args[3].dat->offset[1]);

  //set up initial pointers
  int base4 = 1 * 
  (start_add[0] * args[4].stencil->stride[0] - args[4].dat->offset[0]);
  base4 = base4 + args[4].dat->block_size[0] * 
  (start_add[1] * args[4].stencil->stride[1] - args[4].dat->offset[1]);

  //set up initial pointers
  int base5 = 1 * 
  (start_add[0] * args[5].stencil->stride[0] - args[5].dat->offset[0]);
  base5 = base5 + args[5].dat->block_size[0] * 
  (start_add[1] * args[5].stencil->stride[1] - args[5].dat->offset[1]);

  //set up initial pointers
  int base6 = 1 * 
  (start_add[0] * args[6].stencil->stride[0] - args[6].dat->offset[0]);
  base6 = base6 + args[6].dat->block_size[0] * 
  (start_add[1] * args[6].stencil->stride[1] - args[6].dat->offset[1]);

  //set up initial pointers
  int base7 = 1 * 
  (start_add[0] * args[7].stencil->stride[0] - args[7].dat->offset[0]);
  base7 = base7 + args[7].dat->block_size[0] * 
  (start_add[1] * args[7].stencil->stride[1] - args[7].dat->offset[1]);

  //set up initial pointers
  int base8 = 1 * 
  (start_add[0] * args[8].stencil->stride[0] - args[8].dat->offset[0]);
  base8 = base8 + args[8].dat->block_size[0] * 
  (start_add[1] * args[8].stencil->stride[1] - args[8].dat->offset[1]);

  //set up initial pointers
  int base9 = 1 * 
  (start_add[0] * args[9].stencil->stride[0] - args[9].dat->offset[0]);
  base9 = base9 + args[9].dat->block_size[0] * 
  (start_add[1] * args[9].stencil->stride[1] - args[9].dat->offset[1]);

  //set up initial pointers
  int base10 = 1 * 
  (start_add[0] * args[10].stencil->stride[0] - args[10].dat->offset[0]);
  base10 = base10 + args[10].dat->block_size[0] * 
  (start_add[1] * args[10].stencil->stride[1] - args[10].dat->offset[1]);

  //set up initial pointers
  int base11 = 1 * 
  (start_add[0] * args[11].stencil->stride[0] - args[11].dat->offset[0]);
  base11 = base11 + args[11].dat->block_size[0] * 
  (start_add[1] * args[11].stencil->stride[1] - args[11].dat->offset[1]);

  //set up initial pointers
  int base12 = 1 * 
  (start_add[0] * args[12].stencil->stride[0] - args[12].dat->offset[0]);
  base12 = base12 + args[12].dat->block_size[0] * 
  (start_add[1] * args[12].stencil->stride[1] - args[12].dat->offset[1]);

  //set up initial pointers
  int base13 = 1 * 
  (start_add[0] * args[13].stencil->stride[0] - args[13].dat->offset[0]);
  base13 = base13 + args[13].dat->block_size[0] * 
  (start_add[1] * args[13].stencil->stride[1] - args[13].dat->offset[1]);


  ops_H_D_exchanges_cuda(args, 14);

  ops_timers_core(&c1,&t1);
  OPS_kernels[6].mpi_time += t1-t2;


  clSafeCall( clSetKernelArg(OPS_opencl_core.kernel[6], 0, sizeof(cl_mem), (void*) &arg0.data_d ));
  clSafeCall( clSetKernelArg(OPS_opencl_core.kernel[6], 1, sizeof(cl_mem), (void*) &arg1.data_d ));
  clSafeCall( clSetKernelArg(OPS_opencl_core.kernel[6], 2, sizeof(cl_mem), (void*) &arg2.data_d ));
  clSafeCall( clSetKernelArg(OPS_opencl_core.kernel[6], 3, sizeof(cl_mem), (void*) &arg3.data_d ));
  clSafeCall( clSetKernelArg(OPS_opencl_core.kernel[6], 4, sizeof(cl_mem), (void*) &arg4.data_d ));
  clSafeCall( clSetKernelArg(OPS_opencl_core.kernel[6], 5, sizeof(cl_mem), (void*) &arg5.data_d ));
  clSafeCall( clSetKernelArg(OPS_opencl_core.kernel[6], 6, sizeof(cl_mem), (void*) &arg6.data_d ));
  clSafeCall( clSetKernelArg(OPS_opencl_core.kernel[6], 7, sizeof(cl_mem), (void*) &arg7.data_d ));
  clSafeCall( clSetKernelArg(OPS_opencl_core.kernel[6], 8, sizeof(cl_mem), (void*) &arg8.data_d ));
  clSafeCall( clSetKernelArg(OPS_opencl_core.kernel[6], 9, sizeof(cl_mem), (void*) &arg9.data_d ));
  clSafeCall( clSetKernelArg(OPS_opencl_core.kernel[6], 10, sizeof(cl_mem), (void*) &arg10.data_d ));
  clSafeCall( clSetKernelArg(OPS_opencl_core.kernel[6], 11, sizeof(cl_mem), (void*) &arg11.data_d ));
  clSafeCall( clSetKernelArg(OPS_opencl_core.kernel[6], 12, sizeof(cl_mem), (void*) &arg12.data_d ));
  clSafeCall( clSetKernelArg(OPS_opencl_core.kernel[6], 13, sizeof(cl_mem), (void*) &arg13.data_d ));
  clSafeCall( clSetKernelArg(OPS_opencl_core.kernel[6], 14, sizeof(cl_double), (void*) &dt ));
  clSafeCall( clSetKernelArg(OPS_opencl_core.kernel[6], 15, sizeof(cl_int), (void*) &base0 ));
  clSafeCall( clSetKernelArg(OPS_opencl_core.kernel[6], 16, sizeof(cl_int), (void*) &base1 ));
  clSafeCall( clSetKernelArg(OPS_opencl_core.kernel[6], 17, sizeof(cl_int), (void*) &base2 ));
  clSafeCall( clSetKernelArg(OPS_opencl_core.kernel[6], 18, sizeof(cl_int), (void*) &base3 ));
  clSafeCall( clSetKernelArg(OPS_opencl_core.kernel[6], 19, sizeof(cl_int), (void*) &base4 ));
  clSafeCall( clSetKernelArg(OPS_opencl_core.kernel[6], 20, sizeof(cl_int), (void*) &base5 ));
  clSafeCall( clSetKernelArg(OPS_opencl_core.kernel[6], 21, sizeof(cl_int), (void*) &base6 ));
  clSafeCall( clSetKernelArg(OPS_opencl_core.kernel[6], 22, sizeof(cl_int), (void*) &base7 ));
  clSafeCall( clSetKernelArg(OPS_opencl_core.kernel[6], 23, sizeof(cl_int), (void*) &base8 ));
  clSafeCall( clSetKernelArg(OPS_opencl_core.kernel[6], 24, sizeof(cl_int), (void*) &base9 ));
  clSafeCall( clSetKernelArg(OPS_opencl_core.kernel[6], 25, sizeof(cl_int), (void*) &base10 ));
  clSafeCall( clSetKernelArg(OPS_opencl_core.kernel[6], 26, sizeof(cl_int), (void*) &base11 ));
  clSafeCall( clSetKernelArg(OPS_opencl_core.kernel[6], 27, sizeof(cl_int), (void*) &base12 ));
  clSafeCall( clSetKernelArg(OPS_opencl_core.kernel[6], 28, sizeof(cl_int), (void*) &base13 ));
  clSafeCall( clSetKernelArg(OPS_opencl_core.kernel[6], 29, sizeof(cl_int), (void*) &x_size ));
  clSafeCall( clSetKernelArg(OPS_opencl_core.kernel[6], 30, sizeof(cl_int), (void*) &y_size ));

  //call/enque opencl kernel wrapper function
  clSafeCall( clEnqueueNDRangeKernel(OPS_opencl_core.command_queue, OPS_opencl_core.kernel[6], 3, NULL, globalWorkSize, localWorkSize, 0, NULL, NULL) );
  if (OPS_diags>1) {
    clSafeCall( clFinish(OPS_opencl_core.command_queue) );
  }

  ops_set_dirtybit_opencl(args, 14);

  //Update kernel record
  ops_timers_core(&c2,&t2);
  OPS_kernels[6].count++;
  OPS_kernels[6].time += t2-t1;
  OPS_kernels[6].transfer += ops_compute_transfer(dim, range, &arg0);
  OPS_kernels[6].transfer += ops_compute_transfer(dim, range, &arg1);
  OPS_kernels[6].transfer += ops_compute_transfer(dim, range, &arg2);
  OPS_kernels[6].transfer += ops_compute_transfer(dim, range, &arg3);
  OPS_kernels[6].transfer += ops_compute_transfer(dim, range, &arg4);
  OPS_kernels[6].transfer += ops_compute_transfer(dim, range, &arg5);
  OPS_kernels[6].transfer += ops_compute_transfer(dim, range, &arg6);
  OPS_kernels[6].transfer += ops_compute_transfer(dim, range, &arg7);
  OPS_kernels[6].transfer += ops_compute_transfer(dim, range, &arg8);
  OPS_kernels[6].transfer += ops_compute_transfer(dim, range, &arg9);
  OPS_kernels[6].transfer += ops_compute_transfer(dim, range, &arg10);
  OPS_kernels[6].transfer += ops_compute_transfer(dim, range, &arg11);
  OPS_kernels[6].transfer += ops_compute_transfer(dim, range, &arg12);
  OPS_kernels[6].transfer += ops_compute_transfer(dim, range, &arg13);
}
