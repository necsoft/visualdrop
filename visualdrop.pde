/*//////////////////////////////////////////////////////////////////////////
 VisualDrop
 ------------------------------------------------------------------------
 
 *///////////////////////////////////////////////////////////////////////////


import oscP5.*;
import netP5.*;

BPM BPM;
OscFeed oscFeed;

Visuals visuals;




float tempo = 73;
float numeradorCompas = 4;


void setup() {
  size(800, 600);

  BPM = new BPM(tempo, numeradorCompas);
  visuals = new Visuals(BPM);
  oscFeed = new OscFeed();
}

void draw() {
  background(230);
  BPM.run();

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


































/*//////////////////////////////////////////////////////////////////////////
 BPM
 ------------------------------------------------------------------------
 Esta es la clase que se encarga de devolver a todas las demas clases
 el momento de los BPM que estamos trabajando. 
 *///////////////////////////////////////////////////////////////////////////


class BPM {

  //Variables globales
  float tempo;
  float numeradorCompas;

  //Momentos utiles
  float momentoBeat;
  float momentoCompas;
  float cantidadBeats;
  float cantidadCompases;


  float startTime;
  float syncTime;
  float msXBeat;

  BPM(float tempo, float numeradorCompas) {
    this.tempo = tempo;
    this.numeradorCompas = numeradorCompas;
    syncTime = 0;
    startTime = millis();
    msXBeat = 1000/(tempo/60.0);
  }


  void run() {
    momentoBeat = (millis() - startTime) / msXBeat;
    momentoCompas = ( (millis() - startTime) / msXBeat) / numeradorCompas;

    cantidadBeats = int(momentoBeat);
    cantidadCompases = int(momentoBeat)/numeradorCompas;

    println(momentoBeat);
    println(momentoCompas);
    println(cantidadBeats);
    println(cantidadCompases);
    
    momentoBeat -= int(momentoBeat);
    momentoCompas -= int(momentoCompas);
         
    
  }

  void syncBPM(float syncTime) {
    startTime = syncTime;
  }

  void showBPMmonitor() {
  }
};





















/*//////////////////////////////////////////////////////////////////////////
 oscFeed
 ------------------------------------------------------------------------
 Esta es la clase que simplifica un poco el uso de OSC dentro de 
 visualDrop.
 *///////////////////////////////////////////////////////////////////////////



class OscFeed {

  OscP5 oscP5;
  NetAddress myRemoteLocation;


  //Mis variables OSC
  float visual01Bang;
  float visual02Bang;
  float visual03Bang;




  OscFeed() {
    oscP5 = new OscP5(this, 12000);
    myRemoteLocation = new NetAddress("192.168.0.3", 12001);
  }





  void oscEvent(OscMessage theOscMessage) {
    myPatterns(theOscMessage);
    println("### Recibido mensaje con la siguiente ruta:"+theOscMessage.addrPattern());
  }





  /*
        Esta la seccion
   */

  void myPatterns(OscMessage theOscMessage) {


    if (theOscMessage.checkAddrPattern("/visualbang/1/1")==true) {
      if (theOscMessage.checkTypetag("f")) {
        visual01Bang = theOscMessage.get(0).floatValue();
      }
    }

    if (theOscMessage.checkAddrPattern("/visualbang/1/2")==true) {
      if (theOscMessage.checkTypetag("f")) {
        visual02Bang = theOscMessage.get(0).floatValue();
      }
    }

    if (theOscMessage.checkAddrPattern("/visualbang/1/3")==true) {
      if (theOscMessage.checkTypetag("f")) {
        visual03Bang = theOscMessage.get(0).floatValue();
      }
    }
  }
};


























/*//////////////////////////////////////////////////////////////////////////
 visuals
 ------------------------------------------------------------------------
 Este es un ejemplo de una visual.
 *///////////////////////////////////////////////////////////////////////////


class Visuals {

  BPM BPM;

  Visuals(BPM BPM) {
    this.BPM = BPM;
  }

  void show01() {        
    noStroke();
    fill(255);
    ellipse(width/2, height/2, BPM.momentoBeat*width, BPM.momentoBeat*width);
    fill(#00FF88, 200);
    ellipse(width/2, height/2, BPM.momentoCompas*width, BPM.momentoCompas*width);
  }


  void show02() {
    noStroke();        
    fill(#00FF88);
    rect(BPM.momentoBeat*width, 0, width, height);
  }
  
  
  
  
  
  
};

