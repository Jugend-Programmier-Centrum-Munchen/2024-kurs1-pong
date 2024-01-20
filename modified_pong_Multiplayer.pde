// Koordinaten der Spieler
int aY = 20; // A = Spieler 1
int bY = 20; // B = Spieler 2

// Spielwerte
int GeschwindigkeitSpieler = 10;
int ballX = 370;
int ballY = 290;
int impulsX = 5;
int impulsY = 3; // Changed the initial Y velocity

void setup() {
  size(750, 600);
  background(240);
}

void draw() {
  background(240);
  fill(10, 10, 10); // Farbe vom Viereck
  rect(20, aY, 10, 100); // Linker Spieler
  rect(720, bY, 10, 100); // Rechter Spieler

  circle(ballX, ballY, 15);
  ballX += impulsX;
  ballY += impulsY;

  // Check collision with players
  if (ballX < 30 && ballY > aY && ballY < aY + 100) {
    impulsX = abs(impulsX); // Change X direction
  }
  if (ballX > 710 && ballY > bY && ballY < bY + 100) {
    impulsX = -abs(impulsX); // Change X direction
  }

  // Check collision with screen boundaries
  if (ballY < 0 || ballY > height) {
    impulsY = -impulsY; // Change Y direction
  }

  // Check if ball scored
  if (ballX < 0 || ballX > width) {
    // Reset ball position
    ballX = width / 2;
    ballY = height / 2;
    // Reset ball velocity
    impulsX = 5;
    impulsY = 3;
  }

  // Continuous player movement for the first player (keyboard control)
  if (keyPressed) {
    if (key == 'w' && aY > 10) aY -= GeschwindigkeitSpieler;
    if (key == 's' && aY < 490) aY += GeschwindigkeitSpieler;
  }

  // Set the second player's position based on the mouse Y position
  bY = mouseY - 50; // Adjust the offset based on the paddle's height
  bY = constrain(bY, 10, height - 110); // Ensure the paddle stays within the screen boundaries
}
