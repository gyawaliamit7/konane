//Object of Class Board
Board board = new Board();

//for making turns of black and white buttons
boolean blackTurn = true;
boolean whiteTurn = false;
boolean markingMode = false;

//to display text of whose turn it is 
String whoseTurn = "Black Turn";
String gameChecker = "Going Good";

//to capture current point to move for 
Points currentPoint = new Points();

//list of all the possible moves
ArrayList<Points> possibleMove = new ArrayList<Points>();

//list of boards
BoardList boardList = new BoardList();

int count = 0;

void setup() {
  size(600,500);
  background(0);
  board.createStone();
  board.makeBoxes();
  board.fillStones();
  //removing the first two stones
  Points temp1 = board.point.get(35);
  temp1.setC(2);
  Points temp2 = board.point.get(36);
  temp2.setC(2);
}

void draw() {
  makeAIMove();
  board.fillStones();
  //displaying whose turn message
  displayMessage(whoseTurn);
  displayError(gameChecker);
  
  //displaying left right up down button
  leftButton();
  rightButton();
  upButton();
  downButton();
  
  //marking different color for the possible Point
  board.fillPossibleMoves();
   count  = board.caculateSEF();
  
}


//listening to the mouse Click
void mouseClicked() {
  //to make a left movement
  if (leftMouseOver()) {
    if (board.removeLeftStone(currentPoint)){
     gameChecker = "Going good";
      blackTurn = !blackTurn;
      whiteTurn = !whiteTurn;
    }
    else 
      gameChecker = "Wrong Move";
  }
  
  if (rightMouseOver()) {
    if (board.removeRightStone(currentPoint)) {
      gameChecker = "Going good";
      blackTurn = !blackTurn;
      whiteTurn = !whiteTurn;
    }
    else {
      gameChecker = "Wrong Move";

    }
  }
  
  if (upMouseOver()) {
    if (board.removeUpStone(currentPoint)) {
      gameChecker = "Going good";
      blackTurn = !blackTurn;
      whiteTurn = !whiteTurn;
    }
    else {
       gameChecker = "Wrong Move";
    }
  }
  
  if (downMouseOver()) {
    if (board.removeDownStone(currentPoint)) {
      gameChecker = "Going good";
      blackTurn = !blackTurn;
      whiteTurn = !whiteTurn;
    }
    else 
       gameChecker = "Wrong Move";

  }
   if (blackTurn) {
    whoseTurn = "Black Turn";
    board.unmarkMoves();
    Points temp = board.findStone(mouseX, mouseY);
    //black has been selected
    if (temp == null)
      print("cannot be null");
    else if (temp.c == 1) {
      //setting up current point as temp
      currentPoint = temp;
      //finding possibleMoves 
      board.markMoves(temp);
      markingMode = true;

    }
    //black is not selected 
  }
  //else if (whiteTurn) {
    /*
    whoseTurn = "White Turn";
    board.unmarkMoves();
    Points temp = board.findStone(mouseX, mouseY);
    //black has been selected
    if (temp == null)
      print("cannot be null");
    else if (temp.c == 0) {
      //setting up current point as temp
      currentPoint = temp;
      //finding possibleMoves 
      board.markMoves(temp);
      markingMode = true;
    }
    */
    //white is not selected 
    
 // }
}

void makeAIMove() {
  if (whiteTurn) {
    whoseTurn = "white Turn";
   board.unmarkMoves();
    Board prevBoard = boardList.storeBoard(board);
    //print("The original SEF value is "+ boardList.sefValue);
    if (prevBoard == null) {
     gameChecker = "Invalid";
     print("We are in an invalid move");
    }
     
    else {
      blackTurn = !blackTurn;
      whiteTurn = !whiteTurn;
      print("We are in a move");
      print ("The static value is" +  prevBoard.caculateSEF());
    }
  }
}

void displayMessage (String x ) {
  fill(0);
  rect(485,80,90,15);
  textAlign(CENTER, CENTER);
  fill(255);
  text(x, 520, 87);
  
}

void displayError (String x ) {
  fill(0);
  rect(485,100,90,15);
  textAlign(CENTER, CENTER);
  fill(255,200,240);
  text(x, 520, 107);
  
}



//making left Button
void leftButton() {
    if (leftMouseOver()) 
      fill(203,33,103);
    else 
      fill(123,63,123);
    stroke(250);
    rect(420,200,60,15);
    textAlign(CENTER, CENTER);
    fill(255);
    text("Left", 445, 206);
}

//checking if mouse is Over Left Button
boolean leftMouseOver() {
  if (mouseX > 420 && mouseX < (480) && mouseY > 200 && mouseY < (215)) {
    return true;
  }
  return false;
}




//making right Button
void rightButton() {
    if (rightMouseOver()) 
      fill(203,33,103);
    else 
      fill(123,63,123);
    stroke(250);
    rect(520,200,60,15);
    textAlign(CENTER, CENTER);
    fill(255);
    text("Right", 545, 206);
}

//checking if mouse is Over Right Button
boolean rightMouseOver() {
  if (mouseX > 520 && mouseX < 580 && mouseY > 200 && mouseY < (215)) {
    return true;
  }
  return false;
}

//making up button 
void upButton() {
    if (upMouseOver()) 
      fill(203,33,103);
    else 
      fill(123,63,123);
    stroke(250);
    rect(480,150,60,15);
    textAlign(CENTER, CENTER);
    fill(255);
    text("Up", 505, 156);
}

//checking if mouse is Over Up Button
boolean upMouseOver() {
  if (mouseX > 480 && mouseX < 540 && mouseY > 150 && mouseY < (165)) {
    return true;
  }
  return false;
}

void downButton() {
  if (downMouseOver()) 
    fill(203,33,103);
  else 
    fill(123,63,123);
  stroke(250);
  rect(480,250,60,15);
  textAlign(CENTER, CENTER);
  fill(255);
  text("Down", 505, 256);
}

//checking if mouse is Over Odwn Button
boolean downMouseOver() {
  if (mouseX > 480 && mouseX < (540) && mouseY > 250 && mouseY < (265)) {
    return true;
  }
  return false;
}
