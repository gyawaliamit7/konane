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
      else {
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
  
  //finding possible list of moves for given point
  void markMoves(Points p) {
    for (int i =0; i < point.size(); ++i) {
      Points temp = point.get(i);
      //there is a space
      if (temp.c == 2) {
        //check if the space is not in first row or last row for vertical move
        if (!((temp.x == 0 & p.y ==temp.y )|| (temp.x == 7 && p.y ==temp.y ))) {
           //check if the space is not in first row or last row for horizontal move
           if (!((temp.y == 0 & p.x ==temp.x )|| (temp.y == 7 && p.x ==temp.x ))) {
             //check if there is a gap between space and stone vertically
             if ( ((temp.x -p.x == 2) && (temp.y==p.y)) || ((p.x-temp.x==2)&& (temp.y==p.y))) {
               //check if the gap is not space : THIS NEEDED TO BE IMPLEMENTED                
               temp.setP(1);
               print(temp.x + " " +temp.y);
             }
             //check if there is a gap between space and stone horizontally
             else if (((temp.y-p.y ==2)&& (temp.x==p.x))|| ((p.y-temp.y ==2)&& (temp.x==p.x))) {
               temp.setP(1);
               print(temp.x + " " +temp.y);

             }
           }
        }
      }
    }
  }
   
  
    
  
}
