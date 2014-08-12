  class Visual19 extends VisualParent{
    Visuals visuals;
    Visual19(Visuals _visuals){
      visuals = _visuals;
      init();
    }

    void show(){
      updateBPM(visuals);
      updateColorFeed(visuals);

    }


  }