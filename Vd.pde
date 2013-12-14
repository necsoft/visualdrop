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



	Vd(int _thisPort,int _thatPort, String _remoteLocation, int _tempo, int _numeradorCompas){

		thisPort = _thisPort;
		thatPort = _thatPort;
		remoteLocation = _remoteLocation;
		tempo = _tempo;
		numeradorCompas = _numeradorCompas;

		BPM = new BPM(tempo, numeradorCompas,oscFeed);
		colorFeed = new ColorFeed();
		
		visuals = new Visuals(BPM,colorFeed);
		oscFeed = new OscFeed(remoteLocation,thisPort,thatPort,BPM);

		

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
		if (oscFeed.visual01Bang == 1) {
			visuals.visual01.show();
		}

		if (oscFeed.visual02Bang == 1) {
			visuals.visual02.show();
		}

		if (oscFeed.visual03Bang == 1) {
			visuals.visual03.show();
		}  

		if (oscFeed.visual04Bang == 1) {
			visuals.visual04.show();
		}

		if (oscFeed.visual05Bang == 1) {
			visuals.visual05.show();
		}

		if (oscFeed.visual06Bang == 1) {
			visuals.visual06.show();
		}  

		if (oscFeed.visual07Bang == 1) {
			visuals.visual07.show();
		}

		if (oscFeed.visual08Bang == 1) {
			
		}

		if (oscFeed.visual09Bang == 1) {
			
		}  

		if (oscFeed.flash01 == 1) {
			visuals.flash01();
		} 

		if (oscFeed.strobo01 == 1) {
			
		} 
	}


}