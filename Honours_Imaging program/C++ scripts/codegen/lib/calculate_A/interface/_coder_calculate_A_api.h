/* 
 * File: _coder_calculate_A_api.h 
 *  
 * MATLAB Coder version            : 2.6 
 * C/C++ source code generated on  : 16-Jan-2015 12:36:53 
 */

#ifndef ___CODER_CALCULATE_A_API_H__
#define ___CODER_CALCULATE_A_API_H__
/* Include files */
#include <stdlib.h>
#include <string.h>
#include <math.h>

#include "tmwtypes.h"
#include "mex.h"
#include "emlrt.h"

/* Type Definitions */
#ifndef struct_emxArray_creal_T
#define struct_emxArray_creal_T
struct emxArray_creal_T
{
    creal_T *data;
    int *size;
    int allocatedSize;
    int numDimensions;
    boolean_T canFreeData;
};
#endif /*struct_emxArray_creal_T*/
#ifndef typedef_emxArray_creal_T
#define typedef_emxArray_creal_T
typedef struct emxArray_creal_T emxArray_creal_T;
#endif /*typedef_emxArray_creal_T*/

/* Function Declarations */
extern void calculate_A_initialize(emlrtContext *aContext);
extern void calculate_A_terminate(void);
extern void calculate_A_atexit(void);
extern void calculate_A_api(const mxArray *prhs[6], const mxArray *plhs[1]);
extern void calculate_A(double Receiver_locs[6144], double S_Dimensions[3], double S_Resolution, double S_Start[3], double c, double frequency, emxArray_creal_T *A_Matrix);
extern void calculate_A_xil_terminate(void);

#endif
/* 
 * File trailer for _coder_calculate_A_api.h 
 *  
 * [EOF] 
 */
