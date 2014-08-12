  class Visual05 extends VisualParent{
    Visuals visuals;

    Visual05(Visuals _visuals){
      visuals = _visuals;
    }


    void show(){
      updateBPM(visuals);
      updateColorFeed(visuals);


        pushMatrix();
        translate(width/2,height/2);
        fill(paleta[color01]);
        drawCross(0, 0, momentoCompas*width*0.5,momentoBeat*180, 0.2);
        popMatrix();      

      if(cambiobeat){
        flipColors();
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