/* Name: Jian Fang
 * Andrew ID: jianf@andrew.cmu.edu
 * trans.c - Matrix transpose B = A^T
 *
 * Each transpose function must have a prototype of the form:
 * void trans(int M, int N, int A[N][M], int B[M][N]);
 *
 * A transpose function is evaluated by counting the number of misses
 * on a 1KB direct mapped cache with a block size of 32 bytes.
 */ 
#include <stdio.h>
#include "cachelab.h"
#include "contracts.h"

int is_transpose(int M, int N, int A[N][M], int B[M][N]);

/* 
 * transpose_submit - This is the solution transpose function that you
 *     will be graded on for Part B of the assignment. Do not change
 *     the description string "Transpose submission", as the driver
 *     searches for that string to identify the transpose function to
 *     be graded. The REQUIRES and ENSURES from 15-122 are included
 *     for your convenience. They can be removed if you like.
 */
char transpose_submit_desc[] = "Transpose submission";
void transpose_submit(int M, int N, int A[N][M], int B[M][N])
{
    REQUIRES(M > 0);
    REQUIRES(N > 0);
    int blockRow,blockCol,k,p0,p1,p2,p3,p4,p5,p6,p7;
    int d = 0;
    int* t;
 
    if(M == 32 && N == 32){
        for(blockRow = 0; blockRow < N; blockRow += 8){
            for(blockCol = 0; blockCol < M; blockCol += 8){
                for(p0 = blockRow; p0 < blockRow + 8; p0++){
                    t = A[p0];
                    if(blockRow == blockCol) d = t[p0];
                    for(p1 = blockCol; p1 < blockCol + 8; p1++){
                        if(p0 != p1) B[p1][p0] = A[p0][p1];
                    }
                    if(blockRow == blockCol)B[p0][p0] = d;
                }
            }
        }
    }

    if(M == 64 && N == 64){
        for(blockRow = 0; blockRow < N; blockRow += 8){
            for(blockCol = 0; blockCol < M; blockCol += 8){
                for(k = 0; k < 8; k++){
                    t = &A[blockCol + k][blockRow];
                    p0 = t[0];
                    p1 = t[1];
                    p2 = t[2];
                    p3 = t[3];
                    if(!k){
                        p4 = t[4];
                        p5 = t[5];
                        p6 = t[6];
                        p7 = t[7];
                    }
                    t = &B[blockRow][blockCol + k];
                    t[0] = p0;
                    t[64] = p1;
                    t[128] = p2;
                    t[192] = p3;
                }
                for(k = 7; k > 0; k--){
                    t = &A[blockCol+k][blockRow+4];
                    p0 = t[0];
                    p1 = t[1];
                    p2 = t[2];
                    p3 = t[3];
                    t = &B[blockRow+4][blockCol+k];
                    t[0] = p0;
                    t[64] = p1;
                    t[128] = p2;
                    t[192] = p3;
                }

                t = &B[blockRow + 4][blockCol];
                t[0] = p4;
                t[64] = p5;
                t[128] = p6;
                t[192] = p7;
            }
        }
    }

    if(M == 61 && N == 67){
        for(blockRow = 0; blockRow < N; blockRow += 8){
            for(blockCol = 0; blockCol < M; blockCol += 8){
                for(p0 = blockCol; p0 < blockCol + 8 && p0 < M; p0++){
                    for(p1 = blockRow; p1 < blockRow + 8 && p1 < N; p1++){
                        B[p0][p1] = A[p1][p0];
                    }
                }
            }
        }
    }

    ENSURES(is_transpose(M, N, A, B));
}

/* 
 * You can define additional transpose functions below. We've defined
 * a simple one below to help you get started. 
 */ 

/* 
 * trans - A simple baseline transpose function, not optimized for the cache.
 */
char trans_desc[] = "Simple row-wise scan transpose";
void trans(int M, int N, int A[N][M], int B[M][N])
{
    int i, j, tmp;

    REQUIRES(M > 0);
    REQUIRES(N > 0);

    for (i = 0; i < N; i++) {
        for (j = 0; j < M; j++) {
            tmp = A[i][j];
            B[j][i] = tmp;
        }
    }    

    ENSURES(is_transpose(M, N, A, B));
}

/*
 * registerFunctions - This function registers your transpose
 *     functions with the driver.  At runtime, the driver will
 *     evaluate each of the registered functions and summarize their
 *     performance. This is a handy way to experiment with different
 *     transpose strategies.
 */
void registerFunctions()
{
    /* Register your solution function */
    registerTransFunction(transpose_submit, transpose_submit_desc); 

    /* Register any additional transpose functions */
    registerTransFunction(trans, trans_desc); 

}

/* 
 * is_transpose - This helper function checks if B is the transpose of
 *     A. You can check the correctness of your transpose by calling
 *     it before returning from the transpose function.
 */
int is_transpose(int M, int N, int A[N][M], int B[M][N])
{
    int i, j;

    for (i = 0; i < N; i++) {
        for (j = 0; j < M; ++j) {
            if (A[i][j] != B[j][i]) {
                return 0;
            }
        }
    }
    return 1;
}

