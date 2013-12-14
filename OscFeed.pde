/*//////////////////////////////////////////////////////////////////////////
 oscFeed
 ------------------------------------------------------------------------
 Esta es la clase que simplifica un poco el uso de OSC dentro de 
 visualDrop.
 *///////////////////////////////////////////////////////////////////////////



 class OscFeed {

  OscP5 oscP5;
  BPM BPM;
  NetAddress myRemoteLocation;


  //Mis variables OSC
  float visual01Bang;
  float visual02Bang;
  float visual03Bang;
  float visual04Bang;
  float visual05Bang;
  float visual06Bang;
  float visual07Bang;
  float visual08Bang;
  float visual09Bang;

  float flash01;
  float strobo01;




  OscFeed(String remoteLocation,int thisPort,int thatPort,BPM BPM) {
    oscP5 = new OscP5(this, thisPort);//12000
    myRemoteLocation = new NetAddress(remoteLocation, thatPort);//12001
    this.BPM = BPM;
  }





  void oscEvent(OscMessage theOscMessage) {
    myPatterns(theOscMessage);
    println("### Recibido ------>"+theOscMessage.addrPattern());
  }


  void mandarMensajeInt(String rutamensaje, int mensaje){
    OscMessage myMessage = new OscMessage(rutamensaje);
    myMessage.add(int(mensaje));
    oscP5.send(myMessage, myRemoteLocation);
  }



  void myPatterns(OscMessage theOscMessage) {


  /*
  Patterns de tempo
  */


  if (theOscMessage.checkAddrPattern("/BPM/sync")==true) {
    if (theOscMessage.checkTypetag("f")) {
      if(theOscMessage.get(0).floatValue() == 1){
        BPM.syncBPM(millis());
      }
    }
  }


  if (theOscMessage.checkAddrPattern("/BPM/tap")==true) {
    if (theOscMessage.checkTypetag("f")) {
      if(theOscMessage.get(0).floatValue() == 1){
        BPM.tap();
      }
    }
  }

  if (theOscMessage.checkAddrPattern("/BPM/tempo_aumentar")==true) {
    if (theOscMessage.checkTypetag("f")) {
      BPM.tempoAproximado = int(BPM.tempoAproximado) + theOscMessage.get(0).floatValue();
    }
  }

  if (theOscMessage.checkAddrPattern("/BPM/tempo_disminuir")==true) {
    if (theOscMessage.checkTypetag("f")) {
      BPM.tempoAproximado = int(BPM.tempoAproximado) - theOscMessage.get(0).floatValue();
    }
  }





  /*
  Patterns de visuales
  */

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

  if (theOscMessage.checkAddrPattern("/visualbang/1/4")==true) {
    if (theOscMessage.checkTypetag("f")) {
      visual04Bang = theOscMessage.get(0).floatValue();
    }
  }

  if (theOscMessage.checkAddrPattern("/visualbang/1/5")==true) {
    if (theOscMessage.checkTypetag("f")) {
      visual05Bang = theOscMessage.get(0).floatValue();
    }
  }

  if (theOscMessage.checkAddrPattern("/visualbang/1/6")==true) {
    if (theOscMessage.checkTypetag("f")) {
      visual06Bang = theOscMessage.get(0).floatValue();
    }
  }

  if (theOscMessage.checkAddrPattern("/visualbang/1/7")==true) {
    if (theOscMessage.checkTypetag("f")) {
      visual07Bang = theOscMessage.get(0).floatValue();
    }
  }


  if (theOscMessage.checkAddrPattern("/visualbang/1/8")==true) {
    if (theOscMessage.checkTypetag("f")) {
      visual08Bang = theOscMessage.get(0).floatValue();
    }
  }

  if (theOscMessage.checkAddrPattern("/visualbang/1/9")==true) {
    if (theOscMessage.checkTypetag("f")) {
      visual09Bang = theOscMessage.get(0).floatValue();
    }
  }




  //Efectos

  if (theOscMessage.checkAddrPattern("/FX/flash")==true) {
    if (theOscMessage.checkTypetag("f")) {
      flash01 = theOscMessage.get(0).floatValue();
    }
  }

  if (theOscMessage.checkAddrPattern("/FX/strobo1x")==true) {
    if (theOscMessage.checkTypetag("f")) {
        strobo01 = theOscMessage.get(0).floatValue();
    }
  }



}
};