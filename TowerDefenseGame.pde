//Tower Defense Game
//William Cheng
//Programming 12

//dont scale images in the image function, may lag
//instead do resizing when you load the picture ex. imageVaraible.resize(width, height);



// ================ GLOBAL VARIABLES =================

final int INTRO    = 0;
final int PLAY     = 1;
final int BUILD    = 2;
final int GAMEOVER = 3;
final int SELECTION = 4;
int mode;

//Pallette
color white = #ffffff;
color black = #000000;

color red = #EA213F;
color blue = #5221EA;
color purple =#AA56AA;
color gold = #C1AF21;

color grass = #7EF716;
color path = #BFB79A;
color dryGrass = #F7D487;
color snow = #D3CEC6;
color buildMenu = #AF662E;
color gasGreen = #B2F77A;

color defaultMob = #C32DCB;
color bigMob = #2D9BCB;
color speedMob = #F23500;
//Mouse & Keyboard interaction variables
boolean mouseReleased;
boolean wasPressed;

//Buttons
Button start;
Button backToStart;
Button nextWave;
Button toBuild;
Button springPlay;
Button summerPlay;
Button winterPlay;


Button backFromBuild;
Button watchTower;
Button ballista;
Button conscripts;
Button gas;
Button deathRayPrototype;

//Collections of objects
Node[] nodes;
ArrayList<Mob> mobs;
ArrayList<Tower> towers;
ArrayList<Bullet> bullets;

//Images and Gifs
Gif introAnimation;

//Fonts
PFont medieval;

//Text
dText gName;

//Money and stuff
int money = 100;
int health = 100;

//Error Messages
int errorMessage = 0;
int broke = 0;

//Map Selector
int mapSelector = 0;

int laserBullets;
// ===================== SETUP =========================

void setup() {
  rectMode(CENTER);
  imageMode(CENTER);
  textAlign(CENTER, CENTER);
  size(1200, 800);
  medieval = createFont("HEROBEAM-Regular.ttf", 100);
  initializeModes();
  initializeVariables();
  makeButtons();

  makeNodes();
}

void initializeModes() {
  //set up the default mode for things
  rectMode(CENTER);
  imageMode(CENTER);
  textAlign(CENTER, CENTER);
  mode = INTRO;
}

void initializeVariables() {

  //Load Images & Gifs
  introAnimation = new Gif("gifs/frame_", "_delay-0.06s.gif", 29, 1, width/2, height/2, width, height);

  //Load Fonts/Text

  //gName = new dText("Tower Def","ense Game", width/2, height/3, 100, 100, 100, medieval);
  //gName = new dText("Tower Defense Game", width/2, height/3, 100, medieval);
  gName = new dText("Tower Defense Game", width/2, height/3, 100, 1, medieval);

  //Create Collections of Objects
  mobs = new ArrayList<Mob>();
  towers = new ArrayList<Tower>();
  bullets = new ArrayList<Bullet>();

  //TEST TOWERS
  //towers.add(new Tower(300, 400, 0, 60));
}

void makeButtons() {
  //INTRO - Start
  start = new Button("Start", width/2, 3*height/4, 200, 100, white, black);
  backToStart = new Button("Menu", width/2, 3*height/4, 200, 100, white, black);

  //Map Select
  springPlay = new Button ("Spring", width/4, 300, 200, 200, white, black);
  summerPlay = new Button ("Summer", 3*width/4, 300, 200, 200, white, black);
  winterPlay = new Button ("Winter", width/2, 600, 200, 200, white, black);

  //PLAY - Next Wave, To Build Mode
  nextWave = new Button("GO", 920, height/2, 100, 50, white, black);
  toBuild = new Button("Buy", 1080, height/2, 100, 50, white, black);


  //BUILD - To play mode, Buy Sniper, Buy Gun, Buy AoE XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
  backFromBuild = new Button("Back", 1080, height/2, 100, 50, white, black);
  watchTower = new Button("Tower", 900, 100, 100, 100, white, black);
  ballista = new Button("ball", 1100, 100, 100, 100, white, black);
  conscripts = new Button("cons", 900, 300, 100, 100, white, black);
  gas = new Button("Gas", 1100, 300, 100, 100, white, black);
  deathRayPrototype = new Button("mach", 1000, 200, 100, 100, white, black);


  //GAMEOVER - Reset
}

void makeNodes() {


  //Plot the nodes on the map
  nodes = new Node[8];

  nodes[0] = new Node(150, 150, 0, 1, 0);
  nodes[1] = new Node(150, 600, 1, 0, 0);
  nodes[2] = new Node(650, 600, 0, -1, 0);
  nodes[3] = new Node(650, 400, -1, 0, 0);
  nodes[4] = new Node(400, 400, 0, -1, 0);
  nodes[5] = new Node(400, 200, 1, 0, 0);


  //Plot the nodes on the map

  nodes[6] = new Node(400, 600, 0, -1, 1);
  nodes[7] = new Node(400, 100, 1, 0, 1);
}


// ===================== DRAW ===========================

void draw() {
  click();
  if (mode == INTRO) {
    intro();
  } else if (mode == PLAY) {
    play();
  } else if (mode == BUILD) {
    build();
  } else if (mode == GAMEOVER) {
    gameOver();
  } else if (mode == SELECTION) {
    selectionMenu();
  }
}
