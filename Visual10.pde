  class Visual10 extends VisualParent{
    Visuals visuals;
    Visual10(Visuals _visuals){
      visuals = _visuals;
      init();
    }

    void show(){
      updateBPM(visuals);
      updateColorFeed(visuals);

    }


  }