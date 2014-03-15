  class Visual02{
    Visuals visuals;
    Visual02(Visuals _visuals){
      visuals = _visuals;
    }

    void show(){
      noStroke();        
      fill(visuals.colorFeed.paletaActual[1]);
      rect(visuals.BPM.momentoBeat*width, 0, width, height);
      fill(visuals.colorFeed.paletaActual[0]);
      rect(visuals.BPM.momentoCompas*width, 0, width, height);
    }

  }