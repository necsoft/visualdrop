  class Visual21 extends VisualParent{
    Visuals visuals;
    Visual21(Visuals _visuals){
      visuals = _visuals;
      init();
    }

    void show(){
      updateBPM(visuals);
      updateColorFeed(visuals);

    }


  }