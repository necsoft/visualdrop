  class Visual06 extends VisualParent{
    Visuals visuals;
    int nroColorActual = 0;
    Visual06(Visuals _visuals){
      visuals = _visuals;
    }

    void show(){
      updateBPM(visuals);
      updateColorFeed(visuals);
      noStroke();

      if (cambiocompas == true){
        nroColorActual = int(random(4));
      }
      
      for (int i = 0; i<90; i++){
        for (int j = 0; j<40; j++){
          fill(visuals.colorFeed.paletaActual[(i+j)%4],200);
          visuals.SRTKshapes.drawCross(i*20, j*20, sin(map(momentoCompas,0,1,-1,1))*width*0.01, sin(map(momentoCompas,0,1,-1,1))*360, 0.2);
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