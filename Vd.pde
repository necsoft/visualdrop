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
		audioFeed = new AudioFeed();
		
		visuals = new Visuals(BPM,colorFeed);
		oscFeed = new OscFeed(BPM);

	}

	void run(){
		if(oscFeed.background == 1){
			background(0);
		}
		BPM.tempo = BPM.tempoAproximado; //
		BPM.run();

		sendTempo();//Manda el tempo aproximado a TouchOSC
		checkPatterns();//Checkea las rutas OSC

		visuals.passMe(colorFeed);

		if(oscFeed.glitch == 1){
			applyGlitch();
		}else{
			blendMode(BLEND);
		}

		if(oscFeed.paleta == 1){
			colorFeed.setPaleta(1);
			oscFeed.paleta = 0;
		}

		if(oscFeed.paleta == 2){
			colorFeed.setPaleta(2);
			oscFeed.paleta = 0;
		}

		if(oscFeed.paleta == 3){
			colorFeed.setPaleta(3);
			oscFeed.paleta = 0;
		}

		if(oscFeed.paleta == 4){
			colorFeed.setPaleta(4);
			oscFeed.paleta = 0;
		}

		if(oscFeed.paleta == 5){
			colorFeed.setPaleta(5);
			oscFeed.paleta = 0;
		}

		if(oscFeed.paleta == 6){
			colorFeed.setPaleta(6);
			oscFeed.paleta = 0;
		}





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
					// if(i == 0 && j == 1){
					// 	visuals.visual08.show();
					// }
					// if(i == 1 && j == 1){
					// 	visuals.visual09.show();
					// }
					// if(i == 2 && j == 1){
					// 	visuals.visual10.show();
					// }				
					// if(i == 3 && j == 1){
					// 	visuals.visual11.show();
					// }
					// if(i == 4 && j == 1){
					// 	visuals.visual12.show();
					// }
					// if(i == 5 && j == 1){
					// 	visuals.visual13.show();
					// }
					// if(i == 6 && j == 1){
					// 	visuals.visual14.show();
					// }					
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

		
		hint(DISABLE_DEPTH_TEST);
		noStroke();
		fill(0,vd.oscFeed.opacity*255);
		rect(0,0, width, height);
		hint(ENABLE_DEPTH_TEST);

	}






}
