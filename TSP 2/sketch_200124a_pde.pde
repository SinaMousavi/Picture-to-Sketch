PImage img;
void setup(){
 
  size(1500,1500);
  img=loadImage("img.jpg");
  background(255);
  img.filter(GRAY);
  image(img,0,0);
   
}
int index(int x,int y){
  return x+y*img.width;
}
  int z=1;
void draw(){

 if(z==1){

   


img.loadPixels();

  for(int y=0;y<img.height-1;y++){
    for(int x=1;x<img.width-1;x++){

      int index=x+y*img.width;
      color pix=img.pixels[index];
    
      
      float red=red(pix);
      float green=green(pix);
      float blue=blue(pix);

      int f=1;
      int red1=round(f*red/255)*(255/f);
      int green1=round(f*green/255)*(255/f);
      int blue1=round(f*blue/255)*(255/f);
     float errR=red-red1;
     float errG=green-green1;
     float errB=blue-blue1;
     
     int i=index(x+1,y);
     color p=img.pixels[i];
     float r2=red(p);
     float g2=green(p);
     float b2=blue(p);
     r2=r2+errR*7/16.0;
     g2=g2+errG*7/16.0;
     b2=b2+errB*7/16.0;
     img.pixels[i]=color(r2,g2,b2);
     
     
      i=index(x-1,y+1);
      p=img.pixels[i];
      r2=red(p);
      g2=green(p);
      b2=blue(p);
     r2=r2+errR*3/16.0;
     g2=g2+errG*3/16.0;
     b2=b2+errB*3/16.0;
     img.pixels[i]=   color(r2,g2,b2);
     
     
        i=index(x,y+1);
      p=img.pixels[i];
      r2=red(p);
      g2=green(p);
      b2=blue(p);
     r2=r2+errR*5/16.0;
     g2=g2+errG*5/16.0;
     b2=b2+errB*5/16.0;
     img.pixels[i]=   color(r2,g2,b2);
     
     
        i=index(x+1,y+1);
      p=img.pixels[i];
      r2=red(p);
      g2=green(p);
      b2=blue(p);
     r2=r2+errR*1/16.0;
     g2=g2+errG*1/16.0;
     b2=b2+errB*1/16.0;
     img.pixels[i]=   color(r2,g2,b2);
    
 
      
  }

}
}
img.updatePixels(); 
image(img,670,0);
z=0;
}
