  class Visual17 extends VisualParent{
    Visuals visuals;
    Visual17(Visuals _visuals){
      visuals = _visuals;
      init();
    }

    void show(){
      updateBPM(visuals);
      updateColorFeed(visuals);

    }


  }