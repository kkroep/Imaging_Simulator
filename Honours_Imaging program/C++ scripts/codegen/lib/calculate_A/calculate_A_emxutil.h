/*
 * File: calculate_A_emxutil.h
 *
 * MATLAB Coder version            : 2.6
 * C/C++ source code generated on  : 16-Jan-2015 12:36:53
 */

#ifndef __CALCULATE_A_EMXUTIL_H__
#define __CALCULATE_A_EMXUTIL_H__

/* Include files */
#include <math.h>
#include <stddef.h>
#include <stdlib.h>
#include <string.h>
#include "rtwtypes.h"
#include "calculate_A_types.h"

/* Function Declarations */
extern void emxEnsureCapacity(emxArray__common *emxArray, int oldNumel, int
  elementSize);
extern void emxFree_creal_T(emxArray_creal_T **pEmxArray);
extern void emxInit_creal_T(emxArray_creal_T **pEmxArray, int numDimensions);

#endif

/*
 * File trailer for calculate_A_emxutil.h
 *
 * [EOF]
 */
