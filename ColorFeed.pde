class ColorFeed{
	
	color [] paletaActual;

	ColorFeed(){
		paletaActual = new color[5];


		paletaActual[0] = color(#00FF88);
		paletaActual[1] = color(#8F00FF);
		paletaActual[2] = color(#FF0086);
		paletaActual[3] = color(#C1FF00);


	}





	void setPaleta(int numeropaleta){


		if (numeropaleta == 1) {
			paletaActual[0] = color(#00FF88);
			paletaActual[1] = color(#8F00FF);
			paletaActual[2] = color(#FF0086);	
		}

		if (numeropaleta == 2) {
			paletaActual[0] = color(#ff9932);
			paletaActual[1] = color(#ff6277);
			paletaActual[2] = color(#86c0ff);
		}

	}

}