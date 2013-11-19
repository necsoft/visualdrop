/*//////////////////////////////////////////////////////////////////////////
 VisualDrop
 ---------------------------------------------------------------------------
 Visualdrop es un conjunto de funcionalidades para facilitar la creación de
 algoritmos gráficos para visuales en tiempo real.

 Actualmente esta funcionando con un patch de toucOSC que es el que se encarga
 de manejar 
 
 *///////////////////////////////////////////////////////////////////////////


 import oscP5.*;
 import netP5.*;



 BPM BPM;
 OscFeed oscFeed;
 Visuals visuals;



 float tempo = 200;
 float numeradorCompas = 4;


 void setup() {
  size(800, 600);

  BPM = new BPM(tempo, numeradorCompas,oscFeed);
  visuals = new Visuals(BPM);
  oscFeed = new OscFeed();
}

void draw() {
  logs();
  background(230);



  BPM.tempo = tempo;
  BPM.run();
  oscFeed.mandarMensajeInt("/BPM/tempo_actual",int(tempo));






  if (oscFeed.visual01Bang == 1) {
    visuals.show01();
  }

  if (oscFeed.visual02Bang == 1) {
    visuals.show02();
  }

  

  }


  void keyPressed() {
    BPM.syncBPM(millis());
  }





  //Estos son logs para debuggear
  void logs(){

  println("Tempo Actual: "+BPM.tempo);

  //Mando el mensaje de cambio de compas al pill del touchOSC
  if (BPM.cambiocompas == true){
    println("Cambio de compas");
  }

  //Mando el mensaje de cambio de compas al pill del touchOSC
  if (BPM.cambiobeat == true){
    println("Cambio de beat");
  }  






}