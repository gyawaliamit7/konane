class Points {
  int x;
  int y;
  //to store color white is 0 and black is 1 and empty is 2
  int c;
  
  //1 if it it is possible move and 0 if it is not possible move
  int p;
  Points() {
  }
  
  //setting value 
  void setC(int c) {
    this.c = c;
  }
  
  //setting the value of possible moves
  void setP(int p ) {
    this.p = p;
  }
  
  
  Points(int x, int y, int c) {
    this.x = x;
    this.y =y;
    this.c = c;
    this.p =0;
  }
}
