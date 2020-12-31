var canv;
var map;
var TILE;
var tiletype;

function setup(){
  smooth(0);
  tiletype = createInput(0);
  canv = createCanvas(640, 640);
  TILE = 80;
  textSize(TILE);
  textFont(loadFont('assets/game_over.ttf'));
  textAlign(CENTER, CENTER);
  map = [];
  for (let i = 0; i < 8; i++){
    map.push([]);
    for (let j = 0; j < 8; j++)
      map[i].push(0);
  }
  canv.position((windowWidth - width)/2, (windowHeight - height)/2);
}

function showMap(){
  let ans = '[\n';
  for (let i = 0; i < 8; i++){
    ans += '[';
    for (let j = 0; j < 8; j++){
      ans += str(map[j][i]);
      if (j < 7) ans += ', ';
    }
    ans += ']';
    if (i < 7) ans += ',';
    ans += '\n';
  }
  ans += ']';
  console.log(ans);
  return ans;
}

function draw(){
  stroke(150);
  if (mouseIsPressed)
    if (mouseX > 0 && mouseX < width && mouseY > 0 && mouseY < height)
      map[int(mouseX/TILE)][int(mouseY/TILE)] = tiletype.value();
  for (let i = 0; i < 8; i++)
    for (let j = 0; j < 8; j++){
      fill(map[i][j]*15.5)
      rect(i*TILE, j*TILE, TILE, TILE);
      fill(0);
      text(map[i][j], i*TILE + TILE/2, j*TILE + TILE/2);
    }
}
