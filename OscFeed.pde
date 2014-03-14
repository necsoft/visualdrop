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



  float [][] visualGridBang;
  float [][] visualGridToggle;

  float flash01;
  float strobo01;




  OscFeed(BPM BPM) {
    oscP5 = new OscP5(this, MAC_RECEIVE_PORT);//12000
    myRemoteLocation = new NetAddress(IPAD_IP, IPAD_RECEIVE_PORT);//12001
    this.BPM = BPM;
    visualGridBang = new float[GRID_BANG_WIDTH][GRID_BANG_HEIGHT];
    visualGridToggle = new float[GRID_BANG_WIDTH][GRID_BANG_HEIGHT];

    for (int i = 0; i < GRID_BANG_WIDTH; ++i) {
      for (int j = 0; j < GRID_BANG_HEIGHT; ++j) {
        visualGridBang[i][j] = 0;
        visualGridToggle[i][j] = 0;     
      }
    }


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


  for (int i = 0; i < GRID_BANG_WIDTH; ++i) {
    for (int j = 0; j < GRID_BANG_HEIGHT; ++j) {
      if (theOscMessage.checkAddrPattern("/visualbang/"+(int(j)+int(1))+"/"+(int(i)+int(1)))==true) {
        println("/visualbang/"+(int(j)+int(1))+"/"+(int(i)+int(1)));
        if (theOscMessage.checkTypetag("f")) {
          visualGridBang[i][j] = theOscMessage.get(0).floatValue();
        }
      }
    }
  }

  for (int i = 0; i < GRID_TOGGLE_WIDTH; ++i) {
    for (int j = 0; j < GRID_TOGGLE_HEIGHT; ++j) {
      if (theOscMessage.checkAddrPattern("/visualtoggle/"+(int(j)+int(1))+"/"+(int(i)+int(1)))==true) {
        println("/visualtoggle/"+(int(j)+int(1))+"/"+(int(i)+int(1)));
        if (theOscMessage.checkTypetag("f")) {
          visualGridToggle[i][j] = theOscMessage.get(0).floatValue();
        }
      }
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