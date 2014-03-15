  class Visual07{
    Visuals visuals;

    int cantidadparticulas = 300;
    int stepSize = 40;

    int [] posx;
    int [] posy;

    color coloractual = color(255);

    
    Visual07(Visuals _visuals){
      visuals = _visuals;

      posx = new int[cantidadparticulas];
      posy = new int[cantidadparticulas];

      for (int i = 0; i<cantidadparticulas-1; i++){
        posx[i] = width/2;
        posy[i] = height/2;
      }

    }

    void show(){
      visuals.showBackground = true;
      fill(coloractual);
      for (int i = 0; i<cantidadparticulas-1; i++){
      
      
      
      noStroke();
      ellipse(posx[i], posy[i], 10, 10);
      stroke(40,100);
      //line(posx[i], posy[i], width/2, height/2);

      }
      step();

      if(visuals.BPM.cambiocompas){
       reset();
       coloractual = visuals.colorFeed.paletaActual[int(random(4))];
      }


    }





    void reset(){
        for (int i = 0; i<cantidadparticulas-1; i++){
        posx[i] = width/2;
        posy[i] = height/2;
      }

      stepSize = int(random(10,30));

    }


    void step(){

    for (int i = 0; i<cantidadparticulas-1; i++){

      int choice = int(random(4));

      if(choice == 0){
        posx[i]+=stepSize;
      }else if(choice == 1){
        posx[i]-=stepSize;
      }else if (choice == 2) {
        posy[i]+=stepSize;
      }else{
        posy[i]-=stepSize;
      }
      
    }


    }

}