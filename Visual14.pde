  class Visual14 extends VisualParent{
    Visuals visuals;
    Visual14(Visuals _visuals){
      visuals = _visuals;
      init();
    }

    void show(){
      updateBPM(visuals);
      updateColorFeed(visuals);

    }


  }