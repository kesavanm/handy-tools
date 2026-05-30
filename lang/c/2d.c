// diffusion2d.c
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define R 20
#define C 30
#define STEPS 100

static double grid[R][C];
static double tmp[R][C];

void init_grid(void) {
    memset(grid, 0, sizeof(grid));
    // place a hot spot
    grid[R/2][C/2] = 100.0;
    grid[R/3][C/3] = 60.0;
}

void apply_diffusion(void) {
    for (int i = 0; i < R; ++i) {
        for (int j = 0; j < C; ++j) {
            double sum = grid[i][j];
            int count = 1;
            if (i>0) { sum += grid[i-1][j]; count++; }
            if (i<R-1) { sum += grid[i+1][j]; count++; }
            if (j>0) { sum += grid[i][j-1]; count++; }
            if (j<C-1) { sum += grid[i][j+1]; count++; }
            tmp[i][j] = sum / count;
        }
    }
    memcpy(grid, tmp, sizeof(grid));
}

int main(void) {
    init_grid();
    for (int step = 0; step < STEPS; ++step) {
        apply_diffusion();
        // Good breakpoint location: after apply_diffusion to inspect grid
        if (step % 1 == 0) {
            printf("step=%d center=%.3f\n", step, grid[R/2][C/2]);
        }
    }
    return 0;
}
