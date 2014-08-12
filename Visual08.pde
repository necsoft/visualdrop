  class Visual08 extends VisualParent{
    Visuals visuals;
    Visual08(Visuals _visuals){
      visuals = _visuals;
      init();
    }

    void show(){
      updateBPM(visuals);
      updateColorFeed(visuals);

    }


  }