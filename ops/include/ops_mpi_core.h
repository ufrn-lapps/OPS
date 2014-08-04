#ifndef __OPS_MPI_CORE_H
#define __OPS_MPI_CORE_H
/*
* Open source copyright declaration based on BSD open source template:
* http://www.opensource.org/licenses/bsd-license.php
*
* This file is part of the OPS distribution.
*
* Copyright (c) 2013, Mike Giles and others. Please see the AUTHORS file in
* the main source directory for a full list of copyright holders.
* All rights reserved.
*
* Redistribution and use in source and binary forms, with or without
* modification, are permitted provided that the following conditions are met:
* * Redistributions of source code must retain the above copyright
* notice, this list of conditions and the following disclaimer.
* * Redistributions in binary form must reproduce the above copyright
* notice, this list of conditions and the following disclaimer in the
* documentation and/or other materials provided with the distribution.
* * The name of Mike Giles may not be used to endorse or promote products
* derived from this software without specific prior written permission.
*
* THIS SOFTWARE IS PROVIDED BY Mike Giles ''AS IS'' AND ANY
* EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
* WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
* DISCLAIMED. IN NO EVENT SHALL Mike Giles BE LIABLE FOR ANY
* DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
* (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
* LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
* ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
* (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
* SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
*/

/** @brief core header file for the ops MPI backend
  * @author Gihan Mudalige, Istvan Reguly
  * @details Headder file for OPS MPI backend
  */

#include <mpi.h>
#include <ops_lib_core.h>

/** Define the root MPI process **/
#ifdef MPI_ROOT
#undef MPI_ROOT
#endif
#define MPI_ROOT 0


#ifdef __cplusplus
extern "C" {
#endif


//
//Struct for holding the decomposition details of a dat on an MPI process
//

typedef struct {
  // the decomposition is for this dat
  ops_dat dat;
  // product array -- used for MPI send/Receives
  int* prod;
  //MPI Types for send/receive -- these should be defined for the dat, not the block
  MPI_Datatype* mpidat;
  //max halo depths at the begining of each dimension -- these should be defined for the dat, not the block
  int* d_m;
  //max halo depths at the end of each dimension -- these should be defined for the dat, not the block
  int* d_p;
  //data structures describing halo access
  ops_halo* halos;
} sub_dat;

typedef sub_dat * sub_dat_list;

//
//MPI Communicator for halo creation and exchange
//

extern MPI_Comm OPS_MPI_WORLD;
extern MPI_Comm OPS_CART_COMM;
extern int ops_comm_size;
extern int ops_my_rank;

//
// list holding sub-block geometries
//
extern sub_block_list *OPS_sub_block_list;
extern sub_dat_list *OPS_sub_dat_list;

void ops_mpi_exit();

/*******************************************************************************
* External functions defined in ops_mpi_(cuda)_rt_support.c
*******************************************************************************/
void ops_pack(ops_dat dat, const int src_offset, char *__restrict dest, const ops_halo *__restrict halo);
void ops_unpack(ops_dat dat, const int dest_offset, const char *__restrict src, const ops_halo *__restrict halo);
void ops_comm_realloc(char **ptr, int size, int prev_size);

#ifdef __cplusplus
}
#endif
#endif /*__OPS_MPI_CORE_H*/