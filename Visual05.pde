  class Visual05{
    Visuals visuals;
    color colorActual;
    int nroColorActual = 0;
    Visual05(Visuals _visuals){
      visuals = _visuals;
    }


    void show(){
      fill(#00FF88);
      colorActual = color(255);
      drawCross(width/2, height/2, visuals.BPM.momentoCompas*width*0.5, 45, 0.2);
    }



    void drawCross(float posx, float posy, float tam, float rot, float thickness) {
      if (visuals.BPM.cambiobeat){
        nroColorActual = int(random(4));
      }

      fill(visuals.colorFeed.paletaActual[nroColorActual]);
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



  }