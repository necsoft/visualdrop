  class Visual04{
    Visuals visuals;

    int cantidadloadings;
    float[] activeLoadings;
    float[] loadingDesfases;
    color[] colorLoading;


    Visual04(Visuals _visuals){
      visuals = _visuals;

      cantidadloadings = 40;

      activeLoadings = new float[cantidadloadings+1];
      loadingDesfases = new float[cantidadloadings+1];
      colorLoading = new color[cantidadloadings+1];



      for (int i = 0; i<cantidadloadings-1; i++){
        activeLoadings[i]=int(random(2));
      }

      for (int i = 0; i<cantidadloadings-1; i++){
        loadingDesfases[i]=random(1);
      }

      for (int i = 0; i<cantidadloadings-1; i++){
        colorLoading[i]=color(255);
      }



    }

    void show(){

      for (int i = 0; i<cantidadloadings-1; i++){
        if(activeLoadings[i]==1){
          loadingBar(width/2,height*0.1+i*10,width*0.9,random(0,2));
        }
      }

      for (int i = 0; i<cantidadloadings-1; i++){
        if(activeLoadings[i]==1){
          fill(colorLoading[i]);
          loadingBar(width/2,height*0.1+i*10,width*0.9,loadingDesfases[i]);
        }  
      }


      if(visuals.BPM.cambiobeat){
       for (int i = 0; i<40; i++){
        activeLoadings[i]=int(random(2));
        loadingDesfases[i]=random(1);
      }
      for (int i = 0; i<cantidadloadings-1; i++){
        colorLoading[i]=color(visuals.colorFeed.paletaActual[int(random(0,4))]);
      }
    }

  }

  void loadingBar(float posx,float posy, float tam,float desfase){
    rectMode(CENTER);
    
    rect(posx, posy, tam, 4);
    rectMode(CORNER);
    noStroke();
    fill(255);
    rect(posx-posx+posx*0.1, posy-2, 100+visuals.BPM.momentoCompas*width*0.8+desfase*50*-1, 4);
  }

}