/*
                     __  ____               
 _______________/  |/  (_)  _____  _____
 / ___/ ___/ ___/ /|_/ / / |/_/ _ \/ ___/
 (__  ) /  / /__/ /  / / />  </  __/ /    
 /____/_/   \___/_/  /_/_/_/|_|\___/_/     
 
 ------------------------------------------------------------------------
 El srcMixter mezcla un source y un pgraphics para dar una imagen que es
 el resultado de ambas.
 
 Input:
 * PImage => img (Es la imagen que le pasamos de src)
 * PGraphics => mask_img (Es la máscara que le pasamos, tiene que tener el mismo tamaño que el src)
 
 Output:
 * Pimage => result 
 
 ------------------------------------------------------------------------
 */

class SrcMixer {

  PImage img;
  PGraphics mask_img;
  PImage result_img;
  
  String adresse;
  String short_name;
  String lat;
  String lng;

  //Inicializarlo con un PImage
  SrcMixer(PImage p_img, PGraphics p_mask_img) {
    short_name = "";
    img = p_img;
    mask_img = p_mask_img;
    result_img = createImage(img.width, img.height, ARGB);
  }

  //Inicializarlo con una ruta hacia una imagen.
  SrcMixer(String p_img, PGraphics p_mask_img) {
    short_name = "";
    img = loadImage(p_img);
    mask_img = p_mask_img;
    result_img = createImage(img.width, img.height, ARGB);
  }


  void update(PGraphics p_mask_img) {
    mask_img = p_mask_img;
  }



  //Aca se mezcla el img mas el mask y devuelve un result_img.
  void imgProcess() {
    for (int i = 0; i < img.width*img.height ; i++) {

      // Var para determinar el punto x y el punto y actual
      int offset = i % img.width;
      int pitch = int(i/img.width);
      int x = offset;
      int y = pitch;

      //Color de la mascara en esta instancia
      color c_mask = mask_img.get(x, y);

      // Color resultado
      color c_result;

      // Preguntamos que color tiene el pixel si es blanco dibuja opaco
      // de lo contrario dibuja con transparencia o directamente transparente. 
      if (c_mask > color(240)) {
        //Asignamos el valor de la imagen de entrada
        c_result = img.get(x, y);
      }
      else {
        //Este es un fix para "captar" el antialiasing de la mascara
        float bright_colormask = brightness(c_mask);
        color color_image = img.get(x, y);
        c_result = color(red(color_image), green(color_image), blue(color_image), bright_colormask);
      }

      //Guardamos y actualizamos el pixel.
      result_img.pixels[i] = c_result;
      result_img.updatePixels();
    }
  }

  PImage get() {
    return result_img;
  }
  
  PImage get_image() {
    return img;
  }
};
