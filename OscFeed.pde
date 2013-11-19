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


  void mandarMensajeInt(String rutamensaje, int mensaje){
    OscMessage myMessage = new OscMessage(rutamensaje);
    myMessage.add(int(mensaje));
    oscP5.send(myMessage, myRemoteLocation);
  }



  void myPatterns(OscMessage theOscMessage) {

  // Manejo del tempo
  if (theOscMessage.checkAddrPattern("/BPM/tempo_aumentar")==true) {
    if (theOscMessage.checkTypetag("f")) {
      tempo = tempo + theOscMessage.get(0).floatValue();
    }
  }

  if (theOscMessage.checkAddrPattern("/BPM/tempo_disminuir")==true) {
    if (theOscMessage.checkTypetag("f")) {
      tempo = tempo - theOscMessage.get(0).floatValue();
    }
  }


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