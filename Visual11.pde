  class Visual11 extends VisualParent{
    Visuals visuals;
    Visual11(Visuals _visuals){
      visuals = _visuals;
      init();
    }

    void show(){
      updateBPM(visuals);
      updateColorFeed(visuals);

    }


  }