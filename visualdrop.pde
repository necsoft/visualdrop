/*//////////////////////////////////////////////////////////////////////////

____   ____.__                    .__  ________                       
\   \ /   /|__| ________ _______  |  | \______ \_______  ____ ______  
 \   Y   / |  |/  ___/  |  \__  \ |  |  |    |  \_  __ \/  _ \\____ \ 
  \     /  |  |\___ \|  |  // __ \|  |__|    `   \  | \(  <_> )  |_> >
   \___/   |__/____  >____/(____  /____/_______  /__|   \____/|   __/ 
                   \/           \/             \/             |__|    

---------------------------------------------------------------------------
Visualdrop es un conjunto de funcionalidades para facilitar la creación de
algoritmos gráficos para visuales en tiempo real.

Actualmente esta funcionando con un patch de toucOSC que es el que se encarga
de disparar los parametros que cambian el flujo. 
 
///////////////////////////////////////////////////////////////////////////*/

import processing.opengl.*;
import oscP5.*;
import netP5.*;
import ddf.minim.*;

// FullScreen fs; 
Vd vd;

// Constantes ---------------------------------------------//

final int FIRST_MONITOR_WIDTH = 1440;
final int SECOND_SCREEN_WIDTH = 1920;
final int SECOND_SCREEN_HEIGHT = 1080;
final int MAC_RECEIVE_PORT = 12000;
final int IPAD_RECEIVE_PORT = 12001;
final String IPAD_IP = "192.168.0.103";

final int GRID_BANG_WIDTH = 7;
final int GRID_BANG_HEIGHT = 3;
final int GRID_TOGGLE_WIDTH = 7;
final int GRID_TOGGLE_HEIGHT = 3;

//BPM
int tempo = 119;
int numeradorCompas = 4;


boolean calibrar = true;
CPunto[] mascara;


//-------------------------------------------------------------//


void setup() {
  size(SECOND_SCREEN_WIDTH , SECOND_SCREEN_HEIGHT,OPENGL);
  frame.setLocation(FIRST_MONITOR_WIDTH,0);
  vd = new Vd(tempo,numeradorCompas);
  mascara = new CPunto[4];
  mascara[0] = new CPunto(100, 100);
  mascara[1] = new CPunto(100, height-100);
  mascara[2] = new CPunto(width-100, height-100);
  mascara[3] = new CPunto(width-100, 100);
  frameRate(60);
}

void draw() {
  blendMode(BLEND);
  vd.run();





  hint(DISABLE_DEPTH_TEST);
  mappingMask();
  hint(ENABLE_DEPTH_TEST);

}


public void init(){
  frame.removeNotify();
  frame.setUndecorated(true);
  frame.setAlwaysOnTop(true); 
  frame.addNotify();
  super.init();
}



void keyReleased(){

    if (key == 'm' || key == 'M') {
      calibrar = !calibrar;
      println("calibrar: "+calibrar);
    }

}




void mappingMask(){

  if (calibrar) {
    for (int i = 0; i < mascara.length; i++) {
      mascara[i].act();
    }
  }

  noStroke();
  fill(0);
  beginShape();
  vertex(width, 0);
  vertex(width, height);
  vertex(0, height);
  vertex(0, 0);
  vertex(mascara[0].x, mascara[0].y); 
  vertex(mascara[1].x, mascara[1].y); 
  vertex(mascara[2].x, mascara[2].y); 
  vertex(mascara[3].x, mascara[3].y); 
  vertex(mascara[0].x, mascara[0].y);
  vertex(0, 0);
  endShape(CLOSE);
}



