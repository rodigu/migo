var canv;
var map;
var TILE;
var tiles;
var current;
var assets;
var mousi;
const number_of_assets = 28;

function setup(){
  smooth(0);
  tiles = [];
  assets = [];
  current = 0;
  TILE = 80;
  let j = 0, k = 0;
  for (let i = 0; i < number_of_assets; i++){
    tiles.push(createImg('assets/' + str(i) + '.png', '').size(40, 40));
    tiles[i].position(45*k, 45*j);
    k++;
    if (45*k > windowWidth){
      k = 0;
      j++;
    }
    tiles[i].mouseClicked(T);
    tiles[i].k = i;
    assets.push(loadImage('assets/' + str(i) + '.png'));
  }
  canv = createCanvas(640, 640);
  textSize(TILE/2);
  textFont(loadFont('assets/game_over.ttf'));
  textAlign(CENTER, CENTER);
  map = [];
  for (let i = 0; i < 8; i++){
    map.push([]);
    for (let j = 0; j < 8; j++)
      map[i].push(1);
  }
  canv.position((windowWidth - width)/2, 40+(windowHeight - height)/2);
}

function setMap(new_map_){
  for (let i = 0; i < map.length; i++){
    for (let j = 0; j < map[i].length; j++){
      map[i][j] = new_map_[j][i];
    }
  }
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

function T(){
  console.log(this.k);
  current = this.k;
  mousi = createImg('assets/' + str(this.k) + '.png', '').size(TILE, TILE);
  mousi.position(64, windowHeight/2);
}

function draw(){
  if (frameCount < 50)
    for (var i = 0; i < assets.length; i++)
      assets[i].resizeNN(TILE, 0);
  stroke(150);
  if (mouseX > 0 && mouseX < width && mouseY > 0 && mouseY < height)
    if(mouseIsPressed)
      map[int(mouseX/TILE)][int(mouseY/TILE)] = current;
  for (let i = 0; i < 8; i++)
    for (let j = 0; j < 8; j++){
      fill(0);
      image(assets[map[i][j]], i*TILE, j*TILE);
      // text(map[i][j], i*TILE + TILE/2, j*TILE + TILE/2);
    }
}

p5.Image.prototype.resizeNN = function (w, h) {
  "use strict";

  // Locally cache current image's canvas' dimension properties:
  const {width, height} = this.canvas;

  // Sanitize dimension parameters:
  w = ~~Math.abs(w), h = ~~Math.abs(h);

  // Quit prematurely if both dimensions are equal or parameters are both 0:
  if (w === width && h === height || !(w | h))  return this;

  // Scale dimension parameters:
  w || (w = h*width  / height | 0); // when only parameter w is 0
  h || (h = w*height / width  | 0); // when only parameter h is 0

  const img = new p5.Image(w, h), // creates temporary image
        sx = w / width, sy = h / height; // scaled coords. for current image

  this.loadPixels(), img.loadPixels(); // initializes both 8-bit RGBa pixels[]

  // Create 32-bit viewers for current & temporary 8-bit RGBa pixels[]:
  const pixInt = new Int32Array(this.pixels.buffer),
        imgInt = new Int32Array(img.pixels.buffer);

  // Transfer current to temporary pixels[] by 4 bytes (32-bit) at once:
  for (let y = 0; y < h; ) {
    const curRow = width * ~~(y/sy), tgtRow = w * y++;

    for (let x = 0; x < w; ) {
      const curIdx = curRow + ~~(x/sx), tgtIdx = tgtRow + x++;
      imgInt[tgtIdx] = pixInt[curIdx];
    }
  }

  img.updatePixels(); // updates temporary 8-bit RGBa pixels[] w/ its current state

  // Resize current image to temporary image's dimensions:
  this.canvas.width = this.width = w, this.canvas.height = this.height = h;
  this.drawingContext.drawImage(img.canvas, 0, 0, w, h, 0, 0, w, h);

  return this;
};
