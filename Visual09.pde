  class Visual09 extends VisualParent{
    Visuals visuals;
    Visual09(Visuals _visuals){
      visuals = _visuals;
      init();
    }

    void show(){
      updateBPM(visuals);
      updateColorFeed(visuals);

    }


  }