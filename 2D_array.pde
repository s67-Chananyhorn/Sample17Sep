void setup() {    
    size(650, 650);
    strokeWeight(12);
    background(255);

    
    // 2D array of sample values
    int[][] grid = {{6, 2, 1, 5}, {3, 4, 5, 1}, {2, 6, 3, 4}};

    int rows = grid.length;
    int cols = grid[0].length;

    int w = width/cols;
    int h = height/rows;


    int i = 0;
    while (i < rows) {

      
        int j = 0;
        while (j < cols) {

            println(i, j, " ", grid[i][j]);

            draw_lines(10+j * w, 10+i * h, grid[i][j]);
            println(i,j,grid[i][j]);
            j++;
        }

        i++;
    }
}

void draw_lines(int x, int y, int n){
    int i = 0;
    while (i < n) {

        line(x + i*20 , y, x + i*20, y + 40);
        i++;

    }
}
