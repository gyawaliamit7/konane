//Object of Class Board
Board board = new Board();

//for making turns of black and white buttons
boolean blackTurn = true;
boolean whiteTurn = false;

//to display text of whose turn it is 
String whoseTurn = " ";

//list of all the possible moves
ArrayList<Points> possibleMove = new ArrayList<Points>();

void setup() {
  size(500,500);
  background(0);
  board.createStone();
  board.makeBoxes();
}

void draw() {
  board.fillStones();
  
  //removing the first two stones
  Points temp1 = board.point.get(35);
  temp1.setC(2);
  Points temp2 = board.point.get(36);
  temp2.setC(2);
  
  //displaying move button 
  moveButton();
  
  //displaying whose turn message
  displayMessage(whoseTurn);
  
  //marking different color for the possible Point
  board.fillPossibleMoves();
  
}


//listening to the mouse Click
void mouseClicked() {
   board.unmarkMoves();
  if (blackTurn) {
    Points temp = board.findStone(mouseX, mouseY);
    //black has been selected
    if (temp == null)
      print("cannot be null");
    else if (temp.c == 1) {
      //finding possibleMoves 
      board.markMoves(temp);
    }
    //black is not selected 
    else 
      whoseTurn = "Black Turn";
   // blackTurn = false;
   // whiteTurn = true;
  }
}


void displayMessage (String x ) {
  textAlign(CENTER, CENTER);
  fill(255);
  stroke(200);
  text(x, 440, 87);
  
}

//checking if mouse is Over 
boolean mouseOver() {
  if (mouseX > 420 && mouseX < (480) && mouseY > 30 && mouseY < (45)) {
    return true;
  }
  return false;
}

//making move button
void moveButton() {
  if (mouseOver()) {
    fill(123,33,123);
    stroke(250);
    rect(420,30,60,15);
    textAlign(CENTER, CENTER);
    fill(255);
    text("Move", 445, 37);
  }
  else 
  {
    fill(255);
    stroke(250);
    rect(420,30,60,15);
    textAlign(CENTER, CENTER);
    fill(0);
    text("Move", 445, 37);
  }
  
}
