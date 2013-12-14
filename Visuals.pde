/*//////////////////////////////////////////////////////////////////////////
 visuals
 ------------------------------------------------------------------------
 Este es un ejemplo de una visual.
 *///////////////////////////////////////////////////////////////////////////


 class Visuals {

  Visual01 visual01;
  Visual02 visual02;
  Visual03 visual03;
  Visual04 visual04;
  Visual05 visual05;
  Visual06 visual06;
  Visual07 visual07;
  Visual08 visual08;
  Visual09 visual09;

  SRTKshapes SRTKshapes;

  ColorFeed colorFeed;

  BPM BPM;

  Boolean showBackground = true;

  Visuals(BPM BPM,ColorFeed _colorFeed) {
    this.BPM = BPM;

    visual01 = new Visual01(this);
    visual02 = new Visual02(this);
    visual03 = new Visual03(this);
    visual04 = new Visual04(this);
    visual05 = new Visual05(this);
    visual06 = new Visual06(this);
    visual07 = new Visual07(this);
    visual08 = new Visual08(this);


    colorFeed = _colorFeed;

    SRTKshapes = new SRTKshapes();

  }



  void passMe(ColorFeed _colorFeed){
    colorFeed = _colorFeed;
  }






  void flash01(){
    fill(255);
    rect(0, 0, width, height);
  }


  void strobo01(){
    if(frameCount % 10 == 0){
      fill(255);
      rect(0, 0, width, height);
      }else{
       fill(0);
       rect(0, 0, width, height);   
     }
   }

 };




















  /*
  ESTRUCTURA DE UNA VISUAL
  --------------------------------------------------------------

  class Visual01{
    Visuals visuals;
    Visual01(Visuals _visuals){
      visuals = _visuals;
    }

    void show(){

    }

  }
  */


  /*
  VISUAL 01
  --------------------------------------------------------------
  
  */


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
























  /*
  VISUAL 02
  --------------------------------------------------------------
  
  */



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


























  /*
  VISUAL 03
  --------------------------------------------------------------
  
  */


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































  /*
  VISUAL 04
  --------------------------------------------------------------
  
  */



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






































  /*
  VISUAL 05
  --------------------------------------------------------------
  
  */



  class Visual05{
    Visuals visuals;
    color colorActual;
    int nroColorActual = 0;
    Visual05(Visuals _visuals){
      visuals = _visuals;
    }


    void show(){
      fill(#00FF88);
      colorActual = color(255);
      drawCross(width/2, height/2, visuals.BPM.momentoCompas*width*0.5, 45, 0.2);
    }



    void drawCross(float posx, float posy, float tam, float rot, float thickness) {
      if (visuals.BPM.cambiobeat){
        nroColorActual = int(random(4));
      }

      fill(visuals.colorFeed.paletaActual[nroColorActual]);
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





























  /*
  VISUAL 06
  --------------------------------------------------------------
  
  */



  class Visual06{
    Visuals visuals;
    int nroColorActual = 0;
    Visual06(Visuals _visuals){
      visuals = _visuals;
    }

    void show(){
      if (visuals.BPM.cambiocompas == true){
        nroColorActual = int(random(4));
      }
      fill(visuals.colorFeed.paletaActual[nroColorActual]);
      for (int i = 0; i<40; i++){
        for (int j = 0; j<40; j++){
          visuals.SRTKshapes.drawCross(i*20, j*20, visuals.BPM.momentoCompas*width*0.02, visuals.BPM.momentoBeat*90, 0.2);
        }
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




























  /*
  VISUAL 07
  --------------------------------------------------------------
  
  */



  class Visual07{
    Visuals visuals;

    int cantidadparticulas = 100;
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
      visuals.showBackground = true;
      fill(coloractual);
      for (int i = 0; i<cantidadparticulas-1; i++){
      
      stroke(255,20);
      line(posx[i], posy[i], width/2, height/2);

      ellipse(posx[i], posy[i], 10, 10);

      }
      step();

      if(visuals.BPM.cambiobeat){
       reset();
       coloractual = visuals.colorFeed.paletaActual[int(random(4))];
      }


    }





    void reset(){
        for (int i = 0; i<cantidadparticulas-1; i++){
        posx[i] = width/2;
        posy[i] = height/2;
      }

      stepSize = int(random(0,20));

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


























  /*
  VISUAL 08
  --------------------------------------------------------------
  
  */



  class Visual08{
    Visuals visuals;
    Visual08(Visuals _visuals){
      visuals = _visuals;

    }

    void show(){

    }

  }





























    /*
  VISUAL 09
  --------------------------------------------------------------
  
  */



  class Visual09{
    Visuals visuals;
    Visual09(Visuals _visuals){
      visuals = _visuals;
    }

    void show(){

    }

  }


































