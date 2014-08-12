  class Visual03 extends VisualParent{
    Visuals visuals;
    float desfaserandom;
    int nroColorActual = 0;
    int direccion;

    Visual03(Visuals _visuals){
      visuals = _visuals;
      desfaserandom = random(TWO_PI);
    }

    void show(){
      updateBPM(visuals);
      updateColorFeed(visuals);


      if(cambio4compases){
       //desfaserandom = random(TWO_PI);
       //nroColorActual = int(random(0,4));
     }

     //Arco-fills
     pushMatrix();
     translate(width/2,height/2);
     for (int i = 0; i < 10; ++i) {
     rotate(momentoCompas*0.6);
     fill(paleta[i%5],200);
     arc(0,0, momentoCompas*width*0.4+i*20, momentoCompas*width*0.4+i*20,desfaserandom,(momentoCompas*TWO_PI)+desfaserandom);      
     }


     //Arco alrededor
     pushMatrix();
     for(int i = 0; i < 20; ++i) {
      rotate(momento8Compases*0.3);
       noFill();
       stroke(paleta[i%4]);
       noFill();
       strokeWeight(momento8Compases*4+5);
       arc(0,0,50+momento8Compases*width*0.3+i*60,50+momento8Compases*width*0.3+i*60,1,4); 
     }
     popMatrix();



     popMatrix();
   }


 }