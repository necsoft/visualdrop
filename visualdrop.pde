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

import oscP5.*;
import netP5.*;
import ddf.minim.*;

Vd vd;

// Inicializacion ---------------------------------------------//

//OSC
int thisPort = 12000;
int thatPort = 12001;
String remoteLocation = "192.168.0.3";

//BPM
int tempo = 120;
int numeradorCompas = 4;

//-------------------------------------------------------------//


void setup() {
  size(800, 600);
  vd = new Vd(thisPort,thatPort,remoteLocation,tempo,numeradorCompas);
}

void draw() {
  vd.run();
}