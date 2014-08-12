  class Visual02 extends VisualParent{
    Visuals visuals;

    int direccion;

    Visual02(Visuals _visuals){
      visuals = _visuals;
      direccion = 2;
    }

    void show(){
      updateBPM(visuals);
      updateColorFeed(visuals);

      noStroke();
      if(direccion == 1){  
        fill(paleta[color01]);
        rect(momentoBeat*width, 0, width, height);
        fill(paleta[color01]);
        rect(momentoCompas*width, 0, width, height*0.6);
        fill(paleta[color02]);
        rect(momentoBeat*width, 0, width, height*0.4);
        fill(paleta[color03]);
        rect(momentoCompas*width, 0, width, height*0.3);
      }

      if(direccion == 2){
        fill(paleta[color01]);

        rect(width-width*momentoBeat, 0, width, height);
      }

      if(direccion == 3){
        fill(paleta[color01]);
        rect(0, 0, width, height*momentoBeat);
      }

      if(direccion == 4){
        pushMatrix();
        rotate(0.2);
        for (int i = 0; i < 10; ++i){
          fill(paleta[colores[i%4]]);
          rect(-width*2+width*4*momentoCompas+i*100, i*height/4, width, height/5);
        }
        popMatrix();
      }

      if(cambiocompas){
        flipColors();
        changeDirection();
      }
    }


    void changeDirection(){
      direccion = int(random(1,5));
      randomSeed(int(frameCount * random(100)));
    }


  }