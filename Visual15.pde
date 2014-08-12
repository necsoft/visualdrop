  class Visual15 extends VisualParent{
    Visuals visuals;
    Visual15(Visuals _visuals){
      visuals = _visuals;
      init();
    }

    void show(){
      updateBPM(visuals);
      updateColorFeed(visuals);

    }


  }