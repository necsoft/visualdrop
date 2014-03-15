  class Visual01{
    Visuals visuals;
    int color01,color02;
    Visual01(Visuals _visuals){
      visuals = _visuals;
      init();
    }

    void show(){
      noStroke();
      fill(visuals.colorFeed.paletaActual[color01]);
      ellipse(width/2, height/2, visuals.BPM.momentoBeat*width/2, visuals.BPM.momentoBeat*width/2);
      fill(visuals.colorFeed.paletaActual[color02]);
      ellipse(width/2, height/2, visuals.BPM.momentoCompas*width/2, visuals.BPM.momentoCompas*width/2);

      if(visuals.BPM.cambio2compases){
        changeColors();
      }
    }


    void init(){
      color01 = 1;
      color02 = 3;
    }


    void changeColors(){
      color01 = int(random(0,5));
      color02 = int(random(0,5));
    }

  }