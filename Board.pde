class Board {
  
   //list to store all the points 
  ArrayList<Points> point = new ArrayList<Points>();
  
  //initial board to create stone
  void createStone() {
    for (int i =0; i <8; ++i) {
      for (int j =0; j<8; ++j) {
        //creating white stone
      if ((i+j) % 2 == 0) {
         Points temp = new Points(i,j,0);
         point.add(temp);
       }
        //creating black stone
       else  {
         Points temp = new Points(i,j,1);
         point.add(temp);
       } 
      }
    } 
  } 
  
  //this method will help to make boxes
  void makeBoxes() {
    for (int i =0; i <8; ++i) {
      for (int j =0; j<8; ++j) {
        fill(175);
        rect(i*50,j*50, 50, 50);
      }
    } 
  }
  
  //the method will help to fill the stones() 
  void fillStones() {
    for (int i =0; i <point.size(); ++i) {
      Points temp = point.get(i);
      //filling white stone
      if (temp.c == 0) {
        makeWhiteStone(temp);
      }
      else if (temp.c == 1 ) {
        makeBlackStone(temp);
      }
      //otherwise we will remove the stone
      else if (temp.c == 2){
        removeStone(temp);
      }
    }
  }
  
  void fillPossibleMoves() {
     for (int i =0; i <point.size(); ++i) {
      Points temp = point.get(i);
      if (temp.p == 1) {
        markOrange(temp);
      }
     }
  }
  
  void unmarkMoves() {
     for (int i =0; i <point.size(); ++i) {
       Points temp = point.get(i);
       temp.setP(0);
     }
  }
  
  //marking orange for the possible moves 
  void markOrange(Points temp){
    stroke(204, 102, 0);
    fill(204, 102, 0);
    rect(temp.x*50,temp.y*50,50,50);
  }
  
  //finding the stone when button is clicked 
  Points findStone(float x, float y) {
    for (int i =0; i< point.size(); ++i) {
      Points p = point.get(i);
      
      float distX = (p.x)*50;
      float distY = (p.y)*50;
 
      if (( (distX < x) && (x < (distX+50))) && ((distY < y) && (y < (distY+50)))) {
        return p;
      }

    }
    return null;
    
  }
  
  //method that will fill white stone
  void makeWhiteStone(Points temp) {
    stroke(250);
    fill(250);
    rect(temp.x*50+5, temp.y*50+5, 15 , 15);
  }
  
  //method that will fill black stone
  void makeBlackStone(Points temp) {
    stroke(0);
    fill(0);
    rect(temp.x*50+5, temp.y*50+5, 15 , 15);
  }
  
  //removing the stone 
  void removeStone(Points temp) {
    stroke(0);
    fill(175);
    rect(temp.x*50,temp.y*50, 50, 50);;
  }
  
  //removing left stone 
  boolean removeLeftStone(Points p) {
    boolean flag = true;
    for ( int i = 0; i <point.size(); ++i) {
      Points temp = point.get(i);
      //we have found have an space
      if (temp.p == 1) {
        try {
            Points temp2 = point.get(i+16);
          if (temp2.x == p.x) {
            temp.setP(0);
            Points temp3 = point.get(i+8);
            if (temp2.c == 0) {
              temp.setC(0);
            }
            else if (temp2.c ==1) {
               temp.setC(1);

            }
            //making the move space
            temp3.setC(2);
            temp2.setC(2);
            flag = true;
          }
          else {
            flag  = false;
          }
        } catch (IndexOutOfBoundsException e) {
          flag = false;
        }
      }
      fillStones();
    }
    return flag;
  }
  
  //removing right Stone 
  boolean removeRightStone(Points p) {
    boolean flag = true;
    for ( int i = 0; i <point.size(); ++i) {
      Points temp = point.get(i);
      //we have found have an space
      if (temp.p == 1) {
        try {
        Points temp2 = point.get(i-16);
          if (temp2.x == p.x) {
            temp.setP(0);
            Points temp3 = point.get(i-8);
            if (temp2.c == 0) {
              temp.setC(0);
            }
            else if (temp2.c ==1) {
               temp.setC(1);

            }
            //making the move space
            temp3.setC(2);
            temp2.setC(2);
            flag = true;
          }
          else {
            flag = false;
          }
      } catch (IndexOutOfBoundsException e) {
        flag = false;
      }
      }
      fillStones();
    }
    return flag;
  }
  
  //removing up stone
  boolean removeUpStone(Points p) {
    boolean flag = true;
    for ( int i = 0; i <point.size(); ++i) {
      Points temp = point.get(i);
      //we have found have an space
      if (temp.p == 1) {
        try {
        Points temp2 = point.get(i+2);
          if (temp2.y == p.y) {
            temp.setP(0);
            Points temp3 = point.get(i+1);
            if (temp2.c == 0) {
              temp.setC(0);
            }
            else if (temp2.c ==1) {
               temp.setC(1);

            }
            //making the move space
            temp3.setC(2);
            temp2.setC(2);
            flag = true;
          }
          else {
            flag = false;
          }
        } catch ( IndexOutOfBoundsException e ) {
          flag = false;
        }
      }
      fillStones();
    }
    return flag;
  }
  
  //removing down stone
  boolean removeDownStone(Points p) {
    boolean flag = true;
    for ( int i = 0; i <point.size(); ++i) {
      Points temp = point.get(i);
      //we have found have an space
      if (temp.p == 1) {
        try {
        Points temp2 = point.get(i-2);
          if (temp2.y == p.y) {
            temp.setP(0);
            Points temp3 = point.get(i-1);
            if (temp2.c == 0) {
              temp.setC(0);
            }
            else if (temp2.c ==1) {
               temp.setC(1);

            }
            //making the move space
            temp3.setC(2);
            temp2.setC(2);
            flag = true;
          }
          else {
            flag = false;
          }
        } catch (IndexOutOfBoundsException e ) {
          flag = false;
        }
      }
      fillStones();
    }
    return flag;
  }
  
  //finding possible list of moves for given point
  void markMoves(Points p) {
    for (int i =0; i < point.size(); ++i) {
      Points temp = point.get(i);
      //there is a space
      if (temp.c == 2) {
        //check if the space is not in first row or last row for vertical move
       // if (!((temp.x == 0 & p.y ==temp.y )|| (temp.x == 7 && p.y ==temp.y ))) {
           //check if the space is not in first row or last row for horizontal move
         //  if (!((temp.y == 0 & p.x ==temp.x )|| (temp.y == 7 && p.x ==temp.x ))) {
             //check if there is a gap between space and stone vertically
             if ( ((temp.x -p.x == 2) && (temp.y==p.y)) || ((p.x-temp.x==2)&& (temp.y==p.y))) {
               //check if the gap is not space : THIS NEEDED TO BE IMPLEMENTED 
               //needed to check up down left right 
                 //if vertical 
               if (temp.y == p.y) {
                 // checking up 
                 if ((temp.x - p.x) < 0) {
                   if (point.get(i+8).c < 2) {
                     temp.setP(1);
                   }
                 }
                 //checking down

                 else if ((temp.x - p.x) > 0){
                   if (point.get(i-8).c < 2) {
                     temp.setP(1);
                   }
                 }
                 
                 
               }
              // temp.setP(1);
             }
             //check if there is a gap between space and stone horizontally
             else if (((temp.y-p.y ==2)&& (temp.x==p.x))|| ((p.y-temp.y ==2)&& (temp.x==p.x))) {
                   //if  vertical
                  if ( temp.x == p.x) {
                 //checking left
                 if (temp.y - p.y > 0) {
                   if (point.get(i-1).c != 2) {
                     temp.setP(1);
                   }
                 }
                 //checking right
                 else if (temp.y - p.y < 0){
                   if (point.get(i+1).c != 2) {
                     temp.setP(1);
                   }                   
                 }
               }
              // temp.setP(1);

             }
           }
        // }
     // }
    }
  }
  
  //function to calcuate SEF to count moves. We need to count only white moves which is AI
  int caculateSEF() {
    int count = 0 ;
    
    for (int j = 0; j < point.size(); ++j ) {
      Points p = point.get(j);
      if (p.c == 0 ) {
      for (int i =0; i<point.size(); ++i) {
        Points temp = point.get(i);
        if (temp.c == 2) {
             //check if there is a gap between space and stone vertically
             if ( ((temp.x -p.x == 2) && (temp.y==p.y)) || ((p.x-temp.x==2)&& (temp.y==p.y))) {
               //check if the gap is not space : THIS NEEDED TO BE IMPLEMENTED 
               //needed to check up down left right 
                 //if vertical 
               if (temp.y == p.y) {
                 // checking up 
                 if ((temp.x - p.x) < 0) {
                   if (point.get(i+8).c < 2) {
                     ++count;
                   }
                 }
                 //checking down

                 else if ((temp.x - p.x) > 0){
                   if (point.get(i-8).c < 2) {
                     ++count;
                   }
                 }
                 
                 
               }
             }
             //check if there is a gap between space and stone horizontally
             else if (((temp.y-p.y ==2)&& (temp.x==p.x))|| ((p.y-temp.y ==2)&& (temp.x==p.x))) {
                   //if  vertical
                  if ( temp.x == p.x) {
                 //checking left
                 if (temp.y - p.y > 0) {
                   if (point.get(i-1).c != 2) {
                     ++count;
                   }
                 }
                 //checking right
                 else if (temp.y - p.y < 0){
                   if (point.get(i+1).c != 2) {
                     ++count;
                   }                   
                 }
               }

             }
           }
    } 
    }
    }
    return count;
  }
  
    ArrayList<Board> findChild() {
    ArrayList<Board> boards = new ArrayList<Board>();  
     Board childBoard = new Board();
     childBoard.point = this.point;
     for (int i =0; i< childBoard.point.size(); ++i) {
       Points temp = childBoard.point.get(i);
       childBoard.markMoves(temp);
       for (int j =0; j <childBoard.point.size(); ++j) {
         Points temp2 = childBoard.point.get(j);
         //there is a possible move
         if (temp2.p ==1) {
           //possible move is left side 
           if ((temp2.y == temp.y) && temp2.x < temp.x) {
             if (childBoard.removeRightStone(temp)) {
               childBoard.unmarkMoves();
               boards.add(childBoard);
             }
           }           
           //possible move is right side
           if ((temp2.y == temp.y) && temp2.x > temp.x) {
             if (childBoard.removeLeftStone(temp)) {
               childBoard.unmarkMoves();
               boards.add(childBoard);
             }
           }
           
           //possible move is up side
           if ((temp2.x == temp.x) && temp2.y < temp.y) {
             if (childBoard.removeUpStone(temp)) {
               childBoard.unmarkMoves();
               boards.add(childBoard);
             }
           }
           
           //possible movedown side
           if ((temp2.x == temp.x) && temp2.y > temp.y) {
             if (childBoard.removeDownStone(temp)) {
               childBoard.unmarkMoves();
               boards.add(childBoard);
             }
           }
           
         }
       }
     }
     
     return boards;
   }
  
    
  
}
