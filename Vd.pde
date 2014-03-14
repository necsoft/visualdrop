/*
Vd
----------------------------------------------------------------------------
Se encarga de gestionar todos los modulos internos de visualDrop.

*/

class Vd{

	//VisualDrop Toolkit
	BPM BPM;
	OscFeed oscFeed;
	Visuals visuals;
	AudioFeed audioFeed;
	ColorFeed colorFeed;

	//OSC
	int thisPort;
	int thatPort;
	String remoteLocation;

	//BPM
	float tempo;
	float numeradorCompas;

	Vd(int _tempo, int _numeradorCompas){
		tempo = _tempo;
		numeradorCompas = _numeradorCompas;

		BPM = new BPM(tempo, numeradorCompas,oscFeed);
		colorFeed = new ColorFeed();
		
		visuals = new Visuals(BPM,colorFeed);
		oscFeed = new OscFeed(BPM);

	}

	void run(){
		if(visuals.showBackground == true){
			background(0);
		}

		BPM.tempo = BPM.tempoAproximado; //
		BPM.run();

		sendTempo();//Manda el tempo aproximado a TouchOSC
		checkPatterns();//Checkea las rutas OSC

		visuals.passMe(colorFeed);
	}


	//-----------------------------------------------//
	// SendTempo
	//-----------------------------------------------//

	void sendTempo(){
		if(frameCount%30==0){
			oscFeed.mandarMensajeInt("/BPM/tempo_actual",int(BPM.tempoAproximado));
		}
	}


	//-----------------------------------------------//
	// CheckPatterns
	//-----------------------------------------------//

	void checkPatterns(){

		//Check toggles
		for (int i = 0; i < GRID_TOGGLE_WIDTH; ++i) {
			for (int j = 0; j < GRID_TOGGLE_HEIGHT; ++j) {
				if (oscFeed.visualGridToggle[i][j] == 1){
					if(i == 0 && j == 0){
						visuals.visual01.show();
					}
					if(i == 1 && j == 0){
						visuals.visual02.show();
					}
					if(i == 2 && j == 0){
						visuals.visual03.show();
					}					
					if(i == 3 && j == 0){
						visuals.visual04.show();
					}
					if(i == 4 && j == 0){
						visuals.visual05.show();
					}	
					if(i == 5 && j == 0){
						visuals.visual06.show();
					}		
					if(i == 6 && j == 0){
						visuals.visual07.show();
					}
				}

			}
		}


		//Check bangs
		for (int i = 0; i < GRID_BANG_WIDTH; ++i) {
			for (int j = 0; j < GRID_BANG_HEIGHT; ++j) {
				if (oscFeed.visualGridBang[i][j] == 1){
					if(i == 0 && j == 0){
						visuals.visual01.show();
					}
					if(i == 1 && j == 0){
						visuals.visual02.show();
					}
					if(i == 2 && j == 0){
						visuals.visual03.show();
					}					
					if(i == 3 && j == 0){
						visuals.visual04.show();
					}
					if(i == 4 && j == 0){
						visuals.visual05.show();
					}	
					if(i == 5 && j == 0){
						visuals.visual06.show();
					}		
					if(i == 6 && j == 0){
						visuals.visual07.show();
					}
				}

			}
		}

		if (oscFeed.flash01 == 1) {
			visuals.flash01();
		} 

	}

}