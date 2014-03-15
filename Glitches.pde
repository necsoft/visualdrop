void applyGlitch(){
  pushStyle();
  if(random(1) < 0.3){
  applyGlitch02(2);
  }
  if(random(1) < 0.3){
  shiftImage01();
  }
  
  if(random(1)<0.1){
  for(int i = 0 ; i<10 ; i++){
   lineShift01();
  }}
  
  if(random(1)<0.1){
  scanLines01(100);
  
  }
  
  if(random(1)<0.3){
  blendMode(MULTIPLY);
  }else if(random(1)<0.3){
  blendMode(EXCLUSION);
  }else{
  blendMode(BLEND);
  }
  popStyle();
}























void shiftImage01() {
  int width_franja = int(random(200));
  int desfase = int(random(300));

  int cantidad_vueltas = int(random(1, 20));


  for (int i = 0; i<cantidad_vueltas; i++) {
    int random_x = int(random(width));
    for (int j = 0;j < width_franja;j++) {
      for (int k = 0;k <height ; k++) {
        color elcolor = get(random_x+j,k);
        set(random_x+j+desfase,k,elcolor);
      }
    }
    
  }
}






void applyGlitch02(int level) {

  float block = int(random(10, 30));  
  for (int i = 0 ; i <width/block ; i++) {
    for (int j = 0 ; j++ <height/block ; j++) {
      if (random(1) < 0.1) {
        noStroke();
        if (random(1)<0.5) {
          fill(30, random(150, 255));
        }
        else if (random(1)<0.1) {
          fill(get(int(i*block), int(j*block)), 200);
        }
        else {
          color elcolor = get(int(i*block), int(j*block));
          if (brightness(elcolor)>20 && saturation(elcolor)>200) {
            colorMode(HSB);
            color nuevo_color = color( (hue(elcolor)+random(-255,255) % 255), 100, 255, 255);
            fill(nuevo_color, random(100, 255));
            colorMode(RGB);
          }
        }


        rect(i*block, j*block, block, block);
        if (random(1)<0.12) {
          rect(i*block, j*block, block+random(block, block*5), block);
        }
        if (random(1)<0.12) {
          rect(i*block, j*block, block, block+random(block, block*5));
        }
        if (random(1)<0.5) {
          fill(30);
          drawCross(i*block+block*0.5, j*block+block*0.5, block*0.2, 45, 0.1);
        }
      }
    }
  }
}

















void drawCross(float posx, float posy, float tam, float rot, float thickness) {
  pushMatrix();

  translate(posx, posy);
  rotate(radians(rot));
  rectMode(CENTER);
  noStroke();
  rect(0, 0, tam, tam*thickness);
  rect(0, 0, tam*thickness, tam);
  rectMode(CORNER);
  popMatrix();
}








void lineShift01(){

  
  
  int random_x = int(random(width));
  int random_y = int(random(height));
  color color_random = get(random_x,random_y);
  float random_with = random(-100,100);
  strokeWeight(10);
  strokeCap(SQUARE);
  line(random_x,random_y,random_with,random_y);

  


}



void scanLines01(int cantidad){
  int salto_linea = int(random(5,20));
  for(int i = 0; i<cantidad; i++){
  stroke(0,random(100));
  strokeWeight(5);
  line(0,i*salto_linea,width,i*salto_linea);
  }

}