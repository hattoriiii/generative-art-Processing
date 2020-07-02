
int count = 3;
int seed = 0;

void setup(){
    size(800,800);
    background(80);
    blendMode(BLEND);
    colorMode(HSB,360,100,100,100);
}

void draw(){
  randomSeed(seed);
  arcCircle(0,0,width,height,count);
}

void arcCircle(float posX, float posY, float sizeX, float sizeY, int n) {
  float alpha;
  float minsize = sizeX*0.05;
  float maxsize = sizeX;
  //実際の描画
  if(n == 1) {
    
    //背景の四角
    alpha =5;
    fill(col(),alpha);
    noStroke();
    
    if(random(1)>0.3) rect(posX,posY,sizeX,sizeY);
    
    //円弧
    pushMatrix();

    float x = posX+(sizeX*0.5);
    float y = posY+(sizeY*0.5);
    
    translate(x,y);

    noStroke();
    fill(col());
    if(random(1)>0.5)circle(0,0,maxsize);//円弧の背景

    if(random(1)>0.5){//円弧
      for( float i=maxsize; i>minsize; i-=random(minsize) ){
        
        stroke(80);
        strokeWeight( map(i,maxsize,minsize,maxsize*0.01,minsize*0.03) );
        strokeCap(ROUND);
        strokeJoin(ROUND);
        fill(col());
            
        arc(0,0,i,i,(int)random(PI),(int)random(PI,TWO_PI),PIE);
        rotate (random(TWO_PI));
      }
    }
    
    popMatrix();
    
    //(上に重ねる)背景の四角
    alpha =2;
    fill(col(),alpha);
    noStroke();
    
    if(random(1)>0.7)rect(posX,posY,sizeX,sizeY);

  }

   n--;

  if( n > 0 ){
    arcCircle( posX, posY, sizeX*0.5, sizeY*0.5, n);
    arcCircle( posX+sizeX*0.5, posY, sizeX*0.5, sizeY*0.5, n);
    arcCircle( posX, posY+sizeY*0.5, sizeX*0.5, sizeY*0.5, n);
    arcCircle( posX+sizeX*0.5,  posY+sizeY*0.5, sizeX*0.5, sizeY*0.5, n);
  }

}

void mousePressed(){
  seed =(int)random(10000);
  randomSeed(seed);
}

color col() {
  float r = random(1);
  if(r >0.8) return color(80);
  if(r >0.6) return color(344,63,98);
  if(r >0.4) return color(179,89,73);
  if(r >0.2) return color(60,63,95);
  else return color(-19);
}

void keyPressed(){
   if (key == 's')saveFrame("####.png");
   if (keyCode == UP) count++;
   if (keyCode == DOWN) count--;
   if (keyCode == ENTER) background(80);
}
