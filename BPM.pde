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
  int cantidadBeats;
  int cantidadCompases;

  //
  float startTime;
  float syncTime;
  float msXBeat;

  //Booleanos de cambio de compas
  Boolean cambiocompas=false;
  Boolean cambiobeat=false;



  //Importado para mandar los momentos a los pills
  OscFeed oscFeed;



  BPM(float tempo, float numeradorCompas,OscFeed oscFeed) {
    this.tempo = tempo;
    this.numeradorCompas = numeradorCompas;
    this.oscFeed = oscFeed ;
    syncTime = 0;
    startTime = millis();
    msXBeat = 1000/(tempo/60.0);
  };


  void run() {
    momentoBeat = (millis() - startTime) / msXBeat;
    momentoCompas = ( (millis() - startTime) / msXBeat) / numeradorCompas;


    //Checkeo si en esta vuelva se cambio el compas
    if(cantidadCompases != int(int(momentoBeat)/numeradorCompas)){
      //println("Cambio de compas");
      cambiocompas=true;
    }else{
      cambiocompas=false;
    }


    //Checkeo si en esta vuelta se cambio el beat
    if(cantidadBeats != int(momentoBeat)){
      cambiobeat=true;
    }else{
      cambiobeat=false;
    }






    cantidadBeats = int(momentoBeat);
    cantidadCompases = int(int(momentoBeat)/numeradorCompas);



    momentoBeat -= int(momentoBeat);
    momentoCompas -= int(momentoCompas);



    // println("============================================");
    // println("momentoBeat"+momentoBeat);
    // println("momentoCompas"+momentoCompas);
    // println("cantidadBeats"+cantidadBeats);
    // println("cantidadCompases"+cantidadCompases);
    // println("============================================");

  }

  void syncBPM(float syncTime) {
    startTime = syncTime;
  }

  void showBPMmonitor() {
  }
};
