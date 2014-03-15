  class Visual06{
    Visuals visuals;
    int nroColorActual = 0;
    Visual06(Visuals _visuals){
      visuals = _visuals;
    }

    void show(){
      if (visuals.BPM.cambiocompas == true){
        nroColorActual = int(random(4));
      }
      fill(visuals.colorFeed.paletaActual[nroColorActual]);
      for (int i = 0; i<40; i++){
        for (int j = 0; j<40; j++){
          visuals.SRTKshapes.drawCross(i*20, j*20, visuals.BPM.momentoCompas*width*0.02, visuals.BPM.momentoBeat*90, 0.2);
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

  }