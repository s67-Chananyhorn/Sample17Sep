int[][] grid = {{6, 2, 1, 5}, {3, 4, 5, 1}, {2, 6, 3, 4}};
int rows, cols, w, h;
boolean[][] revealed;

void setup() {    
    size(650, 650);
    strokeWeight(12);
    background(255);

    rows = grid.length;
    cols = grid[0].length;

    w = width / cols;
    h = height / rows;

    revealed = new boolean[rows][cols];
}

void draw() {
    background(255);

    for (int i = 0; i < rows; i++) {
        for (int j = 0; j < cols; j++) {
            if (revealed[i][j]) {
                draw_lines(10 + j * w, 10 + i * h, grid[i][j]);
            }
        }
    }
}

void draw_lines(int x, int y, int n) {
    for (int i = 0; i < n; i++) {
        line(x + i * 20 , y, x + i * 20, y + 40);
    }
}

void mousePressed() {
    int col = (mouseX - 10) / w;
    int row = (mouseY - 10) / h;

    if (col >= 0 && col < cols && row >= 0 && row < rows) {
        revealed[row][col] = true;
        println("Clicked on: row " + row + ", col " + col + ", value: " + grid[row][col]);
    }
}
