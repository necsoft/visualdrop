/*//////////////////////////////////////////////////////////////////////////

____   ____.__                    .__  ________                       
\   \ /   /|__| ________ _______  |  | \______ \_______  ____ ______  
 \   Y   / |  |/  ___/  |  \__  \ |  |  |    |  \_  __ \/  _ \\____ \ 
  \     /  |  |\___ \|  |  // __ \|  |__|    `   \  | \(  <_> )  |_> >
   \___/   |__/____  >____/(____  /____/_______  /__|   \____/|   __/ 
                   \/           \/             \/             |__|    

---------------------------------------------------------------------------
Visualdrop es un conjunto de funcionalidades para facilitar la creación de
algoritmos gráficos para visuales en tiempo real.

Actualmente esta funcionando con un patch de toucOSC que es el que se encarga
de disparar los parametros que cambian el flujo. 
 
///////////////////////////////////////////////////////////////////////////*/

import oscP5.*;
import netP5.*;
import ddf.minim.*;

//VisualDrop Toolkit
BPM BPM;
OscFeed oscFeed;
Visuals visuals;
AudioFeed audioFeed;
ColorFeed colorFeed;
JohnBullet johnBullet;

// Inicializacion ---------------------------------------------//

//OSC
int thisPort = 12000;
int thatPort = 12001;
String remoteLocation = "192.168.0.3";

//BPM
float tempo = 120;
float numeradorCompas = 4;
//-------------------------------------------------------------//


void setup() {
  size(800, 600);

  BPM = new BPM(tempo, numeradorCompas,oscFeed);
  visuals = new Visuals(BPM);
  oscFeed = new OscFeed(remoteLocation,thisPort,thatPort,BPM);

}

void draw() {
  background(0);

  BPM.tempo = BPM.tempoAproximado;
  BPM.run();
  if(frameCount%30==0){
    oscFeed.mandarMensajeInt("/BPM/tempo_actual",int(BPM.tempoAproximado));
  }


  if (oscFeed.visual01Bang == 1) {
    visuals.show01();
  }

  if (oscFeed.visual02Bang == 1) {
    visuals.show02();
  }

  if (oscFeed.visual03Bang == 1) {
    visuals.show03();
  }  

  if (oscFeed.visual04Bang == 1) {
    visuals.show04();
  }

  if (oscFeed.visual05Bang == 1) {
    visuals.show05();
  }

  if (oscFeed.visual06Bang == 1) {
    visuals.show06();
  }  

  if (oscFeed.visual07Bang == 1) {
    visuals.show07();
  }

  if (oscFeed.visual08Bang == 1) {
    visuals.show08();
  }

  if (oscFeed.visual09Bang == 1) {
    visuals.show09();
  }  

  if (oscFeed.flash01 == 1) {
    visuals.flash01();
  } 

  if (oscFeed.strobo01 == 1) {
    visuals.strobo01();
  } 

}


void keyPressed() {
  //BPM.syncBPM(millis());
  BPM.tap();
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