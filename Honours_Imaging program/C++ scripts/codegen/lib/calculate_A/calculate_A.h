/*
 * File: calculate_A.h
 *
 * MATLAB Coder version            : 2.6
 * C/C++ source code generated on  : 16-Jan-2015 12:36:53
 */

#ifndef __CALCULATE_A_H__
#define __CALCULATE_A_H__

/* Include files */
#include <math.h>
#include <stddef.h>
#include <stdlib.h>
#include <string.h>
#include "rtwtypes.h"
#include "calculate_A_types.h"

/* Function Declarations */
extern void calculate_A(const double Receiver_locs[6144], const double
  S_Dimensions[3], double S_Resolution, const double S_Start[3], double c,
  double frequency, emxArray_creal_T *A_Matrix);

#endif

/*
 * File trailer for calculate_A.h
 *
 * [EOF]
 */
