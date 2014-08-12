class VisualParent{
	// Visuals visuals;
	int color01,color02,color03,color04,color05;
	color [] paleta;
	int [] colores;

	//Tempo variables
	float momentoBeat,momentoCompas,momento4Compases,momento8Compases;
	int cantidadBeats,cantidadCompases; 
  Boolean cambiobeat,cambiocompas,cambio2compases,cambio4compases,cambio8compases;


  VisualParent(){
  	colores = new int[5];
  	paleta = new color[5];
  }


	void init(){
		color01 = 1;
		color02 = 2;
		color03 = 3;
		color04 = 4;
		color05 = 5;
		colores[0] = color01;
		colores[1] = color02;
		colores[2] = color03;
		colores[3] = color04;
		colores[4] = color05;
	}

	void updateBPM(Visuals visuals){
		momentoBeat = visuals.BPM.momentoBeat;
		momentoCompas = visuals.BPM.momentoCompas;
		momento4Compases = visuals.BPM.momento4Compases;
		momento8Compases = visuals.BPM.momento8Compases;
		cantidadBeats = visuals.BPM.cantidadBeats;
		cantidadCompases = visuals.BPM.cantidadBeats;
		cambiobeat = visuals.BPM.cambiobeat;
		cambiocompas = visuals.BPM.cambiocompas;
		cambio2compases = visuals.BPM.cambio2compases;
		cambio4compases = visuals.BPM.cambio4compases;
		cambio8compases = visuals.BPM.cambio8compases;
	}

	void updateColorFeed(Visuals visuals){
		paleta = visuals.colorFeed.paletaActual;
	}


	void flipColors(){
		color01 = int(random(0,5));
		color02 = int(random(0,5));
		color03 = int(random(0,5));
		color04 = int(random(0,5));
		color05 = int(random(0,5));
		colores[0] = color01;
		colores[1] = color02;
		colores[2] = color03;
		colores[3] = color04;
		colores[4] = color05;
	}

}