/*//////////////////////////////////////////////////////////////////////////
 visuals
 ------------------------------------------------------------------------
 Este es un ejemplo de una visual.
 *///////////////////////////////////////////////////////////////////////////


 class Visuals {

  BPM BPM;

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
  
  
  
  
  
  
};