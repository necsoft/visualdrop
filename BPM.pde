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
  float momento4Compases;
  float momento8Compases;
  int cantidadBeats;
  int cantidadCompases;
  
  float startTime;
  float syncTime;
  float msXBeat;

  //Variables para el tap
  float [] tapTime;
  float [] tapDistance;
  int indiceTap=0;
  float tempoAproximado=120;



  //Booleanos de cambio de compas
  Boolean cambiocompas=false;
  Boolean cambio2compases=false;
  Boolean cambio4compases=false;
  Boolean cambio8compases=false;
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

    //Inicializo el tapper
    tapTime = new float[4];
    tapDistance = new float[4];
    for (int i=0;i<tapTime.length;i++) {
      tapTime[i] = 0;
    }

    for (int i=0;i<tapDistance.length;i++) {
      tapDistance[i] = 0;
    }
  };


  void run() {

    msXBeat = 1000/(tempo/60.0);

    momentoBeat = (millis() - startTime) / msXBeat;
    momentoCompas = ( (millis() - startTime) / msXBeat) / numeradorCompas;
    momento4Compases = ( (millis() - startTime) / (msXBeat*4)) / numeradorCompas;
    momento8Compases = ( (millis() - startTime) / (msXBeat*8)) / numeradorCompas;

    //Checkeo si en esta vuelva se cambio el compas
    if(cantidadCompases != int(int(momentoBeat)/numeradorCompas)){
      // println("Cambio de compas");
      cambiocompas=true;


      if(cantidadCompases%2==0){
        // println("Cambio 2 compases");
        cambio2compases = true;
      }

      if(cantidadCompases%4==0){
        // println("Cambio 4 compases");
        cambio4compases = true;
      }
    }else{
      cambiocompas=false;
      cambio2compases=false;
      cambio4compases=false;
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
    momento4Compases -= int(momento4Compases);
    momento8Compases -= int(momento8Compases);

  }



    //Sync

    void syncBPM(float syncTime) {
      startTime = syncTime;
    }

    



    //Tapper

    void tap(){
      tapDistance[indiceTap] = millis() - tapTime[indiceTap];

      if (indiceTap<tapTime.length-1) {
        indiceTap++;
      }
      else {
        indiceTap=0;
      }

      tempoAproximado = (1000/((tapDistance[0] + tapDistance[1] + tapDistance[2] + tapDistance[3])/4))*60;
      tapTime[indiceTap]=millis();

      println("Tempo Aproximado: "+tempoAproximado);
      tempo = tempoAproximado;
    }







  };