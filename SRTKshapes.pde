class SRTKshapes{


	SRTKshapes(){


	}




	void drawCross(float posx, float posy, float tam, float rot, float thickness) {
		pushMatrix();
		translate(posx, posy);
		rotate(radians(rot));
		rectMode(CENTER);
		noStroke();
		rect(0, 0, tam, tam*thickness);
		rect(0, 0, tam*thickness, tam);
		rectMode(CORNER);
		popMatrix();
	}





}