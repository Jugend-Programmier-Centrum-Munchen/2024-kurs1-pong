// Koordinaten der Spieler
float aY = 20; // A = Spieler 1
int bY = 20; // B = Spieler 2

// Spielwerte
int GeschwindigkeitSpieler = 5; //neu
int ballX = 370;
int ballY = 290;
int impulsX = 5;
int impulsY = 3; 

// neu
int scoreA = 0;
int scoreB = 0;

void setup() {
  size(750, 600);
  background(240);
}

void draw() {
  background(240);

  // neu
  textSize(32);
  text("Score: " + scoreA + " - " + scoreB, width/2 - 80, 40);

  fill(10, 10, 10); // Farbe vom Viereck
  rect(20, aY, 10, 100); // Linker Spieler
  rect(720, bY, 10, 100); // Rechter Spieler

  circle(ballX, ballY, 15);
  ballX += impulsX;
  ballY += impulsY;

  // neu V2
  if (random(1) < 0.5) {
    float targetAY = ballY - 50; // Adjusted target position
    aY = lerp(aY, targetAY, 0.1);
  }

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

  // neu
  if (ballX < 0) {
    scoreB++;
    ballX = width / 2;
    ballY = height / 2;
    impulsX = 5;
    impulsY = 3;
  } else if (ballX > width) {
    scoreA++;
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

//neu
void resetBall() {
  ballX = width / 2;
  ballY = height / 2;
  impulsX = 5;
  impulsY = 3;
}
