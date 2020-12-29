var canv;
var map;
var TILE;

function setup(){
  smooth(0);
  canv = createCanvas(640, 640);
  TILE = 80;
  map = [];
  for (let i = 0; i < 8; i++){
    map.push([]);
    for (let j = 0; j < 8; j++)
      map[i].push(0);
  }
  canv.position((windowWidth - width)/2, (windowHeight - height)/2);
}

function keyPressed(){
  if (key == 'a'){

  }
}
function showMap(){
  let ans = '[\n';
  for (let i = 0; i < 8; i++){
    ans += '[';
    for (let j = 0; j < 8; j++){
      ans += str(map[i][j]);
      if (j < 7) ans += ',';
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
      map[int(mouseX/TILE)][int(mouseY/TILE)] = int(key);
  for (let i = 0; i < 8; i++)
    for (let j = 0; j < 8; j++){
      if (map[i][j] == 0) fill(20);
      if (map[i][j] == 1) fill(200);
      if (map[i][j] == 2) fill(200, 0, 0);
      if (map[i][j] == 3) fill(0, 200, 0);
      if (map[i][j] == 4) fill(0, 0, 200);
      rect(i*TILE, j*TILE, TILE, TILE);
    }
}
