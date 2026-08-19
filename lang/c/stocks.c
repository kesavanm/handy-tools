// stocks.c
// Compile: gcc -O0 -g stocks.c -o stocks
// Run: ./stocks data.csv

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define MAX_ROWS 64
#define MAX_NAME 64
#define LINE_BUF 256
#define BAR_WIDTH 40

typedef struct {
    char name[MAX_NAME];
    double qty;
    double buy;
    double sell;
    double value;      // qty * sell
    double cost;       // qty * buy
    double pnl;        // value - cost
    double pnl_pct;    // (pnl / cost) * 100
} Row;


typedef struct {
//     char name[MAX_NAME];
    double buy;
    double sell;
} Stock;


static Stock stock;
static Row rows[MAX_ROWS];
static int nrows = 0;

static void compute_all(void) {
    for (int i = 0; i < nrows; ++i) {
        rows[i].value = rows[i].qty * rows[i].sell;
        rows[i].cost  = rows[i].qty * rows[i].buy;
        rows[i].pnl   = rows[i].value - rows[i].cost;
        rows[i].pnl_pct = (rows[i].cost != 0.0) ? (rows[i].pnl / rows[i].cost * 100.0) : 0.0;

        stock.buy=rows[i].buy;
        stock.sell=rows[i].sell;

    }
}

static void draw_frame(void) {
    printf("Idx  Stock        Qty    Buy      Sell     Value      P/L       P/L%%   Visual\n");
    printf("---- ------------ ------ -------- --------- ---------- --------- ------ ---------------------------\n");
    for (int i = 0; i < nrows; ++i) {
        Row *r = &rows[i];
        // prepare bar: center at zero; left=loss (negative), right=gain (positive)
        int mid = BAR_WIDTH / 2;
        int barpos = (int)((r->pnl_pct / 100.0) * (BAR_WIDTH/2)); // scale: 100% => full half-bar
        int left = mid, right = mid;
        char bar[BAR_WIDTH+1];
        for (int b=0;b<BAR_WIDTH;b++) bar[b] = ' ';
        bar[BAR_WIDTH] = '\0';

        if (barpos > 0) {
            right = mid + (barpos > (BAR_WIDTH-mid-1) ? (BAR_WIDTH-mid-1) : barpos);
            for (int b = mid; b <= right; ++b) bar[b] = '+';
        } else if (barpos < 0) {
            left = mid + (barpos < -(mid) ? -mid : barpos);
            for (int b = left; b < mid; ++b) bar[b] = '-';
        } else {
            bar[mid] = '|';
        }

        // mark center
        bar[mid] = '|';

        printf("%3d  %-12s %6.2f %8.2f %8.2f %10.2f %9.2f %6.2f%% %s\n",
               i, r->name, r->qty, r->buy, r->sell, r->value, r->pnl, r->pnl_pct, bar);
    }
    printf("\n");
    fflush(stdout);
}

static int parse_csv_line(char *line, Row *out) {
    // Expect: stock,qty,rate_buy,rate_sell
    // Trim newline
    char *p = line;
    char *fields[4] = {0};
    int fi = 0;
    while (*p && fi < 4) {
        // skip leading spaces
        while (*p == ' ' || *p == '\t') p++;
        fields[fi++] = p;
        // find comma
        char *c = strchr(p, ',');
        if (!c) break;
        *c = '\0';
        p = c + 1;
    }
    if (fi < 4) return -1;
    // copy
    strncpy(out->name, fields[0], MAX_NAME-1);
    out->name[MAX_NAME-1] = '\0';
    out->qty  = atof(fields[1]);
    out->buy  = atof(fields[2]);
    out->sell = atof(fields[3]);
    return 0;
}

int main(int argc, char **argv) {
    if (argc < 2) {
        fprintf(stderr, "Usage: %s data.csv\n", argv[0]);
        return 1;
    }
    FILE *f = fopen(argv[1], "r");
    if (!f) { perror("fopen"); return 1; }

    char line[LINE_BUF];
    // read header
    if (!fgets(line, sizeof(line), f)) { fclose(f); return 1; }

    while (fgets(line, sizeof(line), f) && nrows < MAX_ROWS) {
        // trim newline
        char *nl = strchr(line, '\n');
        if (nl) *nl = '\0';
        if (line[0] == '\0') continue;
        if (parse_csv_line(line, &rows[nrows]) == 0) {
            nrows++;
        }
    }
    fclose(f);

    compute_all();

    // draw first frame; set a breakpoint here in DDD to inspect 'rows' array and step
    draw_frame();

    // Example interactive loop: update sell prices from stdin to see dynamic changes.
    // In DDD, step through updates and call compute_all(); draw_frame(); to visualize.
    printf("Enter updates as: idx,new_sell (or 'q' to quit). Example: 0,123.45\n");
    while (1) {
        printf("> "); fflush(stdout);
        if (!fgets(line, sizeof(line), stdin)) break;
        if (line[0] == 'q') break;
        char *comma = strchr(line, ',');
        if (!comma) continue;
        *comma = '\0';
        int idx = atoi(line);
        double new_sell = atof(comma+1);
        if (idx < 0 || idx >= nrows) {
            printf("invalid idx\n"); continue;
        }
        rows[idx].sell = new_sell;
        compute_all();
        draw_frame();
        // place breakpoint on draw_frame() call above to inspect changes in DDD
    }

    return 0;
}
