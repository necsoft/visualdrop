  class Visual13 extends VisualParent{
    Visuals visuals;
    Visual13(Visuals _visuals){
      visuals = _visuals;
      init();
    }

    void show(){
      updateBPM(visuals);
      updateColorFeed(visuals);

    }


  }