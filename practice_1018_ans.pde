PImage bg, fish, upBadCat, underBadCat, myCat, lose, win, restart;
final int FISH_W = 130;
final int FISH_H = 130;
final int BADCAT_INIT_X = 160;
final int BADCAT_INIT_Y = -140;
final int BADCAT_W = 150;
final int BADCAT_H = 430;
final int SPACE = 220;
final int MYCAT_X = 1080;
final int MYCAT_Y = 280;
final int MYCAT_W = 220;
final int MYCAT_H = 150;
final int RESTART_W = 150;
final int RESTART_H = 150;


int gameState = 0; 
/**************************
*    0: game is playing   *
*    1: game is lose      *
*    2: game is win       *
***************************/

int fishX, fishY;
float badCatY;
float x_inc = PI/15.0;
float t = 0.0;
float t_inc = PI/15.0;
final float A = 50.0; 
float k =0;

int time = 50; 

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
  frameRate(10);
}

void draw()
{
  switch(gameState) {
    case 0:
        image(bg, 0, 0, 1280, 755);
        
        
        
        //move the fish by mouse 
        fishX = mouseX-FISH_W/2;
        fishY = mouseY-FISH_H/2;
        if(fishX < 0 ){
          fishX = 0;
        } else if(fishX > 1280-FISH_W) {
          fishX = 1280-FISH_W;
        }
        if(fishY < 0) {
          fishY = 0;
        } else if(fishY > 755-FISH_H) {
          fishY = 755-FISH_H;
        }
        image(fish, fishX, fishY,FISH_W, FISH_H);
     
             
        //the badCat robs fish
        /* ... Part I  : badCats line up in sin wave " ...*/                
        /* ... Part II : how to tell "badCats rob fish" ...*/
             
        for(int i = 0; i < 6; i++) {
          badCatY =  A * sin(x_inc*i+k) + BADCAT_INIT_Y ;
          image(upBadCat,BADCAT_INIT_X+BADCAT_W*i , badCatY,BADCAT_W, BADCAT_H);
          image(underBadCat,BADCAT_INIT_X+BADCAT_W*i , badCatY+SPACE+BADCAT_H,BADCAT_W, BADCAT_H);
          k+=0.03;
          //fail to feed myCat
          if(fishX+FISH_W > BADCAT_INIT_X*(i+1) && fishX < BADCAT_INIT_X*(i+1)+ BADCAT_W ){
          if(fishY < badCatY+BADCAT_H || fishY+FISH_H > badCatY+SPACE+BADCAT_H){
            gameState=1;
          }
          }
        }
        
               
        /* ... Part III: badCats move in sin wave  ...*/    
        
        
        //success to feed myCat
        image(myCat, MYCAT_X, MYCAT_Y);
        if(fishX > MYCAT_X){
          gameState = 2;
        }
        
        // Part III : set the time
        time--;
        if(time<0){
          gameState=1;
          time = 300;
        }
        println(time/10); 
            
        
        
      
            
        break;
  
      case 1:
        image(lose, 0, 0);
        image(restart, 0, 0);
        if(mousePressed == true) {
          if(mouseX>0 && mouseX<150 && mouseY>0 && mouseY<150 ){
            //restart
            gameState = 0 ;
            
          }
          
        /* ... Part II : After pressing restart image, game will restart ...*/
          
          
        }
        break;
        
      case 2:
        image(win, 0, 0);
        image(restart, 0, 0);
        if(mousePressed == true) {
          if(mouseX>0 && mouseX<150 && mouseY>0 && mouseY<150 ){
            //restart
            gameState = 0 ;
            
          }
          
        /* ... Part II : After pressing restart image, game will restart ...*/
                    
        }
        break;
        
     default:
        print("error");
        break;
  }
}