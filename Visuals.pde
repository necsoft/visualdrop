/*//////////////////////////////////////////////////////////////////////////
 visuals
 ------------------------------------------------------------------------
 Este es un ejemplo de una visual.
 *///////////////////////////////////////////////////////////////////////////


 class Visuals{

  Visual01 visual01;
  Visual02 visual02;
  Visual03 visual03;
  Visual04 visual04;
  Visual05 visual05;
  Visual06 visual06;
  Visual07 visual07;

  SRTKshapes SRTKshapes;

  ColorFeed colorFeed;

  BPM BPM;

  Boolean showBackground = true;

  Visuals(BPM BPM,ColorFeed _colorFeed) {
    this.BPM = BPM;

    visual01 = new Visual01(this);
    visual02 = new Visual02(this);
    visual03 = new Visual03(this);
    visual04 = new Visual04(this);
    visual05 = new Visual05(this);
    visual06 = new Visual06(this);

    colorFeed = _colorFeed;

    SRTKshapes = new SRTKshapes();

  }

  void passMe(ColorFeed _colorFeed){
    colorFeed = _colorFeed;
  }


  void flash01(){
    fill(255);
    rect(0, 0, width, height);
  }


  void strobo01(){
    if(frameCount % 10 == 0){
      fill(255);
      rect(0, 0, width, height);
      }else{
       fill(0);
       rect(0, 0, width, height);   
     }
   }

 };
