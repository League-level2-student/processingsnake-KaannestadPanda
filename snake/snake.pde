// 1. Follow the recipe instructions inside the Segment class.

// The Segment class will be used to represent each part of the moving snake.
String dir="up";
Boolean alreadyOne=false;
class Segment {

  //2. Create x and y member variables to hold the location of each segment.
int x=250;
int y=250;
  // 3. Add a constructor with parameters to initialize each variable.
Segment(int newX, int newY){
 x=newX;
 y=newY;
}

  // 4. Add getter and setter methods for both the x and y member variables.
  int getX(){
    return x;
  }
  int getY(){
    return y;
  }
  void setX(int ye){
    x=ye;
  }
  void setY(int yea){
    y=yea;
  }
  
}


// 5. Create (but do not initialize) a Segment variable to hold the head of the Snake
Segment head;


// 6. Create and initialize a String to hold the direction of your snake e.g. "up"



// 7. Create and initialize a variable to hold how many pieces of food the snake has eaten.
// give it a value of 1 to start.
int length=1;



// 8. Create and initialize foodX and foodY variables to hold the location of the food.
int foodX = ((int)random(50)*10);
int foodY = ((int)random(50)*10);
// (Hint: use the random method to set both the x and y to random locations within the screen size (500 by 500).)

//int foodX = ((int)random(50)*10);



void setup() {

  // 9. Set the size of your sketch (500 by 500).

  size(500, 500);


  // 10. initialize your head to a new segment.
head=new Segment(250,250);

  // 11. Use the frameRate(int rate) method to set the rate to 20.
  frameRate(15);
}


void draw() {

  background(0);
  fill(255,255,255);
  text(length,20,20);
  drawFood();
  drawSnake();
move();
checkBoundaries();
collision();
manageTail();
  //12. Call the manageTail, drawFood, drawSnake, move, and collision methods.
}
int locationX;
int locationY;
// 13. Complete the drawFood method below. (Hint: each piece of food should be a 10 by 10 rectangle).

void drawFood() {
  if(alreadyOne ==false){
   locationX=((int)random(50)*10);
   locationY=((int)random(50)*10);
  }
  fill(255,0,0);
  rect(locationX, locationY, 10,10);
  alreadyOne=true;
  
}


//14. Draw the snake head (use a 10 by 10 rectangle)

void drawSnake() {
  fill(0,255,0);
rect(head.getX(), head.getY(), 10,10);

  //test your code
}


// 15. Complete the move method below.

void move() {

  // 16. Using a switch statement, make your snake head move by 10 pixels in the correct direction.
  //This is an incomplete switch statement:
  
  switch(dir) {
  case "up":
    head.setY(head.getY()-10);
    break;
  case "down":
    head.setY(head.getY()+10); 
    break;
  case "left":
   head.setX(head.getX()-10);
    break;
  case "right":
    head.setX(head.getX()+10); 
    break;
  }
  


  // 17. Call the checkBoundaries method to make sure the snake head doesn't go off the screen.
}


// 18. Complete the keyPressed method below. Use if statements to set your direction variable depending on what key is pressed.

void keyPressed() {
  if(keyCode==38){
   dir="up"; 
  }
  if(keyCode==40){
   dir="down"; 
  }
  if(keyCode==37){
   dir="left"; 
  }
  if(keyCode==39){
   dir="right"; 
  }
}



// 19. check if your head is out of bounds (teleport your snake head to the other side).

void checkBoundaries() {
  if(head.getY()<0){
  head.setY(490);
  }
  if(head.getY()>=500){
  head.setY(0);
  }
  if(head.getX()<0){
  head.setX(490);
  }
  if(head.getX()>=500){
  head.setX(0);
  }
}



//20. Make sure that the key for your current direction’s opposite doesn’t work(i.e. If you’re going up, down key shouldn’t work)



// 21. Complete the missing parts of the collision method below.

void collision() {

  // If the segment is colliding with a piece of food...
     // Increase the amount of food eaten and set foodX and foodY to new random locations.
     if(head.getX()==locationX&&head.getY()==locationY){
       length++;
       alreadyOne=false;
     }
}



/**
 
 ** Part 2: making the tail (the rest of the snake)
 
 **/

//  1. Create and initialize an ArrayList of Segments. (This will be your snake tail!)
ArrayList<Segment> tail=new ArrayList<Segment>();

// 2. Complete the missing parts of the manageTail method below and call it in the draw method.

void manageTail() {

  //Call the drawTail and checkTailCollision methods.
drawTail();
checkTailCollision();
  // Add a new Segment to your ArrayList that has the same X and Y as the head of your snake.
tail.add(new Segment(head.getX(),head.getY()));
  // To keep your tail the right length:
  // while the tail size is greater than the number of food pieces eaten, remove the first Segment in your tail.
if(tail.size()>length){
 tail.remove(tail.size()-1); 
}
}

void drawTail() {
    // Draw a 10 by 10 rectangle for each Segment in your snake ArrayList.
    for(Segment e:tail){
     fill(0,0,255);
     rect(e.getX(),e.getY(),10,10);
    }
}


// 3. Complete the missing parts of the bodyCollision method below.

void checkTailCollision() {

  // If your head has the same location as one of your segments...

  // reset your food variable

  //Call this method at the beginning of your manageTail method.
}
