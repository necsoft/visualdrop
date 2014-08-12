  class Visual20 extends VisualParent{
    Visuals visuals;
    Visual20(Visuals _visuals){
      visuals = _visuals;
      init();
    }

    void show(){
      updateBPM(visuals);
      updateColorFeed(visuals);

    }


  }