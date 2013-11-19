/*//////////////////////////////////////////////////////////////////////////
 visuals
 ------------------------------------------------------------------------
 Este es un ejemplo de una visual.
 *///////////////////////////////////////////////////////////////////////////


 class Visuals {


  BPM BPM;

  float desfaserandom = random(TWO_PI);



  Visuals(BPM BPM) {
    this.BPM = BPM;
  }

  void show01() {        
    noStroke();
    fill(255);
    ellipse(width/2, height/2, BPM.momentoBeat*width, BPM.momentoBeat*width);
    fill(#00FF88, 200);
    ellipse(width/2, height/2, BPM.momentoCompas*width, BPM.momentoCompas*width);
  }


  void show02() {
    noStroke();        
    fill(#00FF88);
    rect(BPM.momentoBeat*width, 0, width, height);
  }
  
  
  
  void show03(){
    if(BPM.cambiobeat){
     desfaserandom = random(TWO_PI);
    }
    
    fill(#00FF88);
    arc(width/2, height/2, BPM.momentoBeat*width, BPM.momentoBeat*width,desfaserandom,(BPM.momentoBeat*TWO_PI)+desfaserandom);
  }



  
  
};