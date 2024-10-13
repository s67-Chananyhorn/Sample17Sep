int[][] grid = {{7, 3, 2, 6}, {4, 5, 6, 2}, {3, 7, 4, 5}};
int rows, cols, w, h;
boolean[][] revealed;
boolean[][] locked; 
int firstRow = -1, firstCol = -1; 
int secondRow = -1, secondCol = -1; 
boolean checking = false; 
int revealDelay = 500;
int revealStartTime = 0; 

void setup() {
    size(650, 650);
    background(255);
    rows = grid.length;
    cols = grid[0].length;
    w = width / cols; 
    h = height / rows;
    revealed = new boolean[rows][cols];
    locked = new boolean[rows][cols]; 
}

void draw() {
   
    background(255);
    for (int i = 0; i < rows; i++) {
        for (int j = 0; j < cols; j++) {
            if (revealed[i][j]) {
                draw_cell(10 + j * w, 10 + i * h, grid[i][j]);
            } else if (locked[i][j]) {
                fill(0, 255, 0);
                rect(10 + j * w, 10 + i * h, w, h); 
            } else {
                fill(255); 
                rect(10 + j * w, 10 + i * h, w, h); 
            }
        }
    }

       if (checking) {
            if (grid[firstRow][firstCol] == grid[secondRow][secondCol]) {
            locked[firstRow][firstCol] = true; 
            locked[secondRow][secondCol] = true; 
        }

           if (millis() - revealStartTime > revealDelay) {
            
            revealed[firstRow][firstCol] = false; 
            revealed[secondRow][secondCol] = false; 
            checking = false; 
      
            firstRow = -1;
            firstCol = -1;
            secondRow = -1;
            secondCol = -1;
        }
    }
}

void draw_cell(int x, int y, int n) {
    fill(255); 
    rect(x, y, w, h); 
    for (int i = 0; i < n; i++) {
        line(x + i * 20, y, x + i * 20, y + 40); 
    }
}

void mousePressed() {
    int col = (mouseX - 10) / w;
    int row = (mouseY - 10) / h;

    if (col >= 0 && col < cols && row >= 0 && row < rows) {
            if (!locked[row][col]) {
            if (firstRow == -1 && firstCol == -1) {
                firstRow = row;
                firstCol = col;
                revealed[row][col] = true;
                println("Clicked first: row " + firstRow + ", col " + firstCol + ", value: " + grid[firstRow][firstCol]);
            } else if (secondRow == -1 && secondCol == -1) {
                secondRow = row;
                secondCol = col;
                revealed[row][col] = true; 
                println("Clicked second: row " + secondRow + ", col " + secondCol + ", value: " + grid[secondRow][secondCol]);
                checking = true; 
                revealStartTime = millis(); 
            }
        }
    }
}
