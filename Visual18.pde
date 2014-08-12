  class Visual18 extends VisualParent{
    Visuals visuals;
    Visual18(Visuals _visuals){
      visuals = _visuals;
      init();
    }

    void show(){
      updateBPM(visuals);
      updateColorFeed(visuals);

    }


  }