/*
 * File: calculate_A.c
 *
 * MATLAB Coder version            : 2.6
 * C/C++ source code generated on  : 16-Jan-2015 12:36:53
 */

/* Include files */
#include "rt_nonfinite.h"
#include "calculate_A.h"
#include "calculate_A_emxutil.h"

/* Function Definitions */

/*
 * The A matrix is calculated here
 *    The A matrix will be used to calculate
 * Arguments    : const double Receiver_locs[6144]
 *                const double S_Dimensions[3]
 *                double S_Resolution
 *                const double S_Start[3]
 *                double c
 *                double frequency
 *                emxArray_creal_T *A_Matrix
 * Return Type  : void
 */
void calculate_A(const double Receiver_locs[6144], const double S_Dimensions[3],
                 double S_Resolution, const double S_Start[3], double c, double
                 frequency, emxArray_creal_T *A_Matrix)
{
  int M;
  int loop_ub;
  int y;
  int z;
  double r;
  double ai;
  double r_re;
  (void)Receiver_locs;
  (void)S_Resolution;
  (void)S_Start;

  /* First A is initialized. A has a length of #receivers and a width of */
  /* #source voxels */
  M = A_Matrix->size[0] * A_Matrix->size[1];
  A_Matrix->size[0] = 3;
  emxEnsureCapacity((emxArray__common *)A_Matrix, M, (int)sizeof(creal_T));
  M = A_Matrix->size[0] * A_Matrix->size[1];
  A_Matrix->size[1] = (int)(S_Dimensions[0] * S_Dimensions[1] * S_Dimensions[2]);
  emxEnsureCapacity((emxArray__common *)A_Matrix, M, (int)sizeof(creal_T));
  loop_ub = 3 * (int)(S_Dimensions[0] * S_Dimensions[1] * S_Dimensions[2]);
  for (M = 0; M < loop_ub; M++) {
    A_Matrix->data[M].re = 0.0;
    A_Matrix->data[M].im = 0.0;
  }

  /* Then for every receiver an array of elements is calculated. */
  /* note that A_matrix is 2D and source 3D. To improve */
  /* performance, the voxels in source are mapped to a 1D space. */
  for (M = 0; M < 3; M++) {
    for (loop_ub = 0; loop_ub < (int)S_Dimensions[0]; loop_ub++) {
      for (y = 0; y < (int)S_Dimensions[1]; y++) {
        for (z = 0; z < (int)S_Dimensions[2]; z++) {
          /* for every receiver, for every voxel calculate A */
          /* first calculate the distance between voxel and receiver */
          /* dist = pdist([Receiver_locs(M,:);(S_Start+[x,y,z])])*S_Resolution; */
          /* then map the voxel to the correct 1D counterpart */
          /* current = T3Dto1D(x,y,z,S_Dimensions(1),S_Dimensions(2)); */
          /* then calculate the entire formula */
          /* disp(-2*1i*pi*frequency*dist/c); */
          r = frequency * -0.0 * 10.0;
          ai = frequency * -6.2831853071795862 * 10.0;
          if (ai == 0.0) {
            r /= c;
            ai = 0.0;
          } else if (r == 0.0) {
            r = 0.0;
            ai /= c;
          } else {
            r /= c;
            ai /= c;
          }

          r = exp(r / 2.0);
          r_re = r * (r * cos(ai));
          r *= r * sin(ai);
          if (r == 0.0) {
            A_Matrix->data[M + A_Matrix->size[0] * 10].re = r_re /
              125.66370614359172;
            A_Matrix->data[M + A_Matrix->size[0] * 10].im = 0.0;
          } else if (r_re == 0.0) {
            A_Matrix->data[M + A_Matrix->size[0] * 10].re = 0.0;
            A_Matrix->data[M + A_Matrix->size[0] * 10].im = r /
              125.66370614359172;
          } else {
            A_Matrix->data[M + A_Matrix->size[0] * 10].re = r_re /
              125.66370614359172;
            A_Matrix->data[M + A_Matrix->size[0] * 10].im = r /
              125.66370614359172;
          }
        }
      }
    }
  }
}

/*
 * File trailer for calculate_A.c
 *
 * [EOF]
 */
