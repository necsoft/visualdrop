class ColorFeed{
	
	color [] paletaActual;

	ColorFeed(){
		paletaActual = new color[5];


		paletaActual[0] = color(#00FF88);
		paletaActual[1] = color(#8F00FF);
		paletaActual[2] = color(#FF0086);
		paletaActual[3] = color(#C1FF00);
		paletaActual[4] = color(#7050ff);


	}





	void setPaleta(int numeropaleta){


		if (numeropaleta == 1) {
			paletaActual[0] = color(#00FF88);
			paletaActual[1] = color(#8F00FF);
			paletaActual[2] = color(#FF0086);
			paletaActual[3] = color(#C1FF00);
			paletaActual[4] = color(#7050ff);
		}

		if (numeropaleta == 2) {
			paletaActual[0] = color(#556270);
			paletaActual[1] = color(#4ECDC4);
			paletaActual[2] = color(#C7F464);
			paletaActual[3] = color(#FF6B6B);
			paletaActual[4] = color(#C44D58);			
		}


		if (numeropaleta == 3) {
			paletaActual[0] = color(#ABABAB);
			paletaActual[1] = color(#888888);
			paletaActual[2] = color(#D3FF00);
			paletaActual[3] = color(#EF407D);
			paletaActual[4] = color(#5BFFD3);			
		}

		if (numeropaleta == 4) {
			paletaActual[0] = color(#46433A);
			paletaActual[1] = color(#59B2B7);
			paletaActual[2] = color(#FFEECE);
			paletaActual[3] = color(#CE534D);
			paletaActual[4] = color(#C6B697);			
		}

		if (numeropaleta == 5) {
			paletaActual[0] = color(#FDE6BD);
			paletaActual[1] = color(#A1C5AB);
			paletaActual[2] = color(#F4DD51);
			paletaActual[3] = color(#D11E48);
			paletaActual[4] = color(#632F53);			
		}

		if (numeropaleta == 6) {
			paletaActual[0] = color(#f47169);
			paletaActual[1] = color(#fcf8cd);
			paletaActual[2] = color(#64483c);
			paletaActual[3] = color(#200e0f);
			paletaActual[4] = color(#e75652);			
		}



	}

}