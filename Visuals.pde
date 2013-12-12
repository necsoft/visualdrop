/*//////////////////////////////////////////////////////////////////////////
 visuals
 ------------------------------------------------------------------------
 Este es un ejemplo de una visual.
 *///////////////////////////////////////////////////////////////////////////


 class Visuals {

  BPM BPM;
  //Params de visuales
  float desfaserandom = random(TWO_PI);



  int cantidadloadings = 40;
  float[] activeLoadings;
  float[] loadingDesfases;



  Visuals(BPM BPM) {
    this.BPM = BPM;


    activeLoadings = new float[40];
    loadingDesfases = new float[40];


    for (int i = 0; i<40; i++){
      activeLoadings[i]=int(random(2));
    }

    for (int i = 0; i<40; i++){
      loadingDesfases[i]=random(1);
    }

  }



  /*
  VISUAL 01
  --------------------------------------------------------------
  Circulo acercandose a la pantalla.
  */

  void show01() {        
    noStroke();
    fill(255);
    ellipse(width/2, height/2, BPM.momentoBeat*width, BPM.momentoBeat*width);
    fill(#00FF88, 200);
    ellipse(width/2, height/2, BPM.momentoCompas*width, BPM.momentoCompas*width);
  }


  /*
  VISUAL 02
  --------------------------------------------------------------
  Rectangulo que crece desde la izquierda.
  */


  void show02() {
    noStroke();        
    fill(#00FF88);
    rect(BPM.momentoBeat*width, 0, width, height);
  }
  
  
  /*
  VISUAL 03
  --------------------------------------------------------------
  Arco que crece y cambia de desfase en cada Beat
  */
  
  void show03(){
    if(BPM.cambiobeat){
     desfaserandom = random(TWO_PI);
   }

   fill(#00FF88);
   arc(width/2, height/2, BPM.momentoBeat*width, BPM.momentoBeat*width,desfaserandom,(BPM.momentoBeat*TWO_PI)+desfaserandom);
 }

  /*
  VISUAL 04
  --------------------------------------------------------------
  Arco que crece y cambia de desfase en cada Beat
  */

  void show04(){

    for (int i = 0; i<40; i++){
      if(activeLoadings[i]==1){
        loadingBar(width/2,height*0.1+i*10,width*0.9,random(0,2));
      }
    }

    for (int i = 0; i<40; i++){
      if(activeLoadings[i]==1){
        loadingBar(width/2,height*0.1+i*10,width*0.9,loadingDesfases[i]);
      }  
    }


    if(BPM.cambiobeat){
     for (int i = 0; i<40; i++){
      activeLoadings[i]=int(random(2));
      loadingDesfases[i]=random(1);
    }
  }

}


void loadingBar(float posx,float posy, float tam,float desfase){
  rectMode(CENTER);
  fill(#00FF88);
  rect(posx, posy, tam, 4);
  rectMode(CORNER);
  noStroke();
  fill(255);
  rect(posx-posx+posx*0.1, posy-2, 100+BPM.momentoCompas*width*0.8+desfase*50*-1, 4);
}




  /*
  VISUAL 05
  --------------------------------------------------------------
  Arco que crece y cambia de desfase en cada Beat
  */

  void show05(){
    drawCross(width/2, height/2, BPM.momentoCompas*width*0.5, 45, 0.2);
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

  /*
  VISUAL 06
  --------------------------------------------------------------
  Arco que crece y cambia de desfase en cada Beat
  */

  void show06(){
    

    for (int i = 0; i<40; i++){
      for (int j = 0; j<40; j++){
        drawCross(i*20, j*20, BPM.momentoCompas*width*0.02, 45, 0.2);
      }
    }

  }

  /*
  VISUAL 07
  --------------------------------------------------------------
  Arco que crece y cambia de desfase en cada Beat
  */

  void show07(){

  }

  /*
  VISUAL 08
  --------------------------------------------------------------
  Arco que crece y cambia de desfase en cada Beat
  */

  void show08(){

  }

  /*
  VISUAL 09
  --------------------------------------------------------------
  Arco que crece y cambia de desfase en cada Beat
  */

  void show09(){

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