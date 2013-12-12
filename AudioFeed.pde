class AudioFeed{

	Minim minim;
	AudioInput in;

	AudioFeed(){
		minim = new Minim(this);
		in = minim.getLineIn();

	}




}