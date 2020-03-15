class BoardList {
  int sefValue;
  boolean whiteMove;
  boolean blackMove;
  



  //storing all the Board List in an Array till the level 3 depth 
  Board storeBoard(Board board) {
    int level =0;
    int depth = 1;
    println("Before sefValue" + sefValue);
    sefValue = minimax(board, level, depth);
    //print("After sefValue" + sefValue);
    //Board newBoard = makeMove(board);
    return board;
  }
  
  
  
  //minimax search
  int minimax(Board board, int level, int depth) {
       // List to store all the boards 
    ArrayList<Board> boards = new ArrayList<Board>();  
    //list of points
    ArrayList<Points> point = new ArrayList<Points>();
    
    int value =0 ;
    
    //calculating value
          int counter = 0;
   //creating the list of all the possible child moves
    for (int i = 0 ; i< board.point.size(); ++i) {
        Points temp = board.point.get(i);
        Board childBoard = new Board();
        childBoard.point = board.point;
        childBoard.unmarkMoves();
        childBoard.markMoves(temp);
        for (int j = 0 ; j < board.point.size(); ++j) {
          Points temp2 = board.point.get(j);
          if (temp2.p ==1) {
          if (childBoard.removeRightStone(temp) || childBoard.removeLeftStone(temp) || childBoard.removeUpStone(temp) || childBoard.removeDownStone(temp)) {
             println("The size is"+ counter);
             ++counter;
             boards.add(childBoard);
          }
        } 
        } 
    } 
    
        println("The size of the board is " + boards.size());
      //  println("The size of the counter is " + counter);
    
    /*
    //we are at the leaf of the board 
    if (level == depth) {
      return board.caculateSEF();
    }  
    else {
      //if level is even , we will maximize
      if (level %2 == 0 ) {
         println("value of r is" + value);
         value = -10000000;
        for (int i = 0; i < boards.size(); ++i ) {
          Board newChild = boards.get(i);
          int rvalue = minimax(newChild , level+1, depth);
          if (rvalue > value)
            value = rvalue;
       }
      }
      //if level is odd, we will minimize
      else {
         value = 100000;
        println("value of r is" + value);
        for (int i = 0 ; i < boards.size(); ++i ) {
          Board newChild = boards.get(i);
          int rvalue = minimax(newChild, level+1, depth);
          
          if (rvalue < value) {
            value = rvalue;
          }
        }
      }
      
    }
    println("value of r is" + value); */
    return 0;
  }
  //making move
  Board makeMove(Board board) {
     ArrayList<Points> point = new ArrayList<Points>();
     Board checkBoard  = new Board();
     point = board.point;
    for (int i = 0 ; i< point.size(); ++i) {
      Points temp = point.get(i);
      if (temp.p == 1)
      {
        Board temp2 = new Board();
        temp2.point = point;
        temp2.markMoves(temp);
        if (temp2.removeRightStone(temp) || temp2.removeLeftStone(temp) || temp2.removeUpStone(temp) || temp2.removeDownStone(temp)) {
          if (temp2.caculateSEF() == sefValue) {
            return temp2;
          }
        }
          
      }
    }
    return null;
    
  }
  

}
