PImage bg, fish, upBadCat, underBadCat, myCat, lose, win, restart;

final int RESTART_W = 150;
final int RESTART_H = 150;
int gameState = 0; 
/**************************
*    0: game is playing   *
*    1: game is lose      *
*    2: game is win       *
***************************/

float x_inc = PI/15.0;
float t = 0.0;
float t_inc = PI/15.0;
final float A = 50.0; 
float k =0;


void setup()
{
  size(1280,755);
  bg = loadImage("img/bg.png");
  fish = loadImage("img/fish.png");
  upBadCat = loadImage("img/upBadCat.png");
  underBadCat = loadImage("img/underBadCat.png");  
  myCat = loadImage("img/myCat.png");
  lose = loadImage("img/lose.png");
  win = loadImage("img/win.png");
  restart = loadImage("img/restart.png");
}

void draw(){
   switch(gameState) {
    case 0:
        image(bg, 0, 0, 1280, 755);
        // PART I : move the fish by mouse
        
        
        //the badCat robs fish
        /* ... Part I  : badCats line up in sin wave " ...*/                
        /* ... Part II : how to tell "badCats rob fish" ...*/
        /* ... Part III: badCats move in sin wave  ...*/
        
        //PART I : display the white cat(myCat)
        
        //Part II :success to feed myCat (WIN)
        
        // Part III : set the time
        break;
  
    case 1:
        image(lose, 0, 0);
        image(restart, 0, 0);
        if(mousePressed == true) {
          // PART II : After pressing restart image, game will restart
        }
        
        break;
        
    case 2:
        image(win, 0, 0);
        image(restart, 0, 0);
        if(mousePressed == true) {
          // Part II : After pressing restart image, game will restart ...*/
        
      }
        break;
        
     default:
        print("error");
        break;
 }
  
}