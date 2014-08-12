  class Visual16 extends VisualParent{
    Visuals visuals;
    Visual16(Visuals _visuals){
      visuals = _visuals;
      init();
    }

    void show(){
      updateBPM(visuals);
      updateColorFeed(visuals);

    }


  }