// diffusion3d.c
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define Z 6
#define R 12
#define C 12
#define STEPS 80

static double grid[Z][R][C];
static double tmp[Z][R][C];

void init_grid(void) {
    memset(grid, 0, sizeof(grid));
    // seed a few voxels
    grid[Z/2][R/2][C/2] = 200.0;
    grid[Z/2+1][R/2][C/2] = 80.0;
}

void step_once(void) {
    for (int z = 0; z < Z; ++z) {
        for (int i = 0; i < R; ++i) {
            for (int j = 0; j < C; ++j) {
                double sum = grid[z][i][j];
                int count = 1;
                if (i>0) { sum += grid[z][i-1][j]; count++; }
                if (i<R-1) { sum += grid[z][i+1][j]; count++; }
                if (j>0) { sum += grid[z][i][j-1]; count++; }
                if (j<C-1) { sum += grid[z][i][j+1]; count++; }
                if (z>0) { sum += grid[z-1][i][j]; count++; }
                if (z<Z-1) { sum += grid[z+1][i][j]; count++; }
                tmp[z][i][j] = sum / count;
            }
        }
    }
    memcpy(grid, tmp, sizeof(grid));
}

int main(void) {
    init_grid();
    for (int s = 0; s < STEPS; ++s) {
        step_once();
        // Breakpoint here to view grid[z] slices
        printf("step %d center_slice0=%.2f\n", s, grid[0][R/2][C/2]);
    }
    return 0;
}
