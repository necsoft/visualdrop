  class Visual03{
    Visuals visuals;
    float desfaserandom;
    int nroColorActual = 0;

    Visual03(Visuals _visuals){
      visuals = _visuals;
      desfaserandom = random(TWO_PI);
    }

    void show(){

      if(visuals.BPM.cambiobeat){
       desfaserandom = random(TWO_PI);
       nroColorActual = int(random(0,4));
     }

     fill(visuals.colorFeed.paletaActual[nroColorActual]);
     arc(width/2, height/2, visuals.BPM.momentoBeat*width, visuals.BPM.momentoBeat*width,desfaserandom,(visuals.BPM.momentoBeat*TWO_PI)+desfaserandom);

   }

 }