  class Visual12 extends VisualParent{
    Visuals visuals;
    Visual12(Visuals _visuals){
      visuals = _visuals;
      init();
    }

    void show(){
      updateBPM(visuals);
      updateColorFeed(visuals);

    }


  }