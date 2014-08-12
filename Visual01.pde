  class Visual01 extends VisualParent{
    Visuals visuals;
    Visual01(Visuals _visuals){
      visuals = _visuals;
      init();
    }

    void show(){
      updateBPM(visuals);
      updateColorFeed(visuals);
      noStroke();

      fill(paleta[color01]);
      ellipse(width/2, height/2, momentoBeat*width/2, momentoBeat*width/2);
      fill(paleta[color02]);
      ellipse(width/2, height/2, momentoCompas*width/2, momentoCompas*width/2);
      fill(paleta[color03],100);
      ellipse(width/2, height/2, momentoCompas*width/4, momentoCompas*width/4);
      
      if(cambio2compases){
        flipColors();
      }
    }


  }