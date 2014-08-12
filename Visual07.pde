  class Visual07 extends VisualParent{
    Visuals visuals;

    int cantidadparticulas = 1000;
    int stepSize = 20;

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
      updateBPM(visuals);
      updateColorFeed(visuals);
      
      visuals.showBackground = true;
      
      fill(coloractual);
      for (int i = 0; i<cantidadparticulas-1; i++){
      
      
      
      noStroke();
      fill(paleta[color01],100);

      ellipse(posx[i], posy[i], sin(map(momentoCompas,0,1,-1,1))*4+5, sin(map(momentoCompas,0,1,-1,1))*4+5);
      
      //line(posx[i], posy[i], width/2, height/2);

      }
      step();

      if(cambio4compases){
       reset();
       flipColors();
       stepSize = int(random(2,20));
      }


    }





    void reset(){
        for (int i = 0; i<cantidadparticulas-1; i++){
        posx[i] = width/2;
        posy[i] = height/2;
      }

      

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