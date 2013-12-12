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
		visuals = new Visuals(BPM);
		oscFeed = new OscFeed(remoteLocation,thisPort,thatPort,BPM);

	}





	void run(){
		background(0);
		BPM.tempo = BPM.tempoAproximado;
		BPM.run();
		if(frameCount%30==0){
			oscFeed.mandarMensajeInt("/BPM/tempo_actual",int(BPM.tempoAproximado));
		}
		checkPatterns();
	}









	void checkPatterns(){
		if (oscFeed.visual01Bang == 1) {
			visuals.show01();
		}

		if (oscFeed.visual02Bang == 1) {
			visuals.show02();
		}

		if (oscFeed.visual03Bang == 1) {
			visuals.show03();
		}  

		if (oscFeed.visual04Bang == 1) {
			visuals.show04();
		}

		if (oscFeed.visual05Bang == 1) {
			visuals.show05();
		}

		if (oscFeed.visual06Bang == 1) {
			visuals.show06();
		}  

		if (oscFeed.visual07Bang == 1) {
			visuals.show07();
		}

		if (oscFeed.visual08Bang == 1) {
			visuals.show08();
		}

		if (oscFeed.visual09Bang == 1) {
			visuals.show09();
		}  

		if (oscFeed.flash01 == 1) {
			visuals.flash01();
		} 

		if (oscFeed.strobo01 == 1) {
			visuals.strobo01();
		} 
	}



}