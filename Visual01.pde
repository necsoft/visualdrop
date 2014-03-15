  class Visual01{
    Visuals visuals;
    Visual01(Visuals _visuals){
      visuals = _visuals;
    }

    void show(){
      noStroke();
      fill(visuals.colorFeed.paletaActual[1]);
      ellipse(width/2, height/2, visuals.BPM.momentoBeat*width, visuals.BPM.momentoBeat*width);
      fill(visuals.colorFeed.paletaActual[3]);
      ellipse(width/2, height/2, visuals.BPM.momentoCompas*width, visuals.BPM.momentoCompas*width);
    }

  }