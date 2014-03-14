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

final int SECOND_SCREEN_WIDTH = 1920;
final int SECOND_SCREEN_HEIGHT = 1080;
final int MAC_RECEIVE_PORT = 12000;
final int IPAD_RECEIVE_PORT = 12001;
final String IPAD_IP = "192.168.0.103";

//BPM
int tempo = 120;
int numeradorCompas = 4;

//-------------------------------------------------------------//


void setup() {
  size(SECOND_SCREEN_WIDTH , SECOND_SCREEN_HEIGHT,OPENGL);
  frame.setLocation(1440,0);
  vd = new Vd(MAC_RECEIVE_PORT,IPAD_RECEIVE_PORT,IPAD_IP,tempo,numeradorCompas);

}

void draw() {
  vd.run();
}



// public void init(){
//   frame.removeNotify();
//   frame.setUndecorated(true);
//   frame.setAlwaysOnTop(true); 
//   frame.addNotify();
//   super.init();
// }

