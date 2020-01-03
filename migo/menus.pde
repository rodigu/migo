

void display_button(String button_text, float x, float y){
  fill(0);
  stroke(200);
  rect(x - 10 - textWidth(button_text)/2, y - base_size, 20 + textWidth(button_text), 10 + base_size);
  fill(200);
  text(button_text, x - textWidth(button_text)/2, y);
}
