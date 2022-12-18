// Coding Train
// Ported to processing by Max (https://github.com/TheLastDestroyer)
// Origional JS by Daniel Shiffman
// http://patreon.com/codingtrain
// Code for this video: https://youtu.be/BAejnwN4Ccw

PVector[] cities;

int totalCities = 300*351;
int xxx=0;
int r=0,g=0,b=0;
float recordDistance;
PVector[] bestEver;
PImage img;
void setup() {
  size(1024, 1024);
  img=loadImage("img.jpg");
  //img.filter(GRAY);
  img.loadPixels();
  cities = new PVector[img.width*img.height];
  int index;
  bestEver = new PVector[img.width*img.height];
  for(int x=0;x<img.width-11;x+=3){
    for(int y=0;y<img.height-11;y+=3){
      index=x+y*img.width;
      color pix=img.pixels[index];
      if(red(pix)+blue(pix)+green(pix)>450){
        
    PVector v = new PVector(x*3, y*3);
    cities[xxx] = v;
    xxx++;
      }


    }}
img.updatePixels();
 


  float d = calcDistance(cities);
  recordDistance = d;
  arrayCopy(cities, bestEver);

}

void draw() {
  background(0);
  fill(255);
  for (int i = 0; i <xxx-1; i++) {
    ellipse(cities[i].x, cities[i].y, 3, 3);
  }

  stroke(255);
  strokeWeight(0.01);
  noFill();
  beginShape();
 
  for (int i = 0; i < xxx; i++) {
    vertex(cities[i].x, cities[i].y);
  }
   

  endShape();

  stroke(255);

  strokeWeight(2.5);
  noFill();
  beginShape();
  for (int i = 0; i < xxx; i++) {
    vertex(bestEver[i].x, bestEver[i].y);
  }
  endShape();



//////////////////////////////////////////////////////////////////////////////////////////////////
  int j = floor(random(xxx));
  // int i = floor(random(xxx));
 // int i=0;
 

   for(int r=j+1;r<xxx;r++){
       swap(cities, j, r);
  float d1 = calcDistance(cities);
       if (d1< recordDistance) {
 
    recordDistance = d1;
    print(d1+"                         "+"\n" );
    arrayCopy(cities, bestEver);
  }}
//  swap(cities, i, j);
 if(j%2==0)
swap(cities,0,xxx-1);///////////////////////////////////////////////////////////////////////////////
else
swap(cities,0,xxx-1);//////////////////////////////////////////////////////////////////////////////////

  float d = calcDistance(cities);
 
  if (d< recordDistance) {
 
    recordDistance = d;
    print(d+"                         "+"\n" );
    arrayCopy(cities, bestEver);
  }
  
    
  
    
 // swap(cities, i+r, j);//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
 r++;
 if(r>xxx-2)r=0;
 
  
}

void swap(PVector[] a, int i, int j) {
  PVector temp = a[i];
  a[i] = a[j];
  a[j] = temp;
}


float calcDistance(PVector[] points) {
  float sum = 0;
  
  for (int i =xxx-1; i > 1; i--) {
    float d = dist(points[i].x, points[i].y, points[i - 1].x, points[i - 1].y);
    sum += d;
  }
  return sum;
}
